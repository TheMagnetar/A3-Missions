//=======================================================================================================//
// File: fn_zeus_createModule.sqf                                                                        //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/12/07                                                                             //
// Description: This function creates a zeus module and assigns its owner to the administrator.          //
//                                                                                                       //
//              Arguments:                                                                               //
//               - none                                                                                  //
//                                                                                                       //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

if (bmt_param_zeus_admin == 0) exitWith {};
if (!isServer) exitWith {};

// Create the Zeus module.
if (isNil "bmt_var_centreSideLogic_Zeus") then {
    bmt_var_centreSideLogic_Zeus = createCenter sideLogic; publicVariable "bmt_var_centreSideLogic_Zeus";
    bmt_var_groupSideLogic_Zeus = createGroup bmt_var_centreSideLogic_Zeus; publicVariable "bmt_var_groupSideLogic_Zeus";
};

bmt_var_zeusModule = bmt_var_groupSideLogic_Zeus createUnit ["ModuleCurator_F",[0,0,0] , [], 0, ""];
bmt_var_zeusModule setVariable ["showNotification", false, true];
bmt_var_zeusModule setVariable ["birdType", "", true];
bmt_var_zeusModule setVariable ["Owner", "#adminLogged", true];
bmt_var_zeusModule setVariable ["Addons", 3, true];
bmt_var_zeusModule setVariable ["Forced", 0, true];
publicVariable "bmt_var_zeusModule";

//============================================= END OF FILE =============================================//
