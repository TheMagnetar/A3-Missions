//=======================================================================================================//
// File: bmt_endMission.hpp                                                                              //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/11/26                                                                             //
// Description: If this module is loaded, this file declares functions that are used to end the mission  //
//              once certain conditions are met.                                                         //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

// Especifies that this component has been loaded.
#ifdef BMT_COMPONENTS
    class missionConfig_endMission {};
#endif

// Define the functions of this component.
#ifdef BMT_FUNCTIONS_INTERNAL
    class missionConfig_endMission {
        file = "missionConfig\endMission\functions";
        class endMission{};
    };
#endif

// Define function scope in multiplayer.
#ifdef BMT_FUNCTIONS_REMOTEEXEC
    class bmt_fnc_endMission { allowedTargets = 0; }; // This function can target everybody.
#endif

//============================================= END OF FILE =============================================//
