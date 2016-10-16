//=======================================================================================================//
// File: bmt_core_checkConfiguration_acre2.sqf                                                           //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/11/26                                                                             //
// Description: This function checks if the parameter configurations are the ones that are modified the  //
//              ones especified by the mission author. Only those parameters related to Advanced Combat  //
//              Radio Environent 2 (ACRE2).                                                              //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

if (bmt_var_requires_acre2 != 2) then {
    if (bmt_mod_acre2 and (bmt_var_requires_acre2 == 0)) then {
        player sideChat format ["ERROR (bmt_core_checkConfiguration_acre2.sqf): ACRE2 is loaded but this mission does not support it."];
    };

    if (!bmt_mod_acre2 and (bmt_var_requires_acre2 == 1)) then {
        player sideChat format ["ERROR (bmt_core_checkConfiguration_acre2.sqf): ACRE2 is necessary for this mission but it is not loaded."];
    };
};

//============================================= END OF FILE =============================================//
