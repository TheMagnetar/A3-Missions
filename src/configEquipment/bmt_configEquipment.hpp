//=======================================================================================================//
// File: bmt_configEquipment.hpp                                                                         //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/11/26                                                                             //
// Description: This file declares the functions that will be available if this module is used during    //
//              the mission. In this case it declares functions that configure the playable unit's gear. //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

// Especifies that this component has been loaded.
#ifdef BMT_COMPONENTS
    class configEquipment {};
#endif

// Define the functions of this component.
#ifdef BMT_FUNCTIONS_INTERNAL
    class configEquipment {
        file = "src\configEquipment\functions";
        class configEquipment {};
    };
#endif

// Define configurable parameters at mission start.
#ifdef BMT_PARAMETERS
    //===================================================================================================//
    // Delimiter                                                                                         //
    //===================================================================================================//
    class bmt_paramLine_equipment {
        title = "========== Equipment/Gear configuration";
        values[] = {0};
        texts[] = {""};
        default = 0;
    };

    //===================================================================================================//
    // Virtual Arsenal Profiles: Use Virtual Arsenal Profiles when equiping units?                       //
    // Default option: VA profiles are not used.                                                         //
    // Note: VA profiles must be already saved in players computer.                                      //
    //===================================================================================================//
    class bmt_param_useVAProfiles {
        title = "Use Virtual Arsenal profiles";
        values[] = {0,1};
        texts[] = {"No","Yes"};
        default = BMT_VAPROFILES;
    };
#endif

//============================================= END OF FILE =============================================//
