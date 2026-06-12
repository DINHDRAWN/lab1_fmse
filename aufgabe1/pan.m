#define rand	pan_rand
#define pthread_equal(a,b)	((a)==(b))
#if defined(HAS_CODE) && defined(VERBOSE)
	#ifdef BFS_PAR
		bfs_printf("Pr: %d Tr: %d\n", II, t->forw);
	#else
		cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
	#endif
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* PROC :init: */
	case 3: // STATE 1 - treasurehunt-b.pml:105 - [placeTrapX = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[2][1] = 1;
		(trpt+1)->bup.oval = ((int)((P2 *)_this)->placeTrapX);
		((P2 *)_this)->placeTrapX = 1;
#ifdef VAR_RANGES
		logval(":init::placeTrapX", ((int)((P2 *)_this)->placeTrapX));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 2 - treasurehunt-b.pml:105 - [((placeTrapX<=(3-1)))] (16:0:1 - 1)
		IfNotBlocked
		reached[2][2] = 1;
		if (!((((int)((P2 *)_this)->placeTrapX)<=(3-1))))
			continue;
		/* merge: placeTrapY = 1(0, 3, 16) */
		reached[2][3] = 1;
		(trpt+1)->bup.oval = ((int)((P2 *)_this)->placeTrapY);
		((P2 *)_this)->placeTrapY = 1;
#ifdef VAR_RANGES
		logval(":init::placeTrapY", ((int)((P2 *)_this)->placeTrapY));
#endif
		;
		/* merge: .(goto)(0, 17, 16) */
		reached[2][17] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 5: // STATE 4 - treasurehunt-b.pml:106 - [((placeTrapY<=(3-1)))] (11:0:1 - 1)
		IfNotBlocked
		reached[2][4] = 1;
		if (!((((int)((P2 *)_this)->placeTrapY)<=(3-1))))
			continue;
		/* merge: placeTrap = (((placeTrapY*3)+placeTrapX)+1)(0, 5, 11) */
		reached[2][5] = 1;
		(trpt+1)->bup.oval = ((int)((P2 *)_this)->placeTrap);
		((P2 *)_this)->placeTrap = (((((int)((P2 *)_this)->placeTrapY)*3)+((int)((P2 *)_this)->placeTrapX))+1);
#ifdef VAR_RANGES
		logval(":init::placeTrap", ((int)((P2 *)_this)->placeTrap));
#endif
		;
		_m = 3; goto P999; /* 1 */
	case 6: // STATE 6 - treasurehunt-b.pml:111 - [((((placeTrap!=treasureChest)&&(placeTrap!=key))&&(placeTrap!=exit)))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][6] = 1;
		if (!((((((int)((P2 *)_this)->placeTrap)!=((int)now.treasureChest))&&(((int)((P2 *)_this)->placeTrap)!=((int)now.key)))&&(((int)((P2 *)_this)->placeTrap)!=((int)now.exit)))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 7: // STATE 7 - treasurehunt-b.pml:112 - [trap = placeTrap] (0:0:1 - 1)
		IfNotBlocked
		reached[2][7] = 1;
		(trpt+1)->bup.oval = ((int)now.trap);
		now.trap = ((int)((P2 *)_this)->placeTrap);
#ifdef VAR_RANGES
		logval("trap", ((int)now.trap));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 8: // STATE 8 - treasurehunt-b.pml:112 - [foundTrap = 1] (0:16:2 - 1)
		IfNotBlocked
		reached[2][8] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P2 *)_this)->foundTrap);
		((P2 *)_this)->foundTrap = 1;
#ifdef VAR_RANGES
		logval(":init::foundTrap", ((int)((P2 *)_this)->foundTrap));
#endif
		;
		/* merge: .(goto)(16, 12, 16) */
		reached[2][12] = 1;
		;
		/* merge: placeTrapY = (placeTrapY+1)(16, 13, 16) */
		reached[2][13] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P2 *)_this)->placeTrapY);
		((P2 *)_this)->placeTrapY = (((int)((P2 *)_this)->placeTrapY)+1);
#ifdef VAR_RANGES
		logval(":init::placeTrapY", ((int)((P2 *)_this)->placeTrapY));
