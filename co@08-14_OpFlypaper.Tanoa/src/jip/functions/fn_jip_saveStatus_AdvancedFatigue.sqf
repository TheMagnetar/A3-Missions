//=======================================================================================================//
// File: fn_jip_saveStatus_AdvancedFatigue.sqf                                                           //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2016/11/12                                                                             //
// Description: This function stores global client variables related to ACE advanced fatigue in order to //
//              persist them.                                                                            //
//                                                                                                       //
//              Arguments:                                                                               //
//               - 0: unit that whill have its ACE advanced fatigue.                                     //
//                                                                                                       //
// Changes: 1.0 (2016/11/12) First public version.                                                       //
//=======================================================================================================//

params ["_unit"];

_unit setVariable ["bmt_var_ace_advancedfatigue_ae1Reserve", ace_advanced_fatigue_ae1Reserve, true];
_unit setVariable ["bmt_var_ace_advancedfatigue_ae2Reserve", ace_advanced_fatigue_ae2Reserve, true];
_unit setVariable ["bmt_var_ace_advancedfatigue_anReserve", ace_advanced_fatigue_anReserve, true];
_unit setVariable ["bmt_var_ace_advancedfatigue_anFatigue", ace_advanced_fatigue_anFatigue, true];
_unit setVariable ["bmt_var_ace_advancedfatigue_muscleDamage", ace_advanced_fatigue_muscleDamage, true];

//============================================= END OF FILE =============================================//
