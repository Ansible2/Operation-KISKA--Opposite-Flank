if !(isServer) exitWith {};

[((getMissionLayerEntities "AA Units") select 0),false,false] call KISKA_fnc_showHide;