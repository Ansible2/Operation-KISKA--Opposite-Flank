if (!alive mortar1g && {!alive mortar2g} && {!alive mortar3g}) exitWith {};

null = [mortar1, artyTarget3, 4,60,100] spawn Kiska_fnc_Arty;

["Delta is getting mortar fire from its West...BREAK",4] remoteExecCall ["Kiska_fnc_DataLinkMsg",(allplayers inAreaArray MS_Trg)];
["URF is on the hill directly WEST. Look for a cross",8] remoteExecCall ["Kiska_fnc_DataLinkMsg",(allplayers inAreaArray MS_Trg)];