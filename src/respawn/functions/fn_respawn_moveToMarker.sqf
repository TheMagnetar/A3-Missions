//=======================================================================================================//
// File: fn_respawn_moveToMarker.sqf                                                                     //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/10/02                                                                             //
// Description: This function enters spectator mode. The spectator mode that is used, ACE3 spectator or  //
//              BI's End Game Spectator, depends on mission parameters.                                  //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

private ["_unitFaction", "_respawnMarkerName", "_rank", "_targetUnit"];

_unitFaction = tolower (faction player);

// Use leader faction if unit's faction is different.
if (_unitFaction != toLower (faction (leader group player))) then {
    _unitFaction = toLower (faction (leader group player));
};

// Try first if there is a specific faction marker for respawning.
_respawnMarkerName = format ["respawn_%1", _unitFaction];

if (getMarkerColor _respawnMarkerName != "") exitWith {
    player setPosATL [getMarkerPos _respawnMarkerName select 0, getMarkerPos _respawnMarkerName select 1, 0];
};

// If a specific faction marker does not exist, use side marker (respawn_west, respawn_east, ...)
_respawnMarkerName = format ["respawn_%1", tolower format ["%1", side player]];
if (getMarkerColor _respawnMarkerName != "") exitWith {
    player setPosATL [getMarkerPos _respawnMarkerName select 0, getMarkerPos _respawnMarkerName select 1, 0];
};

// If there is no respawn marker, try to respawn near the highest ranked playable unit within the group that is alive.
_targetUnit = objNull;
_rank = -1;
{
    if (alive _x and (rankId _x > _rank) and ((vehicle _x == _x) or ([vehicle _x] call bmt_fnc_misc_checkEmptyPosition))) then {
        _rank = rankId _x;
        _targetUnit = _x;
    };
} forEach ((units group player) - [player]);

if (!isNull _targetUnit) exitWith {
    if ((vehicle _targetUnit) != _targetUnit) then {
            player moveInAny (vehicle _targetUnit);
    } else {
        player setPos [getPos _targetUnit];
    };
};

// As a last resort try to respawn near a unit with the same side.
_targetUnit = objNull;
_rank = -1;
{
    if (alive _x and (rankId _x > _rank) and ((vehicle _x == _x) or ([vehicle _x] call bmt_fnc_misc_checkEmptyPosition))) then {
        if (side _x == side player) then {
            _rank = rankId _x;
            _targetUnit = _x;
        };
    };
} forEach (playableUnits - [player]);

if (!isNull _targetUnit) exitWith {
    if ((vehicle _targetUnit) != _targetUnit) then {
            player moveInAny (vehicle _targetUnit);
    } else {
        player setPos [getPos _targetUnit];
    };
};

// If it is not possible to respawn, kill the player and disable further respawn.
player setVariable ["bmt_var_numRespawns", -1, true];
player setDamage 1;
sleep 2;
"normal" cutText ["Not possible to respawn anywhere. There are no suitable respawn markers, everybody is dead and/or all vehicles are occupied!", "PLAIN"];

//============================================= END OF FILE =============================================//
