	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC :init: */

	case 3: // STATE 1
		;
		((P2 *)_this)->placeTrapX = trpt->bup.oval;
		;
		goto R999;

	case 4: // STATE 3
		;
		((P2 *)_this)->placeTrapY = trpt->bup.oval;
		;
		goto R999;

	case 5: // STATE 5
		;
		((P2 *)_this)->placeTrap = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 7: // STATE 7
		;
		now.trap = trpt->bup.oval;
		;
		goto R999;

	case 8: // STATE 13
		;
		((P2 *)_this)->placeTrapY = trpt->bup.ovals[1];
		((P2 *)_this)->foundTrap = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 9: // STATE 13
		;
		((P2 *)_this)->placeTrapY = trpt->bup.oval;
		;
		goto R999;

	case 10: // STATE 13
		;
		((P2 *)_this)->placeTrapY = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 12: // STATE 25
		;
		((P2 *)_this)->placeTrapX = trpt->bup.oval;
		;
		goto R999;

	case 13: // STATE 25
		;
		((P2 *)_this)->placeTrapX = trpt->bup.oval;
		;
		goto R999;

	case 14: // STATE 31
		;
	/* 0 */	((P2 *)_this)->foundTrap = trpt->bup.oval;
		;
		;
		goto R999;

	case 15: // STATE 35
		;
		now.treasureMap[0].row[0] = trpt->bup.oval;
		;
		goto R999;

	case 16: // STATE 36
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 17: // STATE 37
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 18: // STATE 39
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC assistant */

	case 19: // STATE 1
		;
	/* 0 */	((P1 *)_this)->profLocation = trpt->bup.ovals[1];
		XX = 1;
		unrecv(now.walkieTalkie, XX-1, 0, ((int)((P1 *)_this)->profLocation), 1);
		((P1 *)_this)->profLocation = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 20: // STATE 3
		;
		((P1 *)_this)->_5_2_y = trpt->bup.ovals[1];
		((P1 *)_this)->_5_2_x = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 21: // STATE 4
		;
		((P1 *)_this)->_5_2_x = trpt->bup.oval;
		;
		goto R999;

	case 22: // STATE 11
		;
		((P1 *)_this)->_5_2_y = trpt->bup.oval;
		;
		goto R999;

	case 23: // STATE 6
		;
		((P1 *)_this)->_5_2_x = trpt->bup.oval;
		;
		goto R999;

	case 24: // STATE 11
		;
		((P1 *)_this)->_5_2_y = trpt->bup.oval;
		;
		goto R999;

	case 25: // STATE 13
		;
		((P1 *)_this)->_5_2_y = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 27: // STATE 19
		;
	/* 1 */	((P1 *)_this)->_5_2_x = trpt->bup.ovals[1];
	/* 0 */	((P1 *)_this)->_5_2_y = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 28: // STATE 36
		;
		((P1 *)_this)->nextLocation = trpt->bup.ovals[1];
		((P1 *)_this)->nextLocation = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 29: // STATE 36
		;
		((P1 *)_this)->nextLocation = trpt->bup.oval;
		;
		goto R999;

	case 30: // STATE 37
		;
		_m = unsend(now.walkieTalkie);
		;
		goto R999;

	case 31: // STATE 41
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC professor */
;
		;
		
	case 33: // STATE 2
		;
		now.professor_pid = trpt->bup.oval;
		;
		goto R999;

	case 34: // STATE 5
		;
		((P0 *)_this)->nextLocationWord = trpt->bup.ovals[2];
		((P0 *)_this)->assistantLocation = trpt->bup.ovals[1];
		((P0 *)_this)->nextLocation = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 3);
		goto R999;
;
		;
		
	case 36: // STATE 8
		;
		((P0 *)_this)->_4_1_y = trpt->bup.ovals[1];
		((P0 *)_this)->_4_1_x = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 37: // STATE 9
		;
		((P0 *)_this)->_4_1_x = trpt->bup.oval;
		;
		goto R999;

	case 38: // STATE 16
		;
		((P0 *)_this)->_4_1_y = trpt->bup.oval;
		;
		goto R999;

	case 39: // STATE 11
		;
		((P0 *)_this)->_4_1_x = trpt->bup.oval;
		;
		goto R999;

	case 40: // STATE 16
		;
		((P0 *)_this)->_4_1_y = trpt->bup.oval;
		;
		goto R999;

	case 41: // STATE 18
		;
		((P0 *)_this)->_4_1_y = trpt->bup.oval;
		;
		goto R999;
;
		;
		
	case 43: // STATE 24
		;
	/* 1 */	((P0 *)_this)->_4_1_x = trpt->bup.ovals[1];
	/* 0 */	((P0 *)_this)->_4_1_y = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 44: // STATE 41
		;
		((P0 *)_this)->nextLocationWord = trpt->bup.ovals[1];
		((P0 *)_this)->nextLocation = trpt->bup.ovals[0];
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 45: // STATE 41
		;
		((P0 *)_this)->nextLocationWord = trpt->bup.oval;
		;
		goto R999;

	case 46: // STATE 42
		;
		_m = unsend(now.walkieTalkie);
		;
		goto R999;

	case 47: // STATE 43
		;
		XX = 1;
		unrecv(now.walkieTalkie, XX-1, 0, ((int)((P0 *)_this)->assistantLocation), 1);
		((P0 *)_this)->assistantLocation = trpt->bup.oval;
		;
		;
		goto R999;

	case 48: // STATE 44
		;
	/* 0 */	((P0 *)_this)->nextLocationWord = trpt->bup.oval;
		;
		;
		goto R999;

	case 49: // STATE 45
		;
		now.treasureMap[ Index(((((P0 *)_this)->nextLocation-1)%3), 3) ].row[ Index(((((P0 *)_this)->nextLocation-1)/3), 3) ] = trpt->bup.oval;
		;
		goto R999;

	case 50: // STATE 47
		;
		now.treasureMap[ Index(((((P0 *)_this)->assistantLocation-1)%3), 3) ].row[ Index(((((P0 *)_this)->assistantLocation-1)/3), 3) ] = trpt->bup.oval;
		;
		goto R999;

	case 51: // STATE 50
		;
	/* 0 */	((P0 *)_this)->assistantLocation = trpt->bup.oval;
		;
		;
		goto R999;
;
		;
		
	case 53: // STATE 53
		;
	/* 0 */	((P0 *)_this)->assistantLocation = trpt->bup.oval;
		;
		;
		goto R999;
;
		;
		
	case 55: // STATE 63
		;
		p_restor(II);
		;
		;
		goto R999;
	}

