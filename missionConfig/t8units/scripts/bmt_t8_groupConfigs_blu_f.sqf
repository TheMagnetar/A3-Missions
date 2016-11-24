//=======================================================================================================//
// File: bmt_t8_groupConfigs_blu_f.sqf                                                                   //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/11/26                                                                             //
// Description: This file defines group configurations for T8 Units. Only those groups in the vanilla    //
//              BLUFOR faction. Originally based on SavageCDN's configuration files:                     //
//              https://github.com/SavageCDN/T8Units_Group_Configs                                       //
//                                                                                                       //
//              Arguments:                                                                               //
//               - none                                                                                  //
//                                                                                                       //
//              Defined group configurations:                                                            //
//                    Group                             Array name                                       //
//                    Air-defense Team (Infantry)        _groupArray_BLU_F_BUS_InfTeam_AA                //
//                    Anti-armor Team (Infantry)         _groupArray_BLU_F_BUS_InfTeam_AT                //
//                    Assault Squad (Infantry)           _groupArray_BLU_F_BUS_InfAssault                //
//                    Fire Team (Infantry)               _groupArray_BLU_F_BUS_InfTeam                   //
//                    Rifle Squad (Infantry)             _groupArray_BLU_F_BUS_InfSquad                  //
//                    GMG Team (Infantry)                _groupArray_BLU_F_BUS_support_GMG               //
//                    HMG Team (Infantry)                _groupArray_BLU_F_BUS_support_MG                //
//                    Mortar Team (Infantry)             _groupArray_BLU_F_BUS_support_Mort              //
//                    Sentry (Infantry)                  _groupArray_BLU_F_BUS_InfSentry                 //
//                    Sniper Team (Infantry)             _groupArray_BLU_F_BUS_SniperTeam                //
//                    Support Team (CLS, Infantry)       _groupArray_BLU_F_BUS_support_CLS               //
//                    Support Team (EOD, Infantry)       _groupArray_BLU_F_BUS_support_EOD               //
//                    Support Team (Engineer, Infantry)  _groupArray_BLU_F_BUS_support_ENG               //
//                    Recon Patrol (Infantry)            _groupArray_BLU_F_BUS_reconPatrol               //
//                    Recon Sentry (Infantry)            _groupArray_BLU_F_BUS_reconSentry               //
//                    Recon Squad (Infantry)             _groupArray_BLU_F_BUS_reconSquad                //
//                    Recon Support Team (EOD, Infantry) _groupArray_BLU_F_BUS_recon_EOD                 //
//                    Recon Team (Infantry)              _groupArray_BLU_F_BUS_reconTeam                 //
//                    Weapons Squad (Infantry)           _groupArray_BLU_F_BUS_InfSquad_Weapons          //
//                                                                                                       //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

//=======================================================================================================//
// Regular Infantry                                                                                      //
//=======================================================================================================//

// Air-defense Team (Infantry)
_groupArray_BLU_F_BUS_InfTeam_AA = [
    "B_soldier_TL_F",
    "B_soldier_AA_F",
    "B_soldier_AA_F",
    "B_soldier_AAA_F"
];

// Anti-armor Team (Infantry)
_groupArray_BLU_F_BUS_InfTeam_AT = [
    "B_soldier_TL_F",
    "B_soldier_AT_F",
    "B_soldier_AT_F",
    "B_soldier_AAT_F"
];

// Assault Squad (Infantry)
_groupArray_BLU_F_BUS_InfAssault = [
    "B_soldier_SL_F",
    "B_soldier_AR_F",
    "B_HeavyGunner_F",
    "B_soldier_AAR_F",
    "B_soldier_M_F",
    "B_Sharpshooter_F",
    "B_soldier_LAT_F",
    "B_medic_F"
];

// Fire Team (Infantry)
_groupArray_BLU_F_BUS_InfTeam = [
    "B_soldier_TL_F",
    "B_soldier_AR_F",
    "B_soldier_GL_F",
    "B_soldier_LAT_F"
];

