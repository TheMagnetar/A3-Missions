//=======================================================================================================//
// File: bmt_init.sqf                                                                                    //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/11/27                                                                             //
// Description: This file is used to add those scripts and variables that are mission dependant to the   //
//              init.sqf file.                                                                           //
//                                                                                                       //
//              Arguments:                                                                               //
//               - none                                                                                  //
//                                                                                                       //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

if (isServer) then {
    bmt_airAssets = [bmt_heli1, bmt_heli2, bmt_heli3, bmt_plane1, bmt_plane2, bmt_plane3, bmt_drone1, bmt_drone2];
    publicVariable "bmt_airAssets";
};

//============================================= END OF FILE =============================================//
