if ([reconLZ_TaskID] call BIS_fnc_taskExists) then {
    [reconLZ_TaskID,"CANCELED",true] call BIS_fnc_taskSetState;
};	

["1st and 2nd platoon are on route...BREAK"] remoteExecCall ["Kiska_fnc_DataLinkMsg",[0,-2] select (isDedicated)];

["ETA 2.5 minutes",4] remoteExecCall ["Kiska_fnc_DataLinkMsg",[0,-2] select (isDedicated)];


[{[pelican1,[logic_00,logic_10,logic_20],pad1,logic_30,deleteLog] call Kiska_fnc_AirAssault;}, [], 5] call CBA_fnc_waitAndExecute;

[{[pelican2,[logic_01,logic_11,logic_21],pad2,logic_31,deleteLog] call Kiska_fnc_AirAssault;}, [], 8] call CBA_fnc_waitAndExecute;

[{[pelican3,[logic_02,logic_12,logic_22],pad3,logic_32,deleteLog] call Kiska_fnc_AirAssault;}, [], 12] call CBA_fnc_waitAndExecute;

[
    {
        _waveTrig = createTrigger ["EmptyDetector", [0,0,0],true]; 
        _waveTrig setTriggerActivation ["INDIA", "PRESENT", true]; 
        _waveTrig setTriggerStatements ["!(missionNamespace getVariable 'waveOffCalled')", "missionNamespace setVariable ['waveOffCalled',true,true]", "['Going into holding pattern'] remoteExecCall ['Kiska_fnc_DataLinkMsg',[0,-2] select (isDedicated)]", ""];
            
        _backTrig = createTrigger ["EmptyDetector", [0,0,0],true]; 
        _backTrig setTriggerActivation ["JULIET", "PRESENT", true]; 
        _backTrig setTriggerStatements ["(missionNamespace getVariable 'waveOffCalled')", "missionNamespace setVariable ['waveOffCalled',false,true]", "['Returning to AO'] remoteExecCall ['Kiska_fnc_DataLinkMsg',[0,-2] select (isDedicated)]", ""]; 
    },
    [],
    20
] call CBA_fnc_waitAndExecute;


fn_radio = {
    9 setRadioMsg "Wave off Air Assault";
    10 setRadioMsg "Call back Air Assault";
};

remoteExecCall ["fn_radio",[0,-2] select (isDedicated),true];

[true,"SupAA","SupAA_Task",objNull,"ASSIGNED",5,true,"DEFEND"] call BIS_fnc_taskCreate;


[
    {!(missionNamespace getVariable "waveOffCalled")}, 
    {["HFMP_EldersLegacy"] remoteExecCall ["Kiska_fnc_PlayMusic",[0,-2] select (isDedicated)];}
] call CBA_fnc_waitUntilAndExecute;