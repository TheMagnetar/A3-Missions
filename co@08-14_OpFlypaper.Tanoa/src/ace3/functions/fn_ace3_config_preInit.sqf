//=======================================================================================================//
// File: fn_ace3_config_preInit.sqf                                                                      //
// Author: TheMagnetar                                                                                   //
// Version 1.1                                                                                           //
// File creation: 2015/05/28                                                                             //
// Description: DEPRECATED.This document is used for configuring a mission with ACE 3 without requiring  //
//              to place modules in the editor manually.                                                 //
//              http://ace3mod.com/wiki/index.html                                                       //
//              http://ace3mod.com/wiki/missionmaker/modules.html                                        //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

if (!bmt_mod_ace3) exitWith {};
if (!isServer) exitWith {};

private["_moduleError"];

_moduleError = false;

// Define ACE variables manually using ACE_common_fnc_setSetting function:
//  ["setting_name"], Value, forceSetting(bool), broadcastSetting(bool)] ACE_common_fnc_setSetting

if (isClass (configFile >> "CfgPatches" >> "ace_common")) then {
    ["ace_common_forceAllSettings", false, true, true] call ACE_common_fnc_setSetting;                         // 0* = Disabled, 1 = Enabled.

    //====================================================================================================//
    // Check PBOs: http://ace3mod.com/wiki/missionmaker/modules.html#1.4-check-pbos                       //
    //====================================================================================================//

    ["ace_common_checkPBOsAction", 0.0, true, true] call ACE_common_fnc_setSetting;                            // Scalar 0 = Default value.
    ["ace_common_checkPBOsCheckAll", false, true, true] call ACE_common_fnc_setSetting;                        // 0* = Disabled, 1 = Enabled.
    ["ace_common_checkPBOsWhitelist", "[]", true, true] call ACE_common_fnc_setSetting;                        // String.
} else {
    _moduleError = true;
    diag_log "(BMT Debug) File not found: ace_common.pbo.";
};

if (isClass (configFile >> "CfgPatches" >> "ace_cookoff")) then {
    //====================================================================================================//
    // Cookoff: http://ace3mod.com/wiki/framework/cookoff-framework.html                       //
    //====================================================================================================//

    ["ace_cookoff_enable", true, true, true] call ACE_common_fnc_setSetting;                                   // 0 = Disabled, 1* = Enabled.
} else {
    _moduleError = true;
    diag_log "(BMT Debug) File not found: ace_cookoff.pbo.";
};

if (isClass (configFile >> "CfgPatches" >> "ace_finger")) then {
    //====================================================================================================//
    // Finger: http://ace3mod.com/wiki/missionmaker/modules.html#1-7-finger-settings                      //
    //====================================================================================================//

    ["ace_finger_enabled", true, true, true] call ACE_common_fnc_setSetting;                                   // 0 = No, 1* = Yes.
    ["ace_finger_maxRange", 4.0, true, true] call ACE_common_fnc_setSetting;                                   // Scalar. 4 = Default value.
} else {
    _moduleError = true;
    diag_log "(BMT Debug) File not found: ace_finger.pbo.";
};

if (isClass (configFile >> "CfgPatches" >> "ace_frag")) then {
    ["ace_frag_enabled", true, true, true] call ACE_common_fnc_setSetting;                                     // 0 = Disabled, 1* = Enabled.
    ["ace_frag_SpallEnabled", false, true, true] call ACE_common_fnc_setSetting;                               // 0* = Disabled, 1 = Enabled.
    ["ace_frag_ReflectionsEnabled", false, true, true] call ACE_common_fnc_setSetting;                         // 0* = Disabled, 1 = Enabled.
    ["ace_frag_maxTrack", 500.0, true, true] call ACE_common_fnc_setSetting;                                   // Scalar. 500 = Default value.
    ["ace_frag_MaxTrackPerFrame", 50.0, true, true] call ACE_common_fnc_setSetting;                            // Scalar. 50 = Default value.
    ["ace_frag_EnableDebugTrace", false, true, true] call ACE_common_fnc_setSetting;                           // 0 = Disabled, 1* = Enabled.
} else {
    _moduleError = true;
    diag_log "(BMT Debug) File not found: ace_frag.pbo.";
};

if (isClass (configFile >> "CfgPatches" >> "ace_gforces")) then {
    ["ace_gforces_enabledFor", 1, true, true] call ACE_common_fnc_setSetting;                                  // 0 = Disabled, 1* = Only of aircraft, 2 = Enabled.
} else {
    _moduleError = true;
    diag_log "(BMT Debug) File not found: ace_gforces.pbo.";
};

if (isClass (configFile >> "CfgPatches" >> "ace_goggles")) then {
    ["ace_goggles_effects", 2, true, true] call ACE_common_fnc_setSetting;                                     // 0 = Disabled, 1 = Tint only, 2* = Tint and effects.
} else {
    _moduleError = true;
    diag_log "(BMT Debug) File not found: ace_goggles.pbo.";
};

if (isClass (configFile >> "CfgPatches" >> "ace_hitreactions")) then {

    ["ace_hitreactions_minDamageToTrigger", 0.1, true, true] call ACE_common_fnc_setSetting;                   // 0 = Disabled, 1* = Enabled.
} else {
    _moduleError = true;
    diag_log "(BMT Debug) File not found: ace_hitreactions.pbo.";
};

