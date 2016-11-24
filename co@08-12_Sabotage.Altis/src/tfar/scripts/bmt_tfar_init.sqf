//=======================================================================================================//
// File: bmt_tfar_init.sqf                                                                               //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/02/22                                                                             //
// Description: This script configures the Task Force Arrowhead Radio (TFAR) mod that can be found in    //
//              https://github.com/michail-nikolaev/task-force-arma-3-radio/wiki                         //
//                                                                                                       //
//              Arguments:                                                                               //
//               - none                                                                                  //
//                                                                                                       //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

// Wait until TFAR variables are initialised.
waitUntil {!isNil "TF_defaultWestPersonalRadio"};

// Include the configuration file.
#include "..\..\..\missionConfig\tfar\scripts\bmt_tfar_configuration.sqf"

// Configure the server side.
if (isServer) then {
    [] execVM "src\tfar\scripts\bmt_tfar_initServer.sqf";
};

// Configure the client side.
if (hasInterface) then {
    [] execVM "src\tfar\scripts\bmt_tfar_initClient.sqf";
};

//============================================= END OF FILE =============================================//
