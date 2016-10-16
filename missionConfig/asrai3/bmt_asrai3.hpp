//=======================================================================================================//
// File: bmt_asrai3.hpp                                                                                  //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/11/26                                                                             //
// Description: This file declares the functions that will be available if this module is used during    //
//              the mission. In this case it declares functions related to el mod ASR AI 3.              //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

// Especifies that this component has been loaded.
#ifdef BMT_COMPONENTS
    class asrai3 {};
#endif

// Define the functions of this component.
#ifdef BMT_FUNCTIONS_INTERNAL
    class asrai3 {
        file = "missionConfig\asrai3\functions";
        class asrai3_config { PostInit = 1; };
    };
#endif

// Define configurable parameters at mission start.
#ifdef BMT_PARAMETERS
    //===================================================================================================//
    // Delimiter                                                                                         //
    //===================================================================================================//
    class bmt_paramLine_asrai3 {
        title = "========== ASR AI 3 configuration";
        values[] = {0};
        texts[] = {""};
        default = 0;
    };

    //===================================================================================================//
    // ASR AI 3: Use ASR AI 3 enhancement mod in the mission?                                            //
    // Default option: Enabled                                                                           //
    //===================================================================================================//
    class bmt_param_asrai3_enabled {
        title = "Use ASR AI 3";
        values[] = {0,1};
        texts[] = {"Disabled", "Enabled"};
        default = 1;
    };

    //===================================================================================================//
    // ASR AI 3: Use ASR AI 3 debug?                                                                     //
    // Default option: Disabled                                                                          //
    //===================================================================================================//
    class bmt_param_asrai3_debug {
        title = "Use the Debug of ASR AI 3";
        values[] = {0,1};
        texts[] = {"Disabled", "Enabled"};
        default = 0;
    };
#endif

//============================================= END OF FILE =============================================//
