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
OPF_URF_unitTypes = _enemyManTypes select 0;
OPF_URF_crewman = _enemyManTypes select 1;
OPF_URF_officer = _enemyManTypes select 2;

////////////////////////Enemy Vehicle Types/////////////////////////////
private _enemyVehicleTypes = call OPF_fnc_selectEnemyVehicleTypes;

OPF_largeTrucksURF = _enemyVehicleTypes select 0;
OPF_miscWarthogsURF = _enemyVehicleTypes select 1;
OPF_mgWarthogURF = _enemyVehicleTypes select 2;
OPF_rocketWarthogURF = _enemyVehicleTypes select 3;
OPF_apcWarthogURF = _enemyVehicleTypes select 4;
OPF_falconURF = _enemyVehicleTypes select 5;

////////////////////////Friendly Unit Types/////////////////////////////
private _friendlyUnitTypes = call OPF_fnc_selectEnemyManTypes;

OPF_UNSC_unitTypes = _friendlyUnitTypes select 0;
OPF_UNSC_crewman = _friendlyUnitTypes select 1;

////////////////////////Friendly Vehicle Types/////////////////////////////
private _friendlyVehicleTypes = call OPF_fnc_selectFriendlyVehicleTypes;

OPF_largeTrucksURF = _friendlyVehicleTypes select 0;
OPF_miscWarthogsURF = _friendlyVehicleTypes select 1;
OPF_mgWarthogURF = _friendlyVehicleTypes select 2;
OPF_rocketWarthogURF = _friendlyVehicleTypes select 3;
OPF_apcWarthogURF = _friendlyVehicleTypes select 4;
OPF_falconURF = _friendlyVehicleTypes select 5;

OPF_wolfpackLead = leader OPF_wolfpackGroup;
OPF_hadesLead = leader OPF_hadesGroup;

serverTargetFPS = 30;

call OPF_fnc_clearMemory;