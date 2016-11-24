//=======================================================================================================//
// File: bmt_ace3_configuration.sqf                                                                      //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/04/27                                                                             //
// Description: This document is used for configuring ACE3 variables that affect units like medics,      //
//              repair specialists, explosive specialists, etc.                                          //
//                                                                                                       //
//              Arguments:                                                                               //
//               - none                                                                                  //
//                                                                                                       //
//              Examples:                                                                                //
//               - Unit `bmt_alpha1_1` and `bmt_alpha2_3` are medics and `bmt_medevac_1` is a medical    //
//                 helicopter equipped with FRIES.                                                       //
//                   _medics        = ["bmt_alpha1_1", "bmt_alpha2_3"];                                  //
//                   _medicVehicles = ["bmt_medevac_1"];                                                 //
//                   _heliFRIES     = ["bmt_medevac_1"];                                                 //
//                                                                                                       //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

private ["_medics", "_doctors", "_medicVehicles", "_medicFacilities"];
private ["_expSpecialists", "_engineers", "_repairVehicles", "_repairFacilities"];
private ["_surrenderedUnits", "_handcuffedUnits"];
private ["_heliFRIES"];

// Unit name variables must be declared as string.

// Medical
_medics = [];
_medicVehicles = [];
_medicFacilities = [];
_doctors = [];

// Explosives
_expSpecialists = [];

// Repair
_engineers = [];
_repairVehicles = [];
_repairFacilities = [];

// Captives
_surrenderedUnits = [];
_handcuffedUnits = [];

// Fastroping
_heliFRIES = [];

//============================================= END OF FILE =============================================//
