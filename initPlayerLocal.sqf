params [
	["_player",player]
];

if (isMultiplayer AND {!isMultiplayerSolo}) then {
	enableSaving [false,false];
} else {
	enableSaving [true,true];
};

// intel
// if intel hasn't been destroyed by another player, then add the action
if (alive intel1) then {
	[intel1,"Dossier 1", "The target is Nicholas Bertruzzi, commander of the 140th Infantry Regiment garrisoned at La Trinite.","pics\hvts\hvt3.jpg"] call KISKA_fnc_intel;
};

if (alive intel2) then {
	[intel2,"Dossier 2", "Thomas Nyugen, 135th Field Artilley Brigade. ONI just got us word that he'll be round to La Trinite.","pics\hvts\hvt2.jpg"] call KISKA_fnc_intel;
};

if (alive intel3) then {
	[intel3,"Dossier 3", "We can expect the commander of the 110th Engineer Regiment, Daniel Kadavy, to be at Siren.","pics\hvts\hvt1.jpg"] call KISKA_fnc_intel;
};

screen1 addaction ["Start Briefing For All Players",{remoteExec ["OPF_fnc_AnimatedBrief",0];}];

// resupply actions
OPF_supplyDrop1Action = [
	player, 
	"Supply Pod Drop 1", 
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_loaddevice_ca.paa", 
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa", 
	"missionNamespace getVariable ['OPF_podDropAvailable_1',true]", 
	"true", 
	{}, 
	{}, 
	{
		private _caller = param [1];

		[_caller] remoteExecCall ["KISKA_fnc_podDrop",2];

		missionNamespace setVariable ["OPF_podDropAvailable_1",false,true];
	}, 
	{}, 
	[], 
	1, 
	1, 
	true, 
	false, 
	false
] call BIS_fnc_holdActionAdd;
OPF_supplyDrop2Action = [
	player, 
	"Supply Pod Drop 2", 
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_loaddevice_ca.paa", 
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa", 
	"missionNamespace getVariable ['OPF_podDropAvailable_2',true]", 
	"true", 
	{}, 
	{}, 
	{
		private _caller = param [1];

		[_caller] remoteExecCall ["KISKA_fnc_podDrop",2];

		missionNamespace setVariable ["OPF_podDropAvailable_2",false,true];
	}, 
	{}, 
	[], 
	1, 
	1, 
	true, 
	false, 
	false
] call BIS_fnc_holdActionAdd;

call KISKA_fnc_rallyPointActionLoop;

private _fn_introText = {
	["HFMP_Sketchbook1_1"] call KISKA_fnc_playMusic;

	["This is your Datalink...",5] call Kiska_fnc_DataLinkMsg;

	["It will give you updates throughout the mission...",10,false] call Kiska_fnc_DataLinkMsg;

	["The Pelican will not be able to take off until 0730, but board when ready.",15,false] call Kiska_fnc_DataLinkMsg;

	["When you're ready, head over to the green tent.",20,false] call Kiska_fnc_DataLinkMsg;


	if (count allPlayers < 1) then {
		["The large screen will have the briefing on it.",25,false] call Kiska_fnc_DataLinkMsg;

		["There are also three Intel pieces on the Center table.",30,false] call Kiska_fnc_DataLinkMsg;
	} else {
		["The large screen will have the briefing on it.",25,false] call Kiska_fnc_DataLinkMsg;

		["Just make sure your ALL of the team is ready.",30,false] call Kiska_fnc_DataLinkMsg;
		
		if (alive intel1 OR {alive intel2} OR {alive intel3}) then {
			["There are also three Intel pieces on the Center table.",35,false] call Kiska_fnc_DataLinkMsg;
		};
	};
};
call _fn_introText;

_player setCustomAimCoef 0.15;