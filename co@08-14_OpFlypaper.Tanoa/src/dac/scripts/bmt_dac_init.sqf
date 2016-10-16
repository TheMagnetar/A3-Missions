//=======================================================================================================//
// File: bmt_dac_init.sqf                                                                                //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/09/29                                                                             //
// Description: This script has the purpose of initialising the script version of the addon, created by  //
//              Silola, Dynamic-AI-Creator (DAC) (http://www.armaholic.com/page.php?id=25550). It        //
//              automatically initialises the variable "DAC_STRPlayers" with the playable units' names   //
//              in order to avoid having to introduce them in the file "DAC_Config_Creator.sqf". This is //
//              a LEGACY script and it is recommended to use the addon version of DAC.                   //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

// Wait unit the degub variables are initialised.
waitUntil {(!isNil "bmt_param_debugOutput")};
waitUntil {(!isNil "bmt_param_dac_debug")};

DAC_Basic_Value = 0;

// Initialise the variable "DAC_STRPlayers" with the names of all playable units. It is necessary that
// all playable units have an associated name.
if (isServer) then {
    DAC_STRPlayers = [];
    {
        DAC_STRPlayers pushBack format ["%1",_x];
    } forEach playableUnits;
    publicVariable "DAC_STRPlayers";

    if ((bmt_param_debugOutput == 1)) then {
        player sideChat format ["DEBUG (bmt_dac_init.sqf): %1", DAC_STRPlayers];
    };
};

// Modify DAC output depending whether the debug is activated or not.
switch (bmt_param_dac_debug) do {
    case 0: {
        // Do not display any info.
        DAC_Com_Values = [0,0,0,0];
        DAC_Marker     = 0;
    };

    case 1: {
        // Show initialisation messages (recommended).
        DAC_Com_Values = [0,1,0,0];
        DAC_Marker     = 0;
    };

    case 2: {
        // Show reduction and initialisation messages as well as unit markers on the map.
        DAC_Com_Values = [1,2,0,0];
        DAC_Marker     = 2;
    };

    default {
        player sideChat format ["DEBUG (bmt_dac_init.sqf): Unrecognised DAC parameter."];
    };
};
//============================================= END OF FILE =============================================//
