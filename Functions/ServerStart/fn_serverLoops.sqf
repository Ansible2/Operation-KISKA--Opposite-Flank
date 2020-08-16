// select point
[
	4,
	{
		if (missionNamespace getVariable ["oppositeFlank_pointSelected",false]) then {
			call OPF_fnc_selectPoint;
		};
	},
	{daytime > 8.33}
] call KISKA_fnc_waitUntil;

// Delta Contact Loop
[
	2,
	{
		call OPF_fnc_deltaContact;
	},
	{daytime > 8}
] call KISKA_fnc_waitUntil;

// air assualt
[
	2,
	{
		[((getMissionLayerEntities "AA Units") select 0),true,false] call KISKA_fnc_showHide;

		call OPF_fnc_enRoute;
		
		// complete Air Assualt
		[
			2,
			{
				call OPF_fnc_airAssaultLanded;
			},
			{ (((count (crew Dragon1)) < 3) OR (isNull Dragon1)) AND {((count (crew Dragon2)) < 2) OR (isNull Dragon2)} AND {((count (crew Dragon3)) < 3) OR (isNull Dragon3)} }
		] call KISKA_fnc_waitUntil;
	},
	{dayTime > 8.41}
] call KISKA_fnc_waitUntil;

// Arudy Spawn Loop
[
	2,
	{
		call OPF_fnc_arudySpawn;
	},
	{(!((allPlayers findIf {_x distance aurdyCityLogic < 115}) isEqualTo -1)) AND {diag_fps >= serverTargetFPS}}
] call KISKA_fnc_waitUntil;

// Arudy Ambush Loop
[
	2,
	{
		private _group1 = [9,OPF_battleJumpersUnitTypes_array,opfor,arudyAmbushlogic1] call KISKA_fnc_spawnGroup;
		private _group2 = [9,OPF_battleJumpersUnitTypes_array,opfor,arudyAmbushlogic2] call KISKA_fnc_spawnGroup;
		[_group1,arudyAmbush1WP] call CBA_fnc_taskAttack;
		[_group2,arudyAmbush2WP] call CBA_fnc_taskAttack;

	},
	{(!((allPlayers findIf {_x distance arudyAmbushlogic2 < 165}) isEqualTo -1)) AND {diag_fps >= serverTargetFPS}}
] call KISKA_fnc_waitUntil;

// Centaur Spawn Loop
[
	2,
	{
		private _group = [3,OPF_vanillaUnitTypes_array,opfor] call KISKA_fnc_spawnGroup;
		{
			if (_forEachIndex isEqualTo 0) then {_x moveInGunner centaurHog1};

			if (_forEachIndex isEqualTo 1) then {_x setPosWorld [7439.6,8072.15,0]; _x setDir 154.85;};

			if (_forEachIndex isEqualTo 2) then {_x moveInGunner centaurTurret1};
		} foreach (units _group);


		private _apcCrew = [3,["OPTRE_Ins_URF_Crewman"],opfor] call KISKA_fnc_spawnGroup;
		[units _apcCrew,centaurAPC] call KISKA_fnc_setCrew;
		[_apcCrew,centaurLogic] call CBA_fnc_taskAttack;


		private _group2 = [3,OPF_vanillaUnitTypes_array,opfor,centaurLogic] call KISKA_fnc_spawnGroup;

		if (missionNamespace getVariable ["oppositeFlank_pointSelected",false]) then {
			call OPF_fnc_selectPoint;
		};

	},
	{(!((allPlayers findIf {_x distance CentaurLogic < 100}) isEqualTo -1)) AND {diag_fps >= serverTargetFPS}}
] call KISKA_fnc_waitUntil;

