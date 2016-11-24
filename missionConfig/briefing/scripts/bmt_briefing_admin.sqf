//=======================================================================================================//
// File: bmt_briefing_admin.sqf                                                                          //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/02/22                                                                             //
// Description: This document provides additional information to the administrator. Since only the       //
//              administrator can view this additional remarks, advices and notes can be given.          //
//                                                                                                       //
//              Arguments:                                                                               //
//               - none                                                                                  //
//                                                                                                       //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

private ["_briefingAdmin", "_briefingNotes", "_briefingEndings", "_briefingJip"];
private ["_respawnDescription", "_respawnType", "_respawnTickets"];
private ["_debriefingEntries", "_endingEntry", "_endingTitle", "_endingDescription"];
private

//=======================================================================================================//
// MESSAGES ONLY SHOWN TO THE ADMINISTRATOR.                                                             //
//=======================================================================================================//

//=======================================================================================================//
// NOTES: ADMINISTRATOR.                                                                                 //
//=======================================================================================================//
_briefingAdmin = format ["
<font color='#FF0000' size='18'>Information for the administrator</font>
<br/>
This mission runs correctly using the following:
<br/><br/>
%1
<br/><br/>
If the previous requirements are not met, the mission ought to be tested before playing it.
<br/>
", getText (missionConfigFile >> "bmt_config" >> "bmt_config_testedAddons")];

//=======================================================================================================//
// NOTES: MISSION AUTHOR'S REMARKS.                                                                      //
//=======================================================================================================//

_respawnTickets = getNumber (missionConfigFile >> "bmt_config" >> "bmt_config_numAllowedRespawns");
_respawnType = toLower getText (missionConfigFile >> "respawn");

if (_respawnType != "base") then {
    _respawnDescription = format ["%1", toUpper _respawnType];
} else {

    if (_respawnTickets == -99) then {
        _respawnDescription = format ["BASE with unlimited tickets and respawn delay of %1", getNumber (missionConfigFile >> "respawnDelay") ];
    };

    if ((_respawnTickets <= 0) && (_respawnTickets != -99)) then {
        _respawnDescription = format ["BASE without tickets (no respawn)", getNumber (missionConfigFile >> "respawnDelay") ];
    };

    if (_respawnTickets > 0) then {
        _respawnDescription = format ["BASE with %1 tickets and respawn delay of %2", _respawnTickets, getNumber (missionConfigFile >> "respawnDelay") ];
    };
};

_briefingNotes = format ["
<br/>
<font color='#FF0000' size='18'>Mission author's remarks</font>
<br/>
<font color='#00FFFF'>Mission name:</font> %1.
<br/>
<font color='#00FFFF'>Version</font> %2
<br/>
<font color='#00FFFF'>Author:</font> %3.
<br/>
<font color='#00FFFF'>Collaborators:</font> %4
<br/>
<font color='#00FFFF'>Basic Mission Template (BMT) version:</font> %5
<br/>
<font color='#00FFFF'>Game Type:</font> %6.
<br/>
<font color='#00FFFF'>Minimum number of players:</font> %7.
<br/>
<font color='#00FFFF'>Maximum number of players:</font> %8.
<br/>
<font color='#00FFFF'>Respawn:</font> %9. Spectator when dead.
<br/>
<font color='#00FFFF'>Difficulty:</font> %10
<br/>
<font color='#00FFFF'>Mission summary:</font> %11
<br/>
<font color='#00FFFF'>Additional notes and remarks:</font> %12
<br/><br/>
", getText (missionConfigFile >> "onLoadName"),
getText (missionConfigFile >> "bmt_config" >> "bmt_config_missionVersion"),
getText (missionConfigFile >> "author"),
getText (missionConfigFile >> "bmt_config" >> "bmt_config_missionCollaborators"),
getText (missionConfigFile >> "bmt_config" >> "bmt_config_templateVersion"),
getText (missionConfigFile >> "Header" >> "gameType"),
getNumber (missionConfigFile >> "Header" >> "minPlayers"),
getNumber (missionConfigFile >> "Header" >> "maxPlayers"), _respawnDescription,
getText (missionConfigFile >> "bmt_config" >> "bmt_config_missionDifficulty"),
getText (missionConfigFile >> "bmt_config" >> "bmt_config_missionSummary"),
getText (missionConfigFile >> "bmt_config" >> "bmt_config_missionNotesAndRemarks") ];

//=======================================================================================================//
// NOTES: MISSION ENDINGS.                                                                               //
//=======================================================================================================//

_briefingEndings = "
<font color='#FF0000' size='18'>Different mission endings</font>
<br/>
Select one of the endings in order to trigger it.
<br/><br/>
";

// List all debriefing entries defined in "bmt_missionDebriefing.hpp" automatically.
_debriefingEntries = (missionConfigFile >> "CfgDebriefing");
for [{ _x = 0 }, {_x < count _debriefingEntries}, { _x = _x + 1}] do {
    _endingEntry = (configName ((missionConfigFile >> "CfgDebriefing") select _x));
    _endingTitle = getText (missionConfigFile >> "CfgDebriefing" >> format["%1",_endingEntry] >> "title");
    _endingDescription = getText (missionConfigFile >> "CfgDebriefing" >> format["%1",_endingEntry] >> "description");
    _briefingEndings = _briefingEndings + format [
    "<execute expression=""['%1',true] remoteExec ['BIS_fnc_endMission', 0, true];"">- %2</execute>: %3<br/>", _endingEntry, _endingTitle, _endingDescription
    ];
};

//=======================================================================================================//
// NOTES: JIP Control.                                                                                   //
//=======================================================================================================//

_briefingJip = "
<br/>
<font color='#FF0000' size='18'>JIP control:</font>
<br/>
- <execute expression=""bmt_var_jipAllowedTime = bmt_var_jipAllowedTime + 300;  publicVariable 'bmt_var_jipAllowedTime'; hint format ['Time until JIP is disabled: %1', bmt_var_jipAllowedTime];"">Increase JIP allowed time by 5 minutes</execute>.
<br/>
- <execute expression=""missionNamespace setVariable ['bmt_var_jip_allowed', true, true]; hint 'JIP is enabled';"">Enable JIP</execute>.
<br/>
- <execute expression=""missionNamespace setVariable ['bmt_var_jip_allowed', false, true]; hint 'JIP is disabled';"">Disable JIP</execute>.
";

_briefing = _briefingAdmin + _briefingNotes + _briefingEndings + _briefingJIP;

//=======================================================================================================//
// DIARY ENTRY CREATION.                                                                                 //
//=======================================================================================================//
player createDiaryRecord ["diary", ["Admin",_briefing]];

//============================================= END OF FILE =============================================//
