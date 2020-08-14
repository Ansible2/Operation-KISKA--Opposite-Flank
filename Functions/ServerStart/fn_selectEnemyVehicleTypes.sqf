private ["_largeTrucksURF","_miscWarthogsURF","_mgWarthogURF","_rocketWarthogURF","_apcWarthogURF","_falconURF"];

private _fn_defineEnemyVehicles_vanilla = {
	_largeTrucksURF = OPF_largeTrucksURF_vanilla;
	_miscWarthogsURF = OPF_miscWarthogsURF_vanilla;
	_mgWarthogURF = "OPTRE_M12_LRV_ins";
	_rocketWarthogURF = "OPTRE_M12A1_LRV_ins";
	_apcWarthogURF = "OPTRE_M12_FAV_APC";
	_falconURF = "OPTRE_UNSC_falcon_unarmed";
};
private _fn_defineEnemyVehicles_zulu = {
	_largeTrucksURF = OPF_largeTrucksURF_vanilla;
	_miscWarthogsURF = OPF_miscWarthogsURF_zulu;
	_mgWarthogURF = "VES_M12_LRV_URF";
	_rocketWarthogURF = "VES_M12A1_LRV_URF";
	_apcWarthogURF = "VES_M12_APC_URF";
	_falconURF = "VES_UH144_URF";
};
private _fn_defineEnemyVehicles_JTFS = {
	_largeTrucksURF = OPF_largeTrucksURF_JTFS;
	_miscWarthogsURF = OPF_miscWarthogsURF_JTFS;
	_mgWarthogURF = "JTFS_M12_LRV";
	_rocketWarthogURF = "JTFS_M12A1_LRV";
	_apcWarthogURF = "JTFS_M12_FAV_APC";
	_falconURF = "JTFS_UH144_UA";
};

switch (["enemyVehicles",0] call BIS_fnc_getParamValue) do {
	// vanilla
	case 0: {
		call _fn_defineEnemyVehicles_vanilla;
	};
	// Zulu
	case 1: {
		if (OPF_FTZLoaded) then {
			call _fn_defineEnemyVehicles_zulu;
		} else {
			if (OPF_JTFSArmoryLoaded) then {
				call _fn_defineEnemyVehicles_JTFS;
			} else {
				call _fn_defineEnemyVehicles_vanilla;
			};
		};
	};
	// JTFS
	case 2: {
		if (OPF_JTFSArmoryLoaded) then {
			call _fn_defineEnemyVehicles_JTFS;
		} else {
			if (OPF_FTZLoaded) then {
				call _fn_defineEnemyVehicles_zulu;
			} else {
				call _fn_defineEnemyVehicles_vanilla;
			};
		};
	};
};


[_largeTrucksURF,_miscWarthogsURF,_mgWarthogURF,_rocketWarthogURF,_apcWarthogURF,_falconURF]