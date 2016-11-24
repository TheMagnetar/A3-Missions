//=======================================================================================================//
// File: fn_configEquipment_rhs_usaf.sqf                                                                 //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/04/02                                                                             //
// Description: This function equips the unit according to a specified role and depending on the faction //
//              it belongs to.                                                                           //
//                                                                                                       //
//              Arguments:                                                                               //
//               - 0: unit role <STRING> or unit role with additional options <ARRAY>.                   //
//               - 1: unit <OBJECT>.                                                                     //
//               - 2: unit faction <STRING><OPTIONAL>.                                                   //
//                                                                                                       //
//              Examples:                                                                                //
//               - Unit is a Fire Team Leader.                                                           //
//                   ["tl", this] call bmt_fnc_configEquipment;                                          //
//                                                                                                       //
//              Unit role can be one of the following entries:                                           //
//                                                                                                       //
//                  Unit Role               Assigned role                                                //
//                  pl                      Platoon Leader                                               //
//                  psg                     Platoon Sergeant                                             //
//                  rto                     Platoon Radiotelephone Operator                              //
//                  fo                      Forward Observer                                             //
//                  jtac                    Joint Terminal Attack Controller                             //
//                  me                      Platoon Medic                                                //
//                  sl                      Squad Leader                                                 //
//                  tl                      Team Leader                                                  //
//                  rfl                     Rifleman                                                     //
//                  rflat                   Rifleman with AT4                                            //
//                  rfluav                  Rifleman with UAV (Raven)                                    //
//                  gr                      Grenadier                                                    //
//                  ar                      Automatic Rifleman                                           //
//                  aar                     Assitant Automatic Rifleman                                  //
//                  dm                      Designated Marksman                                          //
//                  mg                      Machine Gunner                                               //
//                  amg                     Assitant Machine Gunner                                      //
//                  at                      Anti-Tank                                                    //
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
//                  ccrw                    Combat Crew                                                  //
//                                                                                                       //
//                  hmmwv                   Equipment for HMMWVs                                         //
//                  abrams                  Equipment for M1A1/M1A2 Abrams                               //
//                                                                                                       //
// Changes: 1.0  (2015/11/26) First public version.                                                      //
//=======================================================================================================//

//=======================================================================================================//
// Variable declarations.                                                                                //
//=======================================================================================================//
private["_isInfantry", "_unitRole"];
private["_uniform", "_vestSL", "_vestTL", "_vestRFL", "_vestGR", "_vestDM", "_vestME", "_vestAR", "_vestMG", "_vestCRW", "_helmet", "_helmetSN", "_helmetCRW", "_backpack", "_uavBackpack", "_unitInsignia"];
private["_uavBattery", "_cableTie", "_mapTools", "_microDAGR", "_earPlugs", "_vectorIV", "_atragmx", "_kestrel", "_clacker", "_clackerm26", "_defusalKit", "_cellphone"];
private["_atropine", "_epinephrine", "_morphine", "_bandage", "_elasticBandage", "_quickClot", "_packingBandage"];
private["_bloodBag250", "_bloodBag500", "_bloodBag1000", "_plasmaBag250", "_plasmaBag500", "_plasmaBag1000", "_salineBag250", "_salineBag500", "_salineBag1000"];
private["_personalAidKid", "_surgicalKit", "_tourniquet"];
private["_flashlight"];

//=======================================================================================================//
// Get unit role and if it is an infantry unit.                                                          //
//=======================================================================================================//

params ["_unitOptions", "_unit", "_unitFaction"];

if ((typeName _unitOptions) == "STRING") then {
    _unitRole = _unitOptions;
} else {
    _unitRole = _unitOptions select 0; // First entry must always be the unit role
};

_unitRole = toLower _unitRole;

if ( isNil "_unitFaction") then {
    _unitFaction = toLower (faction _unit);
} else {
    _unitFaction = toLower _unitFaction;
};

_isInfantry = _unit isKindOf "CAManBase";

//=======================================================================================================//
// Summary of equipment: Weapons, accessories, glasses, vests, ...                                       //
//=======================================================================================================//

// Especific equipment of RHS.
if (_unitFaction == "rhs_faction_usarmy_d") then {
    // Uniforms.
    _uniform = "rhs_uniform_cu_ocp";

    // Vests.
    _vestSL = "rhsusf_iotv_ocp_squadleader";
    _vestTL = "rhsusf_iotv_ocp_teamleader";
    _vestRFL = "rhsusf_iotv_ocp_rifleman";
    _vestGR = "rhsusf_iotv_ocp_grenadier";
    _vestDM = "rhsusf_iotv_ocp_rifleman";
    _vestME = "rhsusf_iotv_ocp_medic";
    _vestAR = "rhsusf_iotv_ocp_SAW";
    _vestMG = "rhsusf_iotv_ocp_SAW";
    _vestCRW = "rhsusf_iotv_ocp";

    // Helmets.
    _helmet = "rhsusf_ach_helmet_headset_ocp";
    _helmetSN = "rhs_Booniehat_ocp";
    _helmetCRW = "rhsusf_cvc_helmet";

    // Backpacks.
    _backpack = "rhsusf_assault_eagleaiii_ocp";

    // Insignia
    _unitInsignia = "";
};

if (_unitFaction == "rhs_faction_usarmy_wd") then {
    // Uniforms.
    _uniform = "rhs_uniform_cu_ucp";

    // Vests.
    _vestSL = "rhsusf_iotv_ucp_squadleader";
    _vestTL = "rhsusf_iotv_ucp_teamleader";
    _vestRFL = "rhsusf_iotv_ucp_rifleman";
    _vestGR = "rhsusf_iotv_ucp_grenadier";
    _vestDM = "rhsusf_iotv_ucp_rifleman";
    _vestME = "rhsusf_iotv_ucp_medic";
    _vestAR = "rhsusf_iotv_ucp_SAW";
    _vestMG = "rhsusf_iotv_ucp_SAW";
    _vestCRW = "rhsusf_iotv_ucp";

    // Helmets.
    _helmet = "rhsusf_ach_helmet_headset_ucp";
    _helmetSN = "rhs_Booniehat_ucp";
    _helmetCRW = "rhsusf_cvc_green_helmet";

    // Backpacks.
    _backpack = "rhsusf_assault_eagleaiii_ucp";

    // Insignia
    _unitInsignia = "";
};

if (_unitFaction == "rhs_faction_usmc_d") then {
    // Uniforms.
    _uniform = "rhs_uniform_FROG01_d";

    // Vests.
    _vestSL = "rhsusf_spc_squadleader";
    _vestTL = "rhsusf_spc_teamleader";
    _vestRFL = "rhsusf_spc_rifleman";
    _vestGR = "rhsusf_spc_rifleman";
    _vestDM = "rhsusf_spc_marksman";
    _vestME = "rhsusf_spc_corpsman";
    _vestAR = "rhsusf_spc_iar";
    _vestMG = "rhsusf_spc_mg";
    _vestCRW = "rhusf_spc_crew";

    // Helmets.
    _helmet = "rhsusf_mich_helmet_marpatd_norotos_arc";
    _helmetSN = "rhs_booniehat_marpatd";
    _helmetCRW = "rhsusf_cvc_helmet";

    // Backpacks.
    _backpack = "rhsusf_assault_eagleaiii_ocp";

    // Insignia
    _unitInsignia = "";
};

if (_unitFaction == "rhs_faction_usmc_wd") then {
    // Uniforms.
    _uniform = "rhs_uniform_FROG01_wd";

    // Vests.
    _vestSL = "rhsusf_spc_squadleader";
    _vestTL = "rhsusf_spc_teamleader";
    _vestRFL = "rhsusf_spc_rifleman";
    _vestGR = "rhsusf_spc_rifleman";
    _vestDM = "rhsusf_spc_marksman";
    _vestME = "rhsusf_spc_corpsman";
    _vestAR = "rhsusf_spc_iar";
    _vestMG = "rhsusf_spc_mg";
    _vestCRW = "rhusf_spc_crew";

    // Helmets.
    _helmet = "rhsusf_mich_helmet_marpatwd_norotos_arc";
    _helmetSN = "rhs_booniehat_marpatwd";
    _helmetCRW = "rhsusf_cvc_green_helmet";

    // Backpacks.
    _backpack = "rhsusf_assault_eagleaiii_ucp";

    // Insignia
    _unitInsignia = "";
};

// Common uniforms.
_uniformSN = "U_B_GhillieSuit";
_uniformDIV = "U_B_Wetsuit";
_uniformHPLT = "U_B_HeliPilotCoveralls";
_uniformJPLT = "U_B_HeliPilotCoveralls";

// Common vests.
_vestDIV = "V_RebreatherB";

// Common helmets.
_helmetHPLT = "rhsusf_hgu56p_mask";
_helmetJPLT = "rhs_jetpilot_usaf";

// Glasses.
_glasses = "G_Tactical_Clear";
_glassesDIV = "G_Diving";

// Common backpacks.
_backpackDIV = "B_AssaultPack_blk";
_parachuteHPLT = "B_Parachute";
_parachuteJPLT = "B_Parachute";
_uavBackpack = "B_rhsusf_B_BACKPACK";

// Primary weapon.
_pweapon = "rhs_weap_m4a1";
_pweapon320 = "rhs_weap_m4a1_m320";
_pweaponAR = "rhs_weap_m249_pip_S";
_pweaponMG = "rhs_weap_m240B_CAP";
_pweaponDM = "rhs_weap_m14ebrri";
_pweaponSN = "rhs_weap_XM2010_sa";
_pweaponDIV = "arifle_SDAR_F";

// Silencers.
_pweaponSilencer = "rhsusf_acc_rotex5_grey";
_pweaponSurefire = "rhsusf_acc_SF3P556";
_pweaponSilencerSN = "rhsusf_acc_M2010S";

// Accessories.
_pweaponLaserLantern = "rhsusf_acc_anpeq15";
_pweaponLaserLanternAR = "rhsusf_acc_anpeq15A";
_pweaponLaserLanternSN = "rhsusf_acc_anpeq15side";

// Scopes.
_pweaponScope = "rhsusf_acc_ACOG";
_pweaponScopeAR = "rhsusf_acc_ELCAN";
_pweaponScopeDM = "rhsusf_acc_LEUPOLDMK4";
_pweaponScopeSN = "rhsusf_acc_LEUPOLDMK4_2";

// Bipods.
_pweaponBipodDM = "rhsusf_acc_harris_bipod";
_pweaponBipodSN = "rhsusf_acc_harris_bipod";

