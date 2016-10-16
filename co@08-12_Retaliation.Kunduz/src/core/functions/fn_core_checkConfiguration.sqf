//=======================================================================================================//
// File: fn_core_checkConfiguration.sqf                                                                  //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/09/29                                                                             //
// Description: This function checks if the parameter configurations are the ones that are modified the  //
//              ones especified by the mission author.                                                   //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

// Check that TFAR and ACRE 2 are not marked as required simultaneously.
if ((bmt_var_requires_tfar == 1) and (bmt_var_requires_acre2 == 1)) then {
    // DEBUG OUTPUT
    if (bmt_param_debugOutput == 1) then {
        player sideChat format ["ERROR (bmt_core_checkConfiguration.sqf): Both TFAR and ACRE2 are marked as required."];
    };
};

// Advanced Combat Environment 3 (ACE 3).
if (isClass (missionconfigfile >> "CfgComponents" >> "ace3")) then {
    if (!bmt_mod_ace3) then {
        if (bmt_param_debugOutput == 1) then {
            player sideChat format ["WARNING: The ACE 3 component of the template is loaded but the mod itself is not. Template component is not used."];
        };
    } else {
        #include "includes\bmt_core_checkConfiguration_ace3.sqf"
    };
} else {
    if (bmt_mod_ace3 and (bmt_param_debugOutput == 1)) then {
        player sideChat format ["WARNING: The ACE 3 component of the template is not loaded but the mod itself is loaded. Not configuring it."];
    };
};

// Advanced Combat Radio Environment 2 (ACRE2)
if (isClass (missionconfigfile >> "CfgComponents" >> "acre2")) then {
    if (!bmt_mod_acre2) then {
        if (bmt_param_debugOutput == 1) then {
            player sideChat format ["WARNING: The ACRE2 component of the template is loaded but the mod itself is not. Template Component is not used."];
        };
    } else {
        #include "includes\bmt_core_checkConfiguration_acre2.sqf"
    };
} else {
    if (bmt_mod_acre2 and (bmt_param_debugOutput == 1)) then {
        player sideChat format ["WARNING: The ACRE2 component of the template is not loaded but the mod itself is loaded. Not configuring it."];
    };
};

// ASR AI 3.
if (isClass (missionconfigfile >> "CfgComponents" >> "asrai3")) then {
    if (!bmt_mod_asrai3) then {
        if (bmt_param_debugOutput == 1) then {
            player sideChat format ["WARNING: The ASR AI 3 component of the template is loaded but the mod itself is not. Template component is not used."];
        };
    } else {
        #include "includes\bmt_core_checkConfiguration_asrai3.sqf"
    };
} else {
    if (bmt_mod_asrai3 and (bmt_param_debugOutput == 1)) then {
        player sideChat format ["WARNING: The ASR AI 3 component of the template is not loaded but the mod itself is loaded. Not configuring it."];
    };
};

// Dynamic-AI-Creator (DAC).
if (isClass (missionconfigfile >> "CfgComponents" >> "dac")) then {
    if (!bmt_mod_dac) then {
        if (bmt_param_debugOutput == 1) then {
            player sideChat format ["WARNING: The DAC component of the template is loaded but the mod itself is not. Template component is not used."];
        };
    } else {
        #include "includes\bmt_core_checkConfiguration_dac.sqf"
    };
} else {
    if (bmt_mod_dac and (bmt_param_debugOutput == 1)) then {
        player sideChat format ["WARNING: The DAC component of the template is not loaded but the mod itself is loaded. Not configuring it."];
    };
};

// T8 Units.
if (isClass (missionconfigfile >> "CfgComponents" >> "t8units")) then {
    if (bmt_var_requires_t8units == 0) then {
        if (bmt_param_debugOutput == 1) then {
            player sideChat format ["WARNING: The T8 Units component of the template is loaded it is not necessary for this mission. Template component is not used."];
        };
    } else {
        #include "includes\bmt_core_checkConfiguration_t8units.sqf"
    };
} else {
    if ((bmt_var_requires_t8units == 1) and (bmt_param_debugOutput == 1)) then {
        player sideChat format ["WARNING: The T8 Units component of the template is not loaded but it is necessary for this misison."];
    };
};

// Perfils de Virtual Arsenal del grup 1RA.
if (bmt_var_requires_VAProfiles != 2) then {
    if (bmt_var_requires_VAProfiles != bmt_param_useVAProfiles) then {
        if (bmt_param_useVAProfiles == 1) then {
            player sideChat format ["WARNING: Virtual Arsenal profiles are selected but they are not necessary for this mission. This will override equipment!"];
        } else {
            player sideChat format ["ERROR: Virtual Arsenal profiles are not selected but they are necessary for this mission."];
        };
    };
};

// Task Force Arrowhead Radio (TFAR)
if (isClass (missionconfigfile >> "CfgComponents" >> "tfar")) then {
    if (!bmt_mod_tfar) then {
        if (bmt_param_debugOutput == 1) then {
            player sideChat format ["WARNING: The TFAR component of the template is loaded but the mod itself is not. Template component is not used."];
        };
    } else {
        #include "includes\bmt_core_checkConfiguration_tfar.sqf"
    };
} else {
    if (bmt_mod_tfar and (bmt_param_debugOutput == 1)) then {
        player sideChat format ["WARNING: The TFAR component of the template is not loaded but the mod itself is loaded. Not configuring it."];
    };
};

//============================================= END OF FILE =============================================//
