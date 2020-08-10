[supportAirAssault_TaskID,"SUCCEEDED"] call BIS_fnc_taskSetState;

[(getMissionLayerEntities "Air Assault Troops") select 0] call fn_EnableDynamic;

[bravo1,getPosASL sirenLogic,50,true] call CBA_fnc_taskAttack;

[bravo2,getPosASL sirenLogic_2,50,true] call CBA_fnc_taskAttack;

[bravo3,getPosASL sirenLogic_1,50,true] call CBA_fnc_taskAttack;

[true,"Siren","Siren_Task","marker_91","ASSIGNED",15,true,"KILL"] call BIS_fnc_taskCreate;