// Cyclops Spawn Loop
[
	2,
	{
		private _group = [5,OPF_vanillaUnitTypes_array,opfor,cyclopsSpawn1] call KISKA_fnc_spawnGroup;
	

		private _apcCrew = [3,["OPTRE_Ins_URF_Crewman"],opfor] call KISKA_fnc_spawnGroup;
		[units _apcCrew,cyclopsAPC] call KISKA_fnc_setCrew;


		private _group2 = [3,OPF_vanillaUnitTypes_array,opfor] call KISKA_fnc_spawnGroup;
		{
			if (_forEachIndex isEqualTo 0) then {_x moveInGunner cyclopsTurret1};

			if (_forEachIndex isEqualTo 1) then {_x setPosWorld [6978.48,8114.31,0]; _x setDir 227.710;};

			if (_forEachIndex isEqualTo 2) then {_x moveInGunner cyclopsTurret2};
		} foreach (units _group2);

		[6,3,OPF_vanillaUnitTypes_array,OPF_cyclopsShow_positions,false,true] call KISKA_fnc_spawn;	

		if (missionNamespace getVariable ["oppositeFlank_pointSelected",false]) then {
			call OPF_fnc_selectPoint;
		};
	},
	{(!((allPlayers findIf {_x distance cyclopsLogic < 100}) isEqualTo -1)) AND {diag_fps >= serverTargetFPS}}
] call KISKA_fnc_waitUntil;

// Bombard LaTrinite Loop
[
	2,
	{
		if !(missionNamespace getVariable ["oppFlank_ArtyCrewSpawned",false]) then {
			private _crew = [3,["OPTRE_Ins_URF_Crewman"],opfor] call KISKA_fnc_spawnGroup;
			private _vehicle = OPF_arudyArtillery_1;
			[units _crew,_vehicle] call KISKA_fnc_setCrew;

			private _crew2 = [3,["OPTRE_Ins_URF_Crewman"],opfor] call KISKA_fnc_spawnGroup;
			private _vehicle2 = OPF_arudyArtillery_2;
			[units _crew2,_vehicle2] call KISKA_fnc_setCrew;

			private _crew3 = [3,["OPTRE_Ins_URF_Crewman"],opfor] call KISKA_fnc_spawnGroup;
			private _vehicle3 = OPF_arudyArtillery_3;
			[units _crew3,_vehicle3] call KISKA_fnc_setCrew;
		};

		private _apcCrew = [3,["OPTRE_Ins_URF_Crewman"],opfor] call KISKA_fnc_spawnGroup;
		[units _apcCrew,arudyAPC1] call KISKA_fnc_setCrew;

		private _apcCrew2 = [3,["OPTRE_Ins_URF_Crewman"],opfor] call KISKA_fnc_spawnGroup;
		[units _apcCrew2,arudyAPC2] call KISKA_fnc_setCrew;

		call OPF_fnc_bombardLaTrinite;

	},
	{((!((allPlayers findIf {_x distance aurdyCityLogic < 800}) isEqualTo -1)) OR {daytime >= 9} OR {([secureSiren_TaskID] call BIS_fnc_taskCompleted)}) AND {diag_fps >= serverTargetFPS}}
] call KISKA_fnc_waitUntil;

// TALOS QRF Loop
[
	3,
	{
		private _group = [6,OPF_vanillaUnitTypes_array,opfor,TalosQRFSpawn1] call KISKA_fnc_spawnGroup;
		[_group, OPF_talosQRF_attackPosition, 30, "MOVE", "AWARE", "YELLOW", "FULL", "STAG COLUMN"] call CBA_fnc_addWaypoint;
		//[_group,OPF_talosQRF_attackPosition,30] call CBA_fnc_taskAttack;

		private _group1 = [13,OPF_vanillaUnitTypes_array,opfor,TalosQRFSpawn2] call KISKA_fnc_spawnGroup;
		[_group1, OPF_talosQRF_attackPosition, 25, "MOVE", "AWARE", "YELLOW", "FULL", "STAG COLUMN"] call CBA_fnc_addWaypoint;
		//[_group1,OPF_talosQRF_attackPosition,25] call CBA_fnc_taskAttack;

		//QRF Building loop spawn
		[
			0.5,
			{
				[10,2,OPF_vanillaUnitTypes_array,OPF_zone1_positions] call Kiska_fnc_spawn;
			},
			{!((allPlayers findIf {_x distance TalosQRFSpawnLogic < 50}) isEqualTo -1)}
		] call KISKA_fnc_waitUntil;

	},
	// it is twice as fast (0.006 compared to 0.003ms) to check like this instead of a function
	{(!((allPlayers findIf {_x distance TalosQRFSpawnLogic < 100}) isEqualTo -1) OR {(!alive m1 AND {!alive m2} AND {!alive m3})}) AND {diag_fps >= serverTargetFPS}}
] call KISKA_fnc_waitUntil;

