private ["_numRespawns", "_pos"];

// The player is not dead.
player setVariable ["bmt_var_playerAlive", true, true];

switch (bmt_param_respawn_numRespawns) do {

    // Unlimited amount of respawns.
    case 0: {
        _numRespawns = -99;
    };

    // No respawn is allowed
    case 1: {
        _numRespawns = 0;
    };

    // The number of respawns is mission dependant.
    case 2: {
        _numRespawns = getNumber (missionConfigFile >> "bmt_config" >> "bmt_config_numAllowedRespawns");
    };
};

switch (bmt_param_respawn_tickets) do {
    case 0: {
        if (bmt_param_debugOutput == 1) then {
            player sidechat format ["DEBUG (fn_respawn_config.sqf): Assigning respawn for side %1.", side player];
        };
        switch (side player) do {
            case west:       { _pos = 0; };
            case east:       { _pos = 1; };
            case resistance: { _pos = 2; };
            case civilian:   { _pos = 3; };
        };
        bmt_array_numRespawns set [_pos, _numRespawns];
        publicVariable bmt_array_numRespawns;
    };
    case 1: {
        if (bmt_param_debugOutput == 1) then {
            player sidechat format ["DEBUG (fn_respawn_config.sqf): Assigning respawn for players."];
        };
        player setVariable ["bmt_var_numRespawns", _numRespawns, true];
    };
};
