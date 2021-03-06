//=======================================================================================================//
// File: bmt_tfar_initClient.sqf                                                                         //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/03/06                                                                             //
// Description: This script configures the client specific side of Task Force Arrowhead Radio (TFAR)     //
//             (https://github.com/michail-nikolaev/task-force-arma-3-radio/wiki).                       //
//                                                                                                       //
//              Arguments:                                                                               //
//               - none                                                                                  //
//                                                                                                       //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

// Configure TFAR. If player is alive then radios will be removed to be added later depending on the role
// as defined in "bmt_tfar_configuracio.sqf". Spectator chat will be force if unit is not alive.

// Proceed if player is alive.
if (alive player) then {

    // Wait until gear assignement is finished.
    waitUntil{(player getVariable ["bmt_var_init_configEquipmentReady", false])};

    // Do not redistribute radios if the previous status has been retrieved.
    if ( !(player getVariable ["bmt_var_jip_StatusRetrieved", false]) ) then {
        // Remove all radios.
        [player] call bmt_fnc_tfar_removeRadios;

        // If radios distribution is enabled, they must be added.
        if (bmt_param_tfar_distributeRadios == 1) then {
            [player] call bmt_fnc_tfar_addRadios;
        };
    };

    sleep 3;

    if (didJIP) then {
        // Add more time in case of JIP. To be checked upon new releases of TFAR.
        sleep 7;
    };

    // Configure active channels.
    if (bmt_param_tfar_configureChannels == 1) then {
        [player] call bmt_fnc_tfar_configureChannels;
    };

    // Configure stereo.
    if (bmt_param_tfar_configureStereo == 1) then {
        [player] call bmt_fnc_tfar_configureStereo;
    };

    // Make sure that the player is not in spectator mode.
    [player, false] call TFAR_fnc_forceSpectator;

} else {
    // Player is dead. Make sure it enters the spectator mode.
    [player, true] call TFAR_fnc_forceSpectator;
};

player setVariable ["bmt_var_init_configRadiosReady", true, true];

// DEBUG OUTPUT
if (bmt_param_debugOutput == 1) then {
    player sideChat format ["DEBUG (bmt_tfar_initClient.sqf): Radios configured."];
};
//============================================= END OF FILE =============================================//
