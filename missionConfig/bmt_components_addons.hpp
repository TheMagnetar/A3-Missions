//=======================================================================================================//
// File: BMT_COMPONENTS_addons.hpp                                                                       //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/11/26                                                                             //
// Description: This document defines which addons will be configured using the scripts in the "Arma 3   //
//              Basic Mission Template" (A3-BMT). The author of the mission must decide which of these   //
//              functions are going to be used depending on the loaded addons. In order to deactivate    //
//              a particular configuration function the corresponding line has to be left commented.     //
//              Sanity checks are performed during the mission start in order to inform the mission      //
//              editor if there is a conflict. None of the components listed below are necessary for     //
//              the scripts of this template to work properly.                                           //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

#include "..\src\ace3\bmt_ace3.hpp"         // Functions to configure ACE 3.
#include "..\src\acre2\bmt_acre2.hpp"       // Functions to initialise and configure ACRE 2.
#include "asrai3\bmt_asrai3.hpp"            // Functions to configure ASR AI 3.
#include "..\src\dac\bmt_dac.hpp"           // Functions to configure DAC.
#include "..\src\t8units\bmt_t8units.hpp"   // Functions to configure T8 Units.
#include "..\src\tfar\bmt_tfar.hpp"         // Functions to initialise and configure TFAR.

//============================================= END OF FILE =============================================//
