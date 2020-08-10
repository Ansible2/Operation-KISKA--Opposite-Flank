[
	2,
	{
		call OPF_fnc_laTriniteLoop_1;
		call OPF_fnc_laTriniteLoop_2;
		call OPF_fnc_laTriniteLoop_3;
		call OPF_fnc_laTriniteLoop_4;
	},
	{!((allPlayers findIf {_x distance laTriniteLogic < 325}) isEqualTo -1)}
] call KISKA_fnc_waitUntil;