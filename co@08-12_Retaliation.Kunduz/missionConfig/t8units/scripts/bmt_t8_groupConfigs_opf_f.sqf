//=======================================================================================================//
// File: bmt_t8_groupConfigs_opf_f.sqf                                                                   //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/11/26                                                                             //
// Description: This file defines group configurations for T8 Units. Only those groups in the vanilla    //
//              OPFOR faction. Originally based on SavageCDN's configuration files:                      //
//              https://github.com/SavageCDN/T8Units_Group_Configs                                       //
//                                                                                                       //
//              Defined group configurations:                                                            //
//                    Group                             Array name                                       //
//                    Air-defense Team (Infantry)        _groupArray_OPF_F_OIA_InfTeam_AA                //
//                    Anti-armor Team (Infantry)         _groupArray_OPF_F_OIA_InfTeam_AT                //
//                    Assault Squad (Infantry)           _groupArray_OPF_F_OIA_InfAssault                //
//                    Fire Team (Infantry)               _groupArray_OPF_F_OIA_InfTeam                   //
//                    Rifle Squad (Infantry)             _groupArray_OPF_F_OIA_InfSquad                  //
//                    GMG Team (Infantry)                _groupArray_OPF_F_OI_support_GMG                //
//                    Guard Sentry (Infantry)            _groupArray_OPF_F_OIA_GuardSentry               //
//                    Guard Squad (Infantry)             _groupArray_OPF_F_OIA_GuardSquad                //
//                    Guard Team (Infantry)              _groupArray_OPF_F_OIA_GuardTeam                 //
//                    HMG Team (Infantry)                _groupArray_OPF_F_OI_support_MG                 //
//                    Mortar Team (Infantry)             _groupArray_OPF_F_OI_support_Mort               //
//                    Sentry (Infantry)                  _groupArray_OPF_F_OIA_InfSentry                 //
//                    Sniper Team (Infantry)             _groupArray_OPF_F_OI_SniperTeam                 //
//                    Support Team (CLS, Infantry)       _groupArray_OPF_F_OI_support_CLS                //
//                    Support Team (EOD, Infantry)       _groupArray_OPF_F_OI_support_EOD                //
//                    Support Team (Engineer, Infantry)  _groupArray_OPF_F_OI_support_ENG                //
//                    Recon Patrol (Infantry)            _groupArray_OPF_F_OI_reconPatrol                //
//                    Recon Sentry (Infantry)            _groupArray_OPF_F_OI_reconSentry                //
//                    Recon Squad (Infantry)             _groupArray_OPF_F_OI_reconSquad                 //
//                    Recon Support Team (EOD, Infantry) _groupArray_OPF_F_OI_recon_EOD                  //
//                    Recon Team (Infantry)              _groupArray_OPF_F_OI_reconTeam                  //
//                    Weapons Squad (Infantry)           _groupArray_OPF_F_OIA_InfSquad_Weapons          //
//                                                                                                       //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

//=======================================================================================================//
// Regular Infantry                                                                                      //
//=======================================================================================================//

// Air-defense Team (Infantry)
_groupArray_OPF_F_OIA_InfTeam_AA = [
    "O_soldier_TL_F",
    "O_soldier_AA_F",
    "O_soldier_AA_F",
    "O_soldier_AAA_F"
];

// Anti-armor Team (Infantry)
_groupArray_OPF_F_OIA_InfTeam_AT = [
    "O_soldier_TL_F",
    "O_soldier_AT_F",
    "O_soldier_AT_F",
    "O_soldier_AAT_F"
];

// Assault Squad (Infantry)
_groupArray_OPF_F_OIA_InfAssault = [
    "O_soldier_SL_F",
    "O_soldier_AR_F",
    "O_HeavyGunner_F",
    "O_soldier_AAR_F",
    "O_soldier_M_F",
    "O_Sharpshooter_F",
    "O_soldier_LAT_F",
    "O_medic_F"
];

// Fire Team (Infantry)
_groupArray_OPF_F_OIA_InfTeam = [
    "O_soldier_TL_F",
    "O_soldier_AR_F",
    "O_soldier_GL_F",
    "O_soldier_LAT_F"
];

// Rifle Squad (Infantry)
_groupArray_OPF_F_OIA_InfSquad = [
    "O_soldier_SL_F",
    "O_soldier_F",
    "O_soldier_LAT_F",
    "O_soldier_M_F",
    "O_soldier_TL_F",
    "O_soldier_AR_F",
    "O_soldier_A_F",
    "O_soldier_AAR_F",
    "O_medic_F"
];

