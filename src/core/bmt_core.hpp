//=======================================================================================================//
// File: bmt_comu.hpp                                                                                    //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/11/26                                                                             //
// Description: This file declares the functions that will be available if this module is used during    //
//              the mission. In this case it declares functions that declare common variables (with      //
//              global scope) that are used by other scripts in the template.                            //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

// Especifies that this component has been loaded.
#ifdef BMT_COMPONENTS
    class comu {};
#endif

// Define the functions of this component.
#ifdef BMT_FUNCTIONS_INTERNAL
    class comu {
        file = "src\core\functions";
        class core_checkConfiguration { postInit = 1; };
        class core_initBMTParams     { };
        class core_processParamsArray { preInit = 1;  };
        class core_processMods        { preInit = 1;  };
    };
#endif

//============================================= END OF FILE =============================================//