if (isClass (configFile >> "CfgPatches" >> "ace_interaction")) then {
    //====================================================================================================//
    // Interaction System: http://ace3mod.com/wiki/missionmaker/modules.html#1.8-interaction-system       //
    //====================================================================================================//

    ["ace_interaction_EnableTeamManagement", true, true, true] call ACE_common_fnc_setSetting;                 // 0 = Disabled, 1* = Enabled.
} else {
    _moduleError = true;
    diag_log "(BMT Debug) File not found: ace_interaction.pbo.";
};

if (isClass (configFile >> "CfgPatches" >> "ace_laserpointer")) then {

    ["ace_laserpointer_enabled", true, true, true] call ACE_common_fnc_setSetting;                             // Scalar. 0.1 = Default value.
} else {
    _moduleError = true;
    diag_log "(BMT Debug) File not found: ace_laserpointer.pbo.";
};

if (isClass (configFile >> "CfgPatches" >> "ace_magazinerepack")) then {
    ["ace_magazinerepack_TimePerAmmo", 1.5, true, true] call ACE_common_fnc_setSetting;                        // Scalar. 1.5 = Default value.
    ["ace_magazinerepack_TimePerMagazine", 2.0, true, true] call ACE_common_fnc_setSetting;                    // Scalar. 2 = Default value.
    ["ace_magazinerepack_TimePerBeltLink", 8.0, true, true] call ACE_common_fnc_setSetting;                    // Scalar. 8 = Default value.
} else {
    _moduleError = true;
    diag_log "(BMT Debug) File not found: ace_magazinerepack.pbo.";
};

if (isClass (configFile >> "CfgPatches" >> "ace_map")) then {
    //====================================================================================================//
    // BlueForce Tracking: http://ace3mod.com/wiki/missionmaker/modules.html#1.3-blueforcetracking        //
    //====================================================================================================//

    ["ace_map_BFT_Interval", 1.0, true, true] call ACE_common_fnc_setSetting;                                  // Scalar. 1 = Default value.
    ["ace_map_BFT_Enabled", false, true, true] call ACE_common_fnc_setSetting;                                 // 0* = Disabled, 1 = Enabled.
    ["ace_map_BFT_HideAiGroups", false, true, true] call ACE_common_fnc_setSetting;                            // 0* = Disabled, 1 = Enabled.
    ["ace_map_BFT_ShowPlayerNames", false, true, true] call ACE_common_fnc_setSetting;                         // 0* = Disabled, 1 = Enabled.
    //====================================================================================================//
    // Map: http://ace3mod.com/wiki/missionmaker/modules.html#1.10-map                                    //
    //====================================================================================================//

    ["ace_map_mapIllumination", true, true, true] call ACE_common_fnc_setSetting;                              // 0 = Disabled, 1* = Enabled.
    ["ace_map_mapGlow", true, true, true] call ACE_common_fnc_setSetting;                                      // 0 = Disabled, 1* = Enabled.
    ["ace_map_mapShake", true, true, true] call ACE_common_fnc_setSetting;                                     // 0 = Disabled, 1* = Enabled.
    ["ace_map_mapLimitZoom", false, true, true] call ACE_common_fnc_setSetting;                                // 0* = Disabled, 1 = Enabled.
    ["ace_map_mapShowCursorCoordinates", false, true, true] call ACE_common_fnc_setSetting;                    // 0* = Disabled, 1 = Enabled.
    ["ace_map_DefaultChannel", 1.0, true, true] call ACE_common_fnc_setSetting;
} else {
    _moduleError = true;
    diag_log "(BMT Debug) File not found: ace_map.pbo.";
};

if (isClass (configFile >> "CfgPatches" >> "ace_map_gestures")) then {
    ["ace_map_gestures_enabled", true, true, true] call ACE_common_fnc_setSetting;                             // 0 = Disabled, 1* = Enabled.
    ["ace_map_gestures_maxRange", 7.0, true, true] call ACE_common_fnc_setSetting;                             // Scalar. 7 = Default value.
    ["ace_map_gestures_interval", 0.03, true, true] call ACE_common_fnc_setSetting;                            // Scalar. 0.03 = Default value.
    //["ace_map_gestures_GroupColorConfigurations", 0.03, true, true] call ACE_common_fnc_setSetting;
    //["ace_map_gestures_GroupColorConfigurationMapping", 0.03, true, true] call ACE_common_fnc_setSetting;
} else {
    _moduleError = true;
    diag_log "(BMT Debug) File not found: ace_map_gestures.pbo.";
};

