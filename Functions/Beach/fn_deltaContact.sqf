["Delta is assaulting the beach now"] remoteExecCall ["Kiska_fnc_DataLinkMsg",[0,-2] select (isDedicated)];

[
    {
        null = [BeachSound,[1500,2000,2500],1100] spawn Kiska_fnc_BattleSound;
    }, 
    [], 
    30
] call CBA_fnc_waitAndExecute;

["Delta is pinned on the beach by heavy armor...BREAK",40] remoteExecCall ["Kiska_fnc_DataLinkMsg",[0,-2] select (isDedicated)];

["Requesting units to move into position for laser guidance of MAC strike",44] remoteExecCall ["Kiska_fnc_DataLinkMsg",[0,-2] select (isDedicated)];

null = [hammer, artyTarget1, 7,60,100] spawn Kiska_fnc_Arty;

[
    {
        [true,"MAC","MAC_TASK",objNull,"AUTOASSIGNED",0,true,"TARGET"] call BIS_fnc_taskCreate;
    }, 
    [], 
    47
] call CBA_fnc_waitAndExecute;

missionNamespace setVariable ["MAC_online",true,true];

"marker_121" setMarkerAlpha 1;