//=======================================================================================================//
// File: bmt_zeus.hpp                                                                                    //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/11/26                                                                             //
// Description: This file declares the functions that will be available if this module is used during    //
//              the mission. In this case it declares functions related to Zeus.                         //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

// Especifies that this component has been loaded.
#ifdef BMT_COMPONENTS
    class zeus {};
#endif

// Define the functions of this component.
#ifdef BMT_FUNCTIONS_INTERNAL
    class zeus {
        file = "src\zeus\functions";
        class zeus_addGroups     { };
        class zeus_addObjects    { };
        class zeus_createModule  { PreInit = 1; };
        class zeus_eventHandlers { PostInit = 1; };

    };
#endif

// Define configurable parameters at mission start.
#ifdef BMT_PARAMETERS
    //===================================================================================================//
    // Delimiter                                                                                         //
    //===================================================================================================//
    class bmt_paramLine_zeus {
        title = "========== Zeus configuration";
        values[] = {0};
        texts[] = {""};
        default = 0;
    };

    //===================================================================================================//
    // Zeus: Configure Zeus for the administrator?                                                       //
    // Default option: Yes.                                                                              //
    //===================================================================================================//
    class bmt_param_zeus_admin {
        title = "Configure Zeus for the Administrator";
        values[] = {0,1};
        texts[] = {"No", "Yes"};
        default = BMT_ZEUS_ADMIN;
    };
#endif

// Define function scope in multiplayer.
#ifdef BMT_FUNCTIONS_REMOTEEXEC
    class bmt_fnc_zeus_addGroups  { allowedTargets = 2; }; // This function can only target servers.
    class bmt_fnc_zeus_addObjects { allowedTargets = 2; }; // This function can only target servers.
#endif

//============================================= END OF FILE =============================================//
