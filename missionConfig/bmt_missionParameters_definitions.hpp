//=======================================================================================================//
// File: bmt_missionParameters_definitions.hpp                                                           //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/11/26                                                                             //
// Description: This file has the purpose to define the different mission parameters without requiring   //
//              to change them in each of the module folders. No entry should be manually deleted.       //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

//=======================================================================================================//
// GENERAL: General mission parameters.                                                                  //
//=======================================================================================================//
#define BMT_DEBUG     1  // 0 = Debug disabled, 1 = Debug enabled

//=======================================================================================================//
// Advanced Combat Environment 3 (ACE3)                                                                  //
//=======================================================================================================//
#define BMT_ACE3_BALLISTICS 1 // 0 = Basic, 1 = Advanced ballistics.
#define BMT_ACE3_MEDICAL    2 // 0 = Disabled, 1 = Basic medical system, 2 = Advanced medical system.
#define BMT_ACE3_SPECTATOR  0 // 0 = BI (End Game), 1 = ACE 3 Spectator mode.
#define BMT_ACE3_REVIVE     0 // 0 = Disabled, 1 = Players only, 2 = Players and AI.

//=======================================================================================================//
// Advanced Combat Radio Environment 2 (ACRE2)                                                           //
//=======================================================================================================//
#define BMT_ACRE2_CONFIGURE_CHANNELS 1 // 0 = Do not configure radio channels, 1 = Configure radio channels
#define BMT_ACRE2_DISTRIBUTE_RADIOS  1 // 0 = Do not distribute radios, 1 = Distribute radios

//=======================================================================================================//
// ASR AI 3                                                                                              //
//=======================================================================================================//
#define BMT_ASRAI_ENABLE 1 // 0 = Disable, 1 = Enable
#define BMT_ASRAI_DEBUG  0 // 0 = No debug, 1 = With debug

//=======================================================================================================//
// Dynamic-AI-Creator 3 (DAC3)                                                                           //
//=======================================================================================================//
#define BMT_DAC_ENABLE 1 // 0 = Disable, 1 = Enable
#define BMT_DAC_DEBUG  2 // 0 = No debug, 1 = Simplified debug, 2 = Full debug

//=======================================================================================================//
// JIP support                                                                                           //
//=======================================================================================================//
#define BMT_JIP_ENABLED      1    // 0 = JIP disabled, 1 = JIP enabled.
#define BMT_JIP_SAVESTATUS     1    // 0 = Disabled, 1 = Enabled.

//=======================================================================================================//
// RESPAWN                                                                                               //
//=======================================================================================================//
#define BMT_RESPAWN_NUMTICKETS_CONFIG    2 // 0 = Unlimited, 1 = No tickets, 2 = Mission based.
#define BMT_RESPAWN_SAVEGEAR             1 // 0 = Gear is not saved, 1 gear is saved.
#define BMT_RESPAWN_TICKETS              1 // 0 = per side, 1 = on a player basis.
#define BMT_RESPAWN_KILLCAM              0 // 0 = Disabled, 1 = Enabled

//=======================================================================================================//
// T8 Units                                                                                              //
//=======================================================================================================//
#define BMT_T8UNITS_ENABLE 1 // 0 = Disable, 1 = Enable
#define BMT_T8UNITS_DEBUG  1 // 0 = No debug, 1 = With debug
#define BMT_T8UNITS_DAC    1 // 0 = Without DAC support, 1 = With DAC support

//=======================================================================================================//
// Task Force Arrowhead Radio (TFAR)                                                                     //
//=======================================================================================================//
#define BMT_TFAR_DISTRIBUTE_RADIOS  1 // 0 = Do not distribute radios, 1 = Distribute radios
#define BMT_TFAR_CONFIGURE_CHANNELS 1 // 0 = Do not configure radio channels, 1 = Configure radio channels
#define BMT_TFAR_CONFIGURE_STEREO   1 // 0 = Do not configure stereo, 1 = Configure stereo

//=======================================================================================================//
// Virtual Arsenal Profiles for 1RA                                                                      //
//=======================================================================================================//
#define BMT_VAPROFILES  0 // 0 = Do not use virtual arsenal profiles, 1 = Use virtual arsenal profiles

//=======================================================================================================//
// ZEUS                                                                                                  //
//=======================================================================================================//
#define BMT_ZEUS_ADMIN 1 // 0 = Do not configure Zeus for the administrator, 1 = Configure Zeus for the administrator

//============================================= END OF FILE =============================================//