#endif
		;
		/* merge: .(goto)(0, 17, 16) */
		reached[2][17] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 9: // STATE 10 - treasurehunt-b.pml:113 - [(1)] (16:0:1 - 1)
		IfNotBlocked
		reached[2][10] = 1;
		if (!(1))
			continue;
		/* merge: .(goto)(16, 12, 16) */
		reached[2][12] = 1;
		;
		/* merge: placeTrapY = (placeTrapY+1)(16, 13, 16) */
		reached[2][13] = 1;
		(trpt+1)->bup.oval = ((int)((P2 *)_this)->placeTrapY);
		((P2 *)_this)->placeTrapY = (((int)((P2 *)_this)->placeTrapY)+1);
#ifdef VAR_RANGES
		logval(":init::placeTrapY", ((int)((P2 *)_this)->placeTrapY));
#endif
		;
		/* merge: .(goto)(0, 17, 16) */
		reached[2][17] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 10: // STATE 13 - treasurehunt-b.pml:106 - [placeTrapY = (placeTrapY+1)] (0:16:1 - 3)
		IfNotBlocked
		reached[2][13] = 1;
		(trpt+1)->bup.oval = ((int)((P2 *)_this)->placeTrapY);
		((P2 *)_this)->placeTrapY = (((int)((P2 *)_this)->placeTrapY)+1);
#ifdef VAR_RANGES
		logval(":init::placeTrapY", ((int)((P2 *)_this)->placeTrapY));
#endif
		;
		/* merge: .(goto)(0, 17, 16) */
		reached[2][17] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 11: // STATE 19 - treasurehunt-b.pml:117 - [((foundTrap==1))] (0:0:0 - 1)
		IfNotBlocked
		reached[2][19] = 1;
		if (!((((int)((P2 *)_this)->foundTrap)==1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 12: // STATE 22 - treasurehunt-b.pml:118 - [(1)] (28:0:1 - 1)
		IfNotBlocked
		reached[2][22] = 1;
		if (!(1))
			continue;
		/* merge: .(goto)(28, 24, 28) */
		reached[2][24] = 1;
		;
		/* merge: placeTrapX = (placeTrapX+1)(28, 25, 28) */
		reached[2][25] = 1;
		(trpt+1)->bup.oval = ((int)((P2 *)_this)->placeTrapX);
		((P2 *)_this)->placeTrapX = (((int)((P2 *)_this)->placeTrapX)+1);
#ifdef VAR_RANGES
		logval(":init::placeTrapX", ((int)((P2 *)_this)->placeTrapX));
#endif
		;
		/* merge: .(goto)(0, 29, 28) */
		reached[2][29] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 13: // STATE 25 - treasurehunt-b.pml:105 - [placeTrapX = (placeTrapX+1)] (0:28:1 - 2)
		IfNotBlocked
		reached[2][25] = 1;
		(trpt+1)->bup.oval = ((int)((P2 *)_this)->placeTrapX);
		((P2 *)_this)->placeTrapX = (((int)((P2 *)_this)->placeTrapX)+1);
#ifdef VAR_RANGES
		logval(":init::placeTrapX", ((int)((P2 *)_this)->placeTrapX));
#endif
		;
		/* merge: .(goto)(0, 29, 28) */
		reached[2][29] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 14: // STATE 31 - treasurehunt-b.pml:122 - [((foundTrap==1))] (0:0:1 - 1)
		IfNotBlocked
		reached[2][31] = 1;
		if (!((((int)((P2 *)_this)->foundTrap)==1)))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: foundTrap */  (trpt+1)->bup.oval = ((P2 *)_this)->foundTrap;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P2 *)_this)->foundTrap = 0;
		_m = 3; goto P999; /* 0 */
	case 15: // STATE 35 - treasurehunt-b.pml:125 - [treasureMap[0].row[0] = 1] (0:0:1 - 2)
		IfNotBlocked
		reached[2][35] = 1;
		(trpt+1)->bup.oval = ((int)now.treasureMap[0].row[0]);
		now.treasureMap[0].row[0] = 1;
#ifdef VAR_RANGES
		logval("treasureMap[0].row[0]", ((int)now.treasureMap[0].row[0]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 16: // STATE 36 - treasurehunt-b.pml:127 - [(run professor())] (0:0:0 - 1)
		IfNotBlocked
		reached[2][36] = 1;
		if (!(addproc(II, 1, 0)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 17: // STATE 37 - treasurehunt-b.pml:128 - [(run assistant())] (0:0:0 - 1)
		IfNotBlocked
		reached[2][37] = 1;
		if (!(addproc(II, 1, 1)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 18: // STATE 39 - treasurehunt-b.pml:131 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[2][39] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC assistant */
	case 19: // STATE 1 - treasurehunt-b.pml:92 - [walkieTalkie?profLocation] (0:0:2 - 1)
		reached[1][1] = 1;
		if (boq != now.walkieTalkie) continue;
		if (q_len(now.walkieTalkie) == 0) continue;

		XX=1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P1 *)_this)->profLocation);
		;
		((P1 *)_this)->profLocation = qrecv(now.walkieTalkie, XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("assistant:profLocation", ((int)((P1 *)_this)->profLocation));
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.walkieTalkie);
		sprintf(simtmp, "%d", ((int)((P1 *)_this)->profLocation)); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.walkieTalkie))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		if (TstOnly) return 1; /* TT */
		/* dead 2: profLocation */  (trpt+1)->bup.ovals[1] = ((P1 *)_this)->profLocation;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)_this)->profLocation = 0;
		_m = 4; goto P999; /* 0 */
	case 20: // STATE 2 - treasurehunt-b.pml:29 - [x = 0] (0:32:2 - 1)
		IfNotBlocked
		reached[1][2] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P1 *)_this)->_5_2_x);
		((P1 *)_this)->_5_2_x = 0;
