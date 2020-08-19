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
if (alive OPF_intel_1) then {
	[OPF_intel_1,"Dossier 1", "The target is Nicholas Bertruzzi, commander of the 140th Infantry Regiment garrisoned at La Trinite.","pics\hvts\hvt3.jpg"] call KISKA_fnc_intel;
};

if (alive OPF_intel_2) then {
	[OPF_intel_2,"Dossier 2", "Thomas Nyugen, 135th Field Artilley Brigade. ONI just got us word that he'll be round to La Trinite.","pics\hvts\hvt2.jpg"] call KISKA_fnc_intel;
};

if (alive OPF_intel_3) then {
	[OPF_intel_3,"Dossier 3", "We can expect the commander of the 110th Engineer Regiment, Daniel Kadavy, to be at Siren.","pics\hvts\hvt1.jpg"] call KISKA_fnc_intel;
};

// change to a hold action
OPF_briefingMonitor addaction ["Start Briefing For All Players",{remoteExec ["OPF_fnc_AnimatedBrief",0];}];

[_player] call OPF_fnc_addSupplyDropActions;

call KISKA_fnc_rallyPointActionLoop;

[_player] call OPF_fnc_createDiaryRecords;

private _fn_introText = {
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
		
		if (alive OPF_intel_1 OR {alive OPF_intel_2} OR {alive OPF_intel_3}) then {
			["There are also three Intel pieces on the Center table.",35,false] call Kiska_fnc_DataLinkMsg;
		};
	};
};
call _fn_introText;

["HFMP_Sketchbook1_1"] call KISKA_fnc_playMusic;

_player setCustomAimCoef 0.15;