//=======================================================================================================//
// File: bmt_components_addons.hpp                                                                       //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/11/26                                                                             //
// Description: This file has the purpose to load different components of the "Arma 3 Basic Mission      //
//              Template" (A3-BMT) in a modular way. This file should not be modified since it can       //
//              have unpredictable functionality consequences in the functions and scripts included in   //
//              this template.                                                                           //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

// Genaral functions and scripts.
#include "src\core\bmt_core.hpp"                       // Core and essential functions for the correct execution of scripts.
#include "src\configEquipment\bmt_configEquipment.hpp" // Loadout and equipment related functions.
#include "src\configGroup\bmt_configGroup.hpp"         // Group configuration functions.
#include "src\configUnit\bmt_configUnit.hpp"           // Unit configuration functions.
#include "src\jip\bmt_jip.hpp"                         // JIP support.
#include "src\misc\bmt_misc.hpp"                       // Miscellaneous functions.
#include "src\respawn\bmt_respawn.hpp"                 // Respawn tickets configuration.
#include "src\zeus\bmt_zeus.hpp"                       // Zeus related functions.

// Mission especific function declarations.
#include "missionConfig\core\bmt_core.hpp"
#include "missionConfig\configEquipment\bmt_configEquipment.hpp"
#include "missionConfig\endMission\bmt_endMission.hpp"

// Function declarations dependant on external scripts.
#include "missionConfig\bmt_components_addons.hpp"

//============================================= END OF FILE =============================================//
