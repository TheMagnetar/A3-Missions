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

// All marines rescued. Warlord dead.
if ((rescuedMarines == 4) and (warlordDead == 1)) then {
    ["EndingSuccess1",true] spawn BIS_fnc_endMission;
};

// Not all marines rescued. Warlord dead.
if (((rescuedMarines > 0) and (rescuedMarines < 4)) and (warlordDead == 1)) then {
    ["EndingSuccess2",true] spawn BIS_fnc_endMission;
};

// All marines rescued. Warlord alive.
if ((rescuedMarines == 4) and (warlordDead == 0)) then {
    ["EndingSuccess3",true] spawn BIS_fnc_endMission;
};

// Not all marines rescued. Warlord alive.
if (((rescuedMarines > 0) and (rescuedMarines < 4)) and (warlordDead == 0)) then {
    ["EndingSuccess4",true] spawn BIS_fnc_endMission;
};

// No marines rescued. Warlord dead.
if ((rescuedMarines == 0) and (warlordDead == 1)) then {
    ["EndingSuccess5",true] spawn BIS_fnc_endMission;
};

// None of the objectives were accomplished. Players quited AO.
if ((rescuedMarines == 0) and (warlordDead == 0)) then {
    ["EndingFailure1",false] spawn BIS_fnc_endMission;
};

// All players are dead. Warlord dead.
if (({alive _x} count allPlayers <= 0) and (warlordDead == 1)) then {
    ["EndingFailure2",false] spawn BIS_fnc_endMission;
};

// If all players are dead and none of the objectives were completed, the mission was a total disaster.
if ((warlordDead == 0) and ({_x getVariable ["bmt_var_playerAlive", true]} count allPlayers <= 0)) then {
    ["Disaster",false] spawn BIS_fnc_endMission;
};

//============================================= END OF FILE =============================================//
