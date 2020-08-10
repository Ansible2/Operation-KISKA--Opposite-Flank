/*
this addaction ["start Briefing",{null = [] remoteExec ["OPF_fnc_AnimatedBrief",[0,-2] select (isDedicated),false];}]
*/

if (missionNamespace getVariable "briefed") exitWith {hint "You have already been briefed"};

hint "Briefing Start";

private _showMarkers = ((getMissionLayerEntities "showAtEnd") select 1) + ((getMissionLayerEntities "Frame1Hide") select 1) + ((getMissionLayerEntities "frame2Hide_1") select 1) + ((getMissionLayerEntities "Frame3persistent") select 1) + ((getMissionLayerEntities "Frame4hide_1") select 1);

_timeline =
[
    
	[0.0,  		{	
					["HFMP_AncientBuilders"] call Kiska_fnc_PlayMusic;
					[(markersize "marker_start"),(markerPos "marker_start"),2,nil,true] spawn BIS_fnc_zoomOnArea;
					[(markerPos "marker_start")] call BIS_fnc_zoomLock;
					if (isServer) then {
						[(getmissionLayerEntities "Airfield") select 1, 1.0, true] call BIS_fnc_showMarkerArray;
					};						
				}      
	],
    
	[2.0,       {null = ["Major Edwards","Okay Bravo.","line1"] spawn Kiska_fnc_PlaySoundNSub;}],
	[3.2,       {null = ["Major Edwards","Got another one for you.","line2"] spawn Kiska_fnc_PlaySoundNSub;}],
	[6.0,       {null = ["Major Edwards","The timing isn’t ideal.","line3"] spawn Kiska_fnc_PlaySoundNSub;}],
	[8.0,       {null = ["Major Edwards","But we can't afford a counterattack to swell this early.","line3_2"] spawn Kiska_fnc_PlaySoundNSub;}],
	[12.0,      {null = ["Major Edwards","Our recent acquisition of the airfield has provided us with a necessary staging ground for our push towards the interior.","line4"] spawn Kiska_fnc_PlaySoundNSub;}],

    [20.0,		{	// Frame 1 Start
					null = ["Major Edwards","However, it also scattered Insurrectionists and irregular forces further inland.","line5"] spawn Kiska_fnc_PlaySoundNSub;
						
					[(markersize "marker_frame_1"),(markerPos "marker_frame_1"),5,nil,true] spawn BIS_fnc_zoomOnArea;

					if (isServer) then {
						[(getmissionLayerEntities "influence") select 1, 2.0, true] call BIS_fnc_showMarkerArray;
						[(getmissionLayerEntities "frame1Move") select 1, 2.0, true] call BIS_fnc_showMarkerArray;
						
						["marker_22", markerPos "marker_23",3,3] spawn BIS_fnc_moveMarker;
						["marker_13", markerPos "marker_24",3,3] spawn BIS_fnc_moveMarker;
						["marker_14", markerPos "marker_25",3,3] spawn BIS_fnc_moveMarker;
						["marker_21", markerPos "marker_26",3,3] spawn BIS_fnc_moveMarker;
						["marker_15", markerPos "marker_27",3,3] spawn BIS_fnc_moveMarker;
						["marker_17", markerPos "marker_28",3,3] spawn BIS_fnc_moveMarker;
						["marker_16", markerPos "marker_29",3,3] spawn BIS_fnc_moveMarker;
						["marker_20", markerPos "marker_30",3,3] spawn BIS_fnc_moveMarker;
						["marker_18", markerPos "marker_31",3,3] spawn BIS_fnc_moveMarker;
						["marker_19", markerPos "marker_32",3,3] spawn BIS_fnc_moveMarker;
					};
				}
	],

	[25.0,		{
					null = ["Major Edwards","Primarily at Larche and La Trinite.","line6"] spawn Kiska_fnc_PlaySoundNSub;
					if (isServer) then {
						["marker_40",0.1,1] spawn BIS_fnc_showMarker;
						["marker_40", 0.75,2] spawn BIS_fnc_blinkMarker;
					};
				}
	],

	[27.0,      {
					if (isServer) then {
						["marker_40",0.5] spawn BIS_fnc_hideMarker;	
					};	
				}
	],

	[28.5,		{	
					if (isServer) then {	
						["marker_39",0.1,1] spawn BIS_fnc_showMarker;
						["marker_39", 0.75, 2] spawn BIS_fnc_blinkMarker;
					};
				}
	],

	[31.5,		{
					if (isServer) then {
						["marker_39",0.5] spawn BIS_fnc_hideMarker;
					};					
				}
	],

	[33.0,		{	// Frame 2 Start
					[(markersize "marker_frame_2"),(markerPos "marker_frame_2"),2,nil,true] spawn BIS_fnc_zoomOnArea;
				}
	],
	
	[35.0,		{	
					if (isServer) then {
						[(getmissionLayerEntities "frame2Move_1") select 1, 1.0, true] call BIS_fnc_showMarkerArray;
					};
				}
	],
	
	[37.0,		{
					null = ["Major Edwards","Tomorrow morning, Alpha and Charlie will be moving on Larche with impunity.","line7_1"] spawn Kiska_fnc_PlaySoundNSub;
					if (isServer) then {
					// Move to Saint Louis
						["marker_47", markerPos "marker_48",2,3] spawn BIS_fnc_moveMarker;
						["marker_46", markerPos "marker_49",2,3] spawn BIS_fnc_moveMarker;
						["marker_45", markerPos "marker_50",2,3] spawn BIS_fnc_moveMarker;
					};
				}
	],

	[37.2,		{
					if (isServer) then {
						["marker_42",0.3,1] spawn BIS_fnc_showMarker;
						["marker_42", markerPos "marker_44",1.5,3] spawn BIS_fnc_moveMarker;
					};
				}
	],			
	
	[39.2,		{
					if (isServer) then {
						// Take Saint Louis
						["marker_41",0.5] spawn BIS_fnc_hideMarker;
						["marker_65",0.5,1] spawn BIS_fnc_showMarker;
					};
				}
	],
					
	[40.5,		{
					if (isServer) then {
						// Move to Larche
						["marker_47", markerPos "marker_52",2.5,3] spawn BIS_fnc_moveMarker;
						["marker_46", markerPos "marker_53",2.5,3] spawn BIS_fnc_moveMarker;
						["marker_45", markerPos "marker_54",2.5,3] spawn BIS_fnc_moveMarker;
					};
				}
	],				

	[41.0,		{
					if (isServer) then {
						// moving on La Trinite in conjunction
						[(getmissionLayerEntities "frame2Move_3") select 1, 1.0, true] spawn BIS_fnc_showMarkerArray;
						["marker_63", markerPos "marker_62",2,3] spawn BIS_fnc_moveMarker;
						["marker_61", markerPos "marker_59",1.5,3] spawn BIS_fnc_moveMarker;
						["marker_60", markerPos "marker_58",1.5,3] spawn BIS_fnc_moveMarker;
					};
				}
	],				

	[41.5,		{
					null = ["Major Edwards","Paving way for an eventual assault on hill 429's complex.","line7_2"] spawn Kiska_fnc_PlaySoundNSub;

					if (isServer) then {
						["marker_43",0.3,1] spawn BIS_fnc_showMarker;
						["marker_43", markerPos "marker_51",1.5,3] spawn BIS_fnc_moveMarker;
						["marker_57",0.3,1] spawn BIS_fnc_showMarker;
						["marker_57", markerPos "marker_55",1.5,3] spawn BIS_fnc_moveMarker;
					};
				}
	],			
				
	[43.5,		{
					if (isServer) then {
						["marker_56",0.1,1] spawn BIS_fnc_showMarker;
						["marker_56", 0.75, 2] spawn BIS_fnc_blinkMarker;
					};
				}
	],

	[45.5,		{
					if (isServer) then {
						["marker_56",0.1] spawn BIS_fnc_hideMarker;
					};
				}
	],				
	// Frame 2 end

	// Frame 3 start
	[48.0,		{	
					[(markersize "marker_frame_3"),(markerPos "marker_frame_3"),4,nil,true] spawn BIS_fnc_zoomOnArea;
					
					null = ["Major Edwards","Meanwhile, command wants us and Delta to open another flank by way of La Trinite.","line8"] spawn Kiska_fnc_PlaySoundNSub;
				}
	],

	[54.0,		{
					null = ["Major Edwards","An advance element; Hades and Wolfpack, will be inserted to the east at LZ Sol.","line10"] spawn Kiska_fnc_PlaySoundNSub;

					if (isServer) then {
						// show recon team and move them to LZ
						["marker_64",0.5,1] spawn BIS_fnc_showMarker;
					};
				}
	],				
				
	[55.5,		{
					if (isServer) then {
						["marker_64", markerPos "marker_66",1.5,3] spawn BIS_fnc_moveMarker;
						["marker_67",0.5,1] spawn BIS_fnc_showMarker;
					};
				}
	],				

	[60.5,		{
					null = ["Major Edwards","They’ll secure Point TALOS.","line11"] spawn Kiska_fnc_PlaySoundNSub;
					
					if (isServer) then {
						// Show Point TALOS
						["marker_100",0.1,1] spawn BIS_fnc_showMarker;
					};
				}
	],
				
	[62.0,		{	
					// Seperate Hades & Wolfpack and move to Point TALOS
					if (isServer) then {
						["marker_64",0.1] spawn BIS_fnc_hideMarker;
						["marker_72",0.3,1] spawn BIS_fnc_showMarker;
						["marker_72", markerPos "marker_71",1.5,3] spawn BIS_fnc_moveMarker;
						["marker_73",0.3,1] spawn BIS_fnc_showMarker;
						["marker_73", markerPos "marker_70",1.5,3] spawn BIS_fnc_moveMarker;
					};
				}
	],
				
	[62.3,		{	
					if (isServer) then {
						["marker_65",0.3,1] spawn BIS_fnc_showMarker;

						["marker_74",0.3,1] spawn BIS_fnc_showMarker;
						["marker_74", markerPos "marker_68",1.5,3] spawn BIS_fnc_moveMarker;
						["marker_75",0.3,1] spawn BIS_fnc_showMarker;
						["marker_75", markerPos "marker_69",1.5,3] spawn BIS_fnc_moveMarker;
					};
				}
	],

	[63.3,		{null = ["Major Edwards","A suspected munitions dump and mortar site.","line12"] spawn Kiska_fnc_PlaySoundNSub;}],	

	[65.3,		{	
					// Take point TALOS
					if (isServer) then {
						[["marker_18","marker_16"], 2] call BIS_fnc_hideMarkerArray;
						["marker_18",1.5,1] spawn BIS_fnc_cancelMarker;
						["marker_16",1.5,1] spawn BIS_fnc_cancelMarker;
					};
				}
	],
	
	[67.3,		{	
					if (isServer) then {
						["marker_100", "colorBLUFOR",1] spawn BIS_fnc_changeColorMarker;
					};
				}
	],

	[71.3,		{null = ["Major Edwards","Then, acting as forward observers, the element will recon LZ's Apollo, Athena, and Helios for 1st platoon and the rest of 2nd to air assault.","line13"] spawn Kiska_fnc_PlaySoundNSub;}],

	[74.3,		{	
					// Show other LZs
					if (isServer) then {
						[["marker_77","marker_76","marker_78"], 2.0, true] call BIS_fnc_showMarkerArray;
					};
				}
	],
				
				// Air Assault
	[82.0,		{null = ["Major Edwards","At 0825, 1st and 2nd will step off from the airfield.","line15"] spawn Kiska_fnc_PlaySoundNSub;}],

	[83.0,		{	
					if (isServer) then {
						[["marker_81","marker_80","marker_79"], 1.0, true] call BIS_fnc_showMarkerArray;
					};
				}
	],				

	[85.0,		{	
					// Dragons move to LZs
					if (isServer) then {
						["marker_81", markerPos "marker_82",1.5,3] spawn BIS_fnc_moveMarker;
						["marker_80", markerPos "marker_83",1.5,3] spawn BIS_fnc_moveMarker;
						["marker_79", markerPos "marker_84",1.5,3] spawn BIS_fnc_moveMarker;
					};
				}
	],					
	
	[88.0,		{	
					null = ["Major Edwards","Once landed, they'll move to cut off any retreat to the South and take their command section at Point Siren.","line16"] spawn Kiska_fnc_PlaySoundNSub;
					
					if (isServer) then {
						// Dragons move away from LZs
						[["marker_81","marker_80","marker_79"], 3] call BIS_fnc_hideMarkerArray;
						[["marker_90","marker_89","marker_88"], 1.0, true] call BIS_fnc_showMarkerArray;
						["marker_81", markerPos "marker_85",3,4] spawn BIS_fnc_moveMarker;
						["marker_80", markerPos "marker_86",3,4] spawn BIS_fnc_moveMarker;
						["marker_79", markerPos "marker_87",3,4] spawn BIS_fnc_moveMarker;
						
						// Show SIREN
						["marker_91",1,1] spawn BIS_fnc_showMarker;
					};
				}
	],

	[91.0,		{	
					// Move to Point SIREN
					if (isServer) then {
						["marker_90", markerPos "marker_94",1.5,3] spawn BIS_fnc_moveMarker;
						["marker_89", markerPos "marker_93",1.5,3] spawn BIS_fnc_moveMarker;
						["marker_88", markerPos "marker_92",1.5,3] spawn BIS_fnc_moveMarker;
					};
				}
	],		
					
	[94.0,		{null = ["Major Edwards","3rd and 4th platoon will be knocking on the front door via Saint Louis with two Bisons and the help of Alpha and Charlie on their way to Larche.","line14"] spawn Kiska_fnc_PlaySoundNSub;}],	

	[96.0,		{	
					// Blink 3rd & 4th
					if (isServer) then {
						["marker_60", 0.75, 2] spawn BIS_fnc_blinkMarker;
						["marker_61", 0.75, 2] spawn BIS_fnc_blinkMarker;
					};
				}
	],

	[104.0,		{	
					null = ["Major Edwards","3rd will eliminate a fuel depot at Point Centaur, while 4th destroys a garrison at Point Cyclops.","line17"] spawn Kiska_fnc_PlaySoundNSub;
					
					// Show other points
					if (isServer) then {
						[["marker_95","marker_96"], 3.0, true] call BIS_fnc_showMarkerArray;
					};
				}
	],

	[113.0,		{						
					[(markersize "marker_frame_4"),(markerPos "marker_frame_4"),3,nil,true] spawn BIS_fnc_zoomOnArea;
				}
	],

	[115.0,		{						
					null = ["Major Edwards","Delta will be providing a blocking position at Dourdan, ensuring no reinforcements from Arudy and Houdan interfere.","line18"] spawn Kiska_fnc_PlaySoundNSub;
					
					if (isServer) then {
						[["marker_107","marker_108"], 0.1, true] call BIS_fnc_showMarkerArray;
						[["marker_113","marker_114"], 0.1, true] call BIS_fnc_showMarkerArray;
					};
				}
	],			

	[115.5,		{						
					if (isServer) then {
						["marker_107", markerPos "marker_109",1.5,3] spawn BIS_fnc_moveMarker;
						["marker_108", markerPos "marker_110",1.5,3] spawn BIS_fnc_moveMarker;
						["marker_113", markerPos "marker_111",1.5,3] spawn BIS_fnc_moveMarker;
						["marker_114", markerPos "marker_112",1.5,3] spawn BIS_fnc_moveMarker;
					};
				}
	],

	[119.5,		{						
					if (isServer) then {
						["marker_113", markerPos "marker_115",1.5,3] spawn BIS_fnc_moveMarker;
						["marker_114", markerPos "marker_116",1.5,3] spawn BIS_fnc_moveMarker;
					};
				}
	],			

	[121.0,		{						
					if (isServer) then {
						[["marker_118","marker_117"], 0.5, true] call BIS_fnc_showMarkerArray;
					};
				}
	],				

	[123.0,		{						
					null = ["Major Edwards","This is by way of amphibious assault in conjunction with our advance element.","line19"] spawn Kiska_fnc_PlaySoundNSub;
					
					if (isServer) then {
						["marker_113", markerPos "marker_98",1.5,3] spawn BIS_fnc_moveMarker;
						["marker_114", markerPos "marker_97",1.5,3] spawn BIS_fnc_moveMarker;
						
						["marker_118", markerPos "marker_119",2,4] spawn BIS_fnc_moveMarker;
						["marker_117", markerPos "marker_99",2,4] spawn BIS_fnc_moveMarker;
					};
				}
	],

	[125.0,		{						
					if (isServer) then {
						[(getmissionLayerEntities "DeltaBlocking") select 1, 1.0, true] call BIS_fnc_showMarkerArray;
					};
				}
	],

	[128.5,		{	
					[(markersize "marker_frame_3"),(markerPos "marker_frame_3"),4,nil,true] spawn BIS_fnc_zoomOnArea;
					if (isServer) then {
						["marker_100", "colorOPFOR",1] spawn BIS_fnc_changeColorMarker;
					};
				}
	],
	
	[129.5,		{null = ["Major Edwards","You all know what’s expected of you.","line20"] spawn Kiska_fnc_PlaySoundNSub;}],	

	[132.5,		{null = ["Major Edwards","Let's get this done.","line21"] spawn Kiska_fnc_PlaySoundNSub;}],

	[136.0,		{}]

];

