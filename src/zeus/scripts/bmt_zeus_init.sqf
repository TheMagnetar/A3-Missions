//=======================================================================================================//
// File: bmt_zeus_init.sqf                                                                               //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/06/04                                                                      //
// Description: Aquest document serveix per afegir al Zeus els diferents objectes, vehicles, i unitats    //
//             que s'han posat utilitzant l'editor. Els jugadors també estan inclosos. D'aquesta manera  //
//             tots aquests els objectes seran editables.                                                //
// Changes: 0.1 (2015/06/04) Initial version.                                                            //
//         1.0 (2015/11/26) First public version.                                                        //
//=======================================================================================================//

// Surt si no és un servidor.
if( !isServer ) exitWith{};

// Afegir les unitats, vehicles i objectes a tots els zeus.
{
    _x addCuratorEditableObjects [vehicles,true];                     // Afegeix els vehicles amb la tripulació.
    _x addCuratorEditableObjects [(allMissionObjects "Man"),false];   // Afegeix les unitats d'infanteria.
    _x addCuratorEditableObjects [(allMissionObjects "Air"),true];    // Afegeix les unitats aèries amb la tripulació.
    _x addCuratorEditableObjects [(allMissionObjects "Ammo"),false];  // Afegeix els objectes de tipus "Ammo".
    _x addCuratorEditableObjects [[player], true];                    // Afegeix el jugador en si.
} forEach allCurators;

//============================================= END OF FILE =============================================//