#ifdef VAR_RANGES
		logval("assistant:x", ((int)((P1 *)_this)->_5_2_x));
#endif
		;
		/* merge: y = 0(32, 3, 32) */
		reached[1][3] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P1 *)_this)->_5_2_y);
		((P1 *)_this)->_5_2_y = 0;
#ifdef VAR_RANGES
		logval("assistant:y", ((int)((P1 *)_this)->_5_2_y));
#endif
		;
		/* merge: .(goto)(0, 33, 32) */
		reached[1][33] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 21: // STATE 4 - treasurehunt-b.pml:31 - [x = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[1][4] = 1;
		(trpt+1)->bup.oval = ((int)((P1 *)_this)->_5_2_x);
		((P1 *)_this)->_5_2_x = 1;
#ifdef VAR_RANGES
		logval("assistant:x", ((int)((P1 *)_this)->_5_2_x));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 22: // STATE 7 - treasurehunt-b.pml:31 - [goto :b6] (0:15:1 - 1)
		IfNotBlocked
		reached[1][7] = 1;
		;
		/* merge: y = 1(15, 11, 15) */
		reached[1][11] = 1;
		(trpt+1)->bup.oval = ((int)((P1 *)_this)->_5_2_y);
		((P1 *)_this)->_5_2_y = 1;
#ifdef VAR_RANGES
		logval("assistant:y", ((int)((P1 *)_this)->_5_2_y));
#endif
		;
		/* merge: .(goto)(0, 16, 15) */
		reached[1][16] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 23: // STATE 5 - treasurehunt-b.pml:31 - [((x<(3-1)))] (8:0:1 - 1)
		IfNotBlocked
		reached[1][5] = 1;
		if (!((((int)((P1 *)_this)->_5_2_x)<(3-1))))
			continue;
		/* merge: x = (x+1)(0, 6, 8) */
		reached[1][6] = 1;
		(trpt+1)->bup.oval = ((int)((P1 *)_this)->_5_2_x);
		((P1 *)_this)->_5_2_x = (((int)((P1 *)_this)->_5_2_x)+1);
#ifdef VAR_RANGES
		logval("assistant:x", ((int)((P1 *)_this)->_5_2_x));
#endif
		;
		/* merge: .(goto)(0, 9, 8) */
		reached[1][9] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 24: // STATE 11 - treasurehunt-b.pml:32 - [y = 1] (0:15:1 - 2)
		IfNotBlocked
		reached[1][11] = 1;
		(trpt+1)->bup.oval = ((int)((P1 *)_this)->_5_2_y);
		((P1 *)_this)->_5_2_y = 1;
#ifdef VAR_RANGES
		logval("assistant:y", ((int)((P1 *)_this)->_5_2_y));
#endif
		;
		/* merge: .(goto)(0, 16, 15) */
		reached[1][16] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 25: // STATE 12 - treasurehunt-b.pml:32 - [((y<(3-1)))] (15:0:1 - 1)
		IfNotBlocked
		reached[1][12] = 1;
		if (!((((int)((P1 *)_this)->_5_2_y)<(3-1))))
			continue;
		/* merge: y = (y+1)(0, 13, 15) */
		reached[1][13] = 1;
		(trpt+1)->bup.oval = ((int)((P1 *)_this)->_5_2_y);
		((P1 *)_this)->_5_2_y = (((int)((P1 *)_this)->_5_2_y)+1);
