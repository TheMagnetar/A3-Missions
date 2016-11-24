//=======================================================================================================//
// File: bmt_core_checkConfiguration_tfar.sqf                                                            //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/11/26                                                                             //
// Description: This function checks if the parameter configurations are the ones that are modified the  //
//              ones especified by the mission author. Only those parameters related to Task Force       //
//              Arrowhead Radio (TFAR).                                                                  //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

if (bmt_var_requires_tfar != 2) then {
    if (bmt_mod_tfar and (bmt_var_requires_tfar == 0)) then {
        player sideChat format ["ERROR (bmt_core_checkConfiguration_tfar.sqf): TFAR is loaded but this mission does not support it."];
    };

    if (!bmt_mod_tfar and (bmt_var_requires_tfar == 1)) then {
        player sideChat format ["ERROR (bmt_core_checkConfiguration_tfar.sqf): TFAR is necessary for this mission but it is not loaded."];
    };
};

//============================================= END OF FILE =============================================//
