//=======================================================================================================//
// File: bmt_intro_uav.sqf                                                                               //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/04/03                                                                             //
// Description: This document prepares a introduction screen with a UAV feed.                            //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

params ["_markerName", "_text", "_uavMovement", "_markers"];

waitUntil{!(isNil "bmt_preload_completed")};

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

//============================================= END OF FILE =============================================//
