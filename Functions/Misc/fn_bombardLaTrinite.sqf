if (!alive OPF_arudyArtillery_1 AND {!alive OPF_arudyArtillery_2} AND {!alive OPF_arudyArtillery_3}) exitWith {};

if (alive OPF_arudyArtillery_1) then {
    null = [OPF_arudyArtillery_1,artyTarget4,8,360,300,[10,11,12]] spawn Kiska_fnc_Arty;
};

[OPF_arudyArtillery_2,OPF_arudyArtillery_3] apply {
    if (alive _x) then {
        [
            {
                null = [_this select 0,artyTarget4,8,360,300] spawn Kiska_fnc_Arty;
            }, 
            [_x], 
            2
        ] call CBA_fnc_waitAndExecute;
    };
};

null = [LarcheSound,3000,600] spawn Kiska_fnc_BattleSound;


["All units TAKE COVER! URF heavy artillery is inbound on La Trinite",22] remoteExecCall ["Kiska_fnc_DataLinkMsg",[0,-2] select (isDedicated)];

/*
if !(missionNamespace getvariable "musicPlaying") then {
    ["Kiska_FiringRange"] remoteExecCall ["Kiska_fnc_PlayMusic",[0,-2] select (isDedicated),false];
};
*/
["Enemy artillery is located at Arudy...Break",32] remoteExecCall ["Kiska_fnc_DataLinkMsg",[0,-2] select (isDedicated)];

["You need to secure transport and push towards it",37] remoteExecCall ["Kiska_fnc_DataLinkMsg",[0,-2] select (isDedicated)];


[
    {
        [true,destroyArudyArtillery_TaskID,"DetArty_Task",objNull,"ASSIGNED",10,true,"DESTROY"] call BIS_fnc_taskCreate;
    }, 
    [], 
    40
] call CBA_fnc_waitAndExecute;	

[
    {
        allPlayers apply {
            private _player = _x;
            [_player, ReqShipArty, ShipArty] remoteExecCall ["BIS_fnc_addSupportLink",_player];
        };
        //[allplayers findIf {local _x},ReqShipArty,ShipArty] remoteExecCall ["BIS_fnc_addSupportLink",allPlayers];
        /*{
            [_x, ReqShipArty, ShipArty] call BIS_fnc_addSupportLink;
        } count allPlayers > 0;*/
    }, 
    [], 
    50
] call CBA_fnc_waitAndExecute;

["Be advised, shipborne artillery is online",52] remoteExecCall ["Kiska_fnc_DataLinkMsg",[0,-2] select (isDedicated)];