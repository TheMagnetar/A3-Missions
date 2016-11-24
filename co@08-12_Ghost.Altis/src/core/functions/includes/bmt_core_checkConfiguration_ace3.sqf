//=======================================================================================================//
// File: bmt_core_checkConfiguration_ace3.sqf                                                            //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/11/26                                                                             //
// Description: This function checks if the parameter configurations are the ones that are modified the  //
//              ones especified by the mission author. Only those parameters related to Advanced Combat  //
//              Environent 3 (ACE3).                                                                     //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

// Check that Both basic and advance medical systems are not marked as required.
if ((bmt_var_requires_ace3_BasMed == 1) and (bmt_var_requires_ace3_AdvMed == 1)) then {
    player sideChat format ["ERROR (bmt_core_checkConfiguration_ace3.sqf): Both basic and advance medical systems are marked as required."];
};

// ACE 3 must be enabled if basic medical system is marked as necessary.
if ((bmt_var_requires_ace3_BasMed == 1) and (bmt_var_requires_ace3 != 1)) then {
    player sideChat format ["WARNING (bmt_core_checkConfiguration_ace3.sqf): ACE3 is not marked as necessary while the basic medical system is. Marking ACE3 as required."];
    bmt_var_requires_ace3 = 1;
};

// ACE 3 must be enabled if advanced medical system is marked as necessary.
if ((bmt_var_requires_ace3_AdvMed == 1) and (bmt_var_requires_ace3 != 1)) then {
    player sideChat format ["WARNING (bmt_core_checkConfiguration_ace3.sqf): ACE3 is not marked as necessary while the advanced medical system is. Marking ACE3 as required."];
    bmt_var_requires_ace3 = 1;
};

// ACE 3 must be enabled if advanced ballistics is marked as necessary.
if ((bmt_var_requires_ace3_AdvBal == 1) and (bmt_var_requires_ace3 != 1)) then {
    player sideChat format ["WARNING (bmt_core_checkConfiguration_ace3.sqf): ACE3 is not marked as necessary while the advanced ballistics system is. Marking ACE3 as required."];
    bmt_var_requires_ace3 = 1;
};

if ((bmt_var_requires_ace3_BasMed == 0) and (bmt_var_requires_ace3_AdvMed == 0) and bmt_mod_ace3medical) then {
    player sideChat format ["ERROR (bmt_core_checkConfiguration_ace3.sqf): Despite having disabled both basic and advanced ACE 3 medical systems the file ace_medical.pbo is loaded."];
};

// Advanced Combat Environment 3 (ACE3): Basic Medical System.
if (bmt_var_requires_ace3_BasMed != 2) then {
    if (bmt_mod_ace3medical) then {
        if ((bmt_var_requires_ace3_BasMed == 1) and (bmt_param_ace3_medicalSystem != 1)) then {
            player sideChat format ["ERROR (bmt_core_checkConfiguration_ace3.sqf): ACE3 basic medical system is disabled but must be enabled for this mission."];
        };

        if ((bmt_var_requires_ace3_BasMed == 0) and (bmt_param_ace3_medicalSystem == 1)) then {
            player sideChat format ["ERROR (bmt_core_checkConfiguration_ace3.sqf): ACE3 basic medical system is active but it must be deactivated for this mission."];
        };
    } else {
        player sideChat format ["ERROR (bmt_core_checkConfiguration_ace3.sqf): ACE 3 basic medical system is required for this mission but the file ace_medical.pbo is not loaded."];
    };
} else {
    if ((bmt_param_ace3_medicalSystem == 1) and !bmt_mod_ace3medical) then {
        player sideChat format ["ERROR (bmt_core_checkConfiguration_ace3.sqf): ACE 3 basic medical system is required for this mission but the file ace_medical.pbo is not loaded."];
    };

    if ((bmt_param_ace3_medicalSystem != 1) and (bmt_param_ace3_medicalSystem != 2) and bmt_mod_ace3medical) then {
        player sideChat format ["ERROR (bmt_core_checkConfiguration_ace3.sqf): ACE 3 basic medical system is disabled but the file ace_medical.pbo is loaded."];
    };
};

// Advanced Combat Environment 3 (ACE3): Advanced Medical System.
if (bmt_var_requires_ace3_AdvMed != 2) then {
    if (bmt_mod_ace3medical) then {
        if ((bmt_var_requires_ace3_AdvMed == 1) and (bmt_param_ace3_medicalSystem != 2)) then {
            player sideChat format ["ERROR (bmt_core_checkConfiguration_ace3.sqf): ACE3 advanced medical system is disabled but must be enabled for this mission."];
        };

        if ((bmt_var_requires_ace3_AdvMed == 0) and (bmt_param_ace3_medicalSystem == 2)) then {
            player sideChat format ["ERROR (bmt_core_checkConfiguration_ace3.sqf): ACE3 advanced medical system is active but it must be deactivated for this mission."];
        };
    } else {
        player sideChat format ["ERROR (bmt_core_checkConfiguration_ace3.sqf): ACE 3 advanced medical system is required for this mission but the file ace_medical.pbo is not loaded."];
    };
} else {
    if ((bmt_param_ace3_medicalSystem == 2) and !bmt_mod_ace3medical) then {
        player sideChat format ["ERROR (bmt_core_checkConfiguration_ace3.sqf): ACE 3 advanced medical system is required for this mission but the file ace_medical.pbo is not loaded."];
    };

    if ((bmt_param_ace3_medicalSystem != 1) and (bmt_param_ace3_medicalSystem != 2) and bmt_mod_ace3medical) then {
        player sideChat format ["ERROR (bmt_core_checkConfiguration_ace3.sqf): ACE 3 advanced medical system is disabled but the file ace_medical.pbo is loaded."];
    };
};

// Advanced Combat Environment 3 (ACE3): Advanced ballistics.
if (bmt_var_requires_ace3_AdvBal != 2) then {
    if (bmt_mod_ace3advbal) then {
        if (bmt_var_requires_ace3_AdvBal != bmt_param_ace3_ballistics) then {
            if (bmt_param_ace3_ballistics == 1) then {
                player sideChat format ["ERROR (bmt_core_checkConfiguration_ace3.sqf): ACE3 advanced ballistics is disabled but must be enabled for this mission."];
            } else {
                player sideChat format ["ERROR (bmt_core_checkConfiguration_ace3.sqf): ACE3 advanced ballistics is active but it must be deactivated for this mission."];
            };
        };
    } else {
        player sideChat format ["ERROR (bmt_core_checkConfiguration_ace3.sqf): ACE 3 advanced ballistics is required for this mission but the file ace_advanced_ballistics.pbo is not loaded."];
    };
} else {
    if ((bmt_param_ace3_ballistics == 1) and !bmt_mod_ace3advbal) then {
        player sideChat format ["ERROR (bmt_core_checkConfiguration_ace3.sqf): ACE 3 advanced ballistics is disabled but the file ace_advanced_ballistics.pbo is not loaded."];
    };

    if ((bmt_param_ace3_ballistics == 0) and bmt_mod_ace3medical) then {
        player sideChat format ["WARNING (bmt_core_checkConfiguration_ace3.sqf): La balística avançada de ACE3 està desactivada però el fitxer ace_advanced_ballistics.pbo is loaded."];
    };
};

//============================================= END OF FILE =============================================//