#ifdef VAR_RANGES
		logval("assistant:y", ((int)((P1 *)_this)->_5_2_y));
#endif
		;
		/* merge: .(goto)(0, 16, 15) */
		reached[1][16] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 26: // STATE 18 - treasurehunt-b.pml:38 - [(((treasureMap[x].row[y]==0)&&((((((x+1)<3)&&(treasureMap[(x+1)].row[y]!=0))||((x>0)&&(treasureMap[(x-1)].row[y]!=0)))||(((y+1)<3)&&(treasureMap[x].row[(y+1)]!=0)))||((y>0)&&(treasureMap[x].row[(y-1)]!=0)))))] (0:0:0 - 1)
		IfNotBlocked
		reached[1][18] = 1;
		if (!(((((int)now.treasureMap[ Index(((int)((P1 *)_this)->_5_2_x), 3) ].row[ Index(((int)((P1 *)_this)->_5_2_y), 3) ])==0)&&((((((((int)((P1 *)_this)->_5_2_x)+1)<3)&&(((int)now.treasureMap[ Index((((int)((P1 *)_this)->_5_2_x)+1), 3) ].row[ Index(((int)((P1 *)_this)->_5_2_y), 3) ])!=0))||((((int)((P1 *)_this)->_5_2_x)>0)&&(((int)now.treasureMap[ Index((((int)((P1 *)_this)->_5_2_x)-1), 3) ].row[ Index(((int)((P1 *)_this)->_5_2_y), 3) ])!=0)))||(((((int)((P1 *)_this)->_5_2_y)+1)<3)&&(((int)now.treasureMap[ Index(((int)((P1 *)_this)->_5_2_x), 3) ].row[ Index((((int)((P1 *)_this)->_5_2_y)+1), 3) ])!=0)))||((((int)((P1 *)_this)->_5_2_y)>0)&&(((int)now.treasureMap[ Index(((int)((P1 *)_this)->_5_2_x), 3) ].row[ Index((((int)((P1 *)_this)->_5_2_y)-1), 3) ])!=0))))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 27: // STATE 19 - treasurehunt-b.pml:40 - [(((_pid==professor_pid)&&((((y*3)+x)+1)==trap)))] (0:0:2 - 1)
		IfNotBlocked
		reached[1][19] = 1;
		if (!(((((int)((P1 *)_this)->_pid)==((int)now.professor_pid))&&((((((int)((P1 *)_this)->_5_2_y)*3)+((int)((P1 *)_this)->_5_2_x))+1)==((int)now.trap)))))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: _5_2_y */  (trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P1 *)_this)->_5_2_y;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)_this)->_5_2_y = 0;
		if (TstOnly) return 1; /* TT */
		/* dead 1: _5_2_x */  (trpt+1)->bup.ovals[1] = ((P1 *)_this)->_5_2_x;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P1 *)_this)->_5_2_x = 0;
		_m = 3; goto P999; /* 0 */
	case 28: // STATE 22 - treasurehunt-b.pml:41 - [nextLocation = ((y*3)+x)] (0:37:2 - 1)
		IfNotBlocked
		reached[1][22] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P1 *)_this)->nextLocation);
		((P1 *)_this)->nextLocation = ((((int)((P1 *)_this)->_5_2_y)*3)+((int)((P1 *)_this)->_5_2_x));
#ifdef VAR_RANGES
		logval("assistant:nextLocation", ((int)((P1 *)_this)->nextLocation));
#endif
		;
		/* merge: goto :b5(37, 23, 37) */
		reached[1][23] = 1;
		;
		/* merge: nextLocation = (nextLocation+1)(37, 36, 37) */
		reached[1][36] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P1 *)_this)->nextLocation);
		((P1 *)_this)->nextLocation = (((int)((P1 *)_this)->nextLocation)+1);
#ifdef VAR_RANGES
		logval("assistant:nextLocation", ((int)((P1 *)_this)->nextLocation));
#endif
		;
		_m = 3; goto P999; /* 2 */
	case 29: // STATE 36 - treasurehunt-b.pml:94 - [nextLocation = (nextLocation+1)] (0:37:1 - 3)
		IfNotBlocked
		reached[1][36] = 1;
		(trpt+1)->bup.oval = ((int)((P1 *)_this)->nextLocation);
		((P1 *)_this)->nextLocation = (((int)((P1 *)_this)->nextLocation)+1);
