//=======================================================================================================//
// File: bmt_jip.hpp                                                                                     //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/11/26                                                                             //
// Description: This file declares the functions that will be available if this module is used during    //
//              the mission. In this case it declares JIP functions.                                     //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

// Especifies that this component has been loaded.
#ifdef BMT_COMPONENTS
    class jip {};
#endif

// Define configurable parameters at mission start.
#ifdef BMT_PARAMETERS
    //===================================================================================================//
    // Delimiter                                                                                         //
    //===================================================================================================//
    class bmt_paramLine_jip {
        title = "========== JIP configuration";
        values[] = {0};
        texts[] = {""};
        default = 0;
    };

    //===================================================================================================//
    // JIP: Time limit after which, JIP will not be allowed?                                             //
    // Default option: Enabled.                                                                          //
    //===================================================================================================//
    class bmt_param_jip_enabled {
        title = "Allow JIP";
        values[] = {0, 1};
        texts[] = {"Disabled", "Enabled"};
        default = BMT_JIP_ENABLED;
    };
#endif

//============================================= END OF FILE =============================================//
