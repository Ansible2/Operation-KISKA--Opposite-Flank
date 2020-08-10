params [
    ["_list",[],[]]
];
    
for "_i" from 0 to (count _list) do {
    _unit = _list select _i;

    if (isNil {(crew _unit)}) exitWith {};

    {_unit deleteVehicleCrew _x} forEach crew _unit; 
    deleteVehicle _unit;

    _i = _i + 1;
};