#ifdef VAR_RANGES
		logval("assistant:nextLocation", ((int)((P1 *)_this)->nextLocation));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 30: // STATE 37 - treasurehunt-b.pml:95 - [walkieTalkie!nextLocation] (0:0:0 - 1)
		IfNotBlocked
		reached[1][37] = 1;
		if (q_len(now.walkieTalkie))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.walkieTalkie);
		sprintf(simtmp, "%d", ((int)((P1 *)_this)->nextLocation)); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.walkieTalkie, 0, ((int)((P1 *)_this)->nextLocation), 1);
		{ boq = now.walkieTalkie; };
		_m = 2; goto P999; /* 0 */
	case 31: // STATE 41 - treasurehunt-b.pml:98 - [-end-] (0:0:0 - 1)
		IfNotBlocked
		reached[1][41] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC professor */
	case 32: // STATE 1 - treasurehunt-b.pml:51 - [printf('Neues Spiel')] (0:0:0 - 1)
		IfNotBlocked
		reached[0][1] = 1;
		Printf("Neues Spiel");
		_m = 3; goto P999; /* 0 */
	case 33: // STATE 2 - treasurehunt-b.pml:52 - [professor_pid = _pid] (0:0:1 - 1)
		IfNotBlocked
		reached[0][2] = 1;
		(trpt+1)->bup.oval = ((int)now.professor_pid);
		now.professor_pid = ((int)((P0 *)_this)->_pid);
#ifdef VAR_RANGES
		logval("professor_pid", ((int)now.professor_pid));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 34: // STATE 3 - treasurehunt-b.pml:54 - [nextLocation = 0] (0:60:3 - 1)
		IfNotBlocked
		reached[0][3] = 1;
		(trpt+1)->bup.ovals = grab_ints(3);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)_this)->nextLocation);
		((P0 *)_this)->nextLocation = 0;
#ifdef VAR_RANGES
		logval("professor:nextLocation", ((int)((P0 *)_this)->nextLocation));
#endif
		;
		/* merge: assistantLocation = 0(60, 4, 60) */
		reached[0][4] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)_this)->assistantLocation);
		((P0 *)_this)->assistantLocation = 0;
#ifdef VAR_RANGES
		logval("professor:assistantLocation", ((int)((P0 *)_this)->assistantLocation));
#endif
		;
		/* merge: nextLocationWord = 0(60, 5, 60) */
		reached[0][5] = 1;
		(trpt+1)->bup.ovals[2] = ((int)((P0 *)_this)->nextLocationWord);
		((P0 *)_this)->nextLocationWord = 0;
#ifdef VAR_RANGES
		logval("professor:nextLocationWord", ((int)((P0 *)_this)->nextLocationWord));
#endif
		;
		/* merge: .(goto)(0, 61, 60) */
		reached[0][61] = 1;
		;
		_m = 3; goto P999; /* 3 */
	case 35: // STATE 6 - treasurehunt-b.pml:57 - [printf('Neue Runde')] (0:0:0 - 1)
		IfNotBlocked
		reached[0][6] = 1;
		Printf("Neue Runde");
		_m = 3; goto P999; /* 0 */
	case 36: // STATE 7 - treasurehunt-b.pml:29 - [x = 0] (0:37:2 - 1)
		IfNotBlocked
		reached[0][7] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)_this)->_4_1_x);
		((P0 *)_this)->_4_1_x = 0;
#ifdef VAR_RANGES
		logval("professor:x", ((int)((P0 *)_this)->_4_1_x));
#endif
		;
		/* merge: y = 0(37, 8, 37) */
		reached[0][8] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)_this)->_4_1_y);
		((P0 *)_this)->_4_1_y = 0;
#ifdef VAR_RANGES
		logval("professor:y", ((int)((P0 *)_this)->_4_1_y));
#endif
		;
		/* merge: .(goto)(0, 38, 37) */
		reached[0][38] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 37: // STATE 9 - treasurehunt-b.pml:31 - [x = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[0][9] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->_4_1_x);
		((P0 *)_this)->_4_1_x = 1;
#ifdef VAR_RANGES
		logval("professor:x", ((int)((P0 *)_this)->_4_1_x));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 38: // STATE 12 - treasurehunt-b.pml:31 - [goto :b2] (0:20:1 - 1)
		IfNotBlocked
		reached[0][12] = 1;
		;
		/* merge: y = 1(20, 16, 20) */
		reached[0][16] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->_4_1_y);
		((P0 *)_this)->_4_1_y = 1;
