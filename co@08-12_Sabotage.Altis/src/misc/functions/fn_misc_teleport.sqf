//=======================================================================================================//
// File: fn_misc_teleport.sqf                                                                            //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/10/18                                                                             //
// Description: This function teleports a player to a defined destination point.                         //
//                                                                                                       //
//              Arguments:                                                                               //
//               - 0: object to teleport <OBJECT>.                                                       //
//               - 1: marker where the object will be teleported <STRING>.                               //
//               - 2: altitude (ASL) at the destination point <FLOAT><OPTIONAL>.                         //
//               - 3: direction at destination point <FLOAT><OPTIONAL>. Defaults to marker direction.    //
//                                                                                                       //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

params["_object","_marker", ["_altitude",0.0], "_direction"];

_object setposatl [getmarkerpos _marker select 0,getmarkerpos _marker select 1, _altitude];

if (isNil "_direction") then {
    _object setDir (markerDir _marker);
} else {
    _object setDir _direction;
};

//============================================= END OF FILE =============================================//
