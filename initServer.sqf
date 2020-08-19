#include "Headers\misc\taskGlobals.hpp";
#include "Headers\misc\spawnData.hpp";
#include "Headers\misc\musicTracks.hpp";
#include "Headers\misc\unitTypes.hpp";

call OPF_fnc_prepareGlobals;

"marker_121" setMarkerAlpha 0;

// create a respawn at the airfield
//OPF_airfieldRespawn = [missionNamespace,getPosATL ONL_airfieldRespawn_Logic,"Airfield Respawn"] call BIS_fnc_addRespawnPosition;


// This may be uneccesary///////////////////////////////////////////////////////////////////////////
if !(isMultiplayer) then {
	if (isNull OPF_wolfpackLead OR {(units OPF_wolfpackGroup) findIf {_x in allPlayers} isEqualTo -1}) then {
		"spawn1" setmarkerAlpha 0;
		(units OPF_wolfpackGroup) apply {deleteVehicle _x};
		deleteGroup OPF_wolfpackGroup;
		
	};

	if (isNull OPF_hadesLead OR {(units OPF_hadesGroup) findIf {_x in allPlayers} isEqualTo -1}) then {
		"spawn2" setmarkerAlpha 0;
		(units OPF_hadesGroup) apply {deleteVehicle _x};
		deleteGroup OPF_hadesGroup;
	};
};
/////////////////////////////////////////////////////////////////////////////////////////////////////

[(getMissionLayerEntities "Arsenals") select 0] call KISKA_fnc_addArsenal;

private _fn_hideMarkers = {
	private _showMarkers = ((getMissionLayerEntities "showAtEnd") select 1) + ((getMissionLayerEntities "Frame1Hide") select 1) + ((getMissionLayerEntities "frame2Hide_1") select 1) + ((getMissionLayerEntities "Frame3persistent") select 1) + ((getMissionLayerEntities "Frame4hide_1") select 1);

	[(allMapMarkers - _showMarkers), 1] call BIS_fnc_hideMarkerArray;
};
call _fn_hideMarkers;

call OPF_fnc_serverLoops;

call OPF_fnc_sirenOfficersEventHandlers;

call OPF_fnc_arudyArtyEventHandlers;

OPF_pelicanStart flyInHeight 10;

missionNamespace setVariable ["MAC_online",false,true];

waitUntil {time > 1};

setDate [2519, 06, 24, 07, 30]; // CHANGE TIME HERE UPON RELEASE//////////////////////////////////

[OPF_musicTracks] call KISKA_fnc_randomMusic;