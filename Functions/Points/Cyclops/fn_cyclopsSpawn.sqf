[15,2,OPF_vanillaUnitTypes_array,OPF_zone4_positions,true,true] remoteExecCall ["Kiska_fnc_spawn",2];

//[0,15,2,1,1,1,"z4SPs"] remoteExecCall ["Kiska_fnc_spawn",2];

[
    3,
    {
        ["HFMP_Postcard"] call Kiska_fnc_PlayMusic;
    },
    {
        !(call KISKA_fnc_isMusicPlaying)
    }

] remoteExecCall ["Kiska_fnc_waitUntil",[0,-2] select (isDedicated),false];

/*
fn_remoteCyclopsSpawnMusic = {
    [	
        {
            [
                {!(call CBA_fnc_isMusicPlaying)},
                {
                    ["Kiska_Aurora"] call Kiska_fnc_PlayMusic;
                }
            ] call CBA_fnc_waitUntilAndExecute;
        }, 
        [], 
        5
    ] call CBA_fnc_waitAndExecute;
};


remoteExec ["fn_remoteCyclopsSpawnMusic",[0,-2] select (isDedicated),false];
*/	