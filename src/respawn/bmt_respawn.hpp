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
    class respawn {};
#endif

// Define the functions of this component.
#ifdef BMT_FUNCTIONS_INTERNAL
    class respawn {
        file = "src\respawn\functions";
        class respawn_config           { PostInit = 1; };
        class respawn_enterSpectator   { };
        class respawn_exitSpectator    { };
        class respawn_moveToMarker     { };
        class respawn_respawnCounter   { };
        class respawn_substractTickets { };
    };
#endif

// Define configurable parameters at mission start.
#ifdef BMT_PARAMETERS
    //===================================================================================================//
    // Delimiter                                                                                         //
    //===================================================================================================//
    class bmt_paramLine_respawn {
        title = "========== RESPAWN configuration";
        values[] = {0};
        texts[] = {""};
        default = 0;
    };

    //===================================================================================================//
    // Respawn: Save gear on death?                                                                      //
    // Default option: No.                                                                           //
    //===================================================================================================//
    class bmt_param_respawn_saveGear {
        title = "Save gear";
        values[] = {0, 1};
        texts[] = {"No", "Yes"};
        default = BMT_RESPAWN_SAVEGEAR;
    };

    //===================================================================================================//
    // Respawn: To which entity (Side or player) will the respawn limit be applied?                      //
    // Default option: Player.                                                                           //
    //===================================================================================================//
    class bmt_param_respawn_tickets {
        title = "Respawn tickets for";
        values[] = {0, 1};
        texts[] = {"Side", "Player"};
        default = BMT_RESPAWN_TICKETS;
    };

    //===================================================================================================//
    // Respawn: Definition of the maximum number of allowed respawns.                                    //
    // Default option: Mission defined.                                                                  //
    //===================================================================================================//
    class bmt_param_respawn_numRespawns {
        title = "Number of respawns";
        values[] = {0, 1, 2};
        texts[] = {"Unlimited", "None", "Mission defined"};
        default = BMT_RESPAWN_NUMTICKETS_CONFIG;
    };
#endif

//============================================= END OF FILE =============================================//
