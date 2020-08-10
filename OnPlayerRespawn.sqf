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

OPF_supplyDrop1Action = [
	player, 
	"Supply Pod Drop 1", 
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_loaddevice_ca.paa", 
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa", 
	"missionNamespace getVariable ['OPF_podDropAvailable_1',true]", 
	"true", 
	{}, 
	{}, 
	{
		params ["_target", "_caller", "_actionId", "_arguments"];

		[_caller] remoteExecCall ["KISKA_fnc_podDrop",2];

		missionNamespace setVariable ["OPF_podDropAvailable_1",false,true];
	}, 
	{}, 
	[], 
	1, 
	1, 
	true, 
	false, 
	false
] call BIS_fnc_holdActionAdd;

OPF_supplyDrop2Action = [
	player, 
	"Supply Pod Drop 2", 
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_loaddevice_ca.paa", 
	"\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_connect_ca.paa", 
	"missionNamespace getVariable ['OPF_podDropAvailable_2',true]", 
	"true", 
	{}, 
	{}, 
	{
		params ["_target", "_caller", "_actionId", "_arguments"];

		[_caller] remoteExecCall ["KISKA_fnc_podDrop",2];

		missionNamespace setVariable ["OPF_podDropAvailable_2",false,true];
	}, 
	{}, 
	[], 
	1, 
	1, 
	true, 
	false, 
	false
] call BIS_fnc_holdActionAdd;