/* ----------------------------------------------------------------------------
Function: OPF_fnc_prepareGlobals

Description:
	Does exactly what it says. Most globals in the scenario are initialized here.
	
	It is executed from the "initServer.sqf".
	
Parameters:
	NONE

Returns:
	Nothing

Examples:
    (begin example)

		call OPF_fnc_prepareGlobals

    (end)

Author:
	Ansible2 // Cipher
---------------------------------------------------------------------------- */
// check optional mods
OPF_JTFSArmoryLoaded = ["JTFS_URF_Units"] call KISKA_fnc_isPatchLoaded;
OPF_opcanLoaded = ["LM_OPCAN_UNSC"] call KISKA_fnc_isPatchLoaded;
OPF_FTZLoaded = ["V_FZ_Core"] call KISKA_fnc_isPatchLoaded;


////////////////////////Enemy Unit Types/////////////////////////////
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

private _enemyManTypes = call OPF_fnc_selectEnemyManTypes;
OPF_URF_unitTypesArray = _enemyManTypes select 0;
OPF_URF_crewman = _enemyManTypes select 1;
OPF_URF_officer = _enemyManTypes select 2;

////////////////////////Enemy Vehicle Types/////////////////////////////
private _enemyVehicleTypes = call OPF_fnc_selectEnemyVehicleTypes;

OPF_largeTrucksURFArray = _enemyVehicleTypes select 0;
OPF_miscWarthogsURFArray = _enemyVehicleTypes select 1;
OPF_mgWarthogURF = _enemyVehicleTypes select 2;
OPF_rocketWarthogURF = _enemyVehicleTypes select 3;
OPF_apcWarthogURF = _enemyVehicleTypes select 4;
OPF_falconURF = _enemyVehicleTypes select 5;
OPF_apcURF = _enemyVehicleTypes select 6;

////////////////////////Friendly Unit Types/////////////////////////////
private _friendlyUnitTypes = call OPF_fnc_selectEnemyManTypes;

OPF_UNSC_unitTypesArray = _friendlyUnitTypes select 0;
OPF_UNSC_crewman = _friendlyUnitTypes select 1;

////////////////////////Friendly Vehicle Types/////////////////////////////
private _friendlyVehicleTypes = call OPF_fnc_selectFriendlyVehicleTypes;

OPF_fuelTruckUNSC = _friendlyVehicleTypes select 0;
OPF_ammoTruckUNSC = _friendlyVehicleTypes select 1;
OPF_transportCoveredTruckUNSC = _friendlyVehicleTypes select 2;
OPF_transportUnCoveredTruckUNSC = _friendlyVehicleTypes select 3;
OPF_miscWarthogsUNSCArray = _friendlyVehicleTypes select 4;
OPF_mgWarthogUNSC = _friendlyVehicleTypes select 5;
OPF_amphibiousAPCUNSC = _friendlyVehicleTypes select 6;
OPF_bisonsArray = _friendlyVehicleTypes select 7;
OPF_falconUNSC = _friendlyVehicleTypes select 8;
OPF_pelicanUNSC = _friendlyVehicleTypes select 9;
OPF_hornetUNSC = _friendlyVehicleTypes select 10;
OPF_sparrowHawksArray = ["OPTRE_AV22C_Sparrowhawk","OPTRE_AV22B_Sparrowhawk","OPTRE_AV22A_Sparrowhawk"];



// placement marker arrays
private _fn_getMissionLayerEntities = {
	params ["_layerName"];

	(getMissionLayerEntities _layerName) select 0;
};
// URF
OPF_spawnMarkers_APCs_URF = ["spawns_URF_APC"] call _fn_getMissionLayerEntities;
OPF_spawnMarkers_falcons_URF = ["spawns_URF_falcons"] call _fn_getMissionLayerEntities;
OPF_spawnMarkers_largeTrucks_URF = ["spawns_URF_largeTrucks"] call _fn_getMissionLayerEntities;
OPF_spawnMarkers_mgWarthogs_URF = ["spawns_URF_mgWarthogs"] call _fn_getMissionLayerEntities;
OPF_spawnMarkers_miscWarthogs_URF = ["spawns_URF_miscWarthogs"] call _fn_getMissionLayerEntities;
OPF_spawnMarkers_rocketWarthogs_URF = ["spawns_URF_rocketWarthogs"] call _fn_getMissionLayerEntities;
// UNSC
OPF_spawnMarkers_ammoTrucks_UNSC = ["spawns_UNSC_ammoTrucks"] call _fn_getMissionLayerEntities;
OPF_spawnMarkers_bison_UNSC = ["spawns_UNSC_bison"] call _fn_getMissionLayerEntities;
OPF_spawnMarkers_fuelTrucks_UNSC = ["spawns_UNSC_fuelTrucks"] call _fn_getMissionLayerEntities;
OPF_spawnMarkers_hornets_UNSC = ["spawns_UNSC_hornets"] call _fn_getMissionLayerEntities;
OPF_spawnMarkers_pelicans_UNSC = ["spawns_UNSC_pelicans"] call _fn_getMissionLayerEntities;
OPF_spawnMarkers_sparrowHawks_UNSC = ["spawns_UNSC_sparrowHawks"] call _fn_getMissionLayerEntities;
OPF_spawnMarkers_transportTrucks_UNSC = ["spawns_UNSC_transportTrucks"] call _fn_getMissionLayerEntities;
OPF_spawnMarkers_warthogs_UNSC = ["spawns_UNSC_warthogs"] call _fn_getMissionLayerEntities;

[] spawn {
	_minDistance = 500;
	_maxDistance = 1700;
	_targetFPS = 100;
	_timeBetween = 5;
	_increment = 25;

	while {sleep _timeBetween; true} do {
		private _viewDistance = viewDistance;
		if (diag_fps < targetFPS) then {
			if (_viewDistance > _minDistance) then {
				setViewDistance (_viewDistance - _increment);
			};
		} else {
			if !(viewDistance isEqualTo _maxDistance) then {
				setViewDistance (_viewDistance + _increment);
			};
		};
	};
};




OPF_wolfpackLead = leader OPF_wolfpackGroup;
OPF_hadesLead = leader OPF_hadesGroup;

serverTargetFPS = 30;

call OPF_fnc_clearMemory;