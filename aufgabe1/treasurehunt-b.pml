#define SIZE 3
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
	do
	::  select(x: 0.. SIZE-1);
		select(y: 0.. SIZE-1);
		if
		:: (treasureMap[x].row[y] == 0) && 
			((x+1 < SIZE && treasureMap[x+1].row[y] != 0) ||
			(x>0 && treasureMap[x-1].row[y] != 0) ||
			(y+1 < SIZE && treasureMap[x].row[y+1] != 0) || 
			(y>0 && treasureMap[x].row[y-1] != 0)) -> 
			if 
			:: _pid == professor_pid && y * SIZE + x == trap -> skip;
			:: else -> p_location = y * SIZE + x; break;
			fi;
		:: else -> skip;
		fi
	od
}

proctype professor() {
	// nützlich für die Fallunterscheidung in choose_valid_location
	printf("Neues Spiel");
	professor_pid = _pid;
	byte nextLocation;
	byte assistantLocation;
	do
	:: 	printf("Neue Runde");
		choose_valid_location(nextLocation);
		nextLocation++; // Wort wird verschickt 
		walkieTalkie ! nextLocation;
		//warte auf antwort vom assistant
		walkieTalkie ? assistantLocation;
		
		if
		:: assistantLocation == nextLocation -> 
			treasureMap[(nextLocation - 1) % SIZE].row[(nextLocation - 1)/ SIZE] = 2; //richtiges Feld
		:: else -> 
			treasureMap[(assistantLocation - 1) % SIZE].row[(assistantLocation - 1) / SIZE] = 1;//falsches Feld
		fi
		
		if 
			:: assistantLocation == trap + 1 ->
				printf("Die Falle wurde ausgelöst"); 
				break; 
			:: assistantLocation == exit + 1 -> 
				printf("Der Ausgang wurde gefunden");
				break;
			:: else -> 
				skip;
		fi
	od		
	// ToDo: Aufgabe 1b)

}

proctype assistant() {
	byte profLocation;
	byte nextLocation;
	do
		:: walkieTalkie ? profLocation; 
		   choose_valid_location(nextLocation);
		   nextLocation++;
		   walkieTalkie ! nextLocation;
	od
	// ToDo: Aufgabe 1b)
}

init {
	int placeTrapX, placeTrapY, placeTrap;
	do
	:: select(placeTrapX: 0 .. SIZE-1);
	   select(placeTrapY: 0 .. SIZE-1);
	   placeTrap = placeTrapY * SIZE + placeTrapX;
	   if
	   :: placeTrap != 0 &&
	   	  placeTrap != treasureChest && 
		  placeTrap != key && 
		  placeTrap != exit -> 
		  trap = placeTrap; break;
	   :: else -> skip;
	   fi
	od
	treasureMap[0].row[0] = 1;
	atomic{
	  run professor();
	  run assistant();
	}
	// ToDo: Aufgabe 1b)
}