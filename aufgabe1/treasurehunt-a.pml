#define SIZE 5
typedef Map {
    byte row[SIZE];	
};

// Wörter für die Map:
mtype = { Ingwer, Wurzel, Wasser, Getraenk, Party, Pflanze, Baum, Zapfen,
          Gluehwein, Becher, Ast, Nadel, Tanne, Weihnachten, Glocke, 
		  Baumwolle, Schal, Winter, Schnee, Berg, Bommel, Muetze, Kaelte, 
		  Ski, Parcours };

// Repräsentiert die Karte (Größe SIZE x SIZE)
Map treasureMap[SIZE];

// Kanal über den der Professor und sein Assistent kommunizieren
chan walkieTalkie = [0] of {byte};
// Die Positionen des Schluessels, der Schatztruhe und des Ausgangs sind 
// fest (nicht ändern)
byte key = 7 % (SIZE*SIZE)
byte treasureChest  = 23 % (SIZE*SIZE)
byte exit = 17 % (SIZE*SIZE)

byte professor_pid;
byte trap;


// Auswahl eines gültigen Feldes/Wortes
inline choose_valid_location(p_location) {
	byte x, y;
	select(x : 0 .. SIZE-1);
	select(y : 0 .. SIZE-1);
	if
	:: (treasureMap[x].row[y] == 0) && 
		((x+1 < SIZE && treasureMap[x+1].row[y] != 0) ||
		(x>0 && treasureMap[x-1].row[y] != 0) ||
		(y+1 < SIZE && treasureMap[x].row[y+1] != 0) || 
		(y>0 && treasureMap[x].row[y-1] != 0)) -> 
		if 
			:: _pid == professor_pid && y * SIZE + x + 1== trap -> skip;
			:: else -> p_location = y * SIZE + x + 1; break;
		fi;
	fi
}

proctype professor() {
	// ToDo: Aufgabe 1b)
}

proctype assistant() {
	// ToDo: Aufgabe 1b)
}

init {
	// ToDo: Aufgabe 1b)
}
