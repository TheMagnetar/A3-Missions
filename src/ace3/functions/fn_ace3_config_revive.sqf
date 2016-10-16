//=======================================================================================================//
// File: fn_ace3_config_revive.sqf                                                                       //
// Author: TheMagnetar                                                                                   //
// Version 1.1                                                                                           //
// File creation: 2015/05/28                                                                             //
// Description: This document is used for configuring a mission with ACE 3 without requiring to place    //
//              modules in the editor manually.                                                          //
//              http://ace3mod.com/wiki/index.html                                                       //
//              http://ace3mod.com/wiki/missionmaker/modules.html                                        //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

private _numRevives =  getNumber (missionConfigFile >> "bmt_config" >> "bmt_config_numAllowedRespawns");

if (bmt_param_ace3_reviveSystem > 0) then {

    // If ACE3's revive system is used, disable respawns themselves.
    switch (bmt_param_respawn_tickets) do {
        case 0: {
            if (bmt_param_debugOutput == 1) then {
                player sidechat format ["DEBUG (fn_ace3_config_revive.sqf): Disabling respawning per side in favour of ACE3 revive system."];
            };
            switch (side player) do {
                case west: { _pos = 0; };
                case east: { _pos = 1; };
                case resistance: { _pos = 2; };
                case civilian: { _pos = 3; };
            };
            bmt_array_numRespawns set [_pos, 0];
            publicVariable bmt_array_numRespawns;
        };
        case 1: {
            if (bmt_param_debugOutput == 1) then {
                player sidechat format ["DEBUG (fn_ace3_config_revive.sqf): Disabling player respawn in favour of ACE3 revive system."];
            };
            player setVariable ["bmt_var_numRespawns", 0, true];
        };
    };

    // Set the number of ACE Revives to be equal to the original respawn tickets
    if (_numRevives > 0) then {
        player setVariable ["ace_medical_amountOfReviveLives", _numRevives, true];
        player sidechat format ["DEBUG (fn_ace3_config_revive.sqf): Player has %1 ACE 3 Revives.", _numRevives];
    } else {
        player setVariable ["ace_medical_amountOfReviveLives", -1, true]; // Unlimited revives.
        player sidechat format ["DEBUG (fn_ace3_config_revive.sqf): Player has unlimited ACE 3 Revives."];
    };
};

//============================================= END OF FILE =============================================//
