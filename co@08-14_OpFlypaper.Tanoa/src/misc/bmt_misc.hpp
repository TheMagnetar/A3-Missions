//=======================================================================================================//
// File: bmt_misc.hpp                                                                                    //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/11/26                                                                             //
// Description: This file declares the functions that will be available if this module is used during    //
//              the mission. In this case it declares miscellaneous functions that can be found in a     //
//              mission like teleport ...                                                                //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

// Especifies that this component has been loaded.
#ifdef BMT_COMPONENTS
    class misc {};
#endif

// Define the functions of this component.
#ifdef BMT_FUNCTIONS_INTERNAL
    class misc {
        file = "src\misc\functions";
        class misc_checkEmptyPosition       { };
        class misc_teleport                 { };
        class misc_teleport_configurePoints { postInit = 1; };
        class misc_teleport_toFriendly      { };
    };
#endif

//============================================= END OF FILE =============================================//