if (isClass (configFile >> "CfgPatches" >> "ace_medical")) then {

    private _numRespawns =  getNumber (missionConfigFile >> "bmt_config" >> "bmt_config_numAllowedRespawns");

    //====================================================================================================//
    // ACE3 Medical: http://ace3mod.com/wiki/missionmaker/modules.html#2.-ace3-medical                    //
    //====================================================================================================//
    ["ace_medical_level", bmt_param_ace3_medicalSystem, true, true] call ACE_common_fnc_setSetting;            // 0 = Disabled, 1* = Basic, 2 = Advanced.
    ["ace_medical_medicSetting", bmt_param_ace3_medicalSystem, true, true] call ACE_common_fnc_setSetting;     // 0 = Disabled, 1* = Basic, 2 = Advanced.
    ["ace_medical_increaseTrainingInLocations", false, true, true] call ACE_common_fnc_setSetting;             // 0* = Disabled, 1 = Enabled.
    ["ace_medical_enableFor", 1.0, true, true] call ACE_common_fnc_setSetting;                                 // 0* = Only players, 1 = Players and AI.
    ["ace_medical_enableOverdosing", true, true, true] call ACE_common_fnc_setSetting;                         // 0 = Disabled, 1* = Enabled.
    ["ace_medical_bleedingCoefficient", 1.0, true, true] call ACE_common_fnc_setSetting;                       // Scalar. 1 = Default value.
    ["ace_medical_painCoefficient", 1.0, true, true] call ACE_common_fnc_setSetting;                           // Scalar. 1 = Default value.
    ["ace_medical_enableAirway", false, true, true] call ACE_common_fnc_setSetting;                            // 0* = Disabled, 1 = Enabled.
    ["ace_medical_enableFractures", false, true, true] call ACE_common_fnc_setSetting;                         // 0* = Disabled, 1 = Enabled.
    ["ace_medical_enableAdvancedWounds", true, true, true] call ACE_common_fnc_setSetting;                     // 0* = Disabled, 1 = Enabled.
    ["ace_medical_enableVehicleCrashes", true, true, true] call ACE_common_fnc_setSetting;                     // 0 = Disabled, 1* = Enabled.
    ["ace_medical_enableScreams", true, true, true] call ACE_common_fnc_setSetting;                            // 0 = Disabled, 1* = Enabled.
    ["ace_medical_playerDamageThreshold", 1.0, true, true] call ACE_common_fnc_setSetting;                     // Scalar. 1 = Default value.
    ["ace_medical_AIDamageThreshold", 1.0, true, true] call ACE_common_fnc_setSetting;                         // Scalar. 1 = Default value.
    ["ace_medical_enableUnconsciousnessAI", 1.0, true, true] call ACE_common_fnc_setSetting;                   // 0 = Disabled, 1* = 50/50, 2 = Enabled.
    ["ace_medical_remoteControlledAI", true, true, true] call ACE_common_fnc_setSetting;                       // 0 = Disabled, 1* = Enabled.
    ["ace_medical_preventInstaDeath", false, true, true] call ACE_common_fnc_setSetting;                       // 0* = Disabled, 1 = Enabled.

    // Revive sistem
    ["ace_medical_enableRevive", bmt_param_ace3_reviveSystem, true, true] call ACE_common_fnc_setSetting;                              // 0* = Disabled, 1 = Only players, 2 = Players and AI.
    ["ace_medical_maxReviveTime", 120.0, true, true] call ACE_common_fnc_setSetting;                           // Scalar. 120 = Default value.
    if ( (_numRespawns > 0) && (bmt_param_ace3_reviveSystem > 0) ) then {
        ["ace_medical_amountOfReviveLives", _numRespawns, true, true] call ACE_common_fnc_setSetting;          // Scalar. -1 = Default value.
    } else {
        ["ace_medical_amountOfReviveLives", -1.0, true, true] call ACE_common_fnc_setSetting;                  // Scalar. -1 = Default value.
    };

    ["ace_medical_allowDeadBodyMovement", false, true, true] call ACE_common_fnc_setSetting;                   // 0* = Disabled, 1 = Enabled.
    ["ace_medical_allowLitterCreation", true, true, true] call ACE_common_fnc_setSetting;                      // 0 = Disabled, 1* = Enabled.
    ["ace_medical_litterSimulationDetail", 3.0, true, true] call ACE_common_fnc_setSetting;               // Client side. 0 = Disabled (0), 1 = Baix(50), 2 = Mitjà (100), 3* = Alt (1000), 4 = Ultra (5000).
    ["ace_medical_litterCleanUpDelay", 1800.0, true, true] call ACE_common_fnc_setSetting;                     // Scalar. 1800 = Default value.
    ["ace_medical_medicSetting_basicEpi", 1.0, true, true] call ACE_common_fnc_setSetting;                    // 0 = Disabled, 1* = Enabled.
    ["ace_medical_medicSetting_PAK", 1.0, true, true] call ACE_common_fnc_setSetting;                          // 0 = Anybody, 1* = Only medics, 2 = Only doctors.
    ["ace_medical_medicSetting_SurgicalKit", 1.0, true, true] call ACE_common_fnc_setSetting;                  // 0 = Anybody, 1* = Only medics, 2 = Only doctors.
    ["ace_medical_consumeItem_PAK", 1.0, true, true] call ACE_common_fnc_setSetting;                           // 0* = No, 1 = Yes.
    ["ace_medical_consumeItem_SurgicalKit", 1.0, true, true] call ACE_common_fnc_setSetting;                   // 0* = No, 1 = Yes.
    ["ace_medical_useLocation_basicEpi", 0.0, true, true] call ACE_common_fnc_setSetting;                     // 0* = Anywhere, 1 = Medical vehicles, 2 = Medical facilities, 3 = Vehicles and medical facilities, 4 = Disabled.
    ["ace_medical_useLocation_PAK", 3.0, true, true] call ACE_common_fnc_setSetting;                           // 0 = Anywhere, 1 = Medical vehicles, 2 = Medical facilities, 3* = Vehicles and medical facilities, 4 = Disabled.
    ["ace_medical_useLocation_SurgicalKit", 2.0, true, true] call ACE_common_fnc_setSetting;                   // 0 = Anywhere, 1 = Medical vehicles, 2* = Medical facilities, 3 = Vehicles and medical facilities, 4 = Disabled.
    ["ace_medical_useCondition_PAK", 1.0, true, true] call ACE_common_fnc_setSetting;                          // 0* = Anytime, 1 = Stable.
    ["ace_medical_useCondition_SurgicalKit", 0.0, true, true] call ACE_common_fnc_setSetting;                  // 0* = Anytime, 1 = Stable.
    ["ace_medical_keepLocalSettingsSynced", true, true, true] call ACE_common_fnc_setSetting;                  // 0 = Disabled, 1* = Enabled.
    ["ace_medical_healHitPointAfterAdvBandage", false, true, true] call ACE_common_fnc_setSetting;             // 0* = Disabled, 1 = Enabled.
    ["ace_medical_painIsOnlySuppressed", true, true, true] call ACE_common_fnc_setSetting;                     // 0 = No, 1* = Yes.
    // ["ace_medical_painEffectType", 0.0, true, true] call ACE_common_fnc_setSetting;                         // Client side. 0 = Pain effect flash, 1 = Pain effect chroma.
    ["ace_medical_allowUnconsciousAnimationOnTreatment", false, true, true] call ACE_common_fnc_setSetting;    // 0* = No, 1 = Yes.
    ["ace_medical_moveUnitsFromGroupOnUnconscious", false, true, true] call ACE_common_fnc_setSetting;         // 0* = No, 1 = Yes.
    //["ace_medical_menuTypeStyle", 0.0, true, true] call ACE_common_fnc_setSetting;                           // 0* = Selection, 1 = Radial.
    ["ace_medical_delayUnconCaptive", 3.0, true, true] call ACE_common_fnc_setSetting;                         // Scalar. 3 = Default value.

} else {
    _moduleError = true;
    diag_log "(BMT Debug) File not found: ace_medical.pbo.";
};

