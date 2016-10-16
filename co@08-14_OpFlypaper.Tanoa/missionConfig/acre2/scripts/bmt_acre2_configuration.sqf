//=======================================================================================================//
// File: bmt_acre2_configuration.sqf                                                                     //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/04/27                                                                             //
// Description: This document is used in order to define basic configuration parameters of the mod       //
//              Advanced Combat Radio Environment 2 (ACRE2) that can be found in:                        //
//              http://gitlab.idi-systems.com/idi-systems/acre2-public/wikis/home                        //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

//=======================================================================================================//
// Mission configuration.                                                                                //
//=======================================================================================================//

// ACRE2: Configure ACRE2.
//        - BABEL:
//            * false: Deactivate babel between sides.
//            * true: Activate babel between sides.
//        - RADIOS:
//            * false: Channels are set-up equally per side.
//            * true: Channels are set-up differently per side.
[true, true] call acre_api_fnc_setupMission;

// ACRE2: Allow AI detect players when they speak.
//        - false: AI cannot listen to players.
//        - true: AI can listen to, and therefore detect players using a inverse quadratic model.
[true] call acre_api_fnc_setRevealToAI;

//=======================================================================================================//
// Babel functionality configuration.                                                                    //
//=======================================================================================================//

bmt_acre2_languages = [["english","English"],["russian","Russian"],["farsi","Farsi"],["greek","Greek"], ["german", "German"]];

bmt_acre2_language_rhsusaf = ["english"];
bmt_acre2_language_rhsafrf = ["russian"];
bmt_acre2_language_blufor  = ["english"];
bmt_acre2_language_opfor   = ["farsi"];
bmt_acre2_language_indfor  = ["greek"];
bmt_acre2_language_fia     = ["english","greek"];
bmt_acre2_language_civ     = ["greek"];
bmt_acre2_language_bwa3    = ["german"];

//=======================================================================================================//
// Difficulty configuration.                                                                             //
//=======================================================================================================//

// ACRE2: Loss of signal due to terrain. Value between 0 and 1.
//        - 0: Deactivates loss of signal due to terrain.
//        - 1: Loss of signal totally simulated.
[1] call acre_api_fnc_setLossModelScale;

// ACRE2: Duplex
//        - false: Transmissions will not be received when radio is transmitting.
//        - true: Transmission will be received when transmitting.
[false] call acre_api_fnc_setFullDuplex;

// ACRE2: Interference.
//        - false: radio interference will not be modelled when two players transmit on the same frequency.
//        - true: interferences will be modelled when simultaneously transmitting on the same frequency.
[true] call acre_api_fnc_setInterference;

// ACRE2: Antena direction
//        - false: antena direction is simulated.
//        - true: the signal simulation model ignores antena direction.
[false] call acre_api_fnc_ignoreAntennaDirection;

//=======================================================================================================//
// Configuration of radio assignement depending on role.                                                 //
//=======================================================================================================//

// Variable to control wether the radio presets are shared between sides.
//   - false: sides share radio presets.
//   - true: sides do not share radio presets.
bmt_acre2_differentPresets = true;

// Variable to determine if the radio defined in "bmt_acre2_riflemanRadio", an AN/PRC 343 by default,
// is distributed to everybody indenpendently to the unit's role.
//    - false: only the units in "bmt_array_riflemanRadio" will get this radio.
//    - true: all units will receive the radio defined in "bmt_acre2_riflemanRadio".
bmt_acre2_riflemanRadioEverybody = true;

// Radio assigned to regular soldiers.
bmt_acre2_riflemanRadio = "ACRE_PRC343";

// Radio assigned to officers.
bmt_acre2_shortRangeRadio = "ACRE_PRC152";

// Radio assigned to RTO.
bmt_acre2_longRangeRadio = "ACRE_PRC117F";

//============================================= END OF FILE =============================================//
