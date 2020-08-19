params ["_newUnit"];

// give unit back their loadout
_newUnit setUnitLoadout KISKA_loadout;

_newunit setCustomAimCoef 0.15;

[
	{
		if (viewDistance > 1700) then {
			setViewDistance 1700;
		};
		if ((getObjectViewDistance select 0) > 1500) then {
			setObjectViewDistance 1500;
		};
	},
	[_newUnit],
	2
] call CBA_fnc_waitAndExecute;

[_newUnit] call OPF_fnc_addSupplyDropActions;