if (isClass (configFile >> "CfgPatches" >> "ace_medical_ai")) then {
    ["ace_medical_ai_enabledFor", 2.0, true, true] call ACE_common_fnc_setSetting;                                  // 0 = Enabled, 1 = Server and HC, 2 = Enabled.
} else {
    _moduleError = true;
    diag_log "(BMT Debug) File not found: ace_medical_ai.pbo.";
};

if (isClass (configFile >> "CfgPatches" >> "ace_medical_menu")) then {
    ["ace_medical_menu_allow", 2.0, true, true] call ACE_common_fnc_setSetting;                                  // 0 = Disabled, 1* = Enabled, 2 = Only vehicles.
    ["ace_medical_menu_maxRange", 3.0, true, true] call ACE_common_fnc_setSetting;                               // Scalar. 3 = Default value.
} else {
    _moduleError = true;
    diag_log "(BMT Debug) File not found: ace_medical_menu.pbo.";
};

if (isClass (configFile >> "CfgPatches" >> "ace_microdagr")) then {
    //====================================================================================================//
    // MicroDAGR Map Fill: http://ace3mod.com/wiki/missionmaker/modules.html#1.11-microdagr-map-fill      //
    //                     - 2: Full Satellite + Buildings                                                //
    //====================================================================================================//

    ["ace_microdagr_MapDataAvailable", 2.0, true, true] call ACE_common_fnc_setSetting;                          // 0 = Without map, 1 = Topographic, 2* = Without limitations.
} else {
    _moduleError = true;
    diag_log "(BMT Debug) File not found: ace_microdagr.pbo.";
};

if (isClass (configFile >> "CfgPatches" >> "ace_mk6mortar")) then {
    //====================================================================================================//
    // MK6 Settings: http://ace3mod.com/wiki/missionmaker/modules.html#1.12-mk6-settings                  //
    //====================================================================================================//

    ["ace_mk6mortar_airResistanceEnabled", true, true, true] call ACE_common_fnc_setSetting;                   // 0* = Disabled, 1 = Enabled.
    ["ace_mk6mortar_allowComputerRangefinder", false, true, true] call ACE_common_fnc_setSetting;              // 0 = Disabled, 1* = Enabled.
    ["ace_mk6mortar_allowCompass", true, true, true] call ACE_common_fnc_setSetting;                           // 0 = Disabled, 1* = Enabled.
    ["ace_mk6mortar_useAmmoHandling", true, true, true] call ACE_common_fnc_setSetting;                           // 0* = Disabled, 1 = Enabled.
} else {
    _moduleError = true;
    diag_log "(BMT Debug) File not found: ace_mk6mortar.pbo.";
};

if (isClass (configFile >> "CfgPatches" >> "ace_nametags")) then {
    //====================================================================================================//
    // Name Tags: http://ace3mod.com/wiki/missionmaker/modules.html#1.13-name-tags                        //
    //====================================================================================================//

    // ["ace_nametags_defaultNametagColor", [0.77, 0.51.0, 0.08, 1], true, true] call ACE_common_fnc_setSetting; // Client side.
    // ["ace_nametags_showPlayerNames", true, true, true] call ACE_common_fnc_setSetting;                      // Client side.
    // ["ace_nametags_showPlayerRanks", true, true, true] call ACE_common_fnc_setSetting;                      // Client side.
    // ["ace_nametags_showVehicleCrewInfo", true, true, true] call ACE_common_fnc_setSetting;                  // Client side.
    // ["ace_nametags_showNamesForAI", false, true, true] call ACE_common_fnc_setSetting;                      // Client side.
    ["ace_nametags_showCursorTagForVehicles", false, true, true] call ACE_common_fnc_setSetting;               // 0* = No, 1 = Yes.
    // ["ace_nametags_showSoundWaves", true, true, true] call ACE_common_fnc_setSetting;                       // Client side.
    ["ace_nametags_PlayerNamesViewDistance", 5.0, true, true] call ACE_common_fnc_setSetting;                  // Scalar. 5 = Default value.
    ["ace_nametags_PlayerNamesMaxAlpha", 0.8, true, true] call ACE_common_fnc_setSetting;                      // Scalar. 0.8 = Default value.
    // ["ace_nametags_tagSize", 2.0, true, true] call ACE_common_fnc_setSetting;                               // Client side.
} else {
    _moduleError = true;
    diag_log "(BMT Debug) File not found: ace_nametags.pbo.";
};

