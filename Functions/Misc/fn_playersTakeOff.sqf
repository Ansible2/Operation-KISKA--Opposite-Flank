["Pelican is taking off now"] remoteExec ["hint",[0,-2] select (isDedicated),false];

["HFMP_sacredRings"] remoteExecCall ["Kiska_fnc_PlayMusic",[0,-2] select (isDedicated)];

[true,destroyTalosMortars_TaskID,"DetMortars_Task",objNull,"ASSIGNED",5,true,"DESTROY"] call BIS_fnc_taskCreate;

OPF_pelicanStart animate ["cargoDoor_1",1];
OPF_pelicanStart animate ["cargoDoor_2",1];

call OPF_fnc_saveGame;