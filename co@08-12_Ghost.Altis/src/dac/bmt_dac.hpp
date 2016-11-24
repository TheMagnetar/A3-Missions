//=======================================================================================================//
// File: bmt_dac.hpp                                                                                     //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/11/26                                                                             //
// Description: This file declares the functions that will be available if this module is used during    //
//              the mission. In this case it declares functions that configure the Dynamic-AI-Creator    //
//              in either script (legacy) or mod version (preferred).                                    //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

// Especifies that this component has been loaded.
#ifdef BMT_COMPONENTS
    class dac {};
#endif

// Define the functions of this component.
#ifdef BMT_FUNCTIONS_INTERNAL
    class dac {
        file = "src\dac\functions";
        class dac_init { postInit = 1; };
    };
#endif

// Define configurable parameters at mission start.
#ifdef BMT_PARAMETERS
    //===================================================================================================//
    // Delimiter                                                                                         //
    //===================================================================================================//
    class bmt_paramLine_dac {
        title = "========== DAC configuration";
        values[] = {0};
        texts[] = {""};
        default = 0;
    };

    //===================================================================================================//
    // Dynamic-AI-Creator: Variable per controlar si es fa servir el Dynamic-AI-Creator (DAC) durant la //
    //                     missió o si aquest es vol desactivar.                                         //
    // Default option: Enabled                                                                      //
    //===================================================================================================//
    class bmt_param_dac_enabled {
        title = "Use DAC";
        values[] = {0,1};
        texts[] = {"Disabled", "Enabled"};
        default = BMT_DAC_ENABLE;
    };

    //===================================================================================================//
    // Debug del DAC: Variable per controlar la quantitat d'informació que es mostra a l'utilitzar el    //
    //                DAC en una missió.                                                                 //
    //                  - Disabled: No es mostra cap informació referent al DAC.                       //
    //                  - Simplificat: No es mostren les zones DAC al mapa ni missatges de reducció dels //
    //                                 diferents grups. Missatges d'inicialització simplificats. Es      //
    //                                 recomana aquest valor durant la missió.                           //
    //                  - Complert: Es mostren les zones DAC i les unitats al mapa així com els diversos //
    //                              missatges de reducció/creació dels diferents grups. Els missatges    //
    //                              a l'inici dónen la màxima informació possible.                       //
    // Default option: Complert.                                                                      //
    //===================================================================================================//
    class bmt_param_dac_debug {
        title = "Debug DAC";
        values[] = {0,1,2};
        texts[] = {"Disabled", "Simplificat", "Complert"};
        default = BMT_DAC_DEBUG;
    };
#endif

//============================================= END OF FILE =============================================//
