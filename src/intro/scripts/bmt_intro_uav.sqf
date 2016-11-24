//=======================================================================================================//
// File: bmt_intro_uav.sqf                                                                               //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/04/03                                                                             //
// Description: This document prepares a introduction screen with a UAV feed. This function should not   //
//              be manually executed, since it is directly called from                                   //
//              `missionConfig/intro/scripts/bmt_intro.sqf`.                                             //
//                                                                                                       //
//              Arguments:                                                                               //
//              - 0: Marker where the UAV camera is centered <STRING>.                                   //
//              - 1: Text displayed in the upper left corner <STRING>.                                   //
//              - 2: Configuration of UAV movement <ARRAY> of four elements of type <REAL>:              //
//                   - Altitude in meters of the stablishing shot.                                       //
//                   - Radius of the circular movement in meters.                                        //
//                   - Viewing angle in degrees.                                                         //
//                   - Direction of camera movement (0: anti-clockwise, 1: clockwise, default: random).  //
//              - 3: Sixth parameter of the function BIS_fnc_establishingShot                            //
//                   (https://community.bistudio.com/wiki/BIS_fnc_establishingShot) <ARRAY>.             //
//                                                                                                       //
//              Example:                                                                                 //
//               ["markerRescue", "Operation Desert Fox - Iran", [400,200,0,1],                          //
//                 ["\a3\ui_f\data\map\markers\military\objective_ca.paa", EAST call BIS_fnc_sideColor,  //
//                   markerPos "markerRescue", 1, 1, 0, "Rescue the marines", 0                          //
//                 ]                                                                                     //
//               ] execVM "src/intro/scripts/bmt_intro_uav.sqf";                                         //
//                                                                                                       //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

params ["_markerName", "_text", "_uavMovement", "_markers"];

// Disable simulation for all units during the UAV feed.
{
    _x enableSimulation false;
} forEach allUnits;

enableEnvironment false;
0 fadeSound 0;

[
    markerPos _markerName,     // Target position/object
    format ["%1", _text],      // Text to display
    _uavMovement select 0,     // Altitude (in meters)
    _uavMovement select 1,     // Radius of the circular movement (in meters)
    _uavMovement select 2,     // Viewing angle (in degrees)
    _uavMovement select 3,     // Direction of camera movement (0: anti-clockwise, 1: clockwise, default: random)
    _markers
] spawn BIS_fnc_establishingShot;

waitUntil { !isNil { BIS_missionStarted } };
waitUntil {missionNamespace getVariable ["bmt_var_init_preloadCompleted", false];};

// Screen starts.
titleCut ["", "BLACK FADED", 5];

// Reenable simulation for all units.
{
    _x enableSimulation true;
} forEach allUnits;

[] spawn {
    sleep 5;
    titleCut ["", "BLACK IN", 5];
    "dynamicBlur" ppEffectEnable true;
    "dynamicBlur" ppEffectAdjust [6];
    "dynamicBlur" ppEffectCommit 0;
    "dynamicBlur" ppEffectAdjust [0.0];
    "dynamicBlur" ppEffectCommit 5;
    enableEnvironment true;
    5 fadeSound 1;
};

player setVariable ["bmt_var_init_introFinished", true, true];
//============================================= END OF FILE =============================================//
