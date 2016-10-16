//=======================================================================================================//
// File: bmt_ace3_configuration.sqf                                                                      //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/04/27                                                                             //
// Description: This document is used for configuring ACE3 variables that affect units like medics,      //
//              repair specialists, explosive specialists, etc.                                          //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

private ["_medics", "_doctors", "_medicVehicles", "_medicFacilities"];
private ["_expSpecialists", "_engineers", "_repairVehicles", "_repairFacilities"];
private ["_surrenderedUnits", "_handcuffedUnits"];
private ["_heliFRIES"];

// Unit name variables must be declared as string.

// Medical
_medics = ["bmt_Alpha1_5"];
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
_surrenderedUnits = ["bmt_marine1","bmt_marine2","bmt_marine3","bmt_marine4"];
_handcuffedUnits = ["bmt_marine1","bmt_marine2","bmt_marine3","bmt_marine4"];

// Fastroping
_heliFRIES = [];

//============================================= END OF FILE =============================================//
