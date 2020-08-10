[
	2,
	{
		private _group = [3,OPF_vanillaUnitTypes_array,opfor,laTriniteSpawn_5] call KISKA_fnc_spawnGroup;
		[_group,laTriniteSpawn_5,100,3] call CBA_fnc_taskPatrol;

		private _group1 = [3,OPF_vanillaUnitTypes_array,opfor,laTriniteSpawn_6] call KISKA_fnc_spawnGroup;
		[_group1,laTriniteSpawn_6,100,3] call CBA_fnc_taskPatrol;

		private _group2 = [5,OPF_vanillaUnitTypes_array,opfor,laTriniteSpawn_4] call KISKA_fnc_spawnGroup;
		[_group2,laTriniteSpawn_4,110,3] call CBA_fnc_taskPatrol;

		private _apcCrew = [3,["OPTRE_Ins_URF_Crewman"],opfor] call KISKA_fnc_spawnGroup;
		private _apc = laTriniteAPC;
		[units _apcCrew,_apc] call KISKA_fnc_setCrew;
		[_apcCrew, [7271.4,7912.79,0], 25, "MOVE", "AWARE", "YELLOW", "NORMAL", "STAG COLUMN"] call CBA_fnc_addWaypoint;
	},
	{(!((allPlayers findIf {_x distance laTriniteLogic_3 < 150}) isEqualTo -1)) AND {diag_fps >= serverTargetFPS}}
] call KISKA_fnc_waitUntil;