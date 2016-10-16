//=======================================================================================================//
// File: bmt_briefing_blu_ctrg_f.sqf                                                                     //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/02/22                                                                             //
// Description: This document generates the mission briefing for units belonging to the CTRG faction     //
//              (blu_ctrg_f). Requires APEX.                                                             //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

private ["_credits", "_radio", "_adminLog", "_intel", "_missionExecution", "_situation"];

//=======================================================================================================//
// NOTES: CREDITS.                                                                                       //
//=======================================================================================================//
_credits = player createDiaryRecord ["diary", ["Credits","
Mission created by <font color='#00FFFF'>*** Authors ***</font> for the community <font color='#00FFFF'>*** name of the community ***</font>.
<br/><br/>
With the collaboration of Magnetar (A3-BMT template) and *** possible collaborators ***.
"]];

//=======================================================================================================//
// NOTES: RADIO.                                                                                         //
//=======================================================================================================//
_radio = player createDiaryRecord ["diary", ["Radio frequencies","
<font color='#FF0000' size='18'>Command</font>: 41 kHz.
<br/><br/>
<font color='#FF0000' size='18'>CAS</font>: 51 kHz.
<br/><br/>
<font color='#FF0000' size='18'>Artillery</font>: 61 kHz.
<br/><br/>
<font color='#FF0000' size='18'>Alpha</font>
<br/>
- Squad ""Alpha 1"": 200 kHz.
<br/>
- Fireteam ""Alpha 1-1"": 201 kHz.
<br/>
- Fireteam ""Alpha 1-2"": 202 kHz.
<br/>
- Fireteam ""Alpha 1-3"": 203 kHz.
<br/><br/>
<font color='#FF0000' size='18'>Bravo</font>
<br/>
- Squad ""Bravo 1"": 210 kHz.
<br/>
- Fireteam ""Bravo 1-1"": 211 kHz.
<br/>
- Fireteam ""Bravo 1-2"": 212 kHz.
<br/>
- Fireteam ""Bravo 1-3"": 213 kHz.
"]];

//=======================================================================================================//
// NOTES: ADMINISTRATION/LOGISTICS.                                                                       //
//=======================================================================================================//
_adminLog = player createDiaryRecord ["diary", ["Administration/Logistics","
<font color='#FF0000' size='18'>Support</font>
<br/>
*** Description, if they exist, of support units like CAS, field artillery, medevac, ... ***
<br/><br/>
<font color='#FF0000' size='18'>Supply</font>
<br/>
*** Troop supply: additional ammunition, ... ***
"]];

//=======================================================================================================//
// NOTES: INTEL.                                                                                         //
//=======================================================================================================//
_intel = player createDiaryRecord ["diary", ["Intel","
*** Intelligence information. ***
<br/><br/>
<font color='#FF0000' size='18'>Enemy forces</font>
<br/>
*** Description of enemy forces.***
<br/><br/>
<font color='#FF0000' size='18'>Allied forces</font>
<br/>
*** Description of allied forces. ***
"]];

//=======================================================================================================//
// NOTES: MISSION AND EXECUTION.                                                                         //
//=======================================================================================================//
_missionExecution = player createDiaryRecord ["diary", ["Mission and Execution","
<font color='#FF0000' size='18'>Mission</font>
<br/>
*** Mission description. ***
<br/><br/>
<font color='#FF0000' size='18'>Main tasks</font>
<br/>
- <font color='#00FFFF'>Main task 1</font>: *** Brief description ***.
<br/>
- <font color='#00FFFF'>Main task 2</font>: *** Brief description ***.
<br/><br/>
<font color='#FF0000' size='18'>Secondary tasks</font>
<br/>
- <font color='#00FFFF'>Secondary task 1</font>: *** Brief description ***.
<br/>
- <font color='#00FFFF'>Secondary task 2</font>: *** Brief description ***.
<br/><br/>
<font color='#FF0000' size='18'>Execution</font>
<br/>
*** Description, using bullet points, of how to execute the mission. ***
"]];

//=======================================================================================================//
// NOTES: SITUATION.                                                                                     //
//=======================================================================================================//
_situation = player createDiaryRecord ["diary", ["SITREP","
*** Brief description of the situation.***
"]];

//============================================= END OF FILE =============================================//
