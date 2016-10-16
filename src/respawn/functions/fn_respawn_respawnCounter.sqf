//=======================================================================================================//
// File: fn_respawn_respawnCounter.sqf                                                                   //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/10/02                                                                             //
// Description: This function displays or hides the counter until the player is respawned.               //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

params [["_enter", true]];
private ["_layer"];

if (_enter) then {
    _layer = "BIS_fnc_respawnCounter" call bis_fnc_rscLayer;
    _layer cutText ["", "plain"];

    missionnamespace setvariable ["RscRespawnCounter_description", format ["<t size='1' align='center'>%1</t>","Respawning. Be more careful next time!"]];
    missionnamespace setvariable ["RscRespawnCounter_colorID", 0];
    missionnamespace setvariable ["RscRespawnCounter_Custom", playerRespawnTime];
    _layer cutRsc ["RscRespawnCounter", "plain"];
} else {
    _layer = "BIS_fnc_respawnCounter" call bis_fnc_rscLayer;
    _layer cutText ["", "plain"];
};
