private ["_UNSC_unitTypes","_UNSC_crewman"];

private _fn_defineFriendlyTypes_vanilla = {
	_UNSC_unitTypes = OPF_manTypesUNSC_vanilla;
	_UNSC_crewman = "OPTRE_UNSC_Marine_Soldier_Crewman";
};
private _fn_defineFriendlyTypes_OPCAN = {
	_UNSC_unitTypes = OPF_manTypesUNSC_OPCAN;
	_UNSC_crewman = "LM_OPCAN_UNSCMC_Crewman_WDL";
};
private _fn_defineFriendlyTypes_zulu = {
	_UNSC_unitTypes = OPF_manTypesUNSC_zulu;
	_UNSC_crewman = "VES_Rifleman_Crew_MAR";
};

switch (["friendlyUnits",0] call BIS_fnc_getParamValue) do {
	// vanilla
	case 0: {
		call _fn_defineFriendlyTypes_vanilla;
	};
	// OPCAN
	case 1: {
		if (OPF_opcanLoaded) then {
			call _fn_defineFriendlyTypes_OPCAN;
		} else {
			if (OPF_FTZLoaded) then {
				call _fn_defineFriendlyTypes_zulu;
			} else {
				call _fn_defineEnemyTypes_vanilla;
			};
		};
	};
	// Fire Team Zulu
	case 2: {
		if (OPF_FTZLoaded) then {
			call _fn_defineFriendlyTypes_zulu;
		} else {
			if (OPF_opcanLoaded) then {
				call _fn_defineEnemyTypes_OPCAN;
			} else {
				call _fn_defineEnemyTypes_vanilla;
			};
		};
	};
};

[_UNSC_unitTypes,_UNSC_crewman]