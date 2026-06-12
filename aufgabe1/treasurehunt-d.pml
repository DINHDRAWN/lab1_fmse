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
			:: _pid == professor_pid && y * SIZE + x == trap -> skip;
			:: else -> p_location = y * SIZE + x; break;
		fi;
	fi
}

byte currentLocation;//ghost variable für d)

proctype professor() {
	// nützlich für die Fallunterscheidung in choose_valid_location
	professor_pid = _pid;
	byte nextLocation;
	byte assistantLocation;
	byte nextLocationWord;
	do
		:: 	choose_valid_location(nextLocation);
			nextLocationWord = nextLocation + 1; // Wort wird verschickt 
		

			walkieTalkie ! nextLocationWord;
			//warte auf antwort vom assistant
			walkieTalkie ? assistantLocation;
			//für d)
			currentLocation = assistantLocation;
			
			if
			:: assistantLocation == nextLocation -> 
				treasureMap[nextLocation % SIZE].row[nextLocation / SIZE] = 2; //richtiges Feld
			:: else -> 
				treasureMap[assistantLocation % SIZE].row[assistantLocation / SIZE] = 1;//falsches Feld
			fi
			label2:	
			if 
				:: assistantLocation == trap - 1 ->
				trapSignal:
					printf("Die Falle wurde ausgelöst"); 
					break;
				:: assistantLocation == exit - 1 -> 
				exitSignal:
					printf("Der Ausgang wurde gefunden");
					break;
				:: else -> 
					skip;
			fi
	od		
	// ToDo: Aufgabe 1b)

}

proctype assistant() {
	byte num;
	byte nextLocation;
	do
		:: walkieTalkie ? num; 
		   choose_valid_location(nextLocation);
		   walkieTalkie ! nextLocation;
	od
	// ToDo: Aufgabe 1b)
}

init {
	byte placeTrap;
	choose_valid_location(placeTrap);
	if
		:: placeTrap != 0 && 
		   placeTrap != treasureChest && 
		   placeTrap != key && 
		   placeTrap != exit -> 
		   	trap = placeTrap;
	fi
	treasureMap[0].row[0] = 10;
	atomic{
		run professor();
		run assistant();
	}
	// ToDo: Aufgabe 1b)
}

//ltl p1 {<> (treasureMap[key % SIZE].row[key / SIZE] == 1 || treasureMap[key % SIZE].row[key / SIZE] == 2) || (treasureMap[treasureChest % SIZE].row[treasureChest / SIZE] == 1 || treasureMap[treasureChest % SIZE].row[treasureChest / SIZE] == 2)}
//ltl p2 {[] (professor@label2 -> <> (professor@trapSignal || professor@exitSignal)) }
//ltl p3 {treasureMap[treasureChest % SIZE].row[treasureChest / SIZE] == 0 U treasureMap[key % SIZE].row[key / SIZE] != 0}

ltl p4 {<> professor@label2 -> (treasureMap[currentLocation % SIZE].row[currentLocation / SIZE] == 2 && 
							   treasureMap[trap % SIZE].row[trap / SIZE] == 0 && 
							   treasureMap[treasureChest % SIZE].row[treasureChest % SIZE] == 2 &&
							   treasureMap[exit % SIZE].row[exit / SIZE] == 2)}