// Sentry (Infantry)
_groupArray_OPF_F_OIA_InfSentry = [
    "O_soldier_GL_F",
    "O_soldier_F"
];

// Sniper Team (Infantry)
_groupArray_OPF_F_OI_SniperTeam = [
    "O_sniper_F",
    "O_spotter_F"
];

// Weapons Squad
_groupArray_OPF_F_OIA_InfSquad_Weapons = [
    "O_soldier_SL_F",
    "O_soldier_AR_F",
    "O_soldier_GL_F",
    "O_soldier_M_F",
    "O_soldier_AT_F",
    "O_soldier_A_F",
    "O_soldier_AAT_F",
    "O_medic_F"
];

//=======================================================================================================//
// Support Infantry                                                                                      //
//=======================================================================================================//

// GMG Team (Infantry)
_groupArray_OPF_F_OI_support_GMG = [
    "O_soldier_TL_F",
    "O_support_GMG_F",
    "O_support_AMG_F"    //same for both GMG and HMG
];
// HMG Team (Infantry)
_groupArray_OPF_F_OI_support_MG = [
    "O_soldier_TL_F",
    "O_support_MG_F",
    "O_support_AMG_F"    //same for both GMG and HMG
];
// Mortar Team (Infantry)
_groupArray_OPF_F_OI_support_Mort = [
    "O_soldier_TL_F",
    "O_support_Mort_F",
    "O_support_AMort_F"
];

// Support Team (CLS, Infantry)
_groupArray_OPF_F_OI_support_CLS = [
    "O_soldier_TL_F",
    "O_soldier_AR_F",
    "O_medic_F",
    "O_medic_F"
];

// Support Team (Engineer, Infantry)
_groupArray_OPF_F_OI_support_ENG = [
    "O_soldier_TL_F",
    "O_engineer_F",
    "O_engineer_F",
    "O_soldier_repair_F"
];
// Support Team (EOD, Infantry)
_groupArray_OPF_F_OI_support_EOD = [
    "O_soldier_TL_F",
    "O_engineer_F",
    "O_soldier_exp_F",
    "O_soldier_exp_F"
];

//=======================================================================================================//
// Recon Infantry                                                                                        //
//=======================================================================================================//

// Recon Patrol (Infantry)
_groupArray_OPF_F_OI_reconPatrol = [
    "O_recon_TL_F",
    "O_recon_M_F",
    "O_recon_medic_F",
    "O_recon_F"
];
// Recon Sentry (Infantry)
_groupArray_OPF_F_OI_reconSentry = [
    "O_recon_M_F",
    "O_recon_F"
];

// Recon Squad (Infantry)
_groupArray_OPF_F_OI_reconSquad = [
    "O_recon_TL_F",
    "O_recon_M_F",
    "O_recon_medic_F",
    "O_recon_F",
    "O_recon_LAT_F",
    "O_recon_JTAC_F",
    "O_recon_exp_F",
    "O_recon_Sharpshooter_F"
];

// Recon Team (Infantry)
_groupArray_OPF_F_OI_reconTeam = [
    "O_recon_TL_F",
    "O_recon_M_F",
    "O_recon_medic_F",
    "O_recon_F",
    "O_recon_LAT_F",
    "O_recon_JTAC_F",
    "O_recon_exp_F"
];

//=======================================================================================================//
// Recon Support Infantry                                                                                //
//=======================================================================================================//

// Recon Support Team (EOD, Infantry)
_groupArray_OPF_F_OI_recon_EOD = [
    "O_recon_TL_F",
    "O_recon_exp_F",
    "O_recon_exp_F",
    "O_recon_F"
];

//=======================================================================================================//
// Urban Guard Infantry                                                                                  //
//=======================================================================================================//

// Guard Sentry (Infantry)
_groupArray_OPF_F_OIA_GuardSentry = [
    "O_soldierU_GL_F",
    "O_soldierU_F"
];
// Guard Squad (Infantry)
_groupArray_OPF_F_OIA_GuardSquad = [
    "O_soldierU_SL_F",
    "O_soldierU_F",
    "O_soldierU_LAT_F",
    "O_soldierU_M_F",
    "O_soldierU_TL_F",
    "O_soldierU_AR_F",
    "O_soldierU_A_F",
    "O_soldierU_medic_F"
];

// Guard Team (Infantry)
_groupArray_OPF_F_OIA_GuardTeam = [
    "O_soldierU_TL_F",
    "O_soldierU_AR_F",
    "O_soldierU_GL_F",
    "O_soldierU_LAT_F"
];

//============================================= END OF FILE =============================================//
