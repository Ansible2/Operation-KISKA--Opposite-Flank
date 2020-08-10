if !(isServer) exitWith {};

((getMissionLayerEntities "Siren Officers") select 0) apply {
	_x addEventHandler ["Killed",{
		private _deadOffs = missionNamespace getVariable ["oppFlank_deadSirenOfficers",0];

		if (_deadOffs isEqualTo 2) then {
			[secureSiren_TaskID] call KISKA_fnc_setTaskComplete;

			["marker_91", "colorBLUFOR",1] spawn BIS_fnc_changeColorMarker;
			
			call OPF_fnc_saveGame;

		} else {

			missionNamespace setVariable ["oppFlank_deadSirenOfficers",_deadOffs + 1];
			
		};
	}];
};