if (isClass (configFile >> "CfgPatches" >> "ace_nightvision")) then {
    ["ace_nightvision_disableNVGsWithSights", false, true, true] call ACE_common_fnc_setSetting;                 // 0 = Disabled, 1* = Enabled.
} else {
    _moduleError = true;
    diag_log "(BMT Debug) File not found: ace_nightvision.pbo.";
};

if (isClass (configFile >> "CfgPatches" >> "ace_overheating")) then {
    ["ace_overheating_overheatingDispersion", true, true, true] call ACE_common_fnc_setSetting;                 // 0 = Disabled, 1* = Enabled.
    ["ace_overheating_unJamOnreload", false, true, true] call ACE_common_fnc_setSetting;                        // 0* = Disabled, 1 = Enabled.
    ["ace_overheating_unJamFailChance", 0.1, true, true] call ACE_common_fnc_setSetting;                        // Scalar. 0.1 = Default value.
    ["ace_overheating_enabled", true, true, true] call ACE_common_fnc_setSetting;                 // 0 = Disabled, 1* = Enabled.
} else {
    _moduleError = true;
    diag_log "(BMT Debug) File not found: ace_overtheating.pbo.";
};

if (isClass (configFile >> "CfgPatches" >> "ace_rearm")) then {
    ["ace_rearm_level", 2.0, true, true] call ACE_common_fnc_setSetting;                                       // Scalar. 0* = Depending on the vehicle, 1 = Depending on munition, 2 = Depending on caliber.
} else {
    _moduleError = true;
    diag_log "(BMT Debug) File not found: ace_rearm.pbo.";
};

if (isClass (configFile >> "CfgPatches" >> "ace_refuel")) then {
    ["ace_refuel_rate", 10.0, true, true] call ACE_common_fnc_setSetting;                                       // Scalar. 10.0 = Default value.
} else {
    _moduleError = true;
    diag_log "(BMT Debug) File not found: ace_refuel.pbo.";
};

if (isClass (configFile >> "CfgPatches" >> "ace_repair")) then {
    ["ace_repair_engineerSetting_Repair", 1.0, true, true] call ACE_common_fnc_setSetting;                     // 0 = Anybody, 1* = Only engineers, 2 = Only repair specialists.
    ["ace_repair_engineerSetting_Wheel", 0.0, true, true] call ACE_common_fnc_setSetting;                      // 0* = Anybody, 1 = Only engineers, 2 = Only repair specialists.
    ["ace_repair_repairDamageThreshold", 0.6, true, true] call ACE_common_fnc_setSetting;                      // Scalar. 0.6 = Default value.
    ["ace_repair_repairDamageThreshold_Engineer", 0.4, true, true] call ACE_common_fnc_setSetting;             // Scalar. 0.4 = Default value.
    ["ace_repair_consumeItem_ToolKit", 0.0, true, true] call ACE_common_fnc_setSetting;                        // 0* = No, 1 = Yes.
    ["ace_repair_fullRepairLocation", 2.0, true, true] call ACE_common_fnc_setSetting;                         // 0 = Anybody lloc, 1 = Repair vehicle, 2* = Repair facility, 3 = Repair vehicle and repair facility, 4 = Disabled.
    ["ace_repair_engineerSetting_fullRepair", 2.0, true, true] call ACE_common_fnc_setSetting;                 // 0 = Anybody, 1 = Only engineers, 2 =  Repair facility, 3 = Repair vehicle and repair facilit, 4 = Disabled.
    ["ace_repair_addSpareParts", true, true, true] call ACE_common_fnc_setSetting;                             // 0 = No, 1* = Yes.
    ["ace_repair_wheelRepairRequiredItems", 1.0, true, true] call ACE_common_fnc_setSetting;                   // 0* = No tools required, 1 = Tools required.
    ["ace_repair_autoShutOffEngineWhenStartingRepair", false, true, true] call ACE_common_fnc_setSetting;      // 0* = Disable, 1* = Enable.

} else {
    _moduleError = true;
    diag_log "(BMT Debug) File not found: ace_repair.pbo.";
};

if (isClass (configFile >> "CfgPatches" >> "ace_respawn")) then {
    //====================================================================================================//
    // Respawn System: http://ace3mod.com/wiki/missionmaker/modules.html#1.15-respawn-system              //
    //====================================================================================================//

    ["ace_respawn_SavePreDeathGear", false, true, true] call ACE_common_fnc_setSetting;                        // 0* = No, 1 = Yes.
    ["ace_respawn_RemoveDeadBodiesDisconnected", false, true, true] call ACE_common_fnc_setSetting;            // 0 = No, 1* = Yes.
    ["ace_respawn_BodyRemoveTimer", 0.0, true, true] call ACE_common_fnc_setSetting;                           // Scalar. 0 = Default value.

    //====================================================================================================//
    // Friendly Fire Messages:                                                                            //
    //          http://ace3mod.com/wiki/missionmaker/modules.html#1.6-friendly-fire-messages              //
    //====================================================================================================//

    //["ace_respawn_showFriendlyFireMessage", false, true, true] call ACE_common_fnc_setSetting;
} else {
    _moduleError = true;
    diag_log "(BMT Debug) File not found: ace_respawn.pbo.";
};

