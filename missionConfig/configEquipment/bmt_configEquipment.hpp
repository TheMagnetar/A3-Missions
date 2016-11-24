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
    class missionConfig_configEquipment {};
#endif

// Define the functions of this component.
#ifdef BMT_FUNCTIONS_INTERNAL
    class missionConfig_configEquipment {
        file = "missionConfig\configEquipment\functions";
        class configEquipment_blu_f {};
        class configEquipment_civ_f {};
        class configEquipment_fia_f {};
        class configEquipment_ind_f {};
        class configEquipment_opf_f {};
        class configEquipment_rhs_insurgents {};
        class configEquipment_rhs_usaf {};
        class configEquipment_rhs_vdv {};
        class configEquipment_rhs_vpvo {};
        class configEquipment_bwa3_faction {};
    };
#endif

//============================================= END OF FILE =============================================//
