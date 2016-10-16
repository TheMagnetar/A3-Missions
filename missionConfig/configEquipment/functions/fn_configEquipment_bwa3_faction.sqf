//=======================================================================================================//
// File: fn_configEquipment_bwa3_faction.sqf                                                             //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/11/05                                                                             //
// Description: This function equips the unit according to a specified role and depending on the faction //
//              it belongs to.                                                                           //
//              Arguments:                                                                               //
//               - 0: unit role <STRING> or unit role with additional options <ARRAY>.                   //
//               - 1: unit <OBJECT>.                                                                     //
//               - 2: unit faction <STRING><OPTIONAL>.                                                   //
//              Examples:                                                                                //
//               - Unit is a Fire Team Leader.                                                           //
//                   ["tl", this] call bmt_fnc_configEquipment;                                          //
//                                                                                                       //
//              Unit role can be one of the following entries:                                           //
//                                                                                                       //
//                  Unit Role               Assigned role                                                //
//                                                                                                       //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

//=======================================================================================================//
// Variable declarations.                                                                                //
//=======================================================================================================//
private["_isInfantry", "_unitRole"];
private["_uniform", "_vestLD", "_vestRFL", "_vestGR", "_vestDM", "_vestME", "_vestAR", "_helmet", "_helmetSN", "_backpack", "uavBackpack", "_unitInsignia"];
private["_uavBattery", "_cableTie", "_mapTools", "_microDAGR", "_earPlugs", "_vectorIV", "_atragmx", "_kestrel", "_clacker", "_clackerm26", "_defusalKit", "_cellphone"];
private["_atropine", "_epinephrine", "_morphine", "_bandage", "_elasticBandage", "_quickClot", "_packingBandage"];
private["_bloodBag250", "_bloodBag500", "_bloodBag1000", "_plasmaBag250", "_plasmaBag500", "_plasmaBag1000", "_salineBag250", "_salineBag500", "_salineBag1000"];
private["_personalAidKid", "_surgicalKit", "_tourniquet"];

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

if (use_flecktarn) then {
    _vest = "BWA3_Vest_Fleck";
    _vestRFL = "BWA3_Vest_Rifleman1_Fleck";
    _vestAR = "BWA3_Vest_Autorifleman_Fleck";
    _vestGR = "BWA3_Vest_Grenadier_Fleck";
    _vestME = "BWA3_Vest_Medic_Fleck";
    _vestDM = "BWA3_Vest_Marksman_Fleck";
    _vestLD = "BWA3_Vest_Leader_Fleck";

    _helmet = "BWA3_OpsCore_Fleck";
} else {
    _vest = "BWA3_Vest_Tropen";
    _vestRFL = "BWA3_Vest_Rifleman1_Tropen";
    _vestAR = "BWA3_Vest_Autorifleman_Tropen";
    _vestGR = "BWA3_Vest_Grenadier_Tropen";
    _vestME = "BWA3_Vest_Medic_Tropen";
    _vestDM = "BWA3_Vest_Marksman_Tropen";
    _vestLD = "BWA3_Vest_Leader_Tropen";

    _helmet = "BWA3_OpsCore_Tropen";
};

// Uniforms.
_uniform = "rhs_uniform_cu_ocp";

// Vests.
_vestTL = "rhsusf_iotv_ocp_teamleader";
_vestRFL = "rhsusf_iotv_ocp_rifleman";
_vestGR = "rhsusf_iotv_ocp_grenadier";
_vestDM = "rhsusf_iotv_ocp_rifleman";
_vestME = "rhsusf_iotv_ocp_medic";
_vestAR = "rhsusf_iotv_ocp_SAW";
_vestMG = "rhsusf_iotv_ocp_SAW";
_vestCREW = "rhsusf_iotv_ocp_rifleman";

// Helmets.
_helmet = "rhsusf_ach_helmet_headset_ocp";
_helmetSN = "rhs_Booniehat_ocp";

// Backpacks.
_backpack = "rhsusf_assault_eagleaiii_ocp";

// Insignia
_unitInsignia = "";

//============================================= END OF FILE =============================================//
