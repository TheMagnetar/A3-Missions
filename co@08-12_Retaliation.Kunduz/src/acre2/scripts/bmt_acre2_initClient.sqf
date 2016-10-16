//=======================================================================================================//
// File: bmt_acre2_initClient.sqf                                                                        //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/04/28                                                                             //
// Description: This script configures the client specific side of Advanced Combat Radio Environment 2   //
//              (ACRE2) http://gitlab.idi-systems.com/idi-systems/acre2-public/wikis/home                //
// Changes: 1.0 (2015/11/26) First public version.                                                        //
//=======================================================================================================//

private["_presetName"];

// Configure the radio presets depending on the side the unit belongs to.
if (bmt_acre2_differentPresets) then {
    switch (side player) do {
        case blufor:      {_presetName = "default2" };
        case opfor:       {_presetName = "default3" };
        case independent: {_presetName = "default4" };
        default           {_presetName = "default"  };
    };
} else {
    _presetName = "default";
};

["ACRE_PRC343", _presetName] call acre_api_fnc_setPreset;
["ACRE_PRC148", _presetName] call acre_api_fnc_setPreset;
["ACRE_PRC152", _presetName] call acre_api_fnc_setPreset;
["ACRE_PRC117F", _presetName] call acre_api_fnc_setPreset;

// Configure ACRE2. If player is alive then radios will be removed to be added later depending on the role
// as defined in "bmt_acre2_configuracio.sqf". Spectator chat will be force if unit is not alive.

sleep 0.1;

if (alive player) then {
    // Wait until gear assignement is finished.
    waitUntil{(player getVariable ["bmt_var_configEquipment_Ready", false])};

    // Wait until ACRE 2 is initialised.
    waitUntil {
        [] call acre_api_fnc_isInitialized;
    };

    // Define languages per side.
    [player] call bmt_fnc_acre2_configureLanguages;

    // Remove all radios.
    [player] call bmt_fnc_acre2_removeRadios;

    // Add radios depending on the role.
    // If radios distribution is enabled, they must be added.
    if (bmt_param_acre2_distributeRadios == 1) then {
        [player] call bmt_fnc_acre2_addRadios;
    };

    // Configure active channels.
    if (bmt_param_acre2_configureChannels == 1) then {
        [player] call bmt_fnc_acre2_configureChannels;
    };

    // Make sure that the player is not in spectator mode.
    [false] call acre_api_fnc_setSpectator;

    if ( bmt_param_debugOutput == 1) then {
        player sideChat format ["DEBUG (fn_acre2_initClient.sqf): Radios configured."];
    };
} else {
    // Player is dead. Make sure it enters the spectator mode.
    [true] call acre_api_fnc_setSpectator;
};

//============================================= END OF FILE =============================================//
