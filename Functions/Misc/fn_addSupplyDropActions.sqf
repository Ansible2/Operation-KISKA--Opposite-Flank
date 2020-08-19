params ["_player"];

OPF_supplyDrop1Action = [
	_player, 
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
	_player, 
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