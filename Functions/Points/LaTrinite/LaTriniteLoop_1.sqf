[
	2,
	{
		private _group = [13,OPF_vanillaUnitTypes_array,opfor,laTriniteSpawn_1] call KISKA_fnc_spawnGroup;
		[_group,laTriniteSpawn_1,175,4] call CBA_fnc_taskPatrol;
	},
	{(!((allPlayers findIf {_x distance laTriniteLogic_1 < 100}) isEqualTo -1)) AND {diag_fps >= serverTargetFPS}}
] call KISKA_fnc_waitUntil;