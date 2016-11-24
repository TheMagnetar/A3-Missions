//=======================================================================================================//
// File: fn_acre2_configureLanguages.sqf                                                                 //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 05/05/2015                                                                             //
// Description: Function to configure languages (babel) for each unit depending on the unit faction for  //
//              Advanced Combat Radio Environment 2 (ACRE2)                                              //
//              http://gitlab.idi-systems.com/idi-systems/acre2-public/wikis/home                        //
//                                                                                                       //
//              Arguments:                                                                               //
//               - 0: unit whose radios must be configured <OBJECT>.                                     //
//                                                                                                       //
// Changes:  1.0 (2015/11/26) First public version.                                                      //
//=======================================================================================================//

// Variable declarations.
params [["_unit", objNull]];
private["_unitFaction"];

// Identificar la facció de la unitat.
_unitFaction = toLower (faction _unit);

// DEBUG OUTPUT.
if ( bmt_param_debugOutput == 1 ) then {
    _unit sideChat format ["DEBUG (fn_acre2_determinarbmt_acre2_configureLanguages.sqf): unit faction: %1", _unitFaction];
};

// Languages for BLUFOR faction.
if (_unitFaction in ["blu_f", "blu_ctrg_f", "blu_gen_f", "blu_t_f"] ) exitWith {

    bmt_acre2_language_blufor call acre_api_fnc_babelSetSpokenLanguages;
    [bmt_acre2_language_blufor select 0] call acre_api_fnc_babelSetSpeakingLanguage;
    // DEBUG OUTPUT
    if ( bmt_param_debugOutput == 1 ) then {
        _unit sideChat format ["DEBUG (bmt_acre2_configureLanguages.sqf): Using %1 for faction %2.", bmt_acre2_language_blufor, _unitFaction];
    };
};

// Languages for FIA faction.
if (_unitFaction in ["blu_g_f","ind_g_f","opf_g_f"]) exitWith {

    bmt_acre2_language_fia call acre_api_fnc_babelSetSpokenLanguages;
    [bmt_acre2_language_fia select 0] call acre_api_fnc_babelSetSpeakingLanguage;
    // DEBUG OUTPUT
    if ( bmt_param_debugOutput == 1 ) then {
        _unit sideChat format ["DEBUG (bmt_acre2_configureLanguages.sqf): Using %1 for faction %2.", bmt_acre2_language_fia, _unitFaction];
    };
};

// Languages for OPFOR faction.
if (_unitFaction in ["opf_f", "opf_t_f"]) exitWith {

    bmt_acre2_language_opfor call acre_api_fnc_babelSetSpokenLanguages;
    [bmt_acre2_language_opfor select 0] call acre_api_fnc_babelSetSpeakingLanguage;
    // DEBUG OUTPUT
    if ( bmt_param_debugOutput == 1 ) then {
        _unit sideChat format ["DEBUG (bmt_acre2_configureLanguages.sqf): Using %1 for faction %2.", bmt_acre2_language_opfor, _unitFaction];
    };
};

// Languages for independent faction.
if (_unitFaction in ["ind_f", "ind_c_f"]) exitWith {

    bmt_acre2_language_indfor call acre_api_fnc_babelSetSpokenLanguages;
    [bmt_acre2_language_indfor select 0] call acre_api_fnc_babelSetSpeakingLanguage;
    // DEBUG OUTPUT
    if ( bmt_param_debugOutput == 1 ) then {
        _unit sideChat format ["DEBUG (bmt_acre2_configureLanguages.sqf): Using %1 for faction %2.", bmt_acre2_language_indfor, _unitFaction];
    };
};

// Languages for civil faction.
if (_unitFaction == "civ_f") exitWith {

    bmt_acre2_language_civ call acre_api_fnc_babelSetSpokenLanguages;
    [bmt_acre2_language_civ select 0] call acre_api_fnc_babelSetSpeakingLanguage;
    // DEBUG OUTPUT
    if ( bmt_param_debugOutput == 1 ) then {
        _unit sideChat format ["DEBUG (bmt_acre2_configureLanguages.sqf): Using %1 for faction %2.", bmt_acre2_language_civ, _unitFaction];
    };
};

// Languages for RHS USAF "United States Armed Forces" faction.
if (_unitFaction in ["rhs_faction_usarmy_wd", "rhs_faction_usarmy_d", "rhs_faction_usmc_wd", "rhs_faction_usmc_d", "rhs_faction_usn"] ) exitWith {

    bmt_acre2_language_rhsusaf call acre_api_fnc_babelSetSpokenLanguages;
    [bmt_acre2_language_rhsusaf select 0] call acre_api_fnc_babelSetSpeakingLanguage;
    // DEBUG OUTPUT
    if ( bmt_param_debugOutput == 1 ) then {
        _unit sideChat format ["DEBUG (bmt_acre2_configureLanguages.sqf): Using %1 for faction %2.", bmt_acre2_language_rhsusaf, _unitFaction];
    };
};

// Languages for RHS: AFRF "Armed Forces of the Russian Federation" faction.
if (_unitFaction in ["rhs_faction_vpvo", "rhs_faction_vdv"] ) exitWith {

    bmt_acre2_language_rhsafrf call acre_api_fnc_babelSetSpokenLanguages;
    [bmt_acre2_language_rhsafrf select 0] call acre_api_fnc_babelSetSpeakingLanguage;
    // DEBUG OUTPUT
    if ( bmt_param_debugOutput == 1 ) then {
        _unit sideChat format ["DEBUG (bmt_acre2_configureLanguages.sqf): Using %1 for faction %2.", bmt_acre2_language_rhsafrf, _unitFaction];
    };
};

// Languages for RHS: Insurgents faction.
if (_unitFaction  == "rhs_faction_insurgents" ) exitWith {

    bmt_acre2_language_rhsins call acre_api_fnc_babelSetSpokenLanguages;
    [bmt_acre2_language_rhsins select 0] call acre_api_fnc_babelSetSpeakingLanguage;
    // DEBUG OUTPUT
    if ( bmt_param_debugOutput == 1 ) then {
        _unit sideChat format ["DEBUG (bmt_acre2_configureLanguages.sqf): Using %1 for faction %2.", bmt_acre2_language_rhsins, _unitFaction];
    };
};

// Languages for Bundeswehr faction.
if (_unitFaction == "bwa3_faction" ) exitWith {

    bmt_acre2_language_bwa3 call acre_api_fnc_babelSetSpokenLanguages;
    [bmt_acre2_language_bwa3 select 0] call acre_api_fnc_babelSetSpeakingLanguage;
    // DEBUG OUTPUT
    if ( bmt_param_debugOutput == 1 ) then {
        _unit sideChat format ["DEBUG (bmt_acre2_configureLanguages.sqf): Using %1 for faction %2.", bmt_acre2_language_bwa3, _unitFaction];
    };
};

//============================================= END OF FILE =============================================//
