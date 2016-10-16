//=======================================================================================================//
// File: fn_core_processParamsArray.sqf                                                                  //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/03/08                                                                             //
// Description: This function processes the paramsArray matrix.                                          //
//              Arguments:                                                                               //
//               - none                                                                                  //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
// ToDo: Replace entries with getMissionConfigValue.                                                     //
//=======================================================================================================//

private ["_paramName", "_paramValue"];

// First initialise all parameters to zero.
[] call bmt_fnc_core_initBMTParams;

{
    _paramName = (configName ((missionConfigFile >> "Params") select _forEachIndex));

    // Avoid lines starting with "paramLine"
    if (!(["paramLine", _paramName, true] call BIS_fnc_inString)) then {
        _paramValue = _paramName call BIS_fnc_getParamValue;

        // If it is an ACE3 setting, use the variable in bmt_paramID instead.
        if (["ace_", _paramName, true] call BIS_fnc_inString) then {
            _paramName = ( getText (missionConfigFile >> "Params" >> _paramName >> "bmt_paramID"));
        };

        call compile format["%1 = %2", _paramName, _paramValue];
        if (isServer) then {
          publicVariable _paramName;
        };
    };
} forEach paramsArray;

//============================================= END OF FILE =============================================//
