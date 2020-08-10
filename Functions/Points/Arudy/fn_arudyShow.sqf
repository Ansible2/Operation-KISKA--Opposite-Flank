["HFMP_EldersLegacy"] remoteExecCall ["Kiska_fnc_PlayMusic",[0,-2] select (isDedicated),false];

[
    2,
    {
        ["HFMP_01MainTheme"] call Kiska_fnc_PlayMusic;
    },
    {
        !(call KISKA_fnc_isMusicPlaying)
    }

] remoteExecCall ["Kiska_fnc_waitUntil",[0,-2] select (isDedicated),false];

[
	2,
	{
        [6,2,OPF_vanillaUnitTypes_array,OPF_zone5d_positions,true,true] remoteExecCall ["Kiska_fnc_spawn",2];
        [8,OPF_vanillaUnitTypes_array,opfor,arudyCityLogic] call KISKA_fnc_spawnGroup;
        [4,OPF_battleJumpersUnitTypes_array,opfor,BatJSpawn2] call KISKA_fnc_spawnGroup;
	},
	{(!((allPlayers findIf {_x distance aurdyCityLogic < 75}) isEqualTo -1)) AND {diag_fps >= serverTargetFPS}}
] call KISKA_fnc_waitUntil;

fn_spawnBJPatrol = {
    params [
        ["_numberOfUnits",1,[1]],
        ["_spawnPosition",[0,0,0],[[],objNull]],
        ["_radius",100,[1]],
        ["_waypointCount",3,[1]]
    ];

    private _group = [_numberOfUnits,OPF_battleJumpersUnitTypes_array,opfor,_spawnPosition] call KISKA_fnc_spawnGroup;
	[_group,_spawnPosition,150,_waypointCount] call CBA_fnc_taskPatrol;
};


[   
    1,
    {diag_fps > serverTargetFPS},
    {
        [4,BatJSpawn1] call fn_spawnBJPatrol;
    }
] call KISKA_fnc_waitUntil;
[   
    1,
    {diag_fps > serverTargetFPS},
    {
        [4,BatJSpawn3] call fn_spawnBJPatrol;
    }
] call KISKA_fnc_waitUntil;
[   
    1,
    {diag_fps > serverTargetFPS},
    {
        [4,BatJSpawn4] call fn_spawnBJPatrol;
    }
] call KISKA_fnc_waitUntil;
[   
    1,
    {diag_fps > serverTargetFPS},
    {
        [9,BatJSpawn5] call fn_spawnBJPatrol;
    }
] call KISKA_fnc_waitUntil;
[   
    1,
    {diag_fps > serverTargetFPS},
    {
        [9,BatJSpawn6] call fn_spawnBJPatrol;
    }
] call KISKA_fnc_waitUntil;



/*
[	
    {
        [
            {!(call CBA_fnc_isMusicPlaying)}, 
            {
                ["Kiska_Homeward"] remoteExecCall ["Kiska_fnc_PlayMusic",[0,-2] select (isDedicated),false];
            }
        ] call CBA_fnc_waitUntilAndExecute;
    }, 
    [], 
    10
] call CBA_fnc_waitAndExecute;
*/	

if (alive arudyArtillery1) then {
    null = [arudyArtillery1,artyTarget4,8,360,300,[10,11,12]] spawn Kiska_fnc_Arty;
};

if (alive arudyArtillery2) then {
    [
        {
            null = [arudyArtillery2,artyTarget4,8,360,300] spawn Kiska_fnc_Arty;
        }, 
        [], 
        2
    ] call CBA_fnc_waitAndExecute;
};