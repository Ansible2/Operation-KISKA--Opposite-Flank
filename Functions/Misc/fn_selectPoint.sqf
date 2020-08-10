private _objective = selectRandomWeighted ["varPoint_Centaur",0.25,"varPoint_Cyclops",0.75];

if (_objective isEqualTo "varPoint_Cyclops") then {
    missionNamespace setVariable ["Point_Cyclops",true,true];

    //[thirdPlatoon,getPos centaurLogic,50,true] call CBA_fnc_taskAttack;
    [thirdPlatoon, centaurLogic, 50, "MOVE", "AWARE", "YELLOW", "FULL", "STAG COLUMN"] call CBA_fnc_addWaypoint;

    //[fourthPlatoon,getPos cyclopsLogic,50,true] call CBA_fnc_taskAttack;
    [fourthPlatoon, cyclopsLogic, 50, "MOVE", "AWARE", "YELLOW", "FULL", "STAG COLUMN"] call CBA_fnc_addWaypoint;

    ["marker_95", "colorBLUFOR",1] spawn BIS_fnc_changeColorMarker;

    ["The Garrison at Point Cyclops is heavily fortified...Break"] remoteExecCall ["Kiska_fnc_DataLinkMsg",[0,-2] select (isDedicated)];	

    ["Requesting that you move to assist.",5] remoteExecCall ["Kiska_fnc_DataLinkMsg",[0,-2] select (isDedicated)];	
    
    [
        {
            [true,helpCyclops_TaskID,"HelpCyclops_Task","marker_96","AUTOASSIGNED",15,true,"ATTACK"] call BIS_fnc_taskCreate;
        }, 
        [], 
        10
    ] call CBA_fnc_waitAndExecute;

    [
        2,
        {
            call OPF_fnc_cyclopsSpawn;

        },
        {!((allPlayers findIf {_x distance cyclopsLogic < 25}) isEqualTo -1)}
    ] call KISKA_fnc_waitUntil;	

} else {
    missionNamespace setVariable ["Point_Centaur",true,true];

    ["marker_96", "colorBLUFOR",1] spawn BIS_fnc_changeColorMarker;

    
    ["Units have encountered unexpected resistance at the fuel depot...Break"] remoteExecCall ["Kiska_fnc_DataLinkMsg",[0,-2] select (isDedicated)];	

    ["Requesting that you flank them to the south.",5] remoteExecCall ["Kiska_fnc_DataLinkMsg",[0,-2] select (isDedicated)];	

    [
        {
            [true,helpCentaur_TaskID,"HelpCentaur_Task","marker_95","AUTOASSIGNED",15,true,"ATTACK"] call BIS_fnc_taskCreate;
        }, 
        [], 
        10
    ] call CBA_fnc_waitAndExecute;	

    [
        2,
        {
            call OPF_fnc_centaurSpawn;
        },
        {!((allPlayers findIf {_x distance centaurLogic < 60}) isEqualTo -1)}
    ] call KISKA_fnc_waitUntil;	

    
};

private _unitTypes = ["OPTRE_UNSC_Marine_Soldier_SquadLead","OPTRE_UNSC_Marine_Soldier_Corpsman","OPTRE_UNSC_Marine_Soldier_TeamLead","OPTRE_UNSC_Marine_Soldier_Rifleman_AT","OPTRE_UNSC_Marine_Soldier_Grenadier","OPTRE_UNSC_Marine_Soldier_Marksman"];

private _centaurUNSC = [8,_unitTypes,blufor,centaurUNSCSpawn] call KISKA_fnc_spawnGroup;
[_centaurUNSC,centaurLogic,20] call CBA_fnc_taskAttack;

private _cyclopsUNSC = [8,_unitTypes,blufor,cyclopsUNSCSpawn] call KISKA_fnc_spawnGroup;
[_cyclopsUNSC,cyclopsLogic,15] call CBA_fnc_taskAttack;

missionNamespace setVariable ["oppositeFlank_pointSelected",true];