//=======================================================================================================//
// File: fn_zeus_eventHandlers.sqf                                                                       //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/06/04                                                                             //
// Description: This eventhandler adds the added units, groups or objects dynamically spawned by other   //
//              curators so that they are ediable by all curators.                                       //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

{
    _x addEventHandler ["CuratorGroupPlaced",{ _this remoteExecCall ["bmt_fnc_zeus_addGroups", 2, false] }];
    _x addEventHandler ["CuratorObjectPlaced",{ _this remoteExecCall ["bmt_fnc_zeus_adObjects", 2, false] }];
} forEach allCurators;

//============================================= END OF FILE =============================================//
