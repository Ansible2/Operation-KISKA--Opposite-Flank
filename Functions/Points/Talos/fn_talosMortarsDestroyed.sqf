if !(isServer) exitWith {};

"marker_29" setMarkerAlpha 0;
"marker_31" setMarkerAlpha 0;
"marker_100" setMarkerColor "colorBLUFOR";

[true,"Recon","Recon_Task",objNull,"ASSIGNED",0,true,"AIRDROP"] call BIS_fnc_taskCreate;

[destroyTalosMortars_TaskID,"SUCCEEDED"] call BIS_fnc_taskSetState;

["HFMP_rainMp4"] remoteExecCall ["Kiska_fnc_PlayMusic",[0,-2] select isDedicated,false];

call OPF_fnc_saveGame;