if (isClass (configFile >> "CfgPatches" >> "ace_spectator")) then {
    ["ace_spectator_filterUnits", 1.0, true, true] call ACE_common_fnc_setSetting;                             // 0 = None, 1 = Players, 2* = Playable units, 3 = All units.
    ["ace_spectator_filterSides", 0.0, true, true] call ACE_common_fnc_setSetting;                             // 0* = Player side, 1 = Friendly side, 2 = Enemy side, 3 = All sides.
    ["ace_spectator_restrictModes", 0.0, true, true] call ACE_common_fnc_setSetting;                           // 0* = All, 1 = Unit modes, 2 = Free, 3 = Internal modes, 4 = External modes.
    ["ace_spectator_restrictVisions", 0.0, true, true] call ACE_common_fnc_setSetting;                         // 0* = All, 1 = Night vision, 2 = Thermal vision.

} else {
    _moduleError = true;
    diag_log "(BMT Debug) File not found: ace_spectator.pbo.";
};

if (isClass (configFile >> "CfgPatches" >> "ace_switchunits")) then {
    //====================================================================================================//
    // SwitchUnits System: http://ace3mod.com/wiki/missionmaker/modules.html#1.16-switchunits-system      //
    //====================================================================================================//

    ["ace_switchunits_EnableSwitchUnits", false, true, true] call ACE_common_fnc_setSetting;                   // 0* = No, 1 = Yes.
    ["ace_switchunits_SwitchToWest", false, true, true] call ACE_common_fnc_setSetting;                        // 0* = No, 1 = Yes.
    ["ace_switchunits_SwitchToEast", false, true, true] call ACE_common_fnc_setSetting;                        // 0* = No, 1 = Yes.
    ["ace_switchunits_SwitchToIndependent", false, true, true] call ACE_common_fnc_setSetting;                 // 0* = No, 1 = Yes.
    ["ace_switchunits_SwitchToCivilian", false, true, true] call ACE_common_fnc_setSetting;                    // 0* = No, 1 = Yes.
    ["ace_switchunits_EnableSafeZone", true, true, true] call ACE_common_fnc_setSetting;                       // 0 = No, 1* = Yes.
    ["ace_switchunits_SafeZoneRadius", 100.0, true, true] call ACE_common_fnc_setSetting;                      // Scalar. 100 = Default value.
} else {
    _moduleError = true;
    diag_log "(BMT Debug) File not found: ace_switchunits.pbo.";
};

if (isClass (configFile >> "CfgPatches" >> "ace_ui")) then {
    ["ace_ui_allowSelectiveUI", true, true, true] call ACE_common_fnc_setSetting;                             // 0 = None, 1 = Players, 2* = Playable units, 3 = All units.
} else {
    _moduleError = true;
    diag_log "(BMT Debug) File not found: ace_ui.pbo.";
};

if (isClass (configFile >> "CfgPatches" >> "ace_vehiclelock")) then {
    //====================================================================================================//
    // Vehicle Lock: http://ace3mod.com/wiki/missionmaker/modules.html#1.17-vehicle-lock                  //
    //====================================================================================================//

    ["ace_vehiclelock_DefaultLockpickStrength", 10.0, true, true] call ACE_common_fnc_setSetting;              // Scalar. 10 = Default value.
    ["ace_vehiclelock_LockVehicleInventory", true, true, true] call ACE_common_fnc_setSetting;                 // 0* = No, 1 = Yes.
    ["ace_vehiclelock_VehicleStartingLockState", 0.0, true, true] call ACE_common_fnc_setSetting;              // Scalar. 0 = Default value.
} else {
    _moduleError = true;
    diag_log "(BMT Debug) File not found: ace_vehiclelock.pbo.";
};

if (isClass (configFile >> "CfgPatches" >> "ace_viewdistance")) then {
    //====================================================================================================//
    // View Distance Limiter: http://ace3mod.com/wiki/missionmaker/modules.html#1.18-view-distance-limiter//
    //====================================================================================================//

    ["ace_viewdistance_enabled", true, true, true] call ACE_common_fnc_setSetting;                             // 0 = No, 1* = Yes.
    ["ace_viewdistance_limitViewDistance", 10000.0, true, true] call ACE_common_fnc_setSetting;                // Scalar. 10000 = Default value.
} else {
    _moduleError = true;
    diag_log "(BMT Debug) File not found: ace_viewdistance.pbo.";
};

if (isClass (configFile >> "CfgPatches" >> "ace_weather")) then {
    //====================================================================================================//
    // Weather: http://ace3mod.com/wiki/missionmaker/modules.html#1.19-weather                            //
    //====================================================================================================//

    ["ace_weather_enableServerController", true, true, true] call ACE_common_fnc_setSetting;                   // 0 = No, 1* = Yes.
    ["ace_weather_useACEWeather", true, true, true] call ACE_common_fnc_setSetting;                            // 0 = No, 1* = Yes.
    ["ace_weather_syncRain", true, true, true] call ACE_common_fnc_setSetting;                                 // 0 = No, 1* = Yes.
    ["ace_weather_syncWind", true, true, true] call ACE_common_fnc_setSetting;                                 // 0 = No, 1* = Yes.
    ["ace_weather_syncMisc", true, true, true] call ACE_common_fnc_setSetting;                                 // 0 = No, 1* = Yes.
    ["ace_weather_serverUpdateInterval", 60.0, true, true] call ACE_common_fnc_setSetting;                     // Scalar. 60 = Default value.
} else {
    _moduleError = true;
    diag_log "(BMT Debug) File not found: ace_weather.pbo.";
};

