//=======================================================================================================//
// File: fn_zeus_addGroups.sqf                                                                           //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/06/04                                                                             //
// Description: This function adds to any curator the different units that other curators have added     //
//              during the mission so that they are editable by all the curators.                        //
//                                                                                                       //
//              Arguments:                                                                               //
//               - 0: curator that placed the group <OBJECT>.                                            //
//               - 1: new placed group <GROUP>.                                                          //
//                                                                                                       //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

params["_zeus", "_newGroup"];

{
    _x addCuratorEditableObjects [(units _newGroup),true]
} forEach (allCurators - [_zeus]);

//============================================= END OF FILE =============================================//