fn_AfterBrief = {

	missionNamespace setVariable ["briefed",true];

	/*
	[	
		0.5,
		{	
			["Kiska_Lobby",0,true] call KISKA_fnc_playMusic;
		},
		{!(call CBA_fnc_isMusicPlaying)} 
	] spawn KISKA_fnc_waitUntil;	
	*/

	[
		1,
		{
			["HFMP_sketchBook1_10"] spawn KISKA_fnc_playMusic;
		},
		{!(call KISKA_fnc_isMusicPlaying)}
	] spawn KISKA_fnc_waitUntil;
/*
	[
		{!(call KISKA_fnc_isMusicPlaying)}, 
		{	
			["HFMP_sketchBook1_10"] spawn KISKA_fnc_playMusic;
		},
		[]
	] call CBA_fnc_waitUntilAndExecute;
*/	
};


[
	_timeline,
	0,
	nil,
	if (isServer) then {allMapMarkers},
	if (isServer) then {_showMarkers},
	"marker_frame_3",
	true,
	{call fn_AfterBrief;}
] spawn BIS_fnc_AnimatedBriefing;  

/*
waitUntil {if !(missionNamespace getVariable "BIS_fnc_eventTimeline_playing") exitwith {true};
			false;
		};
*/

/*
	[0.0,		{
					
				}

	],
*/