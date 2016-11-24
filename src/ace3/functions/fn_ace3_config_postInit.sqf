//=======================================================================================================//
// Arxiu: fn_ace3_config_postInit.sqf                                                                    //
// Author: TheMagnetar                                                                                   //
// Version 1.1                                                                                           //
// File creation: 2015/05/28                                                                             //
// Description: This document is used for configuring a mission with ACE 3 without requiring to place    //
//              modules in the editor manually.                                                          //
//              http://ace3mod.com/wiki/index.html                                                       //
//              http://ace3mod.com/wiki/missionmaker/modules.html                                        //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//
if (!bmt_mod_ace3) exitWith {};

private["_moduleError", "_object"];

_moduleError = false;

// Include variables that define which units, vehicles or buildings have especial roles assigned (medics, engineers, ...)
#include "..\..\..\missionConfig\ace3\scripts\bmt_ace3_configuration.sqf"

if (isClass (configFile >> "CfgPatches" >> "ace_medical")) then {

    // Assign medical, doctor, medical vehicle and medical facility roles.
    {
        if (!isNil _x) then {
            call compile format ["_object = %1", _x];
            _object setVariable ["ace_medical_medicClass", 1.0, true];
        };
    } foreach _medics;

    {
        if (!isNil _x) then {
            call compile format ["_object = %1", _x];
            _object setVariable ["ace_medical_medicClass", 2.0, true];
        };
    } foreach _doctors;

    {
        if (!isNil _x) then {
            call compile format ["_object = %1", _x];
            _object setVariable ["ace_medical_medicClass", 1.0, true];
        };
    } foreach _medicVehicles;

    {
        if (!isNil _x) then {
            call compile format ["_object = %1", _x];
            _object setVariable ["ace_medical_isMedicalFacility", true, true];
        };
    } foreach _medicFacilities;

} else {
    _moduleError = true;
    diag_log "(BMT Debug) File not found: ace_medical.pbo.";
};

if (isClass (configFile >> "CfgPatches" >> "ace_repair")) then {

    // Assign engineering, repair vehicles and repair facilities roles.
    {
        if (!isNil _x) then {
            call compile format ["_object = %1", _x];
            _object setVariable ["ACE_IsEngineer", 1.0, true];
        };
    } foreach _engineers;

    {
        if (!isNil _x) then {
            call compile format ["_object = %1", _x];
            _object setVariable ["ACE_isRepairVehicle", 1.0, true];
        };
    } foreach _repairVehicles;

    {
        if (!isNil _x) then {
            call compile format ["_object = %1", _x];
            _object setVariable ["ACE_isRepairFacility", true, true];
        };
    } foreach _repairFacilities;
} else {
    _moduleError = true;
    diag_log "(BMT Debug) File not found: ace_repair.pbo.";
};

if (isClass (configFile >> "CfgPatches" >> "ace_captives")) then {
    //====================================================================================================//
    // Make Unit Surrender: http://ace3mod.com/wiki/missionmaker/modules.html#1.9-make-unit-surrender     //
    //====================================================================================================//

    {
        if (!isNil _x) then {
            call compile format ["_object = %1", _x];
            [_object, true] call ACE_captives_fnc_setSurrendered;
        };
    } foreach _surrenderedUnits;

    {
        if (!isNil _x) then {
            call compile format ["_object = %1", _x];
            [_object, true] call ACE_captives_fnc_setHandcuffed;
        };
    } foreach _handcuffedUnits;
} else {
    _moduleError = true;
    diag_log "(BMT Debug) File not found: ace_captives.pbo.";
};

if (isClass (configFile >> "CfgPatches" >> "ace_explosives")) then {
    //====================================================================================================//
    // Explosive System: http://ace3mod.com/wiki/missionmaker/modules.html#1.5-explosive-system           //
    //====================================================================================================//

    // Assign explosives specialist roles.
    {
        if (!isNil _x) then {
            call compile format ["_object = %1", _x];
            _object setVariable ["ACE_IsEOD", true, true];
        };
    } foreach _expSpecialists;
} else {
    _moduleError = true;
    diag_log "(BMT Debug) File not found: ace_explosives.pbo.";
};

if (isClass (configFile >> "CfgPatches" >> "ace_fastroping")) then {
    //====================================================================================================//
    // Fast roping: http://ace3mod.com/wiki/feature/fastroping.html                                       //
    //====================================================================================================//

    // Equip a helicopter with FRIES.
    {
        if (!isNil _x) then {
            call compile format ["_object = %1", _x];
            [_object] call ace_fastroping_fnc_equipFRIES;
        };
    } foreach _heliFRIES;
} else {
    _moduleError = true;
    diag_log "(BMT Debug) File not found: ace_fastroping.pbo.";
};

if (bmt_param_debugOutput == 1) then {
    if (_moduleError) then {
        player sideChat format ["DEBUG (fn_ace3_config.sqf): ACE 3 cannot be completely configured since some required files are not loaded."];
    } else {
        player sideChat format ["DEBUG (fn_ace3_config_postInit.sqf): ACE 3 configured."];
    };
};
//============================================ FI DEL FITXER ============================================//
