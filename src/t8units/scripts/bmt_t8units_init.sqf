//=======================================================================================================//
// File: bmt_t8units_init.sqf                                                                            //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/12/06                                                                             //
// Description: This file initialises T8 Units script.                                                   //
// Changes: 1.0 (2015/12/06) Initial version.                                                            //
//=======================================================================================================//

if (bmt_param_t8units_enabled == 0) exitWith {};

// missionEXEC -> Load the unit setup & more
[] execVM "missionConfig\t8units\scripts\T8_missionEXEC.sqf";

//============================================= END OF FILE =============================================//
