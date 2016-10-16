//=======================================================================================================//
// File: bmt_ace3.hpp                                                                                    //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/11/26                                                                             //
// Description: This file declares the functions that will be available if this module is used during    //
//              the mission. In this case it declares functions related to Advanced Combat Environment 3 //
//              (ACE 3).                                                                                 //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

// Especifies that this component has been loaded.
#ifdef BMT_COMPONENTS
    class ace3 {};
#endif

// Define the functions of this component.
#ifdef BMT_FUNCTIONS_INTERNAL
    class ace3 {
        file = "src\ace3\functions";
        class ace3_assignWounds {};
        //class ace3_config_preInit  { PreInit = 1; };
        class ace3_config_postInit { PostInit = 1; };
        class ace3_config_revive   { PostInit = 1; };
    };
#endif

// Define configurable parameters at mission start.
#ifdef BMT_PARAMETERS
    //===================================================================================================//
    // Delimiter                                                                                         //
    //===================================================================================================//
    class bmt_paramLine_ace3 {
        title = "========== ACE 3 configuration";
        values[] = {0};
        texts[] = {""};
        default = 0;
    };

    //===================================================================================================//
    // Medical system: Level of detail of the ACE3 medical system.                                       //
    // Default option: Advanced.                                                                         //
    //===================================================================================================//
    class ace_medical_level {
        title = "Medical system";
        ACE_setting = 1;                              // Marks param to be read as an ace setting.
        bmt_paramID = "bmt_param_ace3_medicalSystem"; // Parameter for the A3-BMT template.
        values[] = {0, 1, 2};
        texts[] =  {"Disabled", "Basic", "Advanced"};
        default = BMT_ACE3_MEDICAL;
    };

    //===================================================================================================//
    // Revive system: Use ACE3 Revive system?                                                            //
    // Default option: Disabled.                                                                         //
    //===================================================================================================//
    class ace_medical_enableRevive {
        title = "Revive system";
        ACE_setting = 1;                               // Marks param to be read as an ace setting.
        bmt_paramID = "bmt_param_ace3_reviveSystem";   // Parameter for the A3-BMT template.
        values[] = {0, 1};
        texts[] = {"Disabled", "Enabled"};
        default = BMT_ACE3_REVIVE;
    };

    //===================================================================================================//
    // Ballistics: Level of detail of ballistic simulation of ACE3.                                      //
    // Default option: Advanced.                                                                         //
    //===================================================================================================//
    class ace_advanced_ballistics_enabled {
        title = "Ballistics";
        ACE_setting = 1;                               // Marks param to be read as an ace setting.
        bmt_paramID = "bmt_param_ace3_ballistics";     // Parameter for the A3-BMT template.
        values[] = {0,1};
        texts[] = {"Basic", "Advanced"};
        default = BMT_ACE3_BALLISTICS;
    };

    //===================================================================================================//
    // Spectator: Use ACE3 spectator mode instead of BI's End Game Spectator                             //
    // Default option: ACE 3 Spectator.                                                                  //
    //===================================================================================================//
    class bmt_param_ace3_spectator {
        title = "ACE 3 Spectator mode";
        values[] = {0,1};
        texts[] = {"BI (End Game)", "ACE 3 Spectator"};
        default = BMT_ACE3_SPECTATOR;
    };
#endif

#ifdef BMT_EXTERNAL_DEFINITIONS
    class ACE_Settings {
        #include "bmt_ace3_settings.hpp"
    };
#endif

//============================================= END OF FILE =============================================//
