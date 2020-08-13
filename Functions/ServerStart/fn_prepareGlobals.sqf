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
call OPF_fnc_selectEnemyManTypes;


////////////////////////Enemy Vehicle Types/////////////////////////////
call OPF_fnc_selectEnemyVehicleTypes;


////////////////////////Vehicle Types/////////////////////////////


OPF_wolfpackLead = leader OPF_wolfpackGroup;
OPF_hadesLead = leader OPF_hadesGroup;

serverTargetFPS = 30;

call OPF_fnc_clearMemory;