#ifdef VAR_RANGES
		logval("professor:y", ((int)((P0 *)_this)->_4_1_y));
#endif
		;
		/* merge: .(goto)(0, 21, 20) */
		reached[0][21] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 39: // STATE 10 - treasurehunt-b.pml:31 - [((x<(3-1)))] (13:0:1 - 1)
		IfNotBlocked
		reached[0][10] = 1;
		if (!((((int)((P0 *)_this)->_4_1_x)<(3-1))))
			continue;
		/* merge: x = (x+1)(0, 11, 13) */
		reached[0][11] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->_4_1_x);
		((P0 *)_this)->_4_1_x = (((int)((P0 *)_this)->_4_1_x)+1);
#ifdef VAR_RANGES
		logval("professor:x", ((int)((P0 *)_this)->_4_1_x));
#endif
		;
		/* merge: .(goto)(0, 14, 13) */
		reached[0][14] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 40: // STATE 16 - treasurehunt-b.pml:32 - [y = 1] (0:20:1 - 2)
		IfNotBlocked
		reached[0][16] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->_4_1_y);
		((P0 *)_this)->_4_1_y = 1;
#ifdef VAR_RANGES
		logval("professor:y", ((int)((P0 *)_this)->_4_1_y));
#endif
		;
		/* merge: .(goto)(0, 21, 20) */
		reached[0][21] = 1;
		;
		_m = 3; goto P999; /* 1 */
	case 41: // STATE 17 - treasurehunt-b.pml:32 - [((y<(3-1)))] (20:0:1 - 1)
		IfNotBlocked
		reached[0][17] = 1;
		if (!((((int)((P0 *)_this)->_4_1_y)<(3-1))))
			continue;
		/* merge: y = (y+1)(0, 18, 20) */
		reached[0][18] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->_4_1_y);
		((P0 *)_this)->_4_1_y = (((int)((P0 *)_this)->_4_1_y)+1);
#ifdef VAR_RANGES
		logval("professor:y", ((int)((P0 *)_this)->_4_1_y));
#endif
		;
		/* merge: .(goto)(0, 21, 20) */
		reached[0][21] = 1;
		;
		_m = 3; goto P999; /* 2 */
	case 42: // STATE 23 - treasurehunt-b.pml:38 - [(((treasureMap[x].row[y]==0)&&((((((x+1)<3)&&(treasureMap[(x+1)].row[y]!=0))||((x>0)&&(treasureMap[(x-1)].row[y]!=0)))||(((y+1)<3)&&(treasureMap[x].row[(y+1)]!=0)))||((y>0)&&(treasureMap[x].row[(y-1)]!=0)))))] (0:0:0 - 1)
		IfNotBlocked
		reached[0][23] = 1;
		if (!(((((int)now.treasureMap[ Index(((int)((P0 *)_this)->_4_1_x), 3) ].row[ Index(((int)((P0 *)_this)->_4_1_y), 3) ])==0)&&((((((((int)((P0 *)_this)->_4_1_x)+1)<3)&&(((int)now.treasureMap[ Index((((int)((P0 *)_this)->_4_1_x)+1), 3) ].row[ Index(((int)((P0 *)_this)->_4_1_y), 3) ])!=0))||((((int)((P0 *)_this)->_4_1_x)>0)&&(((int)now.treasureMap[ Index((((int)((P0 *)_this)->_4_1_x)-1), 3) ].row[ Index(((int)((P0 *)_this)->_4_1_y), 3) ])!=0)))||(((((int)((P0 *)_this)->_4_1_y)+1)<3)&&(((int)now.treasureMap[ Index(((int)((P0 *)_this)->_4_1_x), 3) ].row[ Index((((int)((P0 *)_this)->_4_1_y)+1), 3) ])!=0)))||((((int)((P0 *)_this)->_4_1_y)>0)&&(((int)now.treasureMap[ Index(((int)((P0 *)_this)->_4_1_x), 3) ].row[ Index((((int)((P0 *)_this)->_4_1_y)-1), 3) ])!=0))))))
			continue;
		_m = 3; goto P999; /* 0 */
	case 43: // STATE 24 - treasurehunt-b.pml:40 - [(((_pid==professor_pid)&&((((y*3)+x)+1)==trap)))] (0:0:2 - 1)
		IfNotBlocked
		reached[0][24] = 1;
		if (!(((((int)((P0 *)_this)->_pid)==((int)now.professor_pid))&&((((((int)((P0 *)_this)->_4_1_y)*3)+((int)((P0 *)_this)->_4_1_x))+1)==((int)now.trap)))))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: _4_1_y */  (trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((P0 *)_this)->_4_1_y;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)_this)->_4_1_y = 0;
		if (TstOnly) return 1; /* TT */
		/* dead 1: _4_1_x */  (trpt+1)->bup.ovals[1] = ((P0 *)_this)->_4_1_x;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)_this)->_4_1_x = 0;
		_m = 3; goto P999; /* 0 */
	case 44: // STATE 27 - treasurehunt-b.pml:41 - [nextLocation = ((y*3)+x)] (0:42:2 - 1)
		IfNotBlocked
		reached[0][27] = 1;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)_this)->nextLocation);
		((P0 *)_this)->nextLocation = ((((int)((P0 *)_this)->_4_1_y)*3)+((int)((P0 *)_this)->_4_1_x));
