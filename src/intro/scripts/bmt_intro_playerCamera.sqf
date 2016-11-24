//=======================================================================================================//
// File: bmt_intro_playerCamera.sqf                                                                      //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2016/11/22                                                                             //
// Description: This script serves as a mission introduction. A static camera is created in front of     //
//              player while it plays an animation. This function should not be manually executed, since //
//              it is directly called from `missionConfig/intro/scripts/bmt_intro.sqf`.                  //
//                                                                                                       //
//              Arguments:                                                                               //
//               - 0: Mission name <STRING>.                                                             //
//               - 1: Mission location <STRING>.                                                         //
//               - 2: name of the unit or vehicle <STRING>.                                              //
//               - 3: Use night vision in camera <BOOL>.                                                 //
//               - 4: Animation List of animations to be played <ARRAY> to randonly play. If not         //
//                    defined, the unit will play a random animation selected from:                      //
//                    "AmovPercMstpSrasWrflDnon_Salute", "c4coming2cdf_genericstani1",                   //
//                    "c4coming2cdf_genericstani2", "c4coming2cdf_genericstani3" and                     //
//                    "c4coming2cdf_genericstani4". <OPTIONAL>                                           //
//                                                                                                       //
//              Example:                                                                                 //
//                - A random animation is selected from the predefined ones (no night vision):           //
//                   [                                                                                   //
//                     "Operation Desert Fox", "Iran", "Alpha 1" + name player, false                    //
//                   ] execVM "src/intro/scripts/bmt_intro_playerCamera.sqf";                            //
//                - A random animation is selected from the given ones (with night vision):              //
//                   [                                                                                   //
//                     "Operation Desert Fox", "Iran", "Alpha 1" + name player, true,                    //
//                     ["c4coming2cdf_genericstani1", "c4coming2cdf_genericstani2"]                      //
//                   ] execVM "src/intro/scripts/bmt_intro_playerCamera.sqf";                            //
//                                                                                                       //
// Changes: 1.0 (2016/11/22) First public version.                                                       //
//=======================================================================================================//

params ["_missionName", "_missionLocation", "_vehicleName", "_useNVG", ["_animation", nil]];

private ["_camera", "_selectedAnimation", "_animationList", "_date", "_ppColor", "_ppGrain"];
private ["_month", "_day", "_hour", "_minute"];

// Get date and time
_month = str (date select 1);
_day = str (date select 2);
_hour = str (date select 3);
_minute = str (date select 4);

if (date select 1 < 10) then {_month = format ["0%1", str (date select 1)]};
if (date select 2 < 10) then {_day = format ["0%1", str (date select 2)]};
if (date select 3 < 10) then {_hour = format ["0%1", str (date select 3)]};
if (date select 4 < 10) then {_minute = format ["0%1", str (date select 4)]};

_date = format ["%1:%2 - %3-%4-%5", _hour, _minute,  _day, _month, str (date select 0)];

_animationList = ["AmovPercMstpSrasWrflDnon_Salute", "c4coming2cdf_genericstani1", "c4coming2cdf_genericstani2", "c4coming2cdf_genericstani3", "c4coming2cdf_genericstani4"];

// Create the effects
_ppColor = ppEffectCreate ["colorCorrections", 1999];
_ppColor ppEffectEnable true;
_ppColor ppEffectAdjust [1, 1, 0, [1, 1, 1, 0], [0.8, 0.8, 0.8, 0.65], [1, 1, 1, 1.0]];
_ppColor ppEffectCommit 0;

_ppGrain = ppEffectCreate ["filmGrain", 2012];
_ppGrain ppEffectEnable true;
_ppGrain ppEffectAdjust [0.1, 1, 1, 0, 1];
_ppGrain ppEffectCommit 0;

// Black screen
["TF47_fnc_introShot",false] call BIS_fnc_blackOut;
sleep 0.2;
["TF47_fnc_introShot",true] call BIS_fnc_blackIn;

// Layers and interlacing.
("BIS_layerEstShot" call BIS_fnc_rscLayer) cutRsc ["RscEstablishingShot", "PLAIN"];

("BIS_layerStatic" call BIS_fnc_rscLayer) cutRsc ["RscStatic", "PLAIN"];
("BIS_layerInterlacing" call BIS_fnc_rscLayer) cutRsc ["RscInterlacing", "PLAIN"];
("BIS_fnc_blackOut" call BIS_fnc_rscLayer) cutText ["","PLAIN",10e10];

// Create the camera
_camera = "camera" camCreate (position player);
_camera camSetTarget player;
_camera camSetRelPos [0.0, 5.0, 1.5];
_camera camSetFov 0.5;
showCinemaBorder false;
camUseNVG _useNVG;
_camera cameraEffect ["internal", "back"];
_camera camCommit 0;

// Play  music and avoid ace_hearing to have an effect on fadeMusic.
playMusic ("RadioAmbient" + str (1 + floor random 30));
if (bmt_mod_ace3) then {
    ace_hearing_disableVolumeUpdate = true;
};
// Disable simulation for all units during the black screen.
{
    _x enableSimulation false;
} forEach allUnits - [player];

if (!isNil "_animation") then {
    _selectedAnimation = selectRandom _animation;
} else {
    _selectedAnimation = selectRandom _animationList;
};

player switchMove _selectedAnimation;

// Vehicle name, mission location and, mission location, mission date and mission name.
[
    "<t color='#ff0000' shadow='2' size='0.8' font='PuristaBold'>" + _missionName  + "</t>" +
    "<t color='#d3d3d3' shadow='2' size='0.8' font='PuristaBold'>, " + _missionLocation + "</t><br/>" +
    "<t color='#e8e8e8' shadow='2' size='0.7' font='PuristaMedium'>" + _date + "</t><br/>"+
    "<t color='#afafaf' shadow='2' size='0.7' font='PuristaLight'>" +_vehicleName + "</t><br/>",
    0, 0.83, 5, 3
] spawn BIS_fnc_dynamicText;

waitUntil {missionNamespace getVariable ["bmt_var_init_preloadCompleted", false];};
sleep 4;

// Terminate animation and music
// Stop music and animations
2 fadeMusic 0;
sleep 2;
player switchMove "AmovPercMstpSlowWrflDnon";
playMusic "";

// Restore music and ace_hearing.
0 fadeMusic 1;
if (bmt_mod_ace3) then {
    ace_hearing_disableVolumeUpdate = false;
};

// Remove colors effects and camera
ppEffectDestroy _ppColor;
ppEffectDestroy _ppGrain;
_camera cameraEffect ["terminate", "back"];
showCinemaBorder false;
camDestroy _camera;

// Reset layers
"BIS_layerStatic" cutText ["", "PLAIN"];
"BIS_layerEstShot" cutText ["", "PLAIN"];
"BIS_layerInterlacing" cutText ["", "PLAIN"];

// Reenable simulation for all units.
{
    _x enableSimulation true;
} forEach allUnits - [player];

// Fade into first person
call BIS_fnc_VRFadeIn;
playSound (selectRandom ["Transition1", "Transition2", "Transition3"]);

"dynamicBlur" ppEffectEnable true;
"dynamicBlur" ppEffectAdjust [1.5];
"dynamicBlur" ppEffectCommit 0;
"dynamicBlur" ppEffectAdjust [0.0];
"dynamicBlur" ppEffectCommit 2;

player setVariable ["bmt_var_init_introFinished", true, true];

//============================================= END OF FILE =============================================//
