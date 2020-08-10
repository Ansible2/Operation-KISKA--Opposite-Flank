["Delta has made it to their positions with heavy losses."] remoteExecCall ["Kiska_fnc_DataLinkMsg",[0,-2] select (isDedicated)];

[(getMissionLayerEntities "Delta Dourdan") select 0] call fn_EnableDynamic;

[
    {
        ["MAC", "CANCELED", true] call BIS_fnc_taskSetState;
    }, 
    [], 
    5
] call CBA_fnc_waitAndExecute;