[
	2,
	{
		private _group = [13,OPF_vanillaUnitTypes_array,opfor,laTriniteSpawn_2] call KISKA_fnc_spawnGroup;
		[_group,laTriniteSpawn_2,175,4] call CBA_fnc_taskPatrol;
	},
	{(!((allPlayers findIf {_x distance laTriniteLogic_2 < 75}) isEqualTo -1)) AND {diag_fps >= serverTargetFPS}}
] call KISKA_fnc_waitUntil;