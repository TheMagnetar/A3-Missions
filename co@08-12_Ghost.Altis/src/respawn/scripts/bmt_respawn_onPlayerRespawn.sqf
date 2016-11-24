//=======================================================================================================//
// File: bmt_respawn_onPlayerRespawn.sqf                                                                 //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/10/02                                                                             //
// Description: This document configures the onPlayerRespawn event. For the moment ACE3 spectator mode   //
//              (http://ace3mod.com/wiki/feature/spectator.html) in case it is available, defaulting to  //
//              the vanila one if ACE3 is not loaded.                                                    //
//                                                                                                       //
//              Arguments:                                                                               //
//               - 0: unit to be respawned <OBJECT>.                                                     //
//               - 1: old unit that was killed <OBJECT>.                                                 //
//               - 2: respawn type <SCALAR>.                                                             //
//               - 3: number of seconds until respawn <SCALAR>.                                          //
//                                                                                                       //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

// Parameters passed when onPlayerRespawn.
params [["_unit",objNull], ["_oldUnit",objNull], ["_respawn",0], ["_respawnDelay",0]];
private ["_unitOptions"];

// If there is respawn of type BIRD.
if (_respawn == 1) then {
    player setVariable ["bmt_var_playerAlive", false, true];

    sleep 1;

    bmt_script_respawnCamera = [_oldUnit] execVM "src\respawn\scripts\bmt_respawn_effects.sqf";
    sleep 6;
    if ({_x getVariable ["bmt_var_playerAlive", true]} count allPlayers <= 0) then {
        // End the mission if there are no alive units and respawn of type "BIRD".
        [] remoteExecCall ["bmt_fnc_endMission", 0, true];
    } else {
        cutText ["You are dead! Entering spectator mode.", "PLAIN DOWN"];
        sleep 5;

        bmt_respawn_camera = false;
        sleep 0.2;
        [_oldUnit] call bmt_fnc_respawn_enterSpectator;
    };
} else {

    // Hide custom respawn counter and terminate camera.
    [false] call bmt_fnc_respawn_respawnCounter;
    bmt_respawn_camera = false;

    [] call bmt_fnc_respawn_exitSpectator;

    [] call bmt_fnc_respawn_moveToMarker;

    // Assign equipment before death or default one depending on the role
    if (bmt_param_respawn_saveGear == 1) then {
        _unit setUnitLoadout(_unit getVariable["bmt_array_savedLoadout",[]]);
        if (bmt_mod_ace3) then {
            _unit setVariable ["ACE_hasEarPlugsin", _unit getVariable ["bmt_var_hasEarPlugs", false]];
            _unit setVariable ["bmt_var_hasEarPlugs", nil];
        };
    } else {
        _unitOptions = _unit getVariable "bmt_var_configEquipment";
        [_unitOptions, _unit] call bmt_fnc_configEquipment;

        sleep 1;

        // Remove and distribute ACRE 2 radios.
        if (bmt_mod_acre2) then {
            // Remove radios
            [_unit] call bmt_fnc_acre2_removeRadios;

            sleep 0.5;

            // Distribute radios
            if (bmt_param_acre2_distributeRadios == 1) then {
                [_unit] call bmt_fnc_acre2_addRadios;
            };

            // Configure active channels.
            if (bmt_param_acre2_configureChannels == 1) then {
                [player] call bmt_fnc_acre2_configureChannels;
            };
        };

        // Remove and distribute TFAR radios.
        if (bmt_mod_tfar) then {
            // Remove radios
            [_unit] call bmt_fnc_tfar_removeRadios;

            sleep 0.5;

            // Distribute radios
            if (bmt_param_tfar_distributeRadios == 1) then {
                [_unit] call bmt_fnc_tfar_addRadios;
            };

            // Configure active channels.
            if (bmt_param_tfar_configureChannels == 1) then {
                [player] call bmt_fnc_tfar_configureChannels;
            };

            // Configure stereo.
            if (bmt_param_tfar_configureStereo == 1) then {
                [player] call bmt_fnc_tfar_configureStereo;
            };
        };
    };
};

//============================================= END OF FILE =============================================//
