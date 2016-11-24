//=======================================================================================================//
// File: fn_zeus_addOjects.sqf                                                                           //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/06/04                                                                             //
// Description: This function adds to any curator the different objects that other curators have added   //
//              during the mission so that they are editable by all the curators.                        //
//                                                                                                       //
//              Arguments:                                                                               //
//               - 0: curator that placed the object <OBJECT>.                                           //
//               - 1: new placed object <OBJECT>.                                                        //
//                                                                                                       //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

// Surt si no és un servidor
if( !isServer ) exitWith{};

params["_zeus", "_newObject"];

{
    _x addCuratorEditableObjects [[_newObject],true]
} forEach (allCurators - [_zeus]);

//============================================= END OF FILE =============================================//
