//=======================================================================================================//
// File: bmt_intro.sqf                                                                                   //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/04/03                                                                             //
// Description: This document is used in order to display an introduction screen in which the mission    //
//              name, date and location are shown.                                                       //
//                                                                                                       //
//              Note: the _uavMarkerType variable is the sixth parameter of the function                 //
//              BIS_fnc_establishingShot (https://community.bistudio.com/wiki/BIS_fnc_establishingShot). //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

if (!hasInterface) exitWith {};

private ["_unitFaction", "_quotes", "_recognised"];
private ["_missionName", "_missionLocation", "_introText", "_introType"];
private ["_uavMarker", "_uavMarkerType", "_uavMarkerColor"];

// Wait until the variable that activates/deactivates debug output is initialised.
waitUntil {!isNil "bmt_param_debugOutput"};

// Type of introduction: "blackScreen", "uavFeed"
_introType = "blackScreen";

_quotes = ["Whoever said the pen is mightier than the sword obviously never encountered automatic weapons.\nDouglas MacArthur."];

_missionName = getText (missionConfigFile >> "onLoadName");
_introText = selectRandom _quotes;

// Identify which faction the unit belongs to.
_unitFaction = toLower (faction player);

// Use leader faction if unit's faction is different.
if (_unitFaction != toLower (faction (leader group player))) then {
    _unitFaction = toLower (faction (leader group player));
};

// All factions are initially recognised
_recognised = true;

switch (_unitFaction) do {
    //====================================================================================================//
    // Vanila factions.                                                                                   //
    //====================================================================================================//

    // Introduction for BLUFOR faction.
    case "blu_f": {
        _missionLocation = "Location";
        _uavMarker = "marker"; _uavMarkerType = [];
    };

    // Introduction for CTRG faction (APEX).
    case "blu_ctrg_f": {
        _missionLocation = "Location";
        _uavMarker = "marker"; _uavMarkerType = [];
    };

    // Introduction for GENDARMERIE faction (APEX).
    case "blu_gen_f": {
        _missionLocation = "Location";
        _uavMarker = "marker"; _uavMarkerType = [];
    };

    // Introduction for BLUFOR Pacific faction (APEX).
    case "blu_t_f": {
        _missionLocation = "Location";
        _uavMarker = "marker"; _uavMarkerType = [];
    };

    // Introduction for FIA faction.
    case "blu_g_f": {
        _missionLocation = "Location";
        _uavMarker = "marker"; _uavMarkerType = [];
    };

    // Introduction for FIA faction.
    case "ind_g_f": {
        _missionLocation = "Location";
        _uavMarker = "marker"; _uavMarkerType = [];
    };
    // Introduction for FIA faction.
    case "opf_g_f": {
        _missionLocation = "Location";
        _uavMarker = "marker"; _uavMarkerType = [];
    };

    // Introduction for the Independent faction.
    case "ind_f": {
        _missionLocation = "Location";
        _uavMarker = "marker"; _uavMarkerType = [];
    };

    // Introduction for the Syndikat faction.
    case "ind_c_f": {
        _missionLocation = "Location";
        _uavMarker = "marker"; _uavMarkerType = [];
    };

    // Introduction for the Civillian faction.
    case "civ_f": {
        _missionLocation = "Location";
        _uavMarker = "marker"; _uavMarkerType = [];
    };

    // Introduction for OPFOR faction.
    case "opf_f":{
        _missionLocation = "Location";
        _uavMarker = "marker"; _uavMarkerType = [];
    };

    // Introduction for OPFOR Pacific faction (APEX).
    case "opf_t_f":{
        _missionLocation = "Location";
        _uavMarker = "marker"; _uavMarkerType = [];
    };

    //====================================================================================================//
    // RHS factions.                                                                                      //
    //====================================================================================================//

    // RHS: USAF "United States Army" (OCP) faction.
    case "rhs_faction_usarmy_d": {
        _missionLocation = "Location"; _uavMarker = "marker"; _uavMarkerType = [];
    };

    // RHS: USAF "United States Army" (UCP) faction.
    case "rhs_faction_usarmy_wd": {
        _missionLocation = "Location"; _uavMarker = "marker"; _uavMarkerType = [];
    };

    // RHS: USAF "United States Marine Corps" (D) faction.
    case "rhs_faction_usmc_d": {
        _missionLocation = "Location"; _uavMarker = "marker"; _uavMarkerType = [];
    };

    // RHS: USAF "United States Marine Corps" (WD) faction.
    case "rhs_faction_usmc_wd": {
        _missionLocation = "Location"; _uavMarker = "marker"; _uavMarkerType = [];
    };

    // RHS: USAF "United States Navy" faction.
    case "rhs_faction_usn": {
        _missionLocation = "Location"; _uavMarker = "marker"; _uavMarkerType = [];
    };

    // RHS: Insurgents faction.
    case "rhs_faction_insurgents": {
        _missionLocation = "Location"; _uavMarker = "marker"; _uavMarkerType = [];
    };

    // RHS: AFRF "Russian Airborne Troops" faction.
    case "rhs_faction_vdv": {
        _missionLocation = "Location"; _uavMarker = "marker"; _uavMarkerType = [];
    };

    // RHS: AFRF "Soviet Air Defense Forces" faction.
    case "rhs_faction_vpvo": {
        _missionLocation = "Location"; _uavMarker = "marker"; _uavMarkerType = [];
    };

    //====================================================================================================//
    // Bundeswehr.                                                                                        //
    //====================================================================================================//

    // German army "Bundeswehr" faction.
    case "bwa3_faction": {
        _missionLocation = "Location"; _uavMarker = "marker"; _uavMarkerType = [];
    };

    // Unrecognised faction.
    default {
        _recognised = false;
    };
};

// Check wether a faction is recognised or not.
if (_recognised) then {

    // Only execute if the player is alive.
    if (alive player) then {
        switch (_introType) do {
            case "blackScreen": {
                [_missionName, _missionLocation, _introText] execVM "src\intro\scripts\bmt_intro_blackScreen_typeText.sqf";
            };

            case "uavFeed": {
                [_uavMarker, _missionName + " - " + _missionLocation, [400,200,0,1], _uavMarkerType] execVM "src\intro\scripts\bmt_intro_uav.sqf";
            };
        };

        if (bmt_param_debugOutput == 1) then {
            player sideChat format ["DEBUG (intro.sqf): Using introductory text for faction %1.", _unitFaction];
        };
    };
} else {
    player globalchat format ["ERROR (bmt_intro.sqf): Faction %1 is not defined.", _unitFaction];
};

//============================================= END OF FILE =============================================//