#ifdef VAR_RANGES
		logval("professor:nextLocation", ((int)((P0 *)_this)->nextLocation));
#endif
		;
		/* merge: goto :b1(42, 28, 42) */
		reached[0][28] = 1;
		;
		/* merge: nextLocationWord = (nextLocation+1)(42, 41, 42) */
		reached[0][41] = 1;
		(trpt+1)->bup.ovals[1] = ((int)((P0 *)_this)->nextLocationWord);
		((P0 *)_this)->nextLocationWord = (((int)((P0 *)_this)->nextLocation)+1);
#ifdef VAR_RANGES
		logval("professor:nextLocationWord", ((int)((P0 *)_this)->nextLocationWord));
#endif
		;
		_m = 3; goto P999; /* 2 */
	case 45: // STATE 41 - treasurehunt-b.pml:59 - [nextLocationWord = (nextLocation+1)] (0:42:1 - 3)
		IfNotBlocked
		reached[0][41] = 1;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->nextLocationWord);
		((P0 *)_this)->nextLocationWord = (((int)((P0 *)_this)->nextLocation)+1);
#ifdef VAR_RANGES
		logval("professor:nextLocationWord", ((int)((P0 *)_this)->nextLocationWord));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 46: // STATE 42 - treasurehunt-b.pml:60 - [walkieTalkie!nextLocationWord] (0:0:0 - 1)
		IfNotBlocked
		reached[0][42] = 1;
		if (q_len(now.walkieTalkie))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", now.walkieTalkie);
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->nextLocationWord)); strcat(simvals, simtmp);		}
#endif
		
		qsend(now.walkieTalkie, 0, ((int)((P0 *)_this)->nextLocationWord), 1);
		{ boq = now.walkieTalkie; };
		_m = 2; goto P999; /* 0 */
	case 47: // STATE 43 - treasurehunt-b.pml:62 - [walkieTalkie?assistantLocation] (0:0:1 - 1)
		reached[0][43] = 1;
		if (boq != now.walkieTalkie) continue;
		if (q_len(now.walkieTalkie) == 0) continue;

		XX=1;
		(trpt+1)->bup.oval = ((int)((P0 *)_this)->assistantLocation);
		;
		((P0 *)_this)->assistantLocation = qrecv(now.walkieTalkie, XX-1, 0, 1);
