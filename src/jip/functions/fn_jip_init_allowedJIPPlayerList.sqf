//=======================================================================================================//
// File: fn_jip_init_allowedJIPPlayerList.sqf                                                            //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2016/11/12                                                                             //
// Description: This function initialises the whitelisted JIP players. Every client sends, once          //
//              connected, the playable unit. Only thosee that join the mission since the very beginning //
//              should enter this list. Each element of the list is composed of two entries: player UID, //
//              and player profile name.                                                                 //
//                                                                                                       //
//              Arguments:                                                                               //
//               - 0: unit to check <OBJECT>.                                                            //
//                                                                                                       //
// Changes: 1.0 (2016/11/12) First public version.                                                       //
//=======================================================================================================//

params ["_unit"];
private ["_playerIDs"];

_playerIDs = missionNamespace getVariable ["bmt_arrayMission_allowedJIPPlayerList", [] ];

_playerIDs = _playerIDS + [[getPlayerUID _unit, name _unit]];

missionNamespace setVariable ["bmt_arrayMission_allowedJIPPlayerList", _playerIDs, true];

//============================================= END OF FILE =============================================//
