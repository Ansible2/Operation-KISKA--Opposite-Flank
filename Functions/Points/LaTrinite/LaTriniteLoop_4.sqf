[
	2,
	{
		private _group = [3,OPF_vanillaUnitTypes_array,opfor,laTriniteSpawn_3] call KISKA_fnc_spawnGroup;
		[_group,laTriniteSpawn_3,100,3] call CBA_fnc_taskPatrol;

		private _group1 = [8,OPF_vanillaUnitTypes_array,opfor,laTriniteSpawn_7] call KISKA_fnc_spawnGroup;
		[_group1,laTriniteSpawn_6,100,3] call CBA_fnc_taskPatrol;
	},
	{(!((allPlayers findIf {_x distance laTriniteLogic_4 < 200}) isEqualTo -1)) AND {diag_fps >= serverTargetFPS}}
] call KISKA_fnc_waitUntil;