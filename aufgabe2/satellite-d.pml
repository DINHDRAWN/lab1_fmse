// mtype mit den Richtungsbezeichnern
// none wird verwendet, wenn ein Nachfolger nicht existiert
mtype = {up, up_right, right, down_right, down, down_left, left, up_left, none}

// Kanal als Platzhalter im Falle fehlender Nachbarn
chan NONE = [0] of { byte, byte } 

byte x_ids[7]; // globales Array, das die x-Koordinate jedes Satellite gemäß seiner Prozess-ID enthält
byte y_ids[7]; // globales Array, das die x-Koordinate jedes Satellite gemäß seiner Prozess-ID enthält
byte sums[7]; // Teilsummen Array für Aufgabe 2c

bool checkIfDone = false; // fuer 2d) ob Systemcheck abgeschlossen ist 
proctype satellite(chan prev; chan next; mtype pos_next) {
    byte prev_x, prev_y, next_x, next_y;
    if
    :: prev != NONE -> prev ? prev_x, prev_y;
    :: else -> prev_x = 1; prev_y = 1;
    fi
    //speichere position von satellite
    x_ids[_pid] = prev_x; 
    y_ids[_pid] = prev_y;

    if
    :: next != NONE -> //existiert nachfolger
        if
        :: pos_next == up -> next_y = prev_y + 1; next_x = prev_x;
        :: pos_next == up_right -> next_y = prev_y + 1; next_x = prev_x + 1;
        :: pos_next == right -> next_y = prev_y; next_x = prev_x + 1;
        :: pos_next == down_right -> next_y = prev_y - 1; next_x = prev_x + 1;
        :: pos_next == down -> next_y = prev_y - 1; next_x = prev_x;
        :: pos_next == down_left -> next_y = prev_y - 1; next_x = prev_x - 1;
        :: pos_next == left -> next_y = prev_y; next_x = prev_x - 1;
        :: pos_next == up_left -> next_y = prev_y + 1; next_x = prev_x - 1;
        :: pos_next == none -> next_y = prev_y; next_x = prev_x;
        fi
        next ! next_x, next_y;
    :: else -> next_y = prev_y; next_x = prev_x;
    fi




    // TODO: Modellierung der Phasen

    byte x_sum, y_sum, new_x_sum, new_y_sum;
    if
    :: next != NONE -> 
        next ? x_sum, y_sum;
            
        new_x_sum = x_sum + prev_x;
        new_y_sum = y_sum + prev_y;
    :: else -> new_x_sum = prev_x; new_y_sum = prev_y;
    fi

    sums[_pid] = new_x_sum + new_y_sum;

    if
    :: prev != NONE -> prev ! new_x_sum, new_y_sum;
    :: else -> 
        checkIfDone = true; // wenn das das letzte Satellite war
        skip;
    fi

    // TODO: Modelliere Phase 2
    //skip // Das skip entfernen, sobald mit der Modellierung begonnen wird
}

init {
    chan channels[5] = [0] of { byte, byte};

    atomic {
        run satellite(NONE, channels[0], up_right);// satellite 1
        run satellite(channels[0], channels[1], right); //satellite 2
        run satellite(channels[1], channels[2], right); //satellite 3
        run satellite(channels[2], channels[3], up); //satellite 4
        run satellite(channels[3], channels[4], left); //satellite 5
        run satellite(channels[4], NONE, none); //
        // TODO: Aufbau der Satellitenformation 2a)
    }
    
}

// TODO: Verifikation (LTL-Formeln)
ltl p1 {<> (checkIfDone == true && sums[1] == 26)}
ltl p2 {<> (x_ids[1] == 1 && y_ids[1] == 1 &&
            x_ids[2] == 2 && y_ids[2] == 2 &&
            x_ids[3] == 3 && y_ids[3] == 2 &&
            x_ids[4] == 3 && y_ids[4] == 3 &&
            x_ids[5] == 2 && y_ids[5] == 3 &&
            x_ids[6] == 1 && y_ids[6] == 3 )}

