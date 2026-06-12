#define BUFFER_SIZE 2

mtype:Flag  = { INSTALL_FILES, DOWNLOAD_ONLY }
// Transaktionen dürfen nur von kleineren in größere Zustände übergehen
// Der mtype ist absteigend geordnet: 
// der größte Zustand ist DISCARDED und der kleinste Zustand ist CREATED
mtype:State = { DISCARDED, FINISHED, READY, WAITING_FOR_AUTHENTICATION, ERROR, CREATED}

typedef Transaction {
     // repräsentiert die Dateien
     bit payload; 

     // Die folgenden Daten werden von internen Prozeduren
     // dem Protokoll folgend gesetzt und gelesen.
     mtype:Flag cached_flags;
     mtype:State state;
     bool authenticated;
};

// Hier werden alle erzeugten Transaktionen abgelegt
Transaction transactions[2];

// Kanal zum Weiterreichen einer Transaktion zwecks Authentifizierung
chan auth = [BUFFER_SIZE] of { bit /* ID der betreffenden Transaktion */}
// Kanal zum Abschicken eines Auftrages 
chan dbus_submission = [BUFFER_SIZE] of {mtype:Flag /* angeforderte Aktion */,  
                               bit /* ID der betreffenden Transaktion */}
// Kanal zur Weitergabe einer Transaktion zwecks späterer Ausführung
chan dbus_processing = [BUFFER_SIZE] of {bit /* ID der betreffenden Transaktion */}


// Erzeugt eine Transaktion mit Payload 
// (URL des zu installierenden Paketes)
// und legt sie in transactions[tr_id] ab.
inline create_transaction(tr_id, pl) {
    d_step {
        // Nur falls Transaktion nicht initialisert (state == 0) oder 
        // am Ende des Zyklus angekommene Transaktionen dürfen mit neu erzeugter
        // ersetzt werden.
        transactions[tr_id].state == 0 || transactions[tr_id].state == FINISHED || transactions[tr_id].state == DISCARDED;
        // Ersetze (oder vllt. besser neu initialisieren) der Transaktion "id"
        transactions[tr_id].payload = pl;
        transactions[tr_id].cached_flags = 0;
        transactions[tr_id].state = CREATED;
        transactions[tr_id].authenticated = false;
    }
}

// Setzt den Zustand der Transaktion "transactions[tr_id]"
// auf den übergebenen Zustand "new_state"
// Wie im realen PackageKit Framework kann eine Transaktion nicht
// in einen früheren Zustand zurückkehren. Der Versuch wird
// geloggt und ansonsten ignoriert.
inline set_transaction_state(tr_id, new_state) {    
    d_step {
      if  
       :: transactions[tr_id].state > new_state -> 
          printf("Log: Zustandswechsel zu niedrigerem Zustand nicht möglich.\n")
       :: else -> 
            transactions[tr_id].state = new_state
      fi
    }
}

// Wie set_transaction_state, markiert die Transaktion aber
// gleichzeitig als Authentifiziert
// ACHTUNG: Dieses inline-Makro ist nur vom Prozess PK_Authenticate 
// zu verwenden.
inline set_auth_transaction_state(tr_id, new_state) {    
    d_step {
       if  
        :: transactions[tr_id].state > new_state -> 
           printf("Log: Zustandswechsel zu niedrigerem Zustand nicht möglich.\n")
        :: else -> 
            transactions[tr_id].state         = new_state;
            transactions[tr_id].authenticated = true
       fi
    }
}

active proctype PK_Transaction_Install_Files() {
  
  byte transactionRef;
  mtype:Flag flags;
  
endWaitForTask:  
  dbus_submission ? flags, transactionRef;

  /* try to get authorization */
  if 
   :: flags == DOWNLOAD_ONLY -> 
                                // nur Download wird als sicher betrachtet 
                                // (führt nicht zu Codeausführung)
                                // daher keine Authentifizierung notwendig                                
                                d_step {
                                 /* save so we can run later */
                                 transactions[transactionRef].cached_flags = flags;
                                 set_transaction_state(transactionRef, READY)
                                }
   :: else -> // Authentifizierung notwendig; geschieht asynchron         
         d_step {
            /* save so we can run later */
            transactions[transactionRef].cached_flags = flags;
            // Aktualisiere Transaktionstatus auf "Warte auf Authentifizierung"        
            set_transaction_state(transactionRef, WAITING_FOR_AUTHENTICATION);
         }
         auth ! transactionRef;
  fi;

  /* submit transaction */
  dbus_processing ! transactionRef;

  goto endWaitForTask
}

active proctype PK_Execute() {   
   byte task;
   bit payload;
   bool authenticated;
   mtype:State tr_state;
   mtype:Flag action;
endWaitForTask:
   do
     :: dbus_processing ? task;
        atomic {
            // Snapshot der Transaktion:
            // Die Aktion mit dem Payload des Snapshots wird
            // ausgeführt, verhindert nachträgliche Änderungen
            // oder inkonsistente Zustände der Transaktion
            tr_state = transactions[task].state
            action   = transactions[task].cached_flags
            payload  = transactions[task].payload
            authenticated = transactions[task].authenticated
        }
        if 
         :: tr_state == READY -> // stellt sicher, dass nur 
                                 // Transaktionen im Zustand
                                 // READY ausgeführt werden
                printf("Ausführung der Aktion %e\n", action);
                printf("Datei %d\n", payload)
                printf("Authentifiziert: %d\n", authenticated);
                assert(action != INSTALL_FILES || authenticated)
                set_transaction_state(task, FINISHED);            
         :: tr_state == WAITING_FOR_AUTHENTICATION -> 
                     if
                      :: dbus_processing ! task // Stelle Transaktion für den Moment zurück                     
                      :: full(dbus_processing); // Fallen lassen der Transaktion
                                                // verhindert für die Aufgabe 
                                                // irrelevanten ungültigen Endzustand
                         set_transaction_state(task, DISCARDED)
                     fi
         :: else -> set_transaction_state(task, DISCARDED)
        fi
   od
}

active proctype PK_Authenticate() {
    byte transactionRef;
endWaitForAuthRequests:
    do
     :: auth ? transactionRef;
         if 
//           :: set_transaction_state(transactionRef, ERROR)
           :: set_auth_transaction_state(transactionRef, READY)
         fi
    od
}

active proctype user() {
    // Als Teil der Aufgabe zu modellieren
    skip
}