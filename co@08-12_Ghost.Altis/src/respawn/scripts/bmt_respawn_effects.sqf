//=======================================================================================================//
// File: bmt_respawn_effects.sqf                                                                         //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/04/03                                                                             //
// Description: This script creates a camera that rotates around the given unit. Useful when the player  //
//              is killed. Rotating camera script by Greenfist.                                          //
//                                                                                                       //
//              Arguments:                                                                               //
//               - 0: unit targeted by the camera                                                        //
//                                                                                                       //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

params ["_target"];
private ["_camera", "_ppColor", "_ppGrain"];

// Create the effects
_ppColor = ppEffectCreate ["colorCorrections", 1999];
_ppColor ppEffectEnable true;
_ppColor ppEffectAdjust [1, 1, 0, [1, 1, 1, 0], [0.8, 0.8, 0.8, 0.65], [1, 1, 1, 1.0]];
_ppColor ppEffectCommit 0;

_ppGrain = ppEffectCreate ["filmGrain", 2012];
_ppGrain ppEffectEnable true;
_ppGrain ppEffectAdjust [0.1, 1, 1, 0, 1];
_ppGrain ppEffectCommit 0;

playSound "Simulation_Fatal";

sleep 0.2;

("BIS_layerEstShot" call BIS_fnc_rscLayer) cutRsc ["RscEstablishingShot", "PLAIN"];

("BIS_layerStatic" call BIS_fnc_rscLayer) cutRsc ["RscStatic", "PLAIN"];
("BIS_layerInterlacing" call BIS_fnc_rscLayer) cutRsc ["RscInterlacing", "PLAIN"];
("BIS_fnc_blackOut" call BIS_fnc_rscLayer) cutText ["","PLAIN",10e10];

bmt_respawn_camera = true;

// Camera set-up
_radius = 4;
_angle = 180;
_altitude = 5;
_dir = 0;
_speed = 0.2;

_coords = [_target, _radius, _angle] call BIS_fnc_relPos;
_coords set [2, _altitude];
_camera = "camera" camCreate _coords;
_camera cameraEffect ["internal", "back"];
_camera camPrepareFOV 0.700;
_camera camPrepareTarget _target;
_camera camCommitPrepared 0;

while {bmt_respawn_camera} do {
    _coords = [_target, _radius, _angle] call BIS_fnc_relPos;
    _coords set [2, _altitude];

    _camera camPreparePos _coords;
    _camera camCommitPrepared _speed;

    waitUntil {camCommitted _camera || !(bmt_respawn_camera)};

    _camera camPreparePos _coords;
    _camera camCommitPrepared 0;

    _angle = if (_dir == 0) then {_angle - 1} else {_angle + 1};
};

// Remove colors effects and camera
ppEffectDestroy _ppColor;
ppEffectDestroy _ppGrain;
_camera cameraEffect ["terminate", "back"];
camDestroy _camera;

// Reset layers
"BIS_layerStatic" cutText ["", "PLAIN"];
"BIS_layerEstShot" cutText ["", "PLAIN"];
"BIS_layerInterlacing" cutText ["", "PLAIN"];

// Fade into first person
call BIS_fnc_VRFadeIn;
playSound (selectRandom ["Transition1", "Transition2", "Transition3"]);

//============================================= END OF FILE =============================================//