#ifdef VAR_RANGES
		logval("professor:assistantLocation", ((int)((P0 *)_this)->assistantLocation));
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", now.walkieTalkie);
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->assistantLocation)); strcat(simvals, simtmp);		}
#endif
		if (q_zero(now.walkieTalkie))
		{	boq = -1;
#ifndef NOFAIR
			if (fairness
			&& !(trpt->o_pm&32)
			&& (now._a_t&2)
			&&  now._cnt[now._a_t&1] == II+2)
			{	now._cnt[now._a_t&1] -= 1;
#ifdef VERI
				if (II == 1)
					now._cnt[now._a_t&1] = 1;
#endif
#ifdef DEBUG
			printf("%3ld: proc %d fairness ", depth, II);
			printf("Rule 2: --cnt to %d (%d)\n",
				now._cnt[now._a_t&1], now._a_t);
#endif
				trpt->o_pm |= (32|64);
			}
#endif

		};
		_m = 4; goto P999; /* 0 */
	case 48: // STATE 44 - treasurehunt-b.pml:65 - [((assistantLocation==nextLocationWord))] (0:0:1 - 1)
		IfNotBlocked
		reached[0][44] = 1;
		if (!((((int)((P0 *)_this)->assistantLocation)==((int)((P0 *)_this)->nextLocationWord))))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: nextLocationWord */  (trpt+1)->bup.oval = ((P0 *)_this)->nextLocationWord;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)_this)->nextLocationWord = 0;
		_m = 3; goto P999; /* 0 */
	case 49: // STATE 45 - treasurehunt-b.pml:66 - [treasureMap[((nextLocation-1)%3)].row[((nextLocation-1)/3)] = 2] (0:0:1 - 1)
		IfNotBlocked
		reached[0][45] = 1;
		(trpt+1)->bup.oval = ((int)now.treasureMap[ Index(((((int)((P0 *)_this)->nextLocation)-1)%3), 3) ].row[ Index(((((int)((P0 *)_this)->nextLocation)-1)/3), 3) ]);
		now.treasureMap[ Index(((((P0 *)_this)->nextLocation-1)%3), 3) ].row[ Index(((((P0 *)_this)->nextLocation-1)/3), 3) ] = 2;
#ifdef VAR_RANGES
		logval("treasureMap[((professor:nextLocation-1)%3)].row[((professor:nextLocation-1)/3)]", ((int)now.treasureMap[ Index(((((int)((P0 *)_this)->nextLocation)-1)%3), 3) ].row[ Index(((((int)((P0 *)_this)->nextLocation)-1)/3), 3) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 50: // STATE 47 - treasurehunt-b.pml:68 - [treasureMap[((assistantLocation-1)%3)].row[((assistantLocation-1)/3)] = 1] (0:0:1 - 1)
		IfNotBlocked
		reached[0][47] = 1;
		(trpt+1)->bup.oval = ((int)now.treasureMap[ Index(((((int)((P0 *)_this)->assistantLocation)-1)%3), 3) ].row[ Index(((((int)((P0 *)_this)->assistantLocation)-1)/3), 3) ]);
		now.treasureMap[ Index(((((P0 *)_this)->assistantLocation-1)%3), 3) ].row[ Index(((((P0 *)_this)->assistantLocation-1)/3), 3) ] = 1;
#ifdef VAR_RANGES
		logval("treasureMap[((professor:assistantLocation-1)%3)].row[((professor:assistantLocation-1)/3)]", ((int)now.treasureMap[ Index(((((int)((P0 *)_this)->assistantLocation)-1)%3), 3) ].row[ Index(((((int)((P0 *)_this)->assistantLocation)-1)/3), 3) ]));
#endif
		;
		_m = 3; goto P999; /* 0 */
	case 51: // STATE 50 - treasurehunt-b.pml:72 - [((assistantLocation==trap))] (0:0:1 - 1)
		IfNotBlocked
		reached[0][50] = 1;
		if (!((((int)((P0 *)_this)->assistantLocation)==((int)now.trap))))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: assistantLocation */  (trpt+1)->bup.oval = ((P0 *)_this)->assistantLocation;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)_this)->assistantLocation = 0;
		_m = 3; goto P999; /* 0 */
	case 52: // STATE 51 - treasurehunt-b.pml:74 - [printf('Die Falle wurde ausgelöst')] (0:0:0 - 1)
		IfNotBlocked
		reached[0][51] = 1;
		Printf("Die Falle wurde ausgelöst");
		_m = 3; goto P999; /* 0 */
	case 53: // STATE 53 - treasurehunt-b.pml:76 - [((assistantLocation==exit))] (0:0:1 - 1)
		IfNotBlocked
		reached[0][53] = 1;
		if (!((((int)((P0 *)_this)->assistantLocation)==((int)now.exit))))
			continue;
		if (TstOnly) return 1; /* TT */
		/* dead 1: assistantLocation */  (trpt+1)->bup.oval = ((P0 *)_this)->assistantLocation;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)_this)->assistantLocation = 0;
		_m = 3; goto P999; /* 0 */
	case 54: // STATE 54 - treasurehunt-b.pml:78 - [printf('Der Ausgang wurde gefunden')] (0:0:0 - 1)
		IfNotBlocked
		reached[0][54] = 1;
		Printf("Der Ausgang wurde gefunden");
		_m = 3; goto P999; /* 0 */
	case 55: // STATE 63 - treasurehunt-b.pml:86 - [-end-] (0:0:0 - 5)
		IfNotBlocked
		reached[0][63] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}

