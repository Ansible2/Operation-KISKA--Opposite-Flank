private ["_URF_unitTypes","_URF_crewman","_URF_officer"];

private _fn_defineEnemyTypes_vanilla = {
	_URF_unitTypes = OPF_manTypesURF_vanilla;
	_URF_crewman = "OPTRE_Ins_URF_Crewman";
	_URF_officer = "OPTRE_Ins_URF_Officer";
};
private _fn_defineEnemyTypes_OPCAN = {
	_URF_unitTypes = OPF_manTypesURF_OPCAN;
	_URF_crewman = "LM_OPCAN_URA_Crewman";
	_URF_officer = "LM_OPCAN_URA_Officer";
};
private _fn_defineEnemyTypes_JTFS = {
	_URF_unitTypes = OPF_manTypesURF_JTFS;
	_URF_crewman = "JTFS_Crewman";
	_URF_officer = "JTFS_Officer_01";
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

[_URF_unitTypes,_URF_crewman,_URF_officer]