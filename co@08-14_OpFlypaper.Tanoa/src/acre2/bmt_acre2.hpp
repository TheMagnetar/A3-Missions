//=======================================================================================================//
// File: bmt_acre2.hpp                                                                                   //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/11/26                                                                             //
// Description: This file declares the functions that will be available if this module is used during    //
//              the mission. In this case it declares functions related to radio, frequency and babel    //
//              configuration of Advanced Combat Radio Environment 2 (ACRE 2).                           //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

// Especifies that this component has been loaded.
#ifdef BMT_COMPONENTS
    class acre2 {};
#endif

// Define the functions of this component.
#ifdef BMT_FUNCTIONS_INTERNAL
    class acre2 {
        file = "src\acre2\functions";
        class acre2_addRadios{};
        class acre2_configureChannels{};
        class acre2_configureLanguages{};
        class acre2_configurePresets{};
        class acre2_removeRadios{};
    };
#endif

// Define configurable parameters at mission start.
#ifdef BMT_PARAMETERS
    //===================================================================================================//
    // Delimiter                                                                                         //
    //===================================================================================================//
    class bmt_paramLine_acre2 {
        title = "========== ACRE 2 configuration";
        values[] = {0};
        texts[] = {""};
        default = 0;
    };

    //===================================================================================================//
    // Redistribute radios?                                                                              //
    // Radios are distributed to the different units. The radios that are assigned can be controlled by  //
    // the variables bmt_acre2_riflemanRadio and bmt_array_riflemanRadio for rifleman radios,            //
    // bmt_acre2_shortRangeRadio and bmt_array_shortRangeRadio for short range radios and                //
    // bmt_acre2_longRangeRadio and bmt_array_longRangeRadio for long range radio.                       //
    //   - false: radios are not distributed.                                                            //
    //   - true: radios are distributed.                                                                 //
    // Default option: true.                                                                             //
    //===================================================================================================//
    class bmt_param_acre2_distributeRadios {
        title = "Distribute radios";
        values[] = {0, 1};
        texts[] = {"No", "Yes"};
        default = BMT_ACRE2_DISTRIBUTE_RADIOS;
    };

    //===================================================================================================//
    // Configure radio channels?                                                                         //
    // Frequencies are defined in "missionConfig/scripts/core/bmt_core_commonVariables.sqf".             //
    //   - false: channels are not configured.                                                           //
    //   - true: radio channels are configured depending on the squad, fireteam and radio type.          //
    // Default option: true.                                                                             //
    //===================================================================================================//
    class bmt_param_acre2_configureChannels {
        title = "Configure radio channels";
        values[] = {0, 1};
        texts[] = {"No", "Yes"};
        default = BMT_ACRE2_CONFIGURE_CHANNELS;
    };
#endif

//============================================= END OF FILE =============================================//
