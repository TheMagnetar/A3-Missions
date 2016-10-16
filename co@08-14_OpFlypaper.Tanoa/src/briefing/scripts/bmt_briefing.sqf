//=======================================================================================================//
// File: bmt_briefing.sqf                                                                                //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/02/22                                                                             //
// Description: This script is responsible for generating briefing entries depending on the player's     //
//              faction. This is useful for TvT missions or with missions where factions in the same     //
//              side have different objectives.                                                          //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

// Do not execute the rest of the script if it is not a player.
if (!hasInterface) exitWith {};

// Wait until unit player is initalised in order to execute the rest of the script.
if (!isDedicated && (isNull player)) then {
    waitUntil {sleep 0.1; !isNull player};
};

// Variable declarations.
private ["_unitFaction", "_recognised"];

// Wait until output debug control variable is initialised.
waitUntil {!isNil "bmt_param_debugOutput"};

// Identify which faction the unit belongs to.
_unitFaction = toLower (faction player);

// Use leader faction if unit's faction is different.
if (_unitFaction != toLower (faction (leader group player))) then {
    _unitFaction = toLower (faction (leader group player));
};

_recognised = true;

// Briefing for the Administrator.
if (serverCommandAvailable "#kick") then {
    #include "..\..\..\missionConfig\briefing\scripts\bmt_briefing_admin.sqf"

    // DEBUG OUTPUT
    if (bmt_param_debugOutput == 1) then {
        player sideChat format ["DEBUG (bmt_briefing.sqf): Using briefings for the Administrator."];
    };
};

switch (_unitFaction) do {

    //====================================================================================================//
    // Vanila factions.                                                                                   //
    //====================================================================================================//

    // Briefing for BLUFOR faction.
    case "blu_f": {
        #include "..\..\..\missionConfig\briefing\scripts\bmt_briefing_blu_f.sqf"
    };

    // Briefing for CTRG faction (APEX).
    case "blu_ctrg_f": {
        #include "..\..\..\missionConfig\briefing\scripts\bmt_briefing_blu_ctrg_f.sqf"
    };

    // Briefing for GENDARMERIE faction (APEX).
    case "blu_gen_f": {
        #include "..\..\..\missionConfig\briefing\scripts\bmt_briefing_blu_gen_f.sqf"
    };

    // Briefing for BLUFOR Pacific faction (APEX).
    case "blu_t_f": {
        #include "..\..\..\missionConfig\briefing\scripts\bmt_briefing_blu_t_f.sqf"
    };

    // Briefing for FIA faction.
    case "blu_g_f": {
        #include "..\..\..\missionConfig\briefing\scripts\bmt_briefing_fia_f.sqf"
    };

    // Briefing for FIA faction.
    case "ind_g_f": {
        #include "..\..\..\missionConfig\briefing\scripts\bmt_briefing_fia_f.sqf"
    };

    // Briefing for FIA faction.
    case "opf_g_f": {
        #include "..\..\..\missionConfig\briefing\scripts\bmt_briefing_fia_f.sqf"
    };

    // Briefing for OPFOR faction.
    case "opf_f": {
        #include "..\..\..\missionConfig\briefing\scripts\bmt_briefing_opf_f.sqf"
    };

    // Briefing for OPFOR Pacific faction (APEX).
    case "opf_t_f": {
        #include "..\..\..\missionConfig\briefing\scripts\bmt_briefing_opf_t_f.sqf"
    };

    // Briefing for Independent faction.
    case "ind_f": {
        #include "..\..\..\missionConfig\briefing\scripts\bmt_briefing_ind_f.sqf"
    };

    // Briefing for Syndikat faction (APEX).
    case "ind_c_f": {
        #include "..\..\..\missionConfig\briefing\scripts\bmt_briefing_ind_c_f.sqf"
    };

    // Briefing for Civilian faction.
    case "civ_f": {
        #include "..\..\..\missionConfig\briefing\scripts\bmt_briefing_civ_f.sqf"
    };

    //====================================================================================================//
    // RHS factions.                                                                                      //
    //====================================================================================================//

    // Briefing for RHS: USAF "United States Army" (OCP) faction.
    case "rhs_faction_usarmy_d": {
        #include "..\..\..\missionConfig\briefing\scripts\bmt_briefing_rhs_usarmy_d.sqf"
    };

    // Briefing for RHS: USAF "United States Army" (UCP) faction.
    case "rhs_faction_usarmy_wd": {
        #include "..\..\..\missionConfig\briefing\scripts\bmt_briefing_rhs_usarmy_wd.sqf"
    };

    // Briefing for RHS: USAF "United States Marine Corps" (D) faction.
    case "rhs_faction_usmc_d": {
        #include "..\..\..\missionConfig\briefing\scripts\bmt_briefing_rhs_usmc_d.sqf"
    };

    // Briefing for RHS: USAF "United States Marine Corps" (WD) faction.
    case "rhs_faction_usmc_wd": {
        #include "..\..\..\missionConfig\briefing\scripts\bmt_briefing_rhs_usmc_wd.sqf"
    };

    // Briefing for RHS: USAF "United States Navy" faction.
    case "rhs_faction_usn": {
        #include "..\..\..\missionConfig\briefing\scripts\bmt_briefing_rhs_usn.sqf"
    };

    // Briefing for RHS: Insurgents faction.
    case "rhs_faction_insurgents": {
        #include "..\..\..\missionConfig\briefing\scripts\bmt_briefing_rhs_insurgents.sqf"
    };

    // Briefing for RHS: AFRF "Russian Airborne Troops" faction.
    case "rhs_faction_vdv": {
        #include "..\..\..\missionConfig\briefing\scripts\bmt_briefing_rhs_vdv.sqf"
    };

    // Briefing for RHS: AFRF "Soviet Air Defense Forces" faction.
    case "rhs_faction_vpvo": {
        #include "..\..\..\missionConfig\briefing\scripts\bmt_briefing_rhs_vpvo.sqf"
    };

    //====================================================================================================//
    // Bundeswehr.                                                                                        //
    //====================================================================================================//

    // Briefing for German army "Bundeswehr" faction.
    case "bwa3_faction": {
        #include "..\..\..\missionConfig\briefing\scripts\bmt_briefing_bwa3_faction.sqf"
    };

    default { _recognised = false; };
};

if (_recognised) then {
    // DEBUG OUTPUT.
    if (bmt_param_debugOutput == 1) then {
        player sideChat format ["DEBUG (bmt_briefing.sqf): Using briefing for faction: %1", _unitFaction];
    };
} else {
    player globalchat format ["ERROR (bmt_briefing.sqf): Faction %1 is not defined.", _unitFaction];
};

//============================================= END OF FILE =============================================//
