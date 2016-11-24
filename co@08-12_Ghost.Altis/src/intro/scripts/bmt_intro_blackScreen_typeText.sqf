//=======================================================================================================//
// File: bmt_intro_blackScreen_typeText.sqf                                                              //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/04/03                                                                             //
// Description: This script serves as a mission introduction. A black screen with a citation initially   //
//              appears. It fades slowly using a blur effect while showing the mission name, mission     //
//              location and mission date. This function should not be manually executed, since it is    //
//              directly called from `missionConfig/intro/scripts/bmt_intro.sqf`.                        //
//                                                                                                       //
//              Arguments:                                                                               //
//               - 0: Mission name <STRING>.                                                             //
//               - 1: Mission location <STRING>.                                                         //
//               - 2: Text displayed in the center of the screen <STRING>.                               //
//                                                                                                       //
//              Example:                                                                                 //
//               [                                                                                       //
//                 "Operation Desert Fox", "Iran","Soldiers live. And wonder why.\nGlen Cook"            //
//               ] execVM "src/intro/scripts/bmt_intro_blackScreen_typeText.sqf";                        //
//                                                                                                       //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

params ["_missionName", "_missionLocation", "_introText"];

// Show a black screen.
titleCut ["", "BLACK FADED", 999];

// Disable simulation for all units during the black screen.
{
    _x enableSimulation false;
} forEach allUnits;

// Citation display.
titleText [_introText,"PLAIN"];

waitUntil {missionNamespace getVariable ["bmt_var_init_preloadCompleted", false];};
titleFadeOut 5;

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

player setVariable ["bmt_var_init_introFinished", true, true];

//============================================= END OF FILE =============================================//