// TALOS Patrol 1 loop
[
	2.5,
	{
		private _group = [3,OPF_vanillaUnitTypes_array,opfor,patrol1Spawn1] call KISKA_fnc_spawnGroup;
		[_group,patrol1Spawn1,175,4] call CBA_fnc_taskPatrol;

		private _group1 = [5,OPF_vanillaUnitTypes_array,opfor,patrol1Spawn2] call KISKA_fnc_spawnGroup;
		[_group1,patrol1Spawn2,150,3] call CBA_fnc_taskPatrol;
	},
	{(!((allPlayers findIf {_x distance patrolLogic1 < 300}) isEqualTo -1)) AND {diag_fps >= serverTargetFPS}}
] call KISKA_fnc_waitUntil;

// TALOS Patrol 2 Loop
[
	2.5,
	{
		private _group = [3,OPF_vanillaUnitTypes_array,opfor,patrol2Spawn1] call KISKA_fnc_spawnGroup;
		[_group,patrol2Spawn1,200,4] call CBA_fnc_taskPatrol;

		private _group1 = [6,OPF_vanillaUnitTypes_array,opfor,patrol2Spawn2] call KISKA_fnc_spawnGroup;
		[_group1,patrol2Spawn2,300,3] call CBA_fnc_taskPatrol;
	},
	{(!((allPlayers findIf {_x distance patrolLogic2 < 200}) isEqualTo -1)) AND {diag_fps >= serverTargetFPS}}
] call KISKA_fnc_waitUntil;

// Demons Music Loop
[
	1,
	{
		["HFMP_Demons"] remoteExecCall ["playMusic",[0,-2] select isDedicated,false];
	},
	{!((allPlayers findIf {_x distance tradeCenter_musicLogic < 120}) isEqualTo -1)}
] call KISKA_fnc_waitUntil;

// siren spawn Loop
[
	2,
	{
		[8,OPF_vanillaUnitTypes_array,opfor,sirenLogic] call KISKA_fnc_spawnGroup;

		[3,OPF_vanillaUnitTypes_array,opfor,sirenSpawn1] call KISKA_fnc_spawnGroup;

		[3,3,OPF_vanillaUnitTypes_array,OPF_sirenTower_positions,false,true] call KISKA_fnc_spawn;	

		private _apcCrew = [3,["OPTRE_Ins_URF_Crewman"],opfor] call KISKA_fnc_spawnGroup;
		[units _apcCrew,sirenAPC] call KISKA_fnc_setCrew;
		_apcCrew addWaypoint [[7099.06,7689.7,0],0];

		private _group = [3,OPF_vanillaUnitTypes_array,opfor] call KISKA_fnc_spawnGroup;
		{
			if (_forEachIndex isEqualTo 0) then {_x moveInGunner sirenTurret1};

			if (_forEachIndex isEqualTo 1) then {_x setPosWorld [7095.35,7793.08,0]; _x setDir 94.466;};

			if (_forEachIndex isEqualTo 2) then {_x moveInGunner sirenTurret2};
		} foreach (units _group2);


		[
			1,
			{
				[15,3,OPF_vanillaUnitTypes_array,OPF_zone3_positions,false,true] call Kiska_fnc_spawn;
			},
			{(!((allPlayers findIf {_x distance sirenLogic < 25}) isEqualTo -1)) AND {diag_fps >= serverTargetFPS}}
		] call KISKA_fnc_waitUntil;	
	},
	{(!((allPlayers findIf {_x distance sirenLogic < 100}) isEqualTo -1)) AND {diag_fps >= serverTargetFPS}}
] call KISKA_fnc_waitUntil;