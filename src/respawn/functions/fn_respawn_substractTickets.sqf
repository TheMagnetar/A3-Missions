//=======================================================================================================//
// File: fn_respawn_substractTickets.sqf                                                                 //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/10/02                                                                             //
// Description: This function substracts tickets depending on the mission parameters: from the player    //
//              pool of from the side pool.                                                              //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

private ["_numRespawns", "_pos"];

switch (bmt_param_respawn_tickets) do {
    case 0: {
        switch (side player): {
            case west: { _pos = 0; };
            case east: { _pos = 1; };
            case resistance: { _pos = 2; };
            case civilian: { _pos = 3; };
        };

        _numRespawns = bmt_array_numRespawns select _pos;

        if (_numRespawns >= 0) then {
            _numRespawns = _numRespawns - 1;
            bmt_array_numRespawns set [_pos, _numRespawns];
            publicVariable "bmt_array_numRespawns";
        };
    };
    case 1: {
        _numRespawns = player getVariable ["bmt_var_numRespawns", -1];
        if (_numRespawns >= 0) then {
            _numRespawns = _numRespawns - 1;
            player setVariable ["bmt_var_numRespawns", _numRespawns, true];
        };
    };
};

// Return value
_numRespawns

//============================================= END OF FILE =============================================//
