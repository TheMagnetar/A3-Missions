//=======================================================================================================//
// File: fn_configEquipment.sqf                                                                          //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/04/02                                                                             //
// Description: This function equips the unit according to a specified role and depending on the faction //
//              it belongs to.                                                                           //
//              Arguments:                                                                               //
//               - 0: unit role <STRING> or unit role with additional options <ARRAY>.                   //
//               - 1: unit <OBJECT>.                                                                     //
//               - 2: unit faction <STRING><OPTIONAL>.                                                   //
//              Examples:                                                                                //
//               - Unit is a Fire Team Leader.                                                           //
//                   ["tl", this] call bmt_fnc_configEquipment;                                          //
//               - Unit is a Squad Leader with optional equipment foo.                                   //
//                   [["sl", "foo"], this] call bmt_fnc_configEquipment;                                 //
//               - Unit is a medic and has the equipment of the RHS faction "United States Marine Corps" //
//                 (D) despite not belonging to it.                                                      //
//                   ["me", this, "rhs_faction_usmc_d"] call bmt_fnc_configEquipment;                    //
//                                                                                                       //
//              Unit role can be one of the following entries:                                           //
//                                                                                                       //
//                  Unit Role               Assigned role                                                //
//                  pl                      Platoon Leader                                               //
//                  psg                     Platoon Sergeant                                             //
//                  rto                     Platoon Radiotelephone Operator                              //
//                  fo                      Forward Observer                                             //
//                  me                      Platoon Medic                                                //
//                  sl                      Squad Leader                                                 //
//                  tl                      Team Leader                                                  //
//                  rfl                     Rifleman                                                     //
//                  rflat                   Rifleman with AT4                                            //
//                  gr                      Grenadier                                                    //
//                  ar                      Automatic Rifleman                                           //
//                  dm                      Designated Marksman                                          //
//                  mg                      Machine Gunner                                               //
//                  amg                     Assitant Machine Gunner                                      //
//                  at                      Anti-Tank)                                                   //
//                  aat                     AT Ammo handler                                              //
//                  aa                      Anti-Aircraft gunner                                         //
//                  aaa                     Anti-Aircraft Assitant                                       //
//                  en                      Engineer                                                     //
//                  exp                     Explosives Specialist                                        //
//                  sn                      Sniper                                                       //
//                  sp                      Spotter                                                      //
//                  divsl                   Diver Squad Leader                                           //
//                  divme                   Diver Medic                                                  //
//                  divexp                  Diver Explosives Specialist                                  //
//                  div                     Diver                                                        //
//                  hplt                    Helicopter pilot                                             //
//                  jplt                    Jet pilot                                                    //
//                                                                                                       //
//                  hmmwv                   Equipment for HMMWVs                                         //
//                                                                                                       //
//              while the list of supported factions is:                                                 //
//                                                                                                       //
//                  FACTION                 Forced faction in terms of equipment                         //
//                  blu_f                   Blue Force                                                   //
//                  blu_ctrg_f              CTRG (APEX)                                                  //
//                  blu_gen_f               Gendarmerie (APEX)                                           //
//                  blu_t_f                 Blue Force Pacific (APEX)                                    //
//                  blu_g_f                 FIA                                                          //
//                  ind_g_f                 FIA                                                          //
//                  opf_g_f                 FIA                                                          //
//                  opf_f                   Opposing Force                                               //
//                  opf_t_f                 Opposing Force Pacific (APEX)                                //
//                  ind_f                   Independent Force                                            //
//                  ind_c_f                 Syndikat (APEX)                                              //
//                  civ_f                   Facció civil                                                 //
//                  rhs_faction_usarmy_wd   United States Army (Woodland)                                //
//                  rhs_faction_usarmy_d    United States Army (Desert)                                  //
//                  rhs_faction_usmc_wd     United States Marine Corps (Woodland)                        //
//                  rhs_faction_usmc_d      United States Marine Corps (Desert)                          //
//                  rhs_faction_insurgents  Insurgents                                                   //
//                  rhs_faction_vpvo        Soviet Air Defense Forces (Voyska protivovozdushnoy oborony) //
//                  rhs_faction_vdv         Russian Airborne Troops (Vozdushno-desantnye voyska)         //
//                  bwa3_faction            Bundeswehr                                                   //
//                                                                                                       //
// Changes: 1.0  (2015/11/26) First public version.                                                      //
//=======================================================================================================//

// Variable declaration.
params ["_unitOptions", "_unit", ["_unitFaction", nil]];
private ["_recognised"];

// Only execute if unit is local.
if !(local _unit) exitWith {};

// Assume faction is recognised.
_recognised = true;

if (isNil "_unitFaction") then {
    _unitFaction = toLower (faction _unit);
} else {
    _unitFaction = toLower _unitFaction;
};

// Save unit type.
_unit setVariable ["bmt_var_configEquipment", _unitOptions, true];

// Begin gear assignement depending on unit's role.
_unit setVariable ["bmt_var_configEquipment_Ready", false, true];

