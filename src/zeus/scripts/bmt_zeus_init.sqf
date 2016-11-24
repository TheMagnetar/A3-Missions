//=======================================================================================================//
// File: bmt_zeus_init.sqf                                                                               //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/06/04                                                                             //
// Description: This script adds the different editor placed objects, vehicles and units, including      //
//              players to all curators. In this way all objects can be edited.                          //
//                                                                                                       //
//              Arguments:                                                                               //
//               - none                                                                                  //
//                                                                                                       //
// Changes: 0.1 (2015/06/04) Initial version.                                                            //
//          1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

// Only execute on server.
if( !isServer ) exitWith{};

// Add units, vehicles and objects to all curators.
{
    _x addCuratorEditableObjects [vehicles, true];                     // Adds vehicles with their crew.
    _x addCuratorEditableObjects [(allMissionObjects "Man"), false];   // Adds infantry units.
    _x addCuratorEditableObjects [(allMissionObjects "Air"), true];    // Adds air units with their crew.
    _x addCuratorEditableObjects [(allMissionObjects "Ammo"), false];  // Adds objects of type "Ammo".
    _x addCuratorEditableObjects [[player], true];                     // Adds player units.
} forEach allCurators;

//============================================= END OF FILE =============================================//
