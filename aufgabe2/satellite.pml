// mtype mit den Richtungsbezeichnern
// none wird verwendet, wenn ein Nachfolger nicht existiert
mtype = {up, up_right, right, down_right, down, down_left, left, up_left, none}

// Kanal als Platzhalter im Falle fehlender Nachbarn
chan NONE = [0] of { byte, byte } 

byte x_ids[7]; // globales Array, das die x-Koordinate jedes Satellite gemäß seiner Prozess-ID enthält
byte y_ids[7]; // globales Array, das die x-Koordinate jedes Satellite gemäß seiner Prozess-ID enthält
byte sums[7]; // Teilsummen Array für Aufgabe 2c

proctype satellite(chan prev; chan next; mtype pos_next) {
    // TODO: Modellierung der Phasen
    // TODO: Modelliere Phase 2
    skip // Das skip entfernen, sobald mit der Modellierung begonnen wird
}

init {
    chan channels[5] = [0] of { byte, byte};

    atomic {
        run satellite(NONE, channels[0], up_right);
        // TODO: Aufbau der Satellitenformation 2a)
    }
    
}

// TODO: Verifikation (LTL-Formeln)
