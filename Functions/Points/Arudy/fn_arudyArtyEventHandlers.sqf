[OPF_arudyArtillery_1,OPF_arudyArtillery_2,OPF_arudyArtillery_3] apply {
	_x addEventHandler ["Killed",{

		private _deadArty = missionNamespace getVariable ["deadArudyArty",0];
		
		if (_deadArty isEqualTo 2) then {
			call OPF_fnc_saveGame;
			
			[destroyArudyArtillery_TaskID] call KISKA_fnc_setTaskComplete;

			[
				{[secureSiren_TaskID] call BIS_fnc_taskCompleted}, 
				{
					[true,returnToSiren_TaskID,"ReturnSiren_Task","marker_91","ASSIGNED",20,true,"MOVE"] call BIS_fnc_taskCreate;
				}
			] call CBA_fnc_waitUntilAndExecute;
				
		} else {
			missionNamespace setVariable ["deadArudyArty", _deadArty + 1];
		};
		
	}];
};