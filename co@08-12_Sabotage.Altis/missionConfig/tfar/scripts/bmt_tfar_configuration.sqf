//=======================================================================================================//
// File: bmt_tfar_configuration.sqf                                                                      //
// Author: TheMagnetar                                                                                   //
// Version 0.1                                                                                           //
// File creation: 2015/03/09                                                                             //
// Description: This document is used in order to define basic configuration parameters of the mod       //
//              Task Force Arrowhead Radio (TFAR) that can be found in:                                  //
//              https://github.com/michail-nikolaev/task-force-arma-3-radio/wiki                         //
//                                                                                                       //
//              Arguments:                                                                               //
//               - none                                                                                  //
//                                                                                                       //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

// Disables automatic distribution of long range radios to squad and team leaders.
tf_no_auto_long_range_radio = true;

// Generate identical short range radio configurations for the entire faction.
tf_same_sw_frequencies_for_side = true;

// Generate identical long range radio configuracions for the entire faction.
tf_same_lr_frequencies_for_side = true;

// Assign watch (false) or microDAGR (true).
tf_give_microdagr_to_soldier = true;

// Radios to be distributed among the units.
// [Long range radio, short range radio, rifleman radio]
bmt_list_tfar_radiosWest = ["tf_rt1523g_big_rhs", TF_defaultWestPersonalRadio, TF_defaultWestRiflemanRadio];
bmt_list_tfar_radiosEast = [TF_defaultEastBackpack, TF_defaultEastPersonalRadio, TF_defaultEastRiflemanRadio];
bmt_list_tfar_radiosGuer = [TF_defaultGuerBackpack, TF_defaultGuerPersonalRadio, TF_defaultGuerRiflemanRadio];

//============================================= END OF FILE =============================================//
