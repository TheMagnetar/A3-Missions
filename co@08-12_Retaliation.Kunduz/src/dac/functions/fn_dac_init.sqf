//=======================================================================================================//
// File: fn_dac_init.sqf                                                                                 //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/09/29                                                                             //
// Description: This funtion has the purpose of initialising the addon version of the addon, created by  //
//              Silola, Dynamic-AI-Creator (DAC) (http://www.armaholic.com/page.php?id=25550). It        //
//              automatically creates a Logic Module "DAC_Source_Extern" (there is no need to place it   //
//              using the editor) and initialises the variable "DAC_STRPlayers" with the playable units' //
//              names in order to avoid having to introduce them in the file "DAC_Config_Creator.sqf".   //
//              Arguments:                                                                               //
//               - none                                                                                  //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

if (!bmt_mod_dac OR (bmt_param_dac_enabled == 0)) exitWith {};

if (isServer) then {
    // Create DAC necessary "DAC_Source_Extern" logic module.
    if (isNil "bmt_var_centreSideLogic") then {
        bmt_var_centreSideLogic = createCenter sideLogic;
        bmt_var_groupSideLogic = createGroup bmt_var_centreSideLogic;
    };
    bmt_var_dacModule = bmt_var_groupSideLogic createUnit ["DAC_Source_Extern", [0,0,0],[], 1,"NONE"];
    publicVariable "bmt_var_dacModule";

    // Initialise the variable "DAC_STRPlayers" with the names of all playable units. It is necessary that
    // all playable units have an associated name.
    DAC_STRPlayers = [];
    {
        DAC_STRPlayers pushBack format ["%1",_x];
    } forEach playableUnits;
    publicVariable "DAC_STRPlayers";

    if (bmt_param_debugOutput == 1) then {
        player sideChat format ["DEBUG (fn_dac_init.sqf): %1", DAC_STRPlayers];
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
        player sideChat format ["DEBUG (fn_dac_init.sqf): Unrecognised DAC parameter."];
    };
};

//============================================= END OF FILE =============================================//
