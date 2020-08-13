private _fn_defineEnemyVehicles_vanilla = {
	OPF_largeTrucksURF = OPF_largeTrucksURF_vanilla;
	OPF_miscWarthogs = OPF_miscWarthogsURF_vanilla;
	OPF_mgWarthogURF = "OPTRE_M12_LRV_ins";
	OPF_rocketWarthogURF = "OPTRE_M12A1_LRV_ins";
	OPF_apcWarthogURF = "OPTRE_M12_FAV_APC";
};
private _fn_defineEnemyVehicles_zulu = {
	OPF_largeTrucksURF = OPF_largeTrucksURF_JTFS;
	OPF_miscWarthogsURF = OPF_miscWarthogsURF_zulu;
	OPF_mgWarthogURF = "VES_M12_LRV_URF";
	OPF_rocketWarthogURF = "VES_M12A1_LRV_URF";
	OPF_apcWarthogURF = "VES_M12_APC_URF";
};
private _fn_defineEnemyVehicles_JTFS = {
	OPF_largeTrucksURF = OPF_largeTrucksURF_JTFS;
	OPF_miscWarthogsURF = OPF_miscWarthogsURF_JTFS;
	OPF_mgWarthogURF = "JTFS_M12_LRV";
	OPF_rocketWarthogURF = "JTFS_M12A1_LRV";
	OPF_apcWarthogURF = "JTFS_M12_FAV_APC";
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
		if (OPF_opcanLoaded) then {
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