// Rifle Squad (Infantry)
_groupArray_BLU_F_BUS_InfSquad = [
    "B_soldier_SL_F",
    "B_soldier_F",
    "B_soldier_LAT_F",
    "B_soldier_M_F",
    "B_soldier_TL_F",
    "B_soldier_AR_F",
    "B_soldier_A_F",
    "B_soldier_AAR_F",
    "B_medic_F"
];

// Sentry (Infantry)
_groupArray_BLU_F_BUS_InfSentry = [
    "B_soldier_GL_F",
    "B_soldier_F"
];

// Sniper Team (Infantry)
_groupArray_BLU_F_BUS_SniperTeam = [
    "B_sniper_F",
    "B_spotter_F"
];

// Weapons Squad (Infantry)
_groupArray_BLU_F_BUS_InfSquad_Weapons = [
    "B_soldier_SL_F",
    "B_soldier_AR_F",
    "B_soldier_GL_F",
    "B_soldier_M_F",
    "B_soldier_AT_F",
    "B_soldier_A_F",
    "B_soldier_AAT_F",
    "B_medic_F"
];

//=======================================================================================================//
// Support Infantry                                                                                      //
//=======================================================================================================//

// GMG Team (Infantry)
_groupArray_BLU_F_BUS_support_GMG = [
    "B_soldier_TL_F",
    "B_support_GMG_F",
    "B_support_AMG_F"
];

// HMG Team (Infantry)
_groupArray_BLU_F_BUS_support_MG = [
    "B_soldier_TL_F",
    "B_support_MG_F",
    "B_support_AMG_F"
];

// Mortar Team (Infantry)
_groupArray_BLU_F_BUS_support_Mort = [
    "B_soldier_TL_F",
    "B_support_Mort_F",
    "B_support_AMort_F"
];

// Support Team (CLS, Infantry)
_groupArray_BLU_F_BUS_support_CLS = [
    "B_soldier_TL_F",
    "B_soldier_AR_F",
    "B_medic_F",
    "B_medic_F"
];

// Support Team (EOD, Infantry)
_groupArray_BLU_F_BUS_support_EOD = [
    "B_soldier_TL_F",
    "B_engineer_F",
    "B_soldier_exp_F",
    "B_soldier_exp_F"
];

// Support Team (Engineer, Infantry)
_groupArray_BLU_F_BUS_support_ENG = [
    "B_soldier_TL_F",
    "B_engineer_F",
    "B_engineer_F",
    "B_soldier_repair_F"
];

//=======================================================================================================//
// Recon Infantry                                                                                        //
//=======================================================================================================//

// Recon Patrol (Infantry)
_groupArray_BLU_F_BUS_reconPatrol = [
    "B_recon_TL_F",
    "B_recon_M_F",
    "B_recon_medic_F",
    "B_recon_F"
];

// Recon Sentry (Infantry)
_groupArray_BLU_F_BUS_reconSentry = [
    "B_recon_M_F",
    "B_recon_F"
];

// Recon Squad (Infantry)
_groupArray_BLU_F_BUS_reconSquad = [
    "B_recon_TL_F",
    "B_recon_M_F",
    "B_recon_medic_F",
    "B_recon_F",
    "B_recon_LAT_F",
    "B_recon_JTAC_F",
    "B_recon_exp_F",
    "B_recon_Sharpshooter_F"
];

// Recon Team (Infantry)
_groupArray_BLU_F_BUS_reconTeam = [
    "B_recon_TL_F",
    "B_recon_M_F",
    "B_recon_medic_F",
    "B_recon_LAT_F",
    "B_recon_JTAC_F",
    "B_recon_exp_F"
];

//=======================================================================================================//
// Recon Support Infantry                                                                                //
//=======================================================================================================//

// Recon Support Team (EOD, Infantry)
_groupArray_BLU_F_BUS_recon_EOD = [
    "B_recon_TL_F",
    "B_recon_exp_F",
    "B_recon_exp_F",
    "B_recon_F"
];

//============================================= END OF FILE =============================================//
