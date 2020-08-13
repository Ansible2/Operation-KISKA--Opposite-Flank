// Battle Jumper Types
OPF_BJ_unitTypes = [
	"OPTRE_Ins_BJ_Soldier_TeamLeader",
	"OPTRE_Ins_BJ_Soldier_Automatic_Rifleman",
	"OPTRE_Ins_BJ_Soldier_Corpsman",
	"OPTRE_Ins_BJ_Soldier_Engineer",
	"OPTRE_Ins_BJ_Soldier_Marksman",
	"OPTRE_Ins_BJ_Soldier_Rifleman_AT",
	"OPTRE_Ins_BJ_Soldier_Rifleman_BR",
	"OPTRE_Ins_BJ_Soldier_Rifleman_AR",
	"OPTRE_Ins_BJ_Soldier_Scout"
];


private _fn_defineEnemyTypes_vanilla = {
	// base enemies
	OPF_URF_unitTypes = OPF_manTypesURF_vanilla;
	OPF_URF_crewman = "OPTRE_Ins_URF_Crewman";
	OPF_URF_officer = "OPTRE_Ins_URF_Officer";
};
private _fn_defineEnemyTypes_OPCAN = {
	OPF_URF_unitTypes = OPF_manTypesURF_OPCAN;
	OPF_URF_crewman = "LM_OPCAN_URA_Crewman";
	OPF_URF_officer = "LM_OPCAN_URA_Officer";
};
private _fn_defineEnemyTypes_JTFS = {
	OPF_URF_unitTypes = OPF_manTypesURF_JTFS;
	OPF_URF_crewman = "JTFS_Crewman";
	OPF_URF_officer = "JTFS_Officer_01";
};

// choose enemy type arrays 
switch (["enemyUnits",0] call BIS_fnc_getParamValue) do {
	// vanilla
	case 0: {
		call _fn_defineEnemyTypes_vanilla;
	};
	// OPCAN
	case 1: {
		if (OPF_opcanLoaded) then {
			call _fn_defineEnemyTypes_OPCAN;
		} else {
			if (OPF_JTFSArmoryLoaded) then {
				call _fn_defineEnemyTypes_JTFS;
			} else {
				call _fn_defineEnemyTypes_vanilla;
			};
		};
	};
	// JTFS Armory
	case 2: {
		if (OPF_JTFSArmoryLoaded) then {
			call _fn_defineEnemyTypes_JTFS;
		} else {
			if (OPF_opcanLoaded) then {
				call _fn_defineEnemyTypes_OPCAN;
			} else {
				call _fn_defineEnemyTypes_vanilla;
			};
		};
	};
};