// AT/AA Launchers
_pweaponLauncherRF = "rhs_weap_M136_hedp";
_pweaponLauncherAT = "rhs_weap_fgm148";
_pweaponLauncherAA = "rhs_weap_fim92";

// Pistols.
_pistol = "rhsusf_weap_m1911a1";

// Objects.
_gps = "ItemGPS";
_watch = "ItemWatch";
_map = "ItemMap";
_compass = "ItemCompass";
_radio = "ItemRadio";
_uavTerminal = "B_UavTerminal";

// Binoculars.
_binoculars = "lerca_1200_tan";

// Night vision.
_nightVision = "rhsusf_ANPVS_14";

if (bmt_mod_ace3) then {
    //===================================================================================================//
    // ACE 3 objects.                                                                                    //
    //===================================================================================================//

    // General.
    _uavBattery = "ACE_UAVBattery";
    _cableTie = "ACE_CableTie";
    _mapTools = "ACE_MapTools";
    _microDAGR = "ACE_microDAGR";
    _earPlugs = "ACE_EarPlugs";
    _vectorIV = "ACE_Vector";
    _flashlight = selectRandom ["ACE_Flashlight_MX991", "ACE_Flashlight_KSF1", "ACE_Flashlight_XL50"];

    // Objects for designated marksman/sniper/observer.
    _atragmx = "ACE_ATragMX";
    _kestrel = "ACE_Kestrel4500";

    // Explosives related objects.
    _clacker = "ACE_Clacker";
    _clackerm26 = "ACE_M26_Clacker";
    _defusalKit = "ACE_DefusalKit";
    _cellphone = "ACE_Cellphone";

    // Medical ojects: Drugs.
    _atropine = "ACE_atropine";
    _epinephrine = "ACE_epinephrine";
    _morphine = "ACE_morphine";

    // Medical ojects: Bandages.
    _bandage = "ACE_fieldDressing";
    _elasticBandage = "ACE_elasticBandage";
    _quickClot = "ACE_quikclot";
    _packingBandage = "ACE_packingBandage";

    // Medical ojects: Bags.
    _bloodBag250 = "ACE_bloodIV_250";
    _bloodBag500 = "ACE_bloodIV_250";
    _bloodBag1000 = "ACE_bloodIV_250";
    _plasmaBag250 = "ACE_plasmaIV_250";
    _plasmaBag500 = "ACE_plasmaIV_500";
    _plasmaBag1000 = "ACE_plasmaIV";
    _salineBag250 = "ACE_salineIV_250";
    _salineBag500 = "ACE_salineIV_500";
    _salineBag1000 = "ACE_salineIV_1000";

    // Medical ojects: Kits.
    _personalAidKid= "ACE_personalAidKit";
    _surgicalKit = "ACE_surgicalKit";

    // Medical ojects: Tourniquets.
    _tourniquet = "ACE_tourniquet";

    // Parachutes.
    _parachuteJPLT = "ACE_NonSteerableParachute";
};

if (bmt_mod_agm) then {

    //===================================================================================================//
    // AGM objects.                                                                                      //
    //===================================================================================================//
    _earPlugs = "AGM_EarBuds";
    _morphine = "AGM_Morphine";
    _epinephrine = "AGM_Epipen";
    _bandage = "AGM_Bandage";
    _bloodBag500 = "AGM_Bloodbag";
    _cableTie = "AGM_CableTie";
    _vectorIV = "AGM_Vector";
    _mapTools = "AGM_MapTools";
    _kestrel = "AGM_ItemKestrel";
    _clacker = "AGM_Clacker";
    _defusalKit = "AGM_DefusalKit";
};


// Remove all gear from a infantry unit.
if (_isInfantry) then {
    removeAllWeapons _unit;
    removeAllAssignedItems _unit;
    clearAllItemsFromBackpack _unit;
    removeAllContainers _unit;
    removeHeadgear _unit;

    // Uniform, helment and glasses.
    _unit forceaddUniform _uniform;
    _unit addHeadgear _helmet;
    _unit addGoggles _glasses;

    if (bmt_mod_ace3 or bmt_mod_agm) then {
        (uniformContainer _unit) addItemCargoGlobal [_earPlugs,1];
        (uniformContainer _unit) addItemCargoGlobal [_morphine,1];
        (uniformContainer _unit) addItemCargoGlobal [_epinephrine,1];
        if (bmt_var_equipFlashlight) then {
            (uniformContainer _unit) addItemCargoGlobal [_flashlight, 1];
        };
    };
    (uniformContainer _unit) addMagazineCargoGlobal ["rhsusf_mag_7x45acp_MHP",2];

    // Secondary weapon.
    _unit addWeapon _pistol;

    // Add common objects.
    _unit linkItem _map;
    _unit linkItem _watch;
    _unit linkItem _compass;
    //_unit linkItem _gps;
    _unit linkItem _radio;
};

