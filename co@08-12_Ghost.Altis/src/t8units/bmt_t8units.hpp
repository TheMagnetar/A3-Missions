//=======================================================================================================//
// File: bmt_t8units.hpp                                                                                 //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/12/06                                                                             //
// Description: This file defines the paths of the external script T8-Units, which is totally compatible //
//              with Dynamic-AI-Creator (DAC). For more information:                                     //
//              https://forums.bistudio.com/topic/172795-release-t8-units-a-less-dynamic-ai-creator      //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

// Especifies that this component has been loaded.
#ifdef BMT_COMPONENTS
    class t8units {};
#endif

// Define the functions of this component.
#ifdef BMT_FUNCTIONS_INTERNAL
    class t8units {
        file = "src\t8units\functions";
        class t8units_config { };
    };
#endif

#ifdef BMT_EXTERNAL_DEFINITIONS
    #include "..\..\externalScripts\T8\CONFIG.hpp"
#endif

// Define the functions of this component.
#ifdef BMT_FUNCTIONS_EXTERNAL

    #include "..\..\externalScripts\T8\FUNCTIONS.hpp"
#endif

// Define configurable parameters at mission start.
#ifdef BMT_PARAMETERS
    //===================================================================================================//
    // Delimiter                                                                                         //
    //===================================================================================================//
    class bmt_paramLine_t8units {
        title = "========== T8 Units configuration";
        values[] = {0};
        texts[] = {""};
        default = 0;
    };

    //===================================================================================================//
    // T8 Units: Variable to control whether T8 Units is enabled or disabled for the mission.            //
    // Default option: Enabled                                                                           //
    //===================================================================================================//
    class bmt_param_t8units_enabled {
        title = "Use T8 Units";
        values[] = {0,1};
        texts[] = {"Disabled", "Enabled"};
        default = BMT_T8UNITS_ENABLE;
    };

    //===================================================================================================//
    // T8 Units Debug: Variable to control the amount of information displayed when using T8 Units       //
    //                 during a mission:                                                                 //
    //                     - Disabled: No information regarding T8 Units is shown.                       //
    //                     - Enabled: Markers, waypoints and debug information are displayed.            //
    // Default option: Enabled.                                                                          //
    //===================================================================================================//
    class bmt_param_t8units_debug {
        title = "T8 Units Debug";
        values[] = {0,1};
        texts[] = {"Disabled", "Enabled"};
        default = BMT_T8UNITS_DEBUG;
    };

    //===================================================================================================//
    // DAC compatibility: Variable to control whether T8 Units will ask for help to DAC generated units. //
    // Default option: Enabled.                                                                          //
    //===================================================================================================//
    class bmt_param_t8units_dac {
        title = "DAC compatibility";
        values[] = {0,1};
        texts[] = {"Disabled", "Enabled"};
        default = BMT_T8UNITS_DAC;
    };
#endif

//============================================= END OF FILE =============================================//
