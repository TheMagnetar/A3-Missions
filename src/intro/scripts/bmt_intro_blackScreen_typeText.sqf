//=======================================================================================================//
// File: bmt_intro_blackScreen_typeText.sqf                                                              //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/04/03                                                                             //
// Description: This script serves as a mission introduction. A black screen with a citation initially   //
//              appears. It fades slowly using a blur effect while showing the mission name, mission     //
//              location and mission date.                                                               //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

params ["_missionName", "_missionLocation", "_introText"];

// Show a black screen.
titleCut ["", "BLACK FADED", 999];

waitUntil{!(isNil "bmt_preload_completed")};

// Disable simulation for all units during the black screen.
{
    _x enableSimulation false;
} forEach allUnits;

// Citation display.
titleText [_introText,"PLAIN"];
titleFadeOut 7;
sleep 5;

// Reenable simulation for all units.
{
    _x enableSimulation true;
} forEach allUnits;

// Mision name, mission location and mission date.
[
    [
        [_missionName,"<t color = '#F70D1A' align = 'right' shadow = '1' size = '1.2'>%1</t><br/>"],
        [([([daytime] call BIS_fnc_TimeToString),0,4] call BIS_fnc_trimString) + " " + str(date select 2) + "." + str(date select 1) + "." + str(date select 0),"<t align = 'right' shadow = '1' size = '1.0'>%1</t><br/>"],
        [_missionLocation,"<t align = 'right' shadow = '1' size = '1.0'>%1</t>"]
    ],-safeZoneX,-safeZoneY
] spawn BIS_fnc_typeText;

sleep 5;
"dynamicBlur" ppEffectEnable true;
"dynamicBlur" ppEffectAdjust [6];
"dynamicBlur" ppEffectCommit 0;
"dynamicBlur" ppEffectAdjust [0.0];
"dynamicBlur" ppEffectCommit 5;

titleCut ["", "BLACK IN", 5];

//============================================= END OF FILE =============================================//