// Configure equipment for each unit.
switch (_unitRole) do
{
    // Platoon Leader.
    case "pl": {
        // Vest and Backpack.
        _unit addVest _vestSL;
        _unit addBackpack _backpack;

        // Items in the uniform.
        (uniformContainer _unit) addItemCargoGlobal [_pweaponSilencer,1];
        (uniformContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",1];

        // Items in the vest.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (vestContainer _unit) addItemCargoGlobal [_bandage,2];
            (vestContainer _unit) addItemCargoGlobal [_mapTools,1];
        };
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",8];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",1];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_M433_HEDP",2];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_mk84",1];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_m67",2];

        // Items in the backpack.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (unitBackpack _unit) addItemCargoGlobal [_bandage,2];
            if (bmt_mod_ace3 and (bmt_param_ace3_medicalSystem == 2)) then {
                (unitBackpack _unit) addItemCargoGlobal [_elasticBandage,3];
                (unitBackpack _unit) addItemCargoGlobal [_quickClot,3];
                (unitBackpack _unit) addItemCargoGlobal [_packingBandage,3];
                (unitBackpack _unit) addItemCargoGlobal [_tourniquet,1];
            };
        };
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",5];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",2];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_m714_White",2];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_an_m8hc",2];

        // Primary weapon
        _unit addWeapon _pweapon320;
        _unit addPrimaryWeaponItem _pweaponSurefire;
        _unit addPrimaryWeaponItem _pweaponLaserLantern;
        _unit addPrimaryWeaponItem _pweaponScope;

        // Objects.
        if (bmt_mod_ace3) then {
            (vestContainer _unit) addItemCargoGlobal [_microDAGR,1];
        } else {
            _unit linkItem _gps;
        };

        // Night vision.
        if ((bmt_var_equipNightVision == 1) or (bmt_var_equipNightVision == 2)) then {
            if (bmt_var_equipNightVision == 1) then {
                (unitBackpack _unit) addItemCargoGlobal [_nightVision,1];
            } else {
                _unit linkItem _nightVision;
            };
        };

        // Binoculars.
        _unit addWeapon _vectorIV;
    };

    // Platoon Sergeant.
    case "psg": {
        // Vest and Backpack.
        _unit addVest _vestSL;
        _unit addBackpack _backpack;

        // Items in the uniform.
        (uniformContainer _unit) addItemCargoGlobal [_pweaponSilencer,1];
        (uniformContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",1];

        // Items in the vest.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (vestContainer _unit) addItemCargoGlobal [_bandage,2];
            (vestContainer _unit) addItemCargoGlobal [_mapTools,1];
        };
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",8];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",1];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_M433_HEDP",2];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_mk84",1];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_m67",2];

        // Items in the backpack.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (unitBackpack _unit) addItemCargoGlobal [_bandage,2];
            if (bmt_mod_ace3 and (bmt_param_ace3_medicalSystem == 2)) then {
                (unitBackpack _unit) addItemCargoGlobal [_elasticBandage,3];
                (unitBackpack _unit) addItemCargoGlobal [_quickClot,3];
                (unitBackpack _unit) addItemCargoGlobal [_packingBandage,3];
                (unitBackpack _unit) addItemCargoGlobal [_tourniquet,1];
            };
        };
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",5];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",2];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_m714_White",2];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_an_m8hc",2];

        // Primary weapon
        _unit addWeapon _pweapon320;
        _unit addPrimaryWeaponItem _pweaponSurefire;
        _unit addPrimaryWeaponItem _pweaponLaserLantern;
        _unit addPrimaryWeaponItem _pweaponScope;

        // Night vision.
        if ((bmt_var_equipNightVision == 1) or (bmt_var_equipNightVision == 2)) then {
            if (bmt_var_equipNightVision == 1) then {
                (unitBackpack _unit) addItemCargoGlobal [_nightVision,1];
            } else {
                _unit linkItem _nightVision;
            };
        };

        // Objects.
        if (bmt_mod_ace3) then {
            (vestContainer _unit) addItemCargoGlobal [_microDAGR,1];
        } else {
            _unit linkItem _gps;
        };

        // Binoculars.
        _unit addWeapon _vectorIV;
    };

    // Platoon Radiotelephone Operator.
    case "rto": {
        // Vest and Backpack.
        _unit addVest _vestSL;
        _unit addBackpack _backpack;

        // Items in the uniform.
        (uniformContainer _unit) addItemCargoGlobal [_pweaponSilencer,1];
        (uniformContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",1];

        // Items in the vest.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (vestContainer _unit) addItemCargoGlobal [_bandage,2];
            (vestContainer _unit) addItemCargoGlobal [_mapTools,1];
            if (bmt_mod_ace3) then {
                (vestContainer _unit) addItemCargoGlobal [_microDAGR,1];
            };
        };
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",8];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",1];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_M433_HEDP",2];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_mk84",1];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_m67",2];

        // Items in the backpack.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (unitBackpack _unit) addItemCargoGlobal [_bandage,2];
            if (bmt_mod_ace3 and (bmt_param_ace3_medicalSystem == 2)) then {
                (unitBackpack _unit) addItemCargoGlobal [_elasticBandage,3];
                (unitBackpack _unit) addItemCargoGlobal [_quickClot,3];
                (unitBackpack _unit) addItemCargoGlobal [_packingBandage,3];
                (unitBackpack _unit) addItemCargoGlobal [_tourniquet,1];
            };
        };
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",5];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",2];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_m714_White",2];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_an_m8hc",2];

        // Primary weapon
        _unit addWeapon _pweapon;
        _unit addPrimaryWeaponItem _pweaponSurefire;
        _unit addPrimaryWeaponItem _pweaponLaserLantern;
        _unit addPrimaryWeaponItem _pweaponScope;

        // Night vision.
        if ((bmt_var_equipNightVision == 1) or (bmt_var_equipNightVision == 2)) then {
            if (bmt_var_equipNightVision == 1) then {
                (unitBackpack _unit) addItemCargoGlobal [_nightVision,1];
            } else {
                _unit linkItem _nightVision;
            };
        };
    };

    // Forward Observer.
    case "fo": {
        // Vest and Backpack.
        _unit addVest _vestSL;
        _unit addBackpack _backpack;

        // Items in the uniform.
        (uniformContainer _unit) addItemCargoGlobal [_pweaponSilencer,1];
        (uniformContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",1];

        // Items in the vest.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (vestContainer _unit) addItemCargoGlobal [_bandage,2];
            (vestContainer _unit) addItemCargoGlobal [_mapTools,1];
            if (bmt_mod_ace3) then {
                (vestContainer _unit) addItemCargoGlobal [_microDAGR,1];
            };
        };
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",8];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",1];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_M433_HEDP",2];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_mk84",1];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_m67",2];

        // Items in the backpack.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (unitBackpack _unit) addItemCargoGlobal [_bandage,2];
            if (bmt_mod_ace3 and (bmt_param_ace3_medicalSystem == 2)) then {
                (unitBackpack _unit) addItemCargoGlobal [_elasticBandage,3];
                (unitBackpack _unit) addItemCargoGlobal [_quickClot,3];
                (unitBackpack _unit) addItemCargoGlobal [_packingBandage,3];
                (unitBackpack _unit) addItemCargoGlobal [_tourniquet,1];
            };
        };
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",5];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",2];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_m714_White",2];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_an_m8hc",2];

        // Primary weapon
        _unit addWeapon _pweapon;
        _unit addPrimaryWeaponItem _pweaponSurefire;
        _unit addPrimaryWeaponItem _pweaponLaserLantern;
        _unit addPrimaryWeaponItem _pweaponScope;

        // Night vision.
        if ((bmt_var_equipNightVision == 1) or (bmt_var_equipNightVision == 2)) then {
            if (bmt_var_equipNightVision == 1) then {
                (unitBackpack _unit) addItemCargoGlobal [_nightVision,1];
            } else {
                _unit linkItem _nightVision;
            };
        };

        // Objects.
        _unit linkItem _uavTerminal;
    };

    // Joint Terminal Attack Controller.
        case "jtac": {
            // Vest and Backpack.
            _unit addVest _vestSL;
            _unit addBackpack _backpack;

            // Items in the uniform.
            (uniformContainer _unit) addItemCargoGlobal [_pweaponSilencer,1];
            (uniformContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",1];
            (uniformContainer _unit) addMagazineCargoGlobal ["Laserbatteries",1];

            // Items in the vest.
            if (bmt_mod_ace3 or bmt_mod_agm) then {
                (vestContainer _unit) addItemCargoGlobal [_bandage,2];
                (vestContainer _unit) addItemCargoGlobal [_mapTools,1];
                if (bmt_mod_ace3) then {
                    (vestContainer _unit) addItemCargoGlobal [_microDAGR,1];
                };
            };
            (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",5];
            (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",1];
            (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_m714_White",2];
            (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_mk84",1];
            (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_m67",2];

            // Items in the backpack.
            if (bmt_mod_ace3 or bmt_mod_agm) then {
                (unitBackpack _unit) addItemCargoGlobal [_bandage,2];
                if (bmt_mod_ace3 and (bmt_param_ace3_medicalSystem == 2)) then {
                    (unitBackpack _unit) addItemCargoGlobal [_elasticBandage,3];
                    (unitBackpack _unit) addItemCargoGlobal [_quickClot,3];
                    (unitBackpack _unit) addItemCargoGlobal [_packingBandage,3];
                    (unitBackpack _unit) addItemCargoGlobal [_tourniquet,1];
                };
            };

            // Primary weapon
            _unit addWeapon _pweapon;
            _unit addPrimaryWeaponItem _pweaponSurefire;
            _unit addPrimaryWeaponItem _pweaponLaserLantern;
            _unit addPrimaryWeaponItem _pweaponScope;

            // Night vision.
            if ((bmt_var_equipNightVision == 1) or (bmt_var_equipNightVision == 2)) then {
                if (bmt_var_equipNightVision == 1) then {
                    (unitBackpack _unit) addItemCargoGlobal [_nightVision,1];
                } else {
                    _unit linkItem _nightVision;
                };
            };

            // Objects.
            _unit addWeapon "Laserdesignator";
        };

    // Platoon Medic.
    case "me": {
        // Vest and Backpack.
        _unit addVest _vestME;
        _unit addBackpack _backpack;

        // Items in the uniform.
        (uniformContainer _unit) addItemCargoGlobal [_pweaponSilencer,1];
        (uniformContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",1];

        // Items in the vest.
        if (bmt_mod_ace3) then{
            (vestContainer _unit) addItemCargoGlobal [_bandage,2];
        };
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",8];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",1];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_m67",3];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_an_m8hc",1];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_mk84",1];

        // Items in the backpack.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (unitBackpack _unit) addItemCargoGlobal [_morphine,8];
            (unitBackpack _unit) addItemCargoGlobal [_epinephrine,8];
            if (bmt_mod_ace3 and (bmt_param_ace3_medicalSystem == 2)) then {
                (unitBackpack _unit) addItemCargoGlobal [_bandage,10];
                (unitBackpack _unit) addItemCargoGlobal [_elasticBandage,10];
                (unitBackpack _unit) addItemCargoGlobal [_quickClot,10];
                (unitBackpack _unit) addItemCargoGlobal [_packingBandage,8];
                (unitBackpack _unit) addItemCargoGlobal [_tourniquet,5];
                (unitBackpack _unit) addItemCargoGlobal [_atropine,8];
                (unitBackpack _unit) addItemCargoGlobal [_surgicalKit,2];
                (unitBackpack _unit) addItemCargoGlobal [_personalAidKid,2];
                (unitBackpack _unit) addItemCargoGlobal [_salineBag500,6];
            };

            if( bmt_mod_agm or (bmt_mod_ace3 and (bmt_param_ace3_medicalSystem == 1))) then {
                (unitBackpack _unit) addItemCargoGlobal [_bandage,20];
                (unitBackpack _unit) addItemCargoGlobal [_bloodBag500,2];
            };
        };
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",2];

        // Primary weapon
        _unit addWeapon _pweapon;
        _unit addPrimaryWeaponItem _pweaponSurefire;
        _unit addPrimaryWeaponItem _pweaponLaserLantern;
        _unit addPrimaryWeaponItem _pweaponScope;

        // Night vision.
        if ((bmt_var_equipNightVision == 1) or (bmt_var_equipNightVision == 2)) then {
            if (bmt_var_equipNightVision == 1) then {
                (unitBackpack _unit) addItemCargoGlobal [_nightVision,1];
            } else {
                _unit linkItem _nightVision;
            };
        };
    };

    // Squad Leader.
    case "sl": {
        // Vest and Backpack.
        _unit addVest _vestSL;
        _unit addBackpack _backpack;

        // Items in the uniform.
        (uniformContainer _unit) addItemCargoGlobal [_pweaponSilencer,1];
        (uniformContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",1];

        // Items in the vest.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (vestContainer _unit) addItemCargoGlobal [_bandage,2];
            (vestContainer _unit) addItemCargoGlobal [_mapTools,1];
        };
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",8];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",1];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_M433_HEDP",2];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_mk84",1];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_m67",2];

        // Items in the backpack.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (unitBackpack _unit) addItemCargoGlobal [_bandage,2];
            if (bmt_mod_ace3 and (bmt_param_ace3_medicalSystem == 2)) then {
                (unitBackpack _unit) addItemCargoGlobal [_elasticBandage,3];
                (unitBackpack _unit) addItemCargoGlobal [_quickClot,3];
                (unitBackpack _unit) addItemCargoGlobal [_packingBandage,3];
                (unitBackpack _unit) addItemCargoGlobal [_tourniquet,1];
            };
        };
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",5];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",2];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_m714_White",2];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_an_m8hc",2];

        // Primary weapon
        _unit addWeapon _pweapon320;
        _unit addPrimaryWeaponItem _pweaponSurefire;
        _unit addPrimaryWeaponItem _pweaponLaserLantern;
        _unit addPrimaryWeaponItem _pweaponScope;

        // Objects.
        if (bmt_mod_ace3) then {
            (vestContainer _unit) addItemCargoGlobal [_microDAGR,1];
        } else {
            _unit linkItem _gps;
        };


        // Night vision.
        if ((bmt_var_equipNightVision == 1) or (bmt_var_equipNightVision == 2)) then {
            if (bmt_var_equipNightVision == 1) then {
                (unitBackpack _unit) addItemCargoGlobal [_nightVision,1];
            } else {
                _unit linkItem _nightVision;
            };
        };

        // Binoculars.
        _unit addWeapon _vectorIV;
    };

    // Team leader.
    case "tl": {
        // Vest and Backpack.
        _unit addVest _vestTL;
        _unit addBackpack _backpack;

        // Items in the uniform.
        (uniformContainer _unit) addItemCargoGlobal [_pweaponSilencer,1];
        (uniformContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",1];

        // Items in the vest.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (vestContainer _unit) addItemCargoGlobal [_bandage,2];
            (vestContainer _unit) addItemCargoGlobal [_mapTools,1];
        };
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",8];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",1];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_M433_HEDP",2];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_mk84",1];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_m67",2];

        // Items in the backpack.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (unitBackpack _unit) addItemCargoGlobal [_bandage,2];
            if (bmt_mod_ace3 and (bmt_param_ace3_medicalSystem == 2)) then {
                (unitBackpack _unit) addItemCargoGlobal [_elasticBandage,3];
                (unitBackpack _unit) addItemCargoGlobal [_quickClot,3];
                (unitBackpack _unit) addItemCargoGlobal [_packingBandage,3];
                (unitBackpack _unit) addItemCargoGlobal [_tourniquet,1];
            };
        };
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",5];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",2];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_m714_White",2];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_an_m8hc",2];

        // Primary weapon
        _unit addWeapon _pweapon320;
        _unit addPrimaryWeaponItem _pweaponSurefire;
        _unit addPrimaryWeaponItem _pweaponLaserLantern;
        _unit addPrimaryWeaponItem _pweaponScope;

        // Night vision.
        if ((bmt_var_equipNightVision == 1) or (bmt_var_equipNightVision == 2)) then {
            if (bmt_var_equipNightVision == 1) then {
                (unitBackpack _unit) addItemCargoGlobal [_nightVision,1];
            } else {
                _unit linkItem _nightVision;
            };
        };

        // Binoculars.
        _unit addWeapon _vectorIV;
    };

    // Rifleman.
    case "rfl": {
        // Vest and Backpack.
        _unit addVest _vestRFL;
        _unit addBackpack _backpack;

        // Items in the uniform.
        (uniformContainer _unit) addItemCargoGlobal [_pweaponSilencer,1];
        (uniformContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",1];

        // Items in the vest.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (vestContainer _unit) addItemCargoGlobal [_bandage,2];
        };
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",8];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",1];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_m67",4];

        // Items in the backpack.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (unitBackpack _unit) addItemCargoGlobal [_bandage,2];
            if (bmt_mod_ace3 and (bmt_param_ace3_medicalSystem == 2)) then {
                (unitBackpack _unit) addItemCargoGlobal [_elasticBandage,3];
                (unitBackpack _unit) addItemCargoGlobal [_quickClot,3];
                (unitBackpack _unit) addItemCargoGlobal [_packingBandage,3];
                (unitBackpack _unit) addItemCargoGlobal [_tourniquet,1];
            };
        };
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",5];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",2];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_mk84",2];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_an_m8hc",2];

        // Night vision.
        if ((bmt_var_equipNightVision == 1) or (bmt_var_equipNightVision == 2)) then {
            if (bmt_var_equipNightVision == 1) then {
                (unitBackpack _unit) addItemCargoGlobal [_nightVision,1];
            } else {
                _unit linkItem _nightVision;
            };
        };

        // Primary weapon
        _unit addWeapon _pweapon;
        _unit addPrimaryWeaponItem _pweaponSurefire;
        _unit addPrimaryWeaponItem _pweaponLaserLantern;
        _unit addPrimaryWeaponItem _pweaponScope;
    };

    // Rifleman with AT4.
    case "rflat": {
        // Vest and Backpack.
        _unit addVest _vestRFL;
        _unit addBackpack _backpack;

        // Items in the uniform.
        (uniformContainer _unit) addItemCargoGlobal [_pweaponSilencer,1];
        (uniformContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",1];

        // Items in the vest.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (vestContainer _unit) addItemCargoGlobal [_bandage,2];
        };
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",8];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",1];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_m67",4];

        // Items in the backpack.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (unitBackpack _unit) addItemCargoGlobal [_bandage,2];
            if (bmt_mod_ace3 and (bmt_param_ace3_medicalSystem == 2)) then {
                (unitBackpack _unit) addItemCargoGlobal [_elasticBandage,3];
                (unitBackpack _unit) addItemCargoGlobal [_quickClot,3];
                (unitBackpack _unit) addItemCargoGlobal [_packingBandage,3];
                (unitBackpack _unit) addItemCargoGlobal [_tourniquet,1];
            };
        };
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",5];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",2];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_an_m8hc",2];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_mk84",2];
        (unitBackpack _unit) addItemCargoGlobal ["rhs_m136_hedp_mag",1];

        // Primary weapon
        _unit addWeapon _pweapon;
        _unit addPrimaryWeaponItem _pweaponSurefire;
        _unit addPrimaryWeaponItem _pweaponLaserLantern;
        _unit addPrimaryWeaponItem _pweaponScope;

        // AT4 launcher
        _unit addWeapon _pweaponLauncherRF;

        // Night vision.
        if ((bmt_var_equipNightVision == 1) or (bmt_var_equipNightVision == 2)) then {
            if (bmt_var_equipNightVision == 1) then {
                (unitBackpack _unit) addItemCargoGlobal [_nightVision,1];
            } else {
                _unit linkItem _nightVision;
            };
        };
    };

    // Rifleman with UAV.
    case "rfluav": {
        // Vest and Backpack.
        _unit addVest _vestRFL;
        _unit addBackpack _uavBackpack;

        // Items in the uniform.
        (uniformContainer _unit) addItemCargoGlobal [_pweaponSilencer,1];
        (uniformContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",1];

        // Items in the vest.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (vestContainer _unit) addItemCargoGlobal [_bandage,2];
        };
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",8];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",1];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_m67",4];

        // Items in the backpack.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (unitBackpack _unit) addItemCargoGlobal [_bandage,2];
            if (bmt_mod_ace3 and (bmt_param_ace3_medicalSystem == 2)) then {
                (unitBackpack _unit) addItemCargoGlobal [_elasticBandage,3];
                (unitBackpack _unit) addItemCargoGlobal [_quickClot,3];
                (unitBackpack _unit) addItemCargoGlobal [_packingBandage,3];
                (unitBackpack _unit) addItemCargoGlobal [_tourniquet,1];
            };
        };
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",5];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",2];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_an_m8hc",2];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_mk84",2];
        (unitBackpack _unit) addItemCargoGlobal ["rhs_m136_hedp_mag",1];

        // Primary weapon
        _unit addWeapon _pweapon;
        _unit addPrimaryWeaponItem _pweaponSurefire;
        _unit addPrimaryWeaponItem _pweaponLaserLantern;
        _unit addPrimaryWeaponItem _pweaponScope;

        // AT4 launcher
        _unit addWeapon _pweaponLauncherRF;

        // Night vision.
        if ((bmt_var_equipNightVision == 1) or (bmt_var_equipNightVision == 2)) then {
            if (bmt_var_equipNightVision == 1) then {
                (unitBackpack _unit) addItemCargoGlobal [_nightVision,1];
            } else {
                _unit linkItem _nightVision;
            };
        };
    };

    // Grenadier.
    case "gr": {
        // Vest and Backpack.
        _unit addVest _vestGR;
        _unit addBackpack _backpack;

        // Items in the uniform.
        (uniformContainer _unit) addItemCargoGlobal [_pweaponSilencer,1];
        (uniformContainer _unit) addMagazineCargoGlobal ["rhs_mag_M433_HEDP",4];
        (uniformContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",1];

        // Items in the vest.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (vestContainer _unit) addItemCargoGlobal [_bandage,2];
        };
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",6];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",1];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_m67",4];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_M433_HEDP",6];

        // Items in the backpack.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (unitBackpack _unit) addItemCargoGlobal [_bandage,2];
            if (bmt_mod_ace3 and (bmt_param_ace3_medicalSystem == 2)) then {
                (unitBackpack _unit) addItemCargoGlobal [_elasticBandage,3];
                (unitBackpack _unit) addItemCargoGlobal [_quickClot,3];
                (unitBackpack _unit) addItemCargoGlobal [_packingBandage,3];
                (unitBackpack _unit) addItemCargoGlobal [_tourniquet,1];
            };
        };
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",5];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",1];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_m714_White",2];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_an_m8hc",2];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_mk84",2];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_M433_HEDP",5];

        // Primary weapon
        _unit addWeapon _pweapon320;
        _unit addPrimaryWeaponItem _pweaponSurefire;
        _unit addPrimaryWeaponItem _pweaponLaserLantern;
        _unit addPrimaryWeaponItem _pweaponScope;

        // Night vision.
        if ((bmt_var_equipNightVision == 1) or (bmt_var_equipNightVision == 2)) then {
            if (bmt_var_equipNightVision == 1) then {
                (unitBackpack _unit) addItemCargoGlobal [_nightVision,1];
            } else {
                _unit linkItem _nightVision;
            };
        };
    };

    // Automatic Rifleman.
    case "ar": {
        // Vest and Backpack.
        _unit addVest _vestAR;
        _unit addBackpack _backpack;

        // Items in the uniform.
        (uniformContainer _unit) addMagazineCargoGlobal ["rhsusf_100Rnd_556x45_soft_pouch",2];

        // Items in the vest.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (vestContainer _unit) addItemCargoGlobal [_bandage,2];
        };
        (vestContainer _unit) addMagazineCargoGlobal ["rhsusf_100Rnd_556x45_soft_pouch",3];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_m67",3];

        // Items in the backpack.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (unitBackpack _unit) addItemCargoGlobal [_bandage,2];
            if (bmt_mod_ace3 and (bmt_param_ace3_medicalSystem == 2)) then {
                (unitBackpack _unit) addItemCargoGlobal [_elasticBandage,3];
                (unitBackpack _unit) addItemCargoGlobal [_quickClot,3];
                (unitBackpack _unit) addItemCargoGlobal [_packingBandage,3];
                (unitBackpack _unit) addItemCargoGlobal [_tourniquet,1];
            };
        };
        (unitBackpack _unit) addMagazineCargoGlobal ["rhsusf_200Rnd_556x45_soft_pouch",1];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_mk84",2];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_an_m8hc",1];

        // Primary weapon
        _unit addWeapon _pweaponAR;
        _unit addPrimaryWeaponItem _pweaponLaserLanternAR;
        _unit addPrimaryWeaponItem _pweaponScopeAR;

        // Night vision.
        if ((bmt_var_equipNightVision == 1) or (bmt_var_equipNightVision == 2)) then {
            if (bmt_var_equipNightVision == 1) then {
                (unitBackpack _unit) addItemCargoGlobal [_nightVision,1];
            } else {
                _unit linkItem _nightVision;
            };
        };
    };

    // Assitant Automatic Rifleman.
    case "aar": {
        // Vest and Backpack.
        _unit addVest _vestRFL;
        _unit addBackpack _backpack;

        // Items in the uniform.
        (uniformContainer _unit) addItemCargoGlobal [_pweaponSilencer,1];
        (uniformContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",1];

        // Items in the vest.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (vestContainer _unit) addItemCargoGlobal [_bandage,2];
        };
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",8];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",1];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_m67",4];

        // Items in the backpack.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (unitBackpack _unit) addItemCargoGlobal [_bandage,2];
            if (bmt_mod_ace3 and (bmt_param_ace3_medicalSystem == 2)) then {
                (unitBackpack _unit) addItemCargoGlobal [_elasticBandage,3];
                (unitBackpack _unit) addItemCargoGlobal [_quickClot,3];
                (unitBackpack _unit) addItemCargoGlobal [_packingBandage,3];
                (unitBackpack _unit) addItemCargoGlobal [_tourniquet,1];
            };
        };
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_mk84",1];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_an_m8hc",2];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhsusf_200Rnd_556x45_soft_pouch",2];

        // Primary weapon
        _unit addWeapon _pweapon;
        _unit addPrimaryWeaponItem _pweaponSurefire;
        _unit addPrimaryWeaponItem _pweaponLaserLantern;
        _unit addPrimaryWeaponItem _pweaponScope;

        // Night vision.
        if ((bmt_var_equipNightVision == 1) or (bmt_var_equipNightVision == 2)) then {
            if (bmt_var_equipNightVision == 1) then {
                (unitBackpack _unit) addItemCargoGlobal [_nightVision,1];
            } else {
                _unit linkItem _nightVision;
            };
        };

        // Binoculars.
        _unit addWeapon _binoculars;
    };

    // Designated Marksman.
    case "dm": {
        // Vest and Backpack.
        _unit addVest _vestDM;
        _unit addBackpack _backpack;

        // Items in the uniform.
        (uniformContainer _unit) addMagazineCargoGlobal ["rhsusf_20Rnd_762x51_m118_special_Mag",1];

        // Items in the vest.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (vestContainer _unit) addItemCargoGlobal [_bandage,2];
            (vestContainer _unit) addItemCargoGlobal [_kestrel,1];
            if (bmt_mod_ace3) then {
                (vestContainer _unit) addItemCargoGlobal [_atragmx,1];
            };
        };
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_m67",3];
        (vestContainer _unit) addMagazineCargoGlobal ["rhsusf_20Rnd_762x51_m118_special_Mag",6];

        // Items in the backpack.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (unitBackpack _unit) addItemCargoGlobal [_bandage,2];
            if (bmt_mod_ace3 and (bmt_param_ace3_medicalSystem == 2)) then {
                (unitBackpack _unit) addItemCargoGlobal [_elasticBandage,3];
                (unitBackpack _unit) addItemCargoGlobal [_quickClot,3];
                (unitBackpack _unit) addItemCargoGlobal [_packingBandage,3];
                (unitBackpack _unit) addItemCargoGlobal [_tourniquet,1];
            };
        };
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_mk84",2];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_an_m8hc",1];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhsusf_20Rnd_762x51_m118_special_Mag",5];

        // Primary weapon
        // Missing muzzle attachment
        _unit addWeapon _pweaponDM;
        _unit addPrimaryWeaponItem _pweaponLaserLanternSN;
        _unit addPrimaryWeaponItem _pweaponScopeDM;
        _unit addPrimaryWeaponItem _pweaponBipodDM;

        // Night vision.
        if ((bmt_var_equipNightVision == 1) or (bmt_var_equipNightVision == 2)) then {
            if (bmt_var_equipNightVision == 1) then {
                (unitBackpack _unit) addItemCargoGlobal [_nightVision,1];
            } else {
                _unit linkItem _nightVision;
            };
        };
    };


    // Machine Gunner.
    case "mg": {
        // Vest and Backpack.
        _unit addVest _vestMG;
        _unit addBackpack _backpack;

        // Items in the uniform.
        (uniformContainer _unit) addMagazineCargoGlobal ["rhsusf_100Rnd_762x51",1];

        // Items in the vest.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (vestContainer _unit) addItemCargoGlobal [_bandage,2];
        };
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_m67",3];
        (vestContainer _unit) addMagazineCargoGlobal ["rhsusf_100Rnd_762x51",2];

        // Items in the backpack.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (unitBackpack _unit) addItemCargoGlobal [_bandage,2];
            if (bmt_mod_ace3 and (bmt_param_ace3_medicalSystem == 2)) then {
                (unitBackpack _unit) addItemCargoGlobal [_elasticBandage,3];
                (unitBackpack _unit) addItemCargoGlobal [_quickClot,3];
                (unitBackpack _unit) addItemCargoGlobal [_packingBandage,3];
                (unitBackpack _unit) addItemCargoGlobal [_tourniquet,1];
            };
        };
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_mk84",1];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_an_m8hc",2];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhsusf_100Rnd_762x51",2];

        // Night vision.
        if ((bmt_var_equipNightVision == 1) or (bmt_var_equipNightVision == 2)) then {
            if (bmt_var_equipNightVision == 1) then {
                (unitBackpack _unit) addItemCargoGlobal [_nightVision,1];
            } else {
                _unit linkItem _nightVision;
            };
        };

        // Primary weapon
        _unit addWeapon _pweaponMG;
        _unit addPrimaryWeaponItem _pweaponScopeAR;
    };

    // Assitant Machine Gunner.
    case "amg": {
        // Vest and Backpack.
        _unit addVest _vestRFL;
        _unit addBackpack _backpack;

        // Items in the uniform.
        (uniformContainer _unit) addItemCargoGlobal [_pweaponSilencer,1];
        (uniformContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",1];

        // Items in the vest.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (vestContainer _unit) addItemCargoGlobal [_bandage,2];
        };
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",8];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",1];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_m67",4];

        // Items in the backpack.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (unitBackpack _unit) addItemCargoGlobal [_bandage,2];
            if (bmt_mod_ace3 and (bmt_param_ace3_medicalSystem == 2)) then {
                (unitBackpack _unit) addItemCargoGlobal [_elasticBandage,3];
                (unitBackpack _unit) addItemCargoGlobal [_quickClot,3];
                (unitBackpack _unit) addItemCargoGlobal [_packingBandage,3];
                (unitBackpack _unit) addItemCargoGlobal [_tourniquet,1];
            };
        };
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_mk84",1];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_an_m8hc",2];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhsusf_100Rnd_762x51",2];

        // Primary weapon
        _unit addWeapon _pweapon;
        _unit addPrimaryWeaponItem _pweaponSurefire;
        _unit addPrimaryWeaponItem _pweaponLaserLantern;
        _unit addPrimaryWeaponItem _pweaponScope;

        // Night vision.
        if ((bmt_var_equipNightVision == 1) or (bmt_var_equipNightVision == 2)) then {
            if (bmt_var_equipNightVision == 1) then {
                (unitBackpack _unit) addItemCargoGlobal [_nightVision,1];
            } else {
                _unit linkItem _nightVision;
            };
        };

        // Binoculars.
        _unit addWeapon _binoculars;
    };

    // Anti-Tank.
    case "at": {
        // Vest and Backpack.
        _unit addVest _vestRFL;
        _unit addBackpack _backpack;

        // Items in the uniform.
        (uniformContainer _unit) addItemCargoGlobal [_pweaponSilencer,1];
        (uniformContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",1];

        // Items in the vest.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (vestContainer _unit) addItemCargoGlobal [_bandage,2];
        };
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",8];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",1];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_m67",4];

        // Items in the backpack.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (unitBackpack _unit) addItemCargoGlobal [_bandage,2];
            if (bmt_mod_ace3 and (bmt_param_ace3_medicalSystem == 2)) then {
                (unitBackpack _unit) addItemCargoGlobal [_elasticBandage,3];
                (unitBackpack _unit) addItemCargoGlobal [_quickClot,3];
                (unitBackpack _unit) addItemCargoGlobal [_packingBandage,3];
                (unitBackpack _unit) addItemCargoGlobal [_tourniquet,1];
            };
        };
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",5];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",2];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_mk84",1];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_an_m8hc",2];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_fgm148_magazine_AT",1];

        // Primary weapon
        _unit addWeapon _pweapon;
        _unit addPrimaryWeaponItem _pweaponSurefire;
        _unit addPrimaryWeaponItem _pweaponLaserLantern;
        _unit addPrimaryWeaponItem _pweaponScope;

        // Javelin.
        _unit addWeapon _pweaponLauncherAT;

        // Night vision.
        if ((bmt_var_equipNightVision == 1) or (bmt_var_equipNightVision == 2)) then {
            if (bmt_var_equipNightVision == 1) then {
                (unitBackpack _unit) addItemCargoGlobal [_nightVision,1];
            } else {
                _unit linkItem _nightVision;
            };
        };
    };

    // AT Ammo handler.
    case "aat": {
        // Vest and Backpack.
        _unit addVest _vestRFL;
        _unit addBackpack _backpack;

        // Items in the uniform.
        (uniformContainer _unit) addItemCargoGlobal [_pweaponSilencer,1];
        (uniformContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",1];

        // Items in the vest.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (vestContainer _unit) addItemCargoGlobal [_bandage,2];
        };
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",8];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",1];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_m67",4];

        // Items in the backpack.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (unitBackpack _unit) addItemCargoGlobal [_bandage,2];
            if (bmt_mod_ace3 and (bmt_param_ace3_medicalSystem == 2)) then {
                (unitBackpack _unit) addItemCargoGlobal [_elasticBandage,3];
                (unitBackpack _unit) addItemCargoGlobal [_quickClot,3];
                (unitBackpack _unit) addItemCargoGlobal [_packingBandage,3];
                (unitBackpack _unit) addItemCargoGlobal [_tourniquet,1];
            };
        };
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_fgm148_magazine_AT",1];

        // Primary weapon
        _unit addWeapon _pweapon;
        _unit addPrimaryWeaponItem _pweaponSurefire;
        _unit addPrimaryWeaponItem _pweaponLaserLantern;
        _unit addPrimaryWeaponItem _pweaponScope;

        // Night vision.
        if ((bmt_var_equipNightVision == 1) or (bmt_var_equipNightVision == 2)) then {
            if (bmt_var_equipNightVision == 1) then {
                (unitBackpack _unit) addItemCargoGlobal [_nightVision,1];
            } else {
                _unit linkItem _nightVision;
            };
        };
    };

    // Anti-Aircraft gunner.
    case "aa": {
        // Vest and Backpack.
        _unit addVest _vestRFL;
        _unit addBackpack _backpack;

        // Items in the uniform.
        (uniformContainer _unit) addItemCargoGlobal [_pweaponSilencer,1];
        (uniformContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",1];

        // Items in the vest.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (vestContainer _unit) addItemCargoGlobal [_bandage,2];
        };
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",8];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",1];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_m67",4];

        // Items in the backpack.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (unitBackpack _unit) addItemCargoGlobal [_bandage,2];
            if (bmt_mod_ace3 and (bmt_param_ace3_medicalSystem == 2)) then {
                (unitBackpack _unit) addItemCargoGlobal [_elasticBandage,3];
                (unitBackpack _unit) addItemCargoGlobal [_quickClot,3];
                (unitBackpack _unit) addItemCargoGlobal [_packingBandage,3];
                (unitBackpack _unit) addItemCargoGlobal [_tourniquet,1];
            };
        };
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",5];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",2];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_mk84",1];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_an_m8hc",2];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_fim92_mag",1];

        // Primary weapon
        _unit addWeapon _pweapon;
        _unit addPrimaryWeaponItem _pweaponSurefire;
        _unit addPrimaryWeaponItem _pweaponLaserLantern;
        _unit addPrimaryWeaponItem _pweaponScope;

        // Stinger.
        _unit addWeapon _pweaponLauncherAA;

        // Night vision.
        if ((bmt_var_equipNightVision == 1) or (bmt_var_equipNightVision == 2)) then {
            if (bmt_var_equipNightVision == 1) then {
                (unitBackpack _unit) addItemCargoGlobal [_nightVision,1];
            } else {
                _unit linkItem _nightVision;
            };
        };
    };

    // Anti-Aircraft Assitant.
    case "aaa": {
        // Vest and Backpack.
        _unit addVest _vestRFL;
        _unit addBackpack _backpack;

        // Items in the uniform.
        (uniformContainer _unit) addItemCargoGlobal [_pweaponSilencer,1];
        (uniformContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",1];

        // Items in the vest.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (vestContainer _unit) addItemCargoGlobal [_bandage,2];
        };
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",8];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",1];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_m67",4];

        // Items in the backpack.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (unitBackpack _unit) addItemCargoGlobal [_bandage,2];
            if (bmt_mod_ace3 and (bmt_param_ace3_medicalSystem == 2)) then {
                (unitBackpack _unit) addItemCargoGlobal [_elasticBandage,3];
                (unitBackpack _unit) addItemCargoGlobal [_quickClot,3];
                (unitBackpack _unit) addItemCargoGlobal [_packingBandage,3];
                (unitBackpack _unit) addItemCargoGlobal [_tourniquet,1];
            };
        };
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_fim92_mag",1];

        // Primary weapon
        _unit addWeapon _pweapon;
        _unit addPrimaryWeaponItem _pweaponSurefire;
        _unit addPrimaryWeaponItem _pweaponLaserLantern;
        _unit addPrimaryWeaponItem _pweaponScope;

        // Night vision.
        if ((bmt_var_equipNightVision == 1) or (bmt_var_equipNightVision == 2)) then {
            if (bmt_var_equipNightVision == 1) then {
                (unitBackpack _unit) addItemCargoGlobal [_nightVision,1];
            } else {
                _unit linkItem _nightVision;
            };
        };
    };

    // Engineer.
    case "en": {
        // Vest and Backpack.
        _unit addVest _vestRFL;
        _unit addBackpack _backpack;

        // Items in the uniform.
        (uniformContainer _unit) addItemCargoGlobal [_pweaponSilencer,1];
        (uniformContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",1];
        if (bmt_mod_ace3 or bmt_mod_agm) then{
            (uniformContainer _unit) addItemCargoGlobal [_clacker,1];
        };

        // Items in the vest.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (vestContainer _unit) addItemCargoGlobal [_bandage,2];
        };
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",8];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",1];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_m67",4];

        // Items in the backpack.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (unitBackpack _unit) addItemCargoGlobal [_bandage,2];
            if (bmt_mod_ace3 and (bmt_param_ace3_medicalSystem == 2)) then {
                (unitBackpack _unit) addItemCargoGlobal [_elasticBandage,3];
                (unitBackpack _unit) addItemCargoGlobal [_quickClot,3];
                (unitBackpack _unit) addItemCargoGlobal [_packingBandage,3];
                (unitBackpack _unit) addItemCargoGlobal [_tourniquet,1];
            };
        };
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_mk84", 1];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag", 4];
        (unitBackpack _unit) addItemCargoGlobal ["ToolKit", 1];

        // Primary weapon
        _unit addWeapon _pweapon;
        _unit addPrimaryWeaponItem _pweaponSurefire;
        _unit addPrimaryWeaponItem _pweaponLaserLantern;
        _unit addPrimaryWeaponItem _pweaponScope;

        // Night vision.
        if ((bmt_var_equipNightVision == 1) or (bmt_var_equipNightVision == 2)) then {
            if (bmt_var_equipNightVision == 1) then {
                (unitBackpack _unit) addItemCargoGlobal [_nightVision,1];
            } else {
                _unit linkItem _nightVision;
            };
        };
    };

    // Explosives Specialist.
    case "exp": {
        // Vest and Backpack.
        _unit addVest _vestRFL;
        _unit addBackpack _backpack;

        // Items in the uniform.
        (uniformContainer _unit) addItemCargoGlobal [_pweaponSilencer, 1];
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (uniformContainer _unit) addItemCargoGlobal [_clacker, 1];
        };
        (uniformContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag", 1];

        // Items in the vest.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (vestContainer _unit) addItemCargoGlobal [_bandage, 2];
        };
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag", 8];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", 1];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_m67", 2];

        // Items in the backpack.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (unitBackpack _unit) addItemCargoGlobal [_bandage, 2];
            (unitBackpack _unit) addItemCargoGlobal [_defusalKit, 1];
            if (bmt_mod_ace3 and (bmt_param_ace3_medicalSystem == 2)) then {
                (unitBackpack _unit) addItemCargoGlobal [_elasticBandage, 3];
                (unitBackpack _unit) addItemCargoGlobal [_quickClot, 3];
                (unitBackpack _unit) addItemCargoGlobal [_packingBandage, 3];
                (unitBackpack _unit) addItemCargoGlobal [_tourniquet, 1];
            };
        };
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_mk84", 1];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag", 4];
        (unitBackpack _unit) addMagazineCargoGlobal ["DemoCharge_Remote_Mag", 3];
        (unitBackpack _unit) addMagazineCargoGlobal ["SLAMDirectionalMine_Wire_Mag", 1];

        // Primary weapon
        _unit addWeapon _pweapon;
        _unit addPrimaryWeaponItem _pweaponSurefire;
        _unit addPrimaryWeaponItem _pweaponLaserLantern;
        _unit addPrimaryWeaponItem _pweaponScope;

        // Night vision.
        if ((bmt_var_equipNightVision == 1) or (bmt_var_equipNightVision == 2)) then {
            if (bmt_var_equipNightVision == 1) then {
                (unitBackpack _unit) addItemCargoGlobal [_nightVision,1];
            } else {
                _unit linkItem _nightVision;
            };
        };
    };

    // Sniper.
    case "sn": {
        // Uniforme, armilla i motxilla
        removeUniform _unit;
        _unit forceAddUniform _uniformSN;
        _unit addVest _vestRFL;
        _unit addBackpack _backpack;

        // Helmet.
        removeHeadgear _unit;
        _unit addHeadgear _helmetSN;

        // Items in the uniform.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (uniformContainer _unit) addItemCargoGlobal [_earPlugs,1];
            (uniformContainer _unit) addItemCargoGlobal [_morphine,1];
            (uniformContainer _unit) addItemCargoGlobal [_epinephrine,1];
            if (bmt_var_equipFlashlight) then {
                (uniformContainer _unit) addItemCargoGlobal [_flashlight, 1];
            };
        };
        (uniformContainer _unit) addItemCargoGlobal [_pweaponSilencerSN,1];
        (uniformContainer _unit) addMagazineCargoGlobal ["rhsusf_5Rnd_300winmag_xm2010",2];
        (uniformContainer _unit) addMagazineCargoGlobal ["rhsusf_mag_7x45acp_MHP",2];

        // Items in the vest.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (vestContainer _unit) addItemCargoGlobal [_bandage,2];
            if (bmt_mod_ace3) then {
                (vestContainer _unit) addItemCargoGlobal [_microDAGR,1];
                (vestContainer _unit) addItemCargoGlobal [_atragmx,1];
            };
            (vestContainer _unit) addItemCargoGlobal [_mapTools,1];
            (vestContainer _unit) addItemCargoGlobal [_kestrel,1];
        };
        (vestContainer _unit) addMagazineCargoGlobal ["rhsusf_5Rnd_300winmag_xm2010",5];

        // Items in the backpack.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (unitBackpack _unit) addItemCargoGlobal [_bandage,2];
            if (bmt_mod_ace3 and (bmt_param_ace3_medicalSystem == 2)) then {
                (unitBackpack _unit) addItemCargoGlobal [_elasticBandage,3];
                (unitBackpack _unit) addItemCargoGlobal [_quickClot,3];
                (unitBackpack _unit) addItemCargoGlobal [_packingBandage,3];
                (unitBackpack _unit) addItemCargoGlobal [_tourniquet,1];
            };
        };
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_an_m8hc",1];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_mk84",1];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhsusf_5Rnd_300winmag_xm2010",5];

        // Primary weapon
        _unit addWeapon _pweaponSN;
        _unit addPrimaryWeaponItem _pweaponLaserLanternSN;
        _unit addPrimaryWeaponItem _pweaponScopeSN;
        _unit addPrimaryWeaponItem _pweaponBipodSN;

        // Night vision.
        if ((bmt_var_equipNightVision == 1) or (bmt_var_equipNightVision == 2)) then {
            if (bmt_var_equipNightVision == 1) then {
                (unitBackpack _unit) addItemCargoGlobal [_nightVision,1];
            } else {
                _unit linkItem _nightVision;
            };
        };
    };

    // Spotter.
    case "sp": {
        // Uniforme, armilla i motxilla
        removeUniform _unit;
        _unit forceAddUniform _uniformSN;
        _unit addVest _vestRFL;
        _unit addBackpack _backpack;

        // Helmet.
        removeHeadgear _unit;
        _unit addHeadgear _helmetSN;

        // Items in the uniform.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (uniformContainer _unit) addItemCargoGlobal [_earPlugs,1];
            (uniformContainer _unit) addItemCargoGlobal [_morphine,1];
            (uniformContainer _unit) addItemCargoGlobal [_epinephrine,1];
            if (bmt_var_equipFlashlight) then {
                (uniformContainer _unit) addItemCargoGlobal [_flashlight, 1];
            };
        };
        (uniformContainer _unit) addItemCargoGlobal [_pweaponSilencer,1];
        (uniformContainer _unit) addMagazineCargoGlobal ["rhsusf_mag_7x45acp_MHP",2];
        (uniformContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",1];

        // Items in the vest.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (vestContainer _unit) addItemCargoGlobal [_bandage,2];
            if (bmt_mod_ace3) then {
                (vestContainer _unit) addItemCargoGlobal [_microDAGR,1];
                (vestContainer _unit) addItemCargoGlobal [_atragmx,1];
            };
            (vestContainer _unit) addItemCargoGlobal [_mapTools,1];
            (vestContainer _unit) addItemCargoGlobal [_kestrel,1];
        };

        // Items in the backpack.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (unitBackpack _unit) addItemCargoGlobal [_bandage,2];
            if (bmt_mod_ace3 and (bmt_param_ace3_medicalSystem == 2)) then {
                (unitBackpack _unit) addItemCargoGlobal [_elasticBandage,3];
                (unitBackpack _unit) addItemCargoGlobal [_quickClot,3];
                (unitBackpack _unit) addItemCargoGlobal [_packingBandage,3];
                (unitBackpack _unit) addItemCargoGlobal [_tourniquet,1];
            };
        };
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",5];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",2];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_mk84",2];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_an_m8hc",2];

        _unit addWeapon _pweapon;
        _unit addPrimaryWeaponItem _pweaponSurefire;
        _unit addPrimaryWeaponItem _pweaponLaserLantern;
        _unit addPrimaryWeaponItem _pweaponScope;

        // Objects.
        //_unit linkItem _gps;

        // Night vision.
        if ((bmt_var_equipNightVision == 1) or (bmt_var_equipNightVision == 2)) then {
            if (bmt_var_equipNightVision == 1) then {
                (unitBackpack _unit) addItemCargoGlobal [_nightVision,1];
            } else {
                _unit linkItem _nightVision;
            };
        };

        // Binoculars.
        _unit addWeapon _vectorIV;


    };

    // Diver Squad Leader.
    case "divsl": {
        // Remove uniform, helmet and vest.
        removeUniform _unit;
        removeHeadgear _unit;
        removeGoggles _unit;

        // Uniform, vest and backpack.
        _unit forceAddUniform _uniformDIV;
        _unit addVest _vestDIV;
        _unit addBackpack _backpackDIV;

        // Items in the uniform.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (uniformContainer _unit) addItemCargoGlobal [_earPlugs,1];
            (uniformContainer _unit) addItemCargoGlobal [_morphine,1];
            (uniformContainer _unit) addItemCargoGlobal [_epinephrine,1];
            (uniformContainer _unit) addItemCargoGlobal [_bandage,2];
            if (bmt_var_equipFlashlight) then {
                (uniformContainer _unit) addItemCargoGlobal [_flashlight, 1];
            };
        };
        (uniformContainer _unit) addMagazineCargoGlobal ["rhsusf_mag_7x45acp_MHP",4];
        (uniformContainer _unit) addMagazineCargoGlobal ["20Rnd_556x45_UW_mag",3];

        // Items in the vest.
        // Items cannot be added to diving rebreather.

        // Items in the backpack.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (unitBackpack _unit) addItemCargoGlobal [_bandage,2];
            if (bmt_mod_ace3 and (bmt_param_ace3_medicalSystem == 2)) then {
                (unitBackpack _unit) addItemCargoGlobal [_elasticBandage,3];
                (unitBackpack _unit) addItemCargoGlobal [_quickClot,3];
                (unitBackpack _unit) addItemCargoGlobal [_packingBandage,3];
                (unitBackpack _unit) addItemCargoGlobal [_tourniquet,1];
            };
        };
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_mk84",1];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_an_m8hc",2];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_m67",4];
        (unitBackpack _unit) addMagazineCargoGlobal ["30Rnd_556x45_Stanag",7];
        (unitBackpack _unit) addMagazineCargoGlobal ["20Rnd_556x45_UW_mag",4];
        // Night vision.
        if ((bmt_var_equipNightVision == 1) or (bmt_var_equipNightVision == 2)) then {
                (unitBackpack _unit) addItemCargoGlobal [_nightVision,1];
        };

        // Glasses.
        _unit addGoggles _glassesDIV;

        // Primary weapon
        _unit addWeapon _pweaponDIV;

        // Objects.
        if (bmt_mod_ace3) then {
            (uniformContainer _unit) addItemCargoGlobal [_microDAGR,1];
        } else {
            _unit linkItem _gps;
        };

        // Binoculars.
        _unit addWeapon _vectorIV;
    };

    // Diver Medic.
    case "divme": {
        // Remove uniform, helmet and vest.
        removeUniform _unit;
        removeHeadgear _unit;
        removeGoggles _unit;

        // Uniform, vest and backpack.
        _unit forceAddUniform _uniformDIV;
        _unit addVest _vestDIV;
        _unit addBackpack _backpackDIV;

        // Items in the uniform.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (uniformContainer _unit) addItemCargoGlobal [_earPlugs,1];
            (uniformContainer _unit) addItemCargoGlobal [_morphine,1];
            (uniformContainer _unit) addItemCargoGlobal [_epinephrine,1];
            (uniformContainer _unit) addItemCargoGlobal [_bandage,2];
            if (bmt_var_equipFlashlight) then {
                (uniformContainer _unit) addItemCargoGlobal [_flashlight, 1];
            };
        };
        (uniformContainer _unit) addMagazineCargoGlobal ["rhsusf_mag_7x45acp_MHP",4];
        (uniformContainer _unit) addMagazineCargoGlobal ["20Rnd_556x45_UW_mag",3];

        // Items in the vest.
        // Items cannot be added to diving rebreather.

        // Items in the backpack.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (unitBackpack _unit) addItemCargoGlobal [_morphine,8];
            (unitBackpack _unit) addItemCargoGlobal [_epinephrine,8];
            if (bmt_mod_ace3 and (bmt_param_ace3_medicalSystem == 2)) then {
                (unitBackpack _unit) addItemCargoGlobal [_bandage,8];
                (unitBackpack _unit) addItemCargoGlobal [_elasticBandage,8];
                (unitBackpack _unit) addItemCargoGlobal [_quickClot,8];
                (unitBackpack _unit) addItemCargoGlobal [_packingBandage,6];
                (unitBackpack _unit) addItemCargoGlobal [_tourniquet,3];
                (unitBackpack _unit) addItemCargoGlobal [_atropine,8];
                (unitBackpack _unit) addItemCargoGlobal [_surgicalKit,2];
                (unitBackpack _unit) addItemCargoGlobal [_personalAidKid,2];
                (unitBackpack _unit) addItemCargoGlobal [_salineBag500,3];
            };
            if( bmt_mod_agm or (bmt_mod_ace3 and (bmt_param_ace3_medicalSystem == 1))) then {
                (unitBackpack _unit) addItemCargoGlobal [_bandage,15];
                (unitBackpack _unit) addItemCargoGlobal [_bloodBag500,2];
            };
        };
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_mk84",1];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_an_m8hc",2];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_m67",1];
        (unitBackpack _unit) addMagazineCargoGlobal ["30Rnd_556x45_Stanag",3];
        (unitBackpack _unit) addMagazineCargoGlobal ["20Rnd_556x45_UW_mag",3];
        // Night vision.
        if ((bmt_var_equipNightVision == 1) or (bmt_var_equipNightVision == 2)) then {
                (unitBackpack _unit) addItemCargoGlobal [_nightVision,1];
        };

        // Glasses.
        _unit addGoggles _glassesDIV;

        // Primary weapon
        _unit addWeapon _pweaponDIV;
    };

    // Diver Explosives Specialist.
    case "divexp": {
        // Remove uniform, helmet and vest.
        removeUniform _unit;
        removeHeadgear _unit;
        removeGoggles _unit;

        // Uniform, vest and backpack.
        _unit forceAddUniform _uniformDIV;
        _unit addVest _vestDIV;
        _unit addBackpack _backpackDIV;

        // Items in the uniform.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (uniformContainer _unit) addItemCargoGlobal [_earPlugs,1];
            (uniformContainer _unit) addItemCargoGlobal [_morphine,1];
            (uniformContainer _unit) addItemCargoGlobal [_epinephrine,1];
            (uniformContainer _unit) addItemCargoGlobal [_bandage,2];
            if (bmt_var_equipFlashlight) then {
                (uniformContainer _unit) addItemCargoGlobal [_flashlight, 1];
            };
        };
        (uniformContainer _unit) addMagazineCargoGlobal ["rhsusf_mag_7x45acp_MHP",4];
        (uniformContainer _unit) addMagazineCargoGlobal ["20Rnd_556x45_UW_mag",3];

        // Items in the vest.
        // Items cannot be added to diving rebreather.

        // Items in the backpack.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (unitBackpack _unit) addItemCargoGlobal [_bandage,2];
            if (bmt_mod_ace3 and (bmt_param_ace3_medicalSystem == 2)) then {
                (unitBackpack _unit) addItemCargoGlobal [_elasticBandage,3];
                (unitBackpack _unit) addItemCargoGlobal [_quickClot,3];
                (unitBackpack _unit) addItemCargoGlobal [_packingBandage,3];
                (unitBackpack _unit) addItemCargoGlobal [_tourniquet,1];
            };
        };
        (unitBackpack _unit) addMagazineCargoGlobal ["DemoCharge_Remote_Mag",3];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_mk84",1];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_an_m8hc",2];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_m67",4];
        (unitBackpack _unit) addMagazineCargoGlobal ["30Rnd_556x45_Stanag",7];
        (unitBackpack _unit) addMagazineCargoGlobal ["20Rnd_556x45_UW_mag",4];
        // Night vision.
        if ((bmt_var_equipNightVision == 1) or (bmt_var_equipNightVision == 2)) then {
                (unitBackpack _unit) addItemCargoGlobal [_nightVision,1];
        };

        // Glasses.
        _unit addGoggles _glassesDIV;

        // Primary weapon
        _unit addWeapon _pweaponDIV;
    };

    // Diver.
    case "div": {
        // Remove uniform, helmet and vest.
        removeUniform _unit;
        removeHeadgear _unit;
        removeGoggles _unit;

        // Uniform, vest and backpack.
        _unit forceAddUniform _uniformDIV;
        _unit addVest _vestDIV;
        _unit addBackpack _backpackDIV;

        // Items in the uniform.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (uniformContainer _unit) addItemCargoGlobal [_earPlugs,1];
            (uniformContainer _unit) addItemCargoGlobal [_morphine,1];
            (uniformContainer _unit) addItemCargoGlobal [_epinephrine,1];
            (uniformContainer _unit) addItemCargoGlobal [_bandage,2];
            if (bmt_var_equipFlashlight) then {
                (uniformContainer _unit) addItemCargoGlobal [_flashlight, 1];
            };
        };
        (uniformContainer _unit) addMagazineCargoGlobal ["rhsusf_mag_7x45acp_MHP",4];
        (uniformContainer _unit) addMagazineCargoGlobal ["20Rnd_556x45_UW_mag",3];

        // Items in the vest.
        // Items cannot be added to diving rebreather.

        // Items in the backpack.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (unitBackpack _unit) addItemCargoGlobal [_bandage,2];
            if (bmt_mod_ace3 and (bmt_param_ace3_medicalSystem == 2)) then {
                (unitBackpack _unit) addItemCargoGlobal [_elasticBandage,3];
                (unitBackpack _unit) addItemCargoGlobal [_quickClot,3];
                (unitBackpack _unit) addItemCargoGlobal [_packingBandage,3];
                (unitBackpack _unit) addItemCargoGlobal [_tourniquet,1];
            };
        };
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_mk84",1];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_an_m8hc",2];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_m67",4];
        (unitBackpack _unit) addMagazineCargoGlobal ["30Rnd_556x45_Stanag",7];
        (unitBackpack _unit) addMagazineCargoGlobal ["20Rnd_556x45_UW_mag",4];
        // Night vision.
        if ((bmt_var_equipNightVision == 1) or (bmt_var_equipNightVision == 2)) then {
                (unitBackpack _unit) addItemCargoGlobal [_nightVision,1];
        };

        // Glasses.
        _unit addGoggles _glassesDIV;

        // Primary weapon
        _unit addWeapon _pweaponDIV;
    };

    // Helicopter pilot.
    case "hplt": {
        // Remove uniform, helmet and vest.
        removeUniform _unit;
        removeHeadgear _unit;
        removeGoggles _unit;

        // Uniform and parachute.
        _unit forceAddUniform _uniformHPLT;
        _unit addBackpack _parachuteHPLT;
        _unit addHeadgear _helmetHPLT;

        // Items in the uniform.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (uniformContainer _unit) addItemCargoGlobal [_earPlugs,1];
            (uniformContainer _unit) addItemCargoGlobal [_morphine,1];
            (uniformContainer _unit) addItemCargoGlobal [_epinephrine,1];
            if (bmt_var_equipFlashlight) then {
                (uniformContainer _unit) addItemCargoGlobal [_flashlight, 1];
            };
        };
        (uniformContainer _unit) addItemCargoGlobal [_pweaponSilencer,1];
        (uniformContainer _unit) addMagazineCargoGlobal ["rhsusf_mag_7x45acp_MHP",2];
        (uniformContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",4];

        // Primary weapon
        _unit addWeapon _pweapon;
        _unit addPrimaryWeaponItem _pweaponSurefire;
        _unit addPrimaryWeaponItem _pweaponLaserLantern;
        _unit addPrimaryWeaponItem _pweaponScope;

    };

    // Jet pilot.
    case "jplt": {
        // Remove uniform, helmet and vest.
        removeUniform _unit;
        removeHeadgear _unit;
        removeGoggles _unit;

        // Uniform and parachute.
        _unit forceAddUniform _uniformJPLT;
        _unit addBackpack _parachuteJPLT;
        _unit addHeadgear _helmetJPLT;

        // Items in the uniform.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (uniformContainer _unit) addItemCargoGlobal [_earPlugs,1];
            (uniformContainer _unit) addItemCargoGlobal [_morphine,1];
            (uniformContainer _unit) addItemCargoGlobal [_epinephrine,1];
            if (bmt_var_equipFlashlight) then {
                (uniformContainer _unit) addItemCargoGlobal [_flashlight, 1];
            };
        };
        (uniformContainer _unit) addItemCargoGlobal [_pweaponSilencer,1];
        (uniformContainer _unit) addMagazineCargoGlobal ["rhsusf_mag_7x45acp_MHP",2];
        (uniformContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",4];

        // Primary weapon
        _unit addWeapon _pweapon;
        _unit addPrimaryWeaponItem _pweaponSurefire;
        _unit addPrimaryWeaponItem _pweaponLaserLantern;
        _unit addPrimaryWeaponItem _pweaponScope;
    };

    // Combat crew
    case "ccrw": {
        // Vest and Backpack.
        _unit addVest _vestCRW;
        _unit addBackpack _backpack;

        // Helmet.
        removeHeadgear _unit;
        _unit addHeadgear _helmetCRW;

        // Items in the uniform.
        (uniformContainer _unit) addItemCargoGlobal [_pweaponSilencer,1];
        (uniformContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",1];
        if (bmt_mod_ace3 or bmt_mod_agm) then{
            (uniformContainer _unit) addItemCargoGlobal [_clacker,1];
        };

        // Items in the vest.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (vestContainer _unit) addItemCargoGlobal [_bandage,2];
        };
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",8];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",1];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_m67",4];

        // Items in the backpack.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (unitBackpack _unit) addItemCargoGlobal [_bandage,2];
            if (bmt_mod_ace3 and (bmt_param_ace3_medicalSystem == 2)) then {
                (unitBackpack _unit) addItemCargoGlobal [_elasticBandage,3];
                (unitBackpack _unit) addItemCargoGlobal [_quickClot,3];
                (unitBackpack _unit) addItemCargoGlobal [_packingBandage,3];
                (unitBackpack _unit) addItemCargoGlobal [_tourniquet,1];
            };
        };
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_mk84", 1];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag", 4];
        (unitBackpack _unit) addItemCargoGlobal ["ToolKit", 1];

        // Primary weapon
        _unit addWeapon _pweapon;
        _unit addPrimaryWeaponItem _pweaponSurefire;
        _unit addPrimaryWeaponItem _pweaponLaserLantern;
        _unit addPrimaryWeaponItem _pweaponScope;

        // Night vision.
        if ((bmt_var_equipNightVision == 1) or (bmt_var_equipNightVision == 2)) then {
            if (bmt_var_equipNightVision == 1) then {
                (unitBackpack _unit) addItemCargoGlobal [_nightVision,1];
            } else {
                _unit linkItem _nightVision;
            };
        };
    };

    case "hmmwv": {
        clearWeaponCargoGlobal _unit;
        clearMagazineCargoGlobal _unit;
        clearItemCargoGlobal _unit;
        clearBackpackCargoGlobal _unit;

        _unit addWeaponCargoGlobal [_pweaponDM,1];
        _unit addItemCargoGlobal [_pweaponScopeDM, 1];
        _unit addItemCargoGlobal [_pweaponBipodDM, 1];
        _unit addWeaponCargoGlobal [_pweaponLauncherAT,2];
        _unit addMagazineCargoGlobal ["rhs_fgm148_magazine_AT",2];
        _unit addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",10];
        _unit addMagazineCargoGlobal ["rhs_mag_m67",5];
        _unit addMagazineCargoGlobal ["rhsusf_100Rnd_556x45_soft_pouch",5];
        _unit addMagazineCargoGlobal ["SatchelCharge_Remote_Mag",2];
        _unit addMagazineCargoGlobal ["rhs_mag_M433_HEDP",8];
        _unit addMagazineCargoGlobal ["rhsusf_20Rnd_762x51_m118_special_Mag",6];
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            _unit addItemCargoGlobal [_clacker,1];
            _unit addItemCargoGlobal [_morphine,10];
            _unit addItemCargoGlobal [_epinephrine,10];
            _unit addItemCargoGlobal [_bandage,10];
            _unit addItemCargoGlobal [_bloodBag500,5];
            if (bmt_mod_ace3 and (bmt_param_ace3_medicalSystem == 2)) then {
                _unit addItemCargoGlobal [_atropine,10];
                _unit addItemCargoGlobal [_elasticBandage,10];
                _unit addItemCargoGlobal [_quickClot,10];
                _unit addItemCargoGlobal [_packingBandage,10];
                _unit addItemCargoGlobal [_salineBag500,5];

                _unit addItemCargoGlobal [_plasmaBag500,5];

                _unit addItemCargoGlobal [_surgicalKit,3];
                _unit addItemCargoGlobal [_personalAidKid,3];
            };
        };
    };

    case "abrams": {
        clearWeaponCargoGlobal _unit;
        clearMagazineCargoGlobal _unit;
        clearItemCargoGlobal _unit;
        clearBackpackCargoGlobal _unit;

        _unit addWeaponCargoGlobal ["rhs_weap_M136", 2];
        _unit addMagazineCargoGlobal ["rhs_m136_mag", 2];
        _unit addItemCargoGlobal ["ToolKit", 1];
        _unit addItemCargoGlobal ["rhs_mine_M19_mag",3];
        _unit addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag", 20];
        _unit addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red", 10];
        _unit addMagazineCargoGlobal ["rhs_mag_m67", 10];
        _unit addMagazineCargoGlobal ["rhs_mag_m714_White",3];
        _unit addMagazineCargoGlobal ["rhs_mag_an_m8hc",2];
        _unit addMagazineCargoGlobal ["rhs_mag_M433_HEDP",5];

        if (bmt_mod_ace3 or bmt_mod_agm) then {
            _unit addItemCargoGlobal [_clacker,1];
            _unit addItemCargoGlobal [_morphine,10];
            _unit addItemCargoGlobal [_epinephrine,10];
            _unit addItemCargoGlobal [_bandage,10];
            if (bmt_mod_ace3 and (bmt_param_ace3_medicalSystem == 2)) then {
                _unit addItemCargoGlobal [_atropine,10];
                _unit addItemCargoGlobal [_elasticBandage,10];
                _unit addItemCargoGlobal [_quickClot,10];
                _unit addItemCargoGlobal [_packingBandage,10];
                _unit addItemCargoGlobal [_salineBag500,5];
            };
        };
    };

    default {
        _unit sideChat format ["DEBUG (bmt_configEquipment_rhs_usaf.sqf): unit role %1 is not defined. Defaulting to rifleman.", _unitRole];

        // Vest and Backpack.
        _unit addVest _vestRFL;
        _unit addBackpack _backpack;

        // Items in the uniform.
        (uniformContainer _unit) addItemCargoGlobal [_pweaponSilencer,1];
        (uniformContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",1];

        // Items in the vest.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (vestContainer _unit) addItemCargoGlobal [_bandage,2];
        };
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",8];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",1];
        (vestContainer _unit) addMagazineCargoGlobal ["rhs_mag_m67",4];

        // Items in the backpack.
        if (bmt_mod_ace3 or bmt_mod_agm) then {
            (unitBackpack _unit) addItemCargoGlobal [_bandage,2];
            if (bmt_mod_ace3 and (bmt_param_ace3_medicalSystem == 2)) then {
                (unitBackpack _unit) addItemCargoGlobal [_elasticBandage,3];
                (unitBackpack _unit) addItemCargoGlobal [_quickClot,3];
                (unitBackpack _unit) addItemCargoGlobal [_packingBandage,3];
                (unitBackpack _unit) addItemCargoGlobal [_tourniquet,1];
            };
        };
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag",5];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_30Rnd_556x45_M855A1_Stanag_Tracer_Red",2];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_mk84",2];
        (unitBackpack _unit) addMagazineCargoGlobal ["rhs_mag_an_m8hc",2];

        // Primary weapon
        _unit addWeapon _pweapon;
        _unit addPrimaryWeaponItem _pweaponSurefire;
        _unit addPrimaryWeaponItem _pweaponLaserLantern;
        _unit addPrimaryWeaponItem _pweaponScope;

        // Night vision.
        if ((bmt_var_equipNightVision == 1) or (bmt_var_equipNightVision == 2)) then {
            if (bmt_var_equipNightVision == 1) then {
                (unitBackpack _unit) addItemCargoGlobal [_nightVision,1];
            } else {
                _unit linkItem _nightVision;
            };
        };
    };
};

// Primary weapon selected by default.
if (_isInfantry) then {
    _unit selectWeapon (primaryWeapon _unit);
};

// Unit insignia.
[_unit,_unitInsignia] call bis_fnc_setUnitInsignia;

//============================================= END OF FILE =============================================//
