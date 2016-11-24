//=======================================================================================================//
// File: bmt_configUnit.hpp                                                                            //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/11/26                                                                             //
// Description: This file declares the functions that will be available if this module is used during    //
//              the mission. In this case it declares functions that configure the playable unit.        //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

// Especifies that this component has been loaded.
#ifdef BMT_COMPONENTS
    class configUnit {};
#endif

// Define the functions of this component.
#ifdef BMT_FUNCTIONS_INTERNAL
    class configUnit {
        file = "src\configUnit\functions";
        class configUnit { };
    };
#endif

//============================================= END OF FILE =============================================//