if (isClass (configFile >> "CfgPatches" >> "ace_winddeflection")) then {
    //====================================================================================================//
    // Wind Deflection: http://ace3mod.com/wiki/missionmaker/modules.html#1.20-wind-deflection            //
    //====================================================================================================//

    ["ace_winddeflection_enabled", true, true, true] call ACE_common_fnc_setSetting;                           // 0 = No, 1* = Yes.
    ["ace_winddeflection_vehicleEnabled", true, true, true] call ACE_common_fnc_setSetting;                    // 0 = No, 1* = Yes.
    ["ace_winddeflection_simulationInterval", 0.05, true, true] call ACE_common_fnc_setSetting;                // Scalar. 0.05 = Default value.
    ["ace_winddeflection_simulationRadius", 3000.0, true, true] call ACE_common_fnc_setSetting;                // Scalar. 3000 = Default value.
} else {
    _moduleError = true;
    diag_log "(BMT Debug) File not found: ace_winddeflection.pbo.";
};

if (isClass (configFile >> "CfgPatches" >> "ace_zeus")) then {

    ["ace_zeus_zeusAscension", false, true, true] call ACE_common_fnc_setSetting;                              // 0* = No, 1 = Yes.
    ["ace_zeus_zeusBird", false, true, true] call ACE_common_fnc_setSetting;                                   // 0* = No, 1 = Yes.
    ["ace_zeus_remoteWind", false, true, true] call ACE_common_fnc_setSetting;                                 // 0* = No, 1 = Yes.
    ["ace_zeus_radioOrdnance", false, true, true] call ACE_common_fnc_setSetting;                              // 0* = No, 1 = Yes.
    ["ace_zeus_revealMines", 0.0, true, true] call ACE_common_fnc_setSetting;                                  // 0* = No, 1 = Yes.
    ["ace_zeus_autoAddObjects", false, true, true] call ACE_common_fnc_setSetting;                             // 0* = No, 1 = Yes.
} else {
    _moduleError = true;
    diag_log "(BMT Debug) File not found: ace_zeus.pbo.";
};

if (isClass (configFile >> "CfgPatches" >> "acex_sitting")) then {
    ["acex_sitting_enable", true, true, true] call ACE_common_fnc_setSetting;                                   // 0 = Disabled, 1* = Enabled.
} else {
    _moduleError = true;
    diag_log "(BMT Debug) File not found: acex_sitting.pbo.";
};

if (isClass (configFile >> "CfgPatches" >> "acex_viewrestriction")) then {
    ["acex_viewrestriction_mode", 0, true, true] call ACE_common_fnc_setSetting;                               // Scalar. 0.0 = Default value.
    ["acex_viewrestriction_modeSelectiveFoot", 0, true, true] call ACE_common_fnc_setSetting;                  // Scalar. 0.0 = Default value.
    ["acex_viewrestriction_modeSelectiveLand", 0, true, true] call ACE_common_fnc_setSetting;                  // Scalar. 0.0 = Default value.
    ["acex_viewrestriction_modeSelectiveAir", 0, true, true] call ACE_common_fnc_setSetting;                   // Scalar. 0.0 = Default value.
    ["acex_viewrestriction_modeSelectiveSea", 0, true, true] call ACE_common_fnc_setSetting;                   // Scalar. 0.0 = Default value.

} else {
    _moduleError = true;
    diag_log "(BMT Debug) File not found: acex_viewrestriction.pbo.";
};

if (isClass (configFile >> "CfgPatches" >> "ace_advanced_fatigue")) then {
    ["ace_advanced_fatigue_enabled", true, true, true] call ACE_common_fnc_setSetting;                         // 0 = Disabled, 1* = Enabled.
    ["ace_advanced_fatigue_performanceFactor", 1.0, true, true] call ACE_common_fnc_setSetting;                  // Scalar. 1.0 = Default value.
    ["ace_advanced_fatigue_recoveryFactor", 1.0, true, true] call ACE_common_fnc_setSetting;                     // Scalar. 1.0 = Default value.
    ["ace_advanced_fatigue_loadFactor", 1.0, true, true] call ACE_common_fnc_setSetting;                         // Scalar. 1.0 = Default value.
    ["ace_advanced_fatigue_terrainGradientFactor", 1.0, true, true] call ACE_common_fnc_setSetting;              // Scalar. 1.0 = Default value.
} else {
    _moduleError = true;
    diag_log "(BMT Debug) File not found: ace_advanced_fatigue.pbo.";
};

if (isClass (configFile >> "CfgPatches" >> "ace_advanced_throwing")) then {
    ["ace_advanced_throwing_enablePickUp", true, true, true] call ACE_common_fnc_setSetting;                   // 0 = Disabled, 1* = Enabled.
    ["ace_advanced_throwing_enablePickUpAttached", true, true, true] call ACE_common_fnc_setSetting;           // 0 = Disabled, 1* = Enabled.
} else {
    _moduleError = true;
    diag_log "(BMT Debug) File not found: ace_advanced_throwing.pbo.";
};

if (isClass (configFile >> "CfgPatches" >> "ace_captives")) then {
    //====================================================================================================//
    // Make Unit Surrender: http://ace3mod.com/wiki/missionmaker/modules.html#1.9-make-unit-surrender     //
    //====================================================================================================//

    ["ace_captives_allowHandcuffOwnSide", true, true, true] call ACE_common_fnc_setSetting;                    // 0 = No, 1* = Yes.
    ["ace_captives_requireSurrender", 1.0, true, true] call ACE_common_fnc_setSetting;                         // 0 = Disabled, 1* = Only syrrender, 2 = Surrender without weapon.
    ["ace_captives_allowSurrender", true, true, true] call ACE_common_fnc_setSetting;                          // 0 = No, 1* = Yes.

} else {
    _moduleError = true;
    diag_log "(BMT Debug) File not found: ace_captives.pbo.";
};

