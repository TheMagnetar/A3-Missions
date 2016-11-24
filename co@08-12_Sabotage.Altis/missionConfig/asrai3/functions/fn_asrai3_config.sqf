//=======================================================================================================//
// File: fn_asrai3_config.sqf                                                                            //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/09/29                                                                             //
// Description: This file allows for a more mission customised configuration of the mod ASR AI 3. The    //
//              changes made here override those present at the server. ASR AI 3 can be found in:        //
//               - http://www.armaholic.com/page.php?id=24080                                            //
//               - https://github.com/robalo/mods/tree/master/asr_ai3                                    //
//               - https://forums.bistudio.com/topic/163742-asr-ai-3/                                    //
//                                                                                                       //
//              Arguments:                                                                               //
//               - none                                                                                  //
//                                                                                                       //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

if (!bmt_mod_asrai3) exitWith {};

if (isServer) then {
    if (bmt_param_asrai3_enabled == 1) then {
        asr_ai3_main_setskills = true;
        asr_ai3_main_seekcover = true;
        asr_ai3_main_usebuildings = 0.9;
        asr_ai3_main_getinweapons = 0.5;
        asr_ai3_main_rearm = 40;
        asr_ai3_main_rearm_mags = 3;
        asr_ai3_main_rearm_fak = 1;
        asr_ai3_main_radiorange = 600;
        asr_ai3_main_rrdelaymin = 5;
        asr_ai3_main_rrdelayplus = 10;
        asr_ai3_main_packNVG = true;
        asr_ai3_main_joinlast = 2;
        asr_ai3_main_removegimps = 300;
        asr_ai3_main_pgaistamina = false;
        asr_ai3_main_onteamswitchleader = true;
        asr_ai3_main_loudrange = 0;
    } else {
        asr_ai3_main_setskills = false;
        asr_ai3_main_seekcover = false;
        asr_ai3_main_usebuildings = 0.0;
        asr_ai3_main_getinweapons = 0.0;
        asr_ai3_main_rearm = 0;
        asr_ai3_main_rearm_mags = 30;
        asr_ai3_main_rearm_fak = 0;
        asr_ai3_main_radiorange = 0;
        asr_ai3_main_rrdelaymin = 0;
        asr_ai3_main_rrdelayplus = 0;
        asr_ai3_main_packNVG = false;
        asr_ai3_main_joinlast = 0;
        asr_ai3_main_removegimps = 0;
        asr_ai3_main_pgaistamina = false;
        asr_ai3_main_onteamswitchleader = false;
        asr_ai3_main_loudrange = 0;
    };

    if ( bmt_param_debugOutput == 1 ) then {
        player sideChat format ["DEBUG (fn_asrai_config.sqf): ASR AI configured."];
    };
};

//============================================= END OF FILE =============================================//
