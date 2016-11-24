//=======================================================================================================//
// File: bmt_tfar.hpp                                                                                    //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/11/26                                                                             //
// Description: This file declares the functions that will be available if this module is used during    //
//              the mission. In this case it declares functions related to to radio and frequencys       //
//              configuration of Task Force Arrowhead Radio (TFAR).                                      //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

// Especifies that this component has been loaded.
#ifdef BMT_COMPONENTS
    class tfar {};
#endif

// Define the functions of this component.
#ifdef BMT_FUNCTIONS_INTERNAL
    class tfar {
        file = "src\tfar\functions";
        class tfar_addRadios            { };
        class tfar_configureChannels    { };
        class tfar_configureFrequencies { };
        class tfar_configureStereo      { };
        class tfar_modifySignal         { };
        class tfar_removeRadios         { };
    };
#endif

// Define configurable parameters at mission start.
#ifdef BMT_PARAMETERS
    //===================================================================================================//
    // Delimiter                                                                                         //
    //===================================================================================================//
    class bmt_paramLine_tfar {
        title = "========== TFAR configuration";
        values[] = {0};
        texts[] = {""};
        default = 0;
    };

    //===================================================================================================//
    // Redistribute radios?                                                                              //
    // Distribute radios: radios are distributed to the different units. The radios that are assigned    //
    // can be controlled by the variables bmt_tfar_riflemanRadio and bmt_array_riflemanRadio for         //
    // rifleman radios, bmt_tfar_shortRangeRadio and bmt_array_shortRangeRadio for short range radios    //
    // and bmt_tfar_longRangeRadio and bmt_array_longRangeRadio for long range radio.                    //
    //   - false: radios are not distributed.                                                            //
    //   - true: radios are distributed.                                                                 //
    // Default option: true.                                                                             //
    //===================================================================================================//
    class bmt_param_tfar_distributeRadios {
        title = "Distribute radios";
        values[] = {0, 1};
        texts[] = {"No", "Yes"};
        default = BMT_TFAR_DISTRIBUTE_RADIOS;
    };

    //===================================================================================================//
    // Configure radio channels?                                                                         //
    // Frequencies are defined in "missionConfig/scripts/core/bmt_core_commonVariables.sqf".             //
    //   - false: channels are not configured.                                                           //
    //   - true: radio channels are configured depending on the squad, fireteam and radio type.          //
    // Default option: true.                                                                             //
    //===================================================================================================//
    class bmt_param_tfar_configureChannels {
        title = "Configure radio channels";
        values[] = {0, 1};
        texts[] = {"No", "Yes"};
        default = BMT_TFAR_CONFIGURE_CHANNELS;
    };

    //===================================================================================================//
    // Configure stereo?                                                                                 //
    // Variable to specify if the stereo is automatically configured.                                    //
    //   - false: stereo will not be automatically configured.                                           //
    //   - true: stereo will be automatically configured if the radio supports it.                       //
    // Default option: true.                                                                             //
    //===================================================================================================//
    class bmt_param_tfar_configureStereo {
        title = "Configure stereo";
        values[] = {0, 1};
        texts[] = {"No", "Yes"};
        default = BMT_TFAR_CONFIGURE_STEREO;
    };
#endif
//============================================= END OF FILE =============================================//
