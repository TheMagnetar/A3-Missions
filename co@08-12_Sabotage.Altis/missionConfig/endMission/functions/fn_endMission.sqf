//=======================================================================================================//
// File: fn_endMission.sqf                                                                               //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/10/02                                                                             //
// Description: This document defines under which circumstances any of the defined endings in the file   //
//              bmt_missionDebriefing.hpp is activated. It has to be ensured that this fucntion is       //
//              executed with global scope so that it affects both clients and servers.                  //
//                                                                                                       //
//              Arguments:                                                                               //
//               - none                                                                                  //
//                                                                                                       //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

if (destroyed == 3 && ({alive _x} count allPlayers > 0)) then {
    ["EndingSuccess1", true] spawn BIS_fnc_endMission;
};

if (destroyed < 3 && ({alive _x} count allPlayers > 0)) then {
    ["EndingSuccess2", true] spawn BIS_fnc_endMission;
};

if (destroyed == 3 && ({_x getVariable ["bmt_var_playerAlive", true]} count allPlayers <= 0)) then {
    ["EndingFailure1", false] spawn BIS_fnc_endMission;
};

if (destroyed < 3 && ({_x getVariable ["bmt_var_playerAlive", true]} count allPlayers <= 0)) then {
    ["EndingFailure2", false] spawn BIS_fnc_endMission;
};

// If all players are dead and none of the objectives were completed, the mission was a total disaster.
if (destroyed == 0 && ({_x getVariable ["bmt_var_playerAlive", true]} count allPlayers <= 0)) then {
    ["Disaster",false] spawn BIS_fnc_endMission;
};

//============================================= END OF FILE =============================================//