if (isClass (configFile >> "CfgPatches" >> "ace_cargo")) then {
    ["ace_cargo_enable", true, true, true] call ACE_common_fnc_setSetting;                                     // 0 = No, 1* = Yes.
} else {
    _moduleError = true;
    diag_log "(BMT Debug) File not found: ace_cargo.pbo.";
};

if (isClass (configFile >> "CfgPatches" >> "ace_explosives")) then {
    //====================================================================================================//
    // Explosive System: http://ace3mod.com/wiki/missionmaker/modules.html#1.5-explosive-system           //
    //====================================================================================================//

    ["ace_explosives_RequireSpecialist", true, true, true] call ACE_common_fnc_setSetting;                     // 0* = No, 1 = Yes.
    ["ace_explosives_PunishNonSpecialists", true, true, true] call ACE_common_fnc_setSetting;                  // 0 = No, 1* = Yes.
    ["ace_explosives_ExplodeOnDefuse", true, true, true] call ACE_common_fnc_setSetting;                       // 0 = No, 1* = Yes.

} else {
    _moduleError = true;
    diag_log "(BMT Debug) File not found: ace_explosives.pbo.";
};

if (isClass (configFile >> "CfgPatches" >> "ace_hearing")) then {
    //====================================================================================================//
    // Hearing: http://ace3mod.com/wiki/missionmaker/modules.html#1.7-hearing                             //
    //====================================================================================================//

    ["ace_hearing_EnableCombatDeafness", true, true, true] call ACE_common_fnc_setSetting;                     // 0* = Disabled, 1 = Enabled.
    ["ace_hearing_EarplugsVolume", 0.5, true, true] call ACE_common_fnc_setSetting;                            // Scalar. 0.5 = Default value.
    ["ace_hearing_UnconsciousnessVolume", 0.4, true, true] call ACE_common_fnc_setSetting;                     // Scalar. 0.4 = Default value.
    ["ace_hearing_enabledForZeusUnits", true, true, true] call ACE_common_fnc_setSetting;                      // 0 = Disabled, 1* = Enabled.
    ["ace_hearing_autoAddEarplugsToUnits", false, true, true] call ACE_common_fnc_setSetting;                  // 0* = Disabled, 1 = Enabled.
} else {
    _moduleError = true;
    diag_log "(BMT Debug) File not found: ace_hearing.pbo.";
};

if (isClass (configFile >> "CfgPatches" >> "acex_headless")) then {
    //====================================================================================================//
    // Explosive System: http://ace3mod.com/wiki/missionmaker/modules.html#1.5-explosive-system           //
    //====================================================================================================//

    ["acex_headless_Enabled", true, true, true] call ACE_common_fnc_setSetting;                               // 0* = No, 1 = Yes.
    ["acex_headless_Delay", 15.0, true, true] call ACE_common_fnc_setSetting;                                 // Scalar = 15.0 = Default.
    ["acex_headless_Log", false, true, true] call ACE_common_fnc_setSetting;                                  // 0* = No, 1 = Yes.

} else {
    _moduleError = true;
    diag_log "(BMT Debug) File not found: acex_headless.pbo.";
};

if (isClass (configFile >> "CfgPatches" >> "ace_advanced_ballistics")) then {

    //====================================================================================================//
    // Advanced ballistics: http://ace3mod.com/wiki/missionmaker/modules.html#1.1-advanced-ballistics     //
    //====================================================================================================//
    ["ace_advanced_ballistics_enabled", bmt_param_ace3_ballistics, true, true] call ACE_common_fnc_setSetting;  // 0* = No, 1 = Yes.
    ["ace_advanced_ballistics_simulateForSnipers", true, true, true] call ACE_common_fnc_setSetting;           // 0 = No, 1* = Yes.
    ["ace_advanced_ballistics_simulateForGroupMembers", true, true, true] call ACE_common_fnc_setSetting;      // 0* = No, 1 = Yes.
    ["ace_advanced_ballistics_simulateForEveryone", false, true, true] call ACE_common_fnc_setSetting;         // 0* = No, 1 = Yes.
    ["ace_advanced_ballistics_disabledInFullAutoMode", false, true, true] call ACE_common_fnc_setSetting;      // 0* = No, 1 = Yes.
    ["ace_advanced_ballistics_ammoTemperatureEnabled", true, true, true] call ACE_common_fnc_setSetting;       // 0 = No, 1* = Yes.
    ["ace_advanced_ballistics_barrelLengthInfluenceEnabled", true, true, true] call ACE_common_fnc_setSetting; // 0 = No, 1* = Yes.
    ["ace_advanced_ballistics_bulletTraceEnabled", true, true, true] call ACE_common_fnc_setSetting;           // 0 = No, 1* = Yes.
    ["ace_advanced_ballistics_simulationInterval", 0.0, true, true] call ACE_common_fnc_setSetting;            // Scalar. 0.0 = Default value.
    ["ace_advanced_ballistics_simulationRadius", 3000.0, true, true] call ACE_common_fnc_setSetting;           // Scalar. 3000 = Default value.
} else {
    _moduleError = true;
    diag_log "(BMT Debug) File not found: ace_advanced_ballistics.pbo.";
};

if (bmt_param_debugOutput == 1) then {

    if (_moduleError) then {
        player sideChat format ["DEBUG (fn_ace3_config.sqf): ACE 3 cannot be completely configured since some required files are not loaded."];
    } else {
        player sideChat format ["DEBUG (fn_ace3_config.sqf): ACE 3 configured."];
    };
};

//============================================= END OF FILE =============================================//