// Include file for equipment configuration.
#include "..\..\..\missionConfig\configEquipment\scripts\bmt_configEquipment_options.sqf";

switch (_unitFaction) do {

    //====================================================================================================//
    // Vanila factions.                                                                                   //
    //====================================================================================================//

    // Equipment for BLUFOR faction.
    case "blu_f": { [_unitOptions, _unit, _unitFaction] call bmt_fnc_configEquipment_blu_f; };

    // Equipment for CTRG faction (APEX).
    case "blu_ctrg_f": { [_unitOptions, _unit, _unitFaction] call bmt_fnc_configEquipment_blu_f; };

    // Equipment for GENDARMERIE faction (APEX).
    case "blu_gen_f": { [_unitOptions, _unit, _unitFaction] call bmt_fnc_configEquipment_blu_f; };

    // Equipment for BLUFOR Pacific faction (APEX).
    case "blu_t_f": { [_unitOptions, _unit, _unitFaction] call bmt_fnc_configEquipment_blu_f; };

    // Equipment for FIA faction.
    case "blu_g_f": { [_unitOptions, _unit, _unitFaction] call bmt_fnc_configEquipment_fia_f; };

    // Equipment for FIA faction.
    case "ind_g_f": { [_unitOptions, _unit, _unitFaction] call bmt_fnc_configEquipment_fia_f; };

    // Equipment for FIA faction.
    case "opf_g_f": { [_unitOptions, _unit, _unitFaction] call bmt_fnc_configEquipment_fia_f; };

    // Equipment for OPFOR faction.
    case "opf_f": { [_unitOptions, _unit, _unitFaction] call bmt_fnc_configEquipment_opf_f; };

    // Equipment for OPFOR Pacific faction (APEX).
    case "opf_t_f": { [_unitOptions, _unit, _unitFaction] call bmt_fnc_configEquipment_opf_f; };

    // Equipment for Independent faction.
    case "ind_f": { [_unitOptions, _unit, _unitFaction] call bmt_fnc_configEquipment_ind_f; };

    // Equipment for Syndikat faction.
    case "ind_c_f": { [_unitOptions, _unit, _unitFaction] call bmt_fnc_configEquipment_ind_f; };

    // Equipment for Civilian faction.
    case "civ_f": { [_unitOptions, _unit, _unitFaction] call bmt_fnc_configEquipment_civ_f; };

    //====================================================================================================//
    // RHS factions.                                                                                      //
    //====================================================================================================//

    // Equipment for RHS: USAF "United States Army" (OCP) faction.
    case "rhs_faction_usarmy_d": { [_unitOptions, _unit, _unitFaction] call bmt_fnc_configEquipment_rhs_usaf; };

    // Equipment for RHS: USAF "United States Army" (UCP) faction.
    case "rhs_faction_usarmy_wd": { [_unitOptions, _unit, _unitFaction] call bmt_fnc_configEquipment_rhs_usaf; };

    // Equipment for RHS: USAF "United States Marine Corps" (D) faction.
    case "rhs_faction_usmc_d": { [_unitOptions, _unit, _unitFaction] call bmt_fnc_configEquipment_rhs_usaf; };

    // Equipment for RHS: USAF "United States Marine Corps" (WD) faction.
    case "rhs_faction_usmc_wd": { [_unitOptions, _unit, _unitFaction] call bmt_fnc_configEquipment_rhs_usaf; };

    // Equipment for RHS: USAF "United States Navy" faction.
    case "rhs_faction_usn": { [_unitOptions, _unit, _unitFaction] call bmt_fnc_configEquipment_rhs_usaf; };

    // Equipment for RHS: Insurgents faction.
    case "rhs_faction_insurgents": { [_unitOptions, _unit, _unitFaction] call bmt_fnc_configEquipment_rhs_insurgents; };

    // Equipment for RHS: AFRF "Russian Airborne Troops" faction.
    case "rhs_faction_vdv": { [_unitOptions, _unit, _unitFaction] call bmt_fnc_configEquipment_rhs_vdv; };

    // Equipment for RHS: AFRF "Soviet Air Defense Forces" faction.
    case "rhs_faction_vpvo": { [_unitOptions, _unit, _unitFaction] call bmt_fnc_configEquipment_rhs_vpvo; };

    //====================================================================================================//
    // Bundeswehr.                                                                                        //
    //====================================================================================================//

    // Equipment for German army "Bundeswehr" faction.
    case "bwa3_faction": { [_unitOptions, _unit, _unitFaction] call bmt_fnc_configEquipment_bwa3_faction; };

    default { _recognised = false; };
};

if (_recognised) then {
    // DEBUG OUTPUT.
    _unit setVariable ["bmt_var_configEquipment_Ready", true, true];
    if (bmt_param_debugOutput == 1) then {
        _unit sideChat format ["DEBUG (fn_configEquipment.sqf): unit equiped with gear of faction: %1", _unitFaction];
    };
} else {
    player globalchat format ["ERROR (fn_configEquipment.sqf): Faction %1 is not defined.", _unitFaction];
};

//============================================= END OF FILE =============================================//
