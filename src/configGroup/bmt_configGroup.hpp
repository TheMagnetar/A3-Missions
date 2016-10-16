//=======================================================================================================//
// File: bmt_configGroup.hpp                                                                             //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/11/26                                                                             //
// Description: This file declares the functions that will be available if this module is used during    //
//              the mission. In this case it declares functions that configure the group of the playabe  //
//              unit.                                                                                    //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

// Especifies that this component has been loaded.
#ifdef BMT_COMPONENTS
    class configGroup {};
#endif

// Define the functions of this component.
#ifdef BMT_FUNCTIONS_INTERNAL
    class configGroup {
        file = "src\configGroup\functions";
        class configGroup{};
    };
#endif

//============================================= END OF FILE =============================================//
