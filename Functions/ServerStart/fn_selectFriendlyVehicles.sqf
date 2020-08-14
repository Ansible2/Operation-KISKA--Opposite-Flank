private [
	"_fuelTruckUNSC",
	"_ammoTruckUNSC",
	"_transportTruckCoveredUNSC",
	"_transportTruckUnCoveredUNSC",
	"_largeTrucksUNSC",
	"_miscWarthogsUNSC",
	"_amphibiousAPCUNSC",
	"_bisons",
	"_falconUNSC",
	"_pelicanUNSC",
	"_hornetUNSC"
];

private _fn_defineFriendlyVehicles_vanilla = {
	_fuelTruckUNSC = "B_Truck_01_fuel_F";
	_ammoTruckUNSC = "B_T_Truck_01_ammo_F";
	_transportTruckCoveredUNSC = "B_Truck_01_covered_F";
	_transportTruckUnCoveredUNSC = "B_Truck_01_transport_F";
	_miscWarthogsUNSC = ["OPTRE_M12_FAV","OPTRE_M813_TT","OPTRE_M914_RV"];
	_amphibiousAPCUNSC = "B_T_APC_Wheeled_01_cannon_F";
	_bisons = ["OPTRE_M412_IFV_UNSC","OPTRE_M413_MGS_UNSC"];
	_falconUNSC = "OPTRE_UNSC_falcon_unarmed";
	_pelicanUNSC = "OPTRE_Pelican_armed";
	_hornetUNSC = "OPTRE_UNSC_Hornet";
};
private _fn_defineFriendlyVehicles_OPCAN = {
	_fuelTruckUNSC = "B_Truck_01_fuel_F";
	_ammoTruckUNSC = "B_T_Truck_01_ammo_F";
	_transportTruckCoveredUNSC = "B_Truck_01_covered_F";
	_transportTruckUnCoveredUNSC = "B_Truck_01_transport_F";
	_miscWarthogsUNSC = ["LM_OPCAN_HOG_U_MC_WDL","LM_OPCAN_HOG_TT_MC_WDL","LM_OPCAN_HOG_RC_MC_WDL"];
	_amphibiousAPCUNSC = "LM_OPCAN_AFV102_MC_WDL";
	_bisons = ["OPTRE_M412_IFV_UNSC","OPTRE_M413_MGS_UNSC"];
	_falconUNSC = "LM_OPCAN_UH144_MC";
	_pelicanUNSC = "LM_OPCAN_D77_A_MC_WDL";
	_hornetUNSC = "LM_OPCAN_AV14_MC";
};
private _fn_defineFriendlyVehicles_zulu = {
	_fuelTruckUNSC = "VES_HDV134_Tanker_C";
	_ammoTruckUNSC = "VES_HDV134_Resupply";
	_transportTruckCoveredUNSC = "VES_HDV134_TT_C";
	_transportTruckUnCoveredUNSC = "VES_HDV134_TT";
	_miscWarthogsUNSC = ["VES_M12_APC","VES_M12","VES_M813_TT"];
	_amphibiousAPCUNSC = "VES_IFV76_A";
	_bisons = ["VES_M412_IFV","VES_M413_MGS"];
	_falconUNSC = "VES_UH144";
	_pelicanUNSC = "VES_D77HTCI_A";
	_hornetUNSC = "VES_AV14_AGM";
};

switch (["friendlyVehicles",0] call BIS_fnc_getParamValue) do {
	// vanilla
	case 0: {
		call _fn_defineFriendlyVehicles_vanilla;
	};
	// OPCAN
	case 1: {
		if (OPF_opcanLoaded) then {
			call _fn_defineFriendlyVehicles_OPCAN;
		} else {
			if (OPF_FTZLoaded) then {
				call _fn_defineFriendlyVehicles_zulu;
			} else {
				call _fn_defineFriendlyVehicles_vanilla;
			};
		};
	};
	// Fire Team Zulu
	case 2: {
		if (OPF_FTZLoaded) then {
			call _fn_defineFriendlyVehicles_zulu;
		} else {
			if (OPF_opcanLoaded) then {
				call _fn_defineFriendlyVehicles_OPCAN;
			} else {
				call _fn_defineFriendlyVehicles_vanilla;
			};
		};
	};
};

[_fuelTruckUNSC,_ammoTruckUNSC,_transportTruckCoveredUNSC,_transportTruckUnCoveredUNSC,_miscWarthogsUNSC,_amphibiousAPCUNSC,_bisons,_falconUNSC,_pelicanUNSC,_hornetUNSC]