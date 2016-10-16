
//=======================================================================================================//
// File: bmt_t8_groupConfigs_LOP.sqf                                                                     //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/11/26                                                                             //
// Description: This file defines group configurations for T8 Units. Only those groups in Leights Opfor  //
//              Pack are defined here. Originally based on SavageCDN's configuration files:              //
//              https://github.com/SavageCDN/T8Units_Group_Configs                                       //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

//=======================================================================================================//
// (LOP) Leights Opfor Pack: Afghan Militia                                                              //
//          Group                             Array name                                                 //
//          Antiarmor (Infantry)              _groupArray_LOP_AM_infantry_antiarmor                      //
//          Rifle Squad (Infantry)            _groupArray_LOP_AM_infantry_rifleSquad                     //
//          Sentry (Infantry)                 _groupArray_LOP_AM_infantry_sentry                         //
//          Support Team (Infantry)           _groupArray_LOP_AM_infantry_supportTeam                    //
//          Mechanised Infantry (Mechanised)  _groupArray_LOP_AM_mechInfantry_landroverM2                //
//          T-72 Platoon (Armored)            _groupArray_LOP_AM_mechInfantry_landroverM2                //
//=======================================================================================================//

// Antiarmor (Infantry)
_groupArray_LOP_AM_infantry_antiarmor = [
    "LOP_AM_Infantry_SL",
    "LOP_AM_Infantry_TL",
    "LOP_AM_Infantry_Rifleman", "LOP_AM_Infantry_Rifleman", "LOP_AM_Infantry_Rifleman",
    "LOP_AM_Infantry_AT", "LOP_AM_Infantry_AT", "LOP_AM_Infantry_AT",
    "LOP_AM_Infantry_Corpsman"
];

//Rifle Squad (Infantry)
_groupArray_LOP_AM_infantry_rifleSquad = [
    "LOP_AM_Infantry_SL",
    "LOP_AM_Infantry_TL",
    "LOP_AM_Infantry_Rifleman", "LOP_AM_Infantry_Rifleman",
    "LOP_AM_Infantry_Marksman",
    "LOP_AM_Infantry_GL",
    "LOP_AM_Infantry_AR",
    "LOP_AM_Infantry_AT",
    "LOP_AM_Infantry_AT"
];

// Sentry (Infantry)
_groupArray_LOP_AM_infantry_sentry = [
    "LOP_AM_Infantry_Rifleman", "LOP_AM_Infantry_Rifleman"
];

// Support Team (Infantry)
_groupArray_LOP_AM_infantry_supportTeam = [
    "LOP_AM_Infantry_SL",
    "LOP_AM_Infantry_TL",
    "LOP_AM_Infantry_Rifleman",
    "LOP_AM_Infantry_GL", "LOP_AM_Infantry_GL",
    "LOP_AM_Infantry_AR", "LOP_AM_Infantry_AR",
    "LOP_AM_Infantry_AT",
    "LOP_AM_Infantry_Corpsman"
];

// Mechanised Infantry (Mechanised)
_groupArray_LOP_AM_mechInfantry_landroverM2 = [
    "LOP_AM_Infantry_SL",
    "LOP_AM_Infantry_TL",
    "LOP_AM_Infantry_GL", "LOP_AM_Infantry_GL",
    "LOP_AM_Infantry_AR",
    "LOP_AM_Infantry_Corpsman",
    "LOP_AM_Landrover_M2"
];

// T-72 Platoon (Armored)
_groupArray_LOP_AM_armored_T72Platoon = [
    "LOP_AM_T72BA", "LOP_AM_T72BA", "LOP_AM_T72BA"
];

//============================================= END OF FILE =============================================//
