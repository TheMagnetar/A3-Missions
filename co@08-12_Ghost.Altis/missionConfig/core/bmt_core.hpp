//=======================================================================================================//
// File: bmt_comu.hpp                                                                                    //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/11/26                                                                             //
// Description: If this module is loaded, this file declares functions that affect other scripts within  //
//              the template and are mission dependant.                                                  //                                                                  //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

// Especifies that this component has been loaded.
#ifdef BMT_COMPONENTS
    class missionConfig_core {};
#endif

// Define the functions of this component.
#ifdef BMT_FUNCTIONS_INTERNAL
    class missionConfig_core {
        file = "missionConfig\core\functions";
        class core_commonVariables    { preInit = 1; };
    };
#endif

//============================================= END OF FILE =============================================//
