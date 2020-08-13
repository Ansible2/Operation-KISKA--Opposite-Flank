class OPF
{
	
	class AirAssault
	{
		class enRoute
		{
			file = "Functions\AirAssault\fn_enRoute.sqf";
		};
		class airAssaultLanded
		{
			file = "Functions\AirAssault\fn_airAssaultLanded.sqf";
		};
		class hideAirAssault
		{
			file = "Functions\AirAssault\fn_hideAirAssault.sqf";
		};
	};
	class serverStart
	{
		file="Functions\ServerStart";
		class placeSimpleVehicles
		{};
		class prepareGlobals
		{};
		class serverLoops
		{}; 
	};
	class Misc
	{	
		file="Functions\misc";
		class animatedBrief
		{};
		class bombardLaTrinite
		{};
		class delete
		{};
		class endex
		{};
		class playersTakeOff
		{};
		class saveGame
		{};
		class selectPoint
		{};
		class skipBrief
		{
			preInit=1;
		};
	};
	class Arudy
	{
		class arudySpawn
		{
			file = "Functions\Points\Arudy\fn_arudySpawn.sqf";
		};

		class arudyArtyEventHandlers
		{
			file = "Functions\Points\Arudy\fn_arudyArtyEventHandlers.sqf";
		};
		class arudyShow
		{
			file = "Functions\Points\Arudy\fn_arudyShow.sqf";
		};
	};

	class Centaur
	{
		class centaurTaskComplete
		{
			file = "Functions\Points\Centaur\fn_centaurTaskComplete.sqf";
		};
		class centaurSpawn
		{
			file = "Functions\Points\Centaur\fn_centaurSpawn.sqf";
		};

	};

	class Cyclops
	{
		class cyclopsTaskComplete
		{
			file = "Functions\Points\Cyclops\fn_cyclopsTaskComplete.sqf";
		};
		class cyclopsSpawn
		{
			file = "Functions\Points\Cyclops\fn_cyclopsSpawn.sqf";
		};

	};
	
	class LaTrinite
	{
		class laTriniteLoopMaster
		{
			file = "Functions\Points\LaTrinite\LaTriniteLoopMain.sqf";
		};
		class laTriniteLoop_1
		{
			file = "Functions\Points\LaTrinite\LaTriniteLoop_1.sqf";
		};
		class laTriniteLoop_2
		{
			file = "Functions\Points\LaTrinite\LaTriniteLoop_2.sqf";
		};
		class laTriniteLoop_3
		{
			file = "Functions\Points\LaTrinite\LaTriniteLoop_3.sqf";
		};
		class laTriniteLoop_4
		{
			file = "Functions\Points\LaTrinite\LaTriniteLoop_4.sqf";
		};
	};

	class Siren
	{
		class sirenOfficersEventHandlers
		{
			file = "Functions\Points\Siren\fn_sirenOfficersEventHandlers.sqf";
		};
	};

	class Talos
	{
		class talosMortarsDestroyed
		{
			file = "Functions\Points\Talos\fn_talosMortarsDestroyed.sqf";
		};
	};

	class Beach
	{
		class deltaAlt
		{
			file = "Functions\Beach\fn_deltaAlt.sqf";
		};

		class tanksKilled
		{
			file = "Functions\Beach\fn_tanksKilled.sqf";
		};

		class deltaMortars
		{
			file = "Functions\Beach\fn_deltaMortars.sqf";
		};
		class deltaContact
		{
			file = "Functions\Beach\fn_deltaContact.sqf";
		};
	};
};