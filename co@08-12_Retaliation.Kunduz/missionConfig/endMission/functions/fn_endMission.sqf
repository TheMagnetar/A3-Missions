//=======================================================================================================//
// File: fn_endMission.sqf                                                                               //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/10/02                                                                             //
// Description: This document defines under which circumstances any of the defined endings in the file   //
//              bmt_missionDebriefing.hpp is activated. It has to be ensured that this fucntion is       //
//              executed with global scope so that it affects both clients and servers.                  //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

// If all players are dead and none of the objectives were completed, the mission was a total disaster.
if ({_x getVariable ["bmt_var_playerAlive", true]} count allPlayers <= 0) then {
    ["Disaster",false] spawn BIS_fnc_endMission;
};

//============================================= END OF FILE =============================================//
