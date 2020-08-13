/* ----------------------------------------------------------------------------
Function: OPF_fnc_placeSimpleVehicles

Description:
	The function spawns in all simple object vehicles across the mission.
	The function was used to support the multiple add ons that are possible to use with ONL.
	
	It is executed from the "initServer.sqf".
	
Parameters:
	NONE

Returns:
	Nothing

Examples:
    (begin example)

		call OPF_fnc_placeSimpleVehicles

    (end)

Author:
	Ansible2 // Cipher
---------------------------------------------------------------------------- */
if (!isServer) exitWith {};

private _fn_createSimple = {
	params [
		["_logic",objNull,[objNull]],
		["_type","",[""]]
	];
	/*
	private "_object";

	if (_type isEqualTo "fsg_tigr_1") then {
		_object = createVehicle [_type, getPosATL _logic];
		_object enableSimulationGlobal false;
		_object setVectorDirAndUp [vectorDir _logic,vectorUp _logic];
	} else {
		_object = createSimpleObject [_type, getPosASL _logic, false];
		_object setVectorDirAndUp [vectorDir _logic,vectorUp _logic];
	};
	*/
	private _object = [_type,getPosWorld _logic,getDir _logic,true] call BIS_fnc_createSimpleObject;

	_object
};