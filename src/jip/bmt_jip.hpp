//=======================================================================================================//
// File: bmt_jip.hpp                                                                                     //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/11/26                                                                             //
// Description: This file declares the functions that will be available if this module is used during    //
//              the mission. In this case it declares JIP functions.                                     //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

// Especifies that this component has been loaded.
#ifdef BMT_COMPONENTS
    class jip {};
#endif

// Define the functions of this component.
#ifdef BMT_FUNCTIONS_INTERNAL
    class jip {
        file = "src\jip\functions";
        class jip_saveStatus_AdvancedFatigue { };
        class jip_addTo_allowedJIPPlayerList { };
        class jip_check_allowedJIPPlayerList { };
        class jip_init_allowedJIPPlayerList  { };
        class jip_retrievePlayerVariables    { };
        class jip_retrieveStatus             { };
        class jip_savePlayerVariables        { };
        class jip_saveStatus                 { };
        class jip_teleport                   { };
    };
#endif

// Define configurable parameters at mission start.
#ifdef BMT_PARAMETERS
    //===================================================================================================//
    // Delimiter                                                                                         //
    //===================================================================================================//
    class bmt_paramLine_jip {
        title = "========== JIP configuration";
        values[] = {0};
        texts[] = {""};
        default = 0;
    };

    //===================================================================================================//
    // JIP: Time limit after which, JIP will not be allowed?                                             //
    // Default option: Enabled.                                                                          //
    //===================================================================================================//
    class bmt_param_jip_enabled {
        title = "Allow JIP";
        values[] = {0, 1};
        texts[] = {"Disabled", "Enabled"};
        default = BMT_JIP_ENABLED;
    };

    //===================================================================================================//
    // JIP Save Status: Save the gear and status if player disconnects in order to keep it if JIP?       //
    // Default option: Enabled.                                                                          //
    //===================================================================================================//
    class bmt_param_jip_saveStatus {
        title = "JIP Save Status (Gear, medical)";
        values[] = {0, 1};
        texts[] = {"Disabled", "Enabled"};
        default = BMT_JIP_SAVESTATUS;
    };
#endif

// Define function scope in multiplayer.
#ifdef BMT_FUNCTIONS_REMOTEEXEC
    class jip_init_allowedJIPPlayerList  { allowedTargets = 2; }; // This function can only target servers.
#endif

//============================================= END OF FILE =============================================//
