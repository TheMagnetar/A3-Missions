//=======================================================================================================//
// File: bmt_briefing_rhs_usmc_wd.sqf                                                                    //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/06/12                                                                             //
// Description: This document generates the mission briefing for units belonging to the RHS faction      //
//              United States Marine Corps "rhs_faction_usmc_wd"                                         //
//              http://doc.rhsmods.org/index.php/United_States_Marine_Corps                              //
//                                                                                                       //
//              Arguments:                                                                               //
//               - none                                                                                  //
//                                                                                                       //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

private ["_credits", "_radio", "_adminLog", "_intel", "_missionExecution", "_situation"];

//=======================================================================================================//
// NOTES: CREDITS.                                                                                       //
//=======================================================================================================//
_credits = player createDiaryRecord ["diary", ["Credits","
Mission created by <font color='#00FFFF'>TheMagnetar</font> for the community <font color='#00FFFF'>Cavallers del Cel</font>.
"]];

//=======================================================================================================//
// NOTES: RADIO.                                                                                         //
//=======================================================================================================//
_radio = player createDiaryRecord ["diary", ["Radio frequencies","
- Squad ""Alpha 1"": 200 kHz.
<br/>
- Fireteam ""Alpha 1-1"": 201 kHz.
<br/>
- Fireteam ""Alpha 1-2"": 202 kHz.
<br/>
- Sniper team ""Alpha 1-3"": 203 kHz.
"]];

//=======================================================================================================//
// NOTES: ADMINISTRATION/LOGISTICS.                                                                       //
//=======================================================================================================//
_adminLog = player createDiaryRecord ["diary", ["Administration/Logistics","
<font color='#FF0000' size='18'>Support</font>
<br/>
- Artillery battery ""Feuer Regen"" with: 3 SADARM, 1 SMOKE and 1 HE.
<br/><br/>
<font color='#FF0000' size='18'>Supply</font>
<br/>
Without additional supplies.
"]];

//=======================================================================================================//
// NOTES: INTEL.                                                                                         //
//=======================================================================================================//
_intel = player createDiaryRecord ["diary", ["Intel","
<br/><br/>
<font color='#FF0000' size='18'>Enemy forces</font>
<br/>
- Enemy air defense units are located near an enemy camp.<br/>
- Armored units have not been spotted.
<br/><br/>
<font color='#FF0000' size='18'>Allied forces</font>
<br/>
- Squad ""Schattenschlag"".<br/>
- Artillery battery ""Feuer Regen"".
"]];

//=======================================================================================================//
// NOTES: MISSION AND EXECUTION.                                                                         //
//=======================================================================================================//
_missionExecution = player createDiaryRecord ["diary", ["Mission and Execution","
<font color='#FF0000' size='18'>Mission</font>
<br/>
Destroy the anti air batteries in order to reduce the defensive capabilities of the troops stationed at
the north of Altis.
<br/><br/>
<font color='#FF0000' size='18'>Main task</font>
<br/>
- <font color='#00FFFF'>Main task</font>: Destroy the anti air defense units.
<br/><br/>
<font color='#FF0000' size='18'>Execution</font>
<br/>
- Insertion at <marker name=""markerInsertion"">(147,226)</marker>.<br/>
- Destroy the enemy defense assets at the <marker name=""markerAntiair"">(142,212)</marker>
coordinates.<br/>
- Evacuate at <marker name=""markerExtraction"">(166,217)</marker>.
"]];

//=======================================================================================================//
// NOTES: SITUATION.                                                                                     //
//=======================================================================================================//
_situation = player createDiaryRecord ["diary", ["SITREP","
With the eastern part of Altis secured and the central front halted for weeks, the high command in Altis
has decided to change strategies. A squad of marines, consisting of two fire teams and one sniper team,
will be deployed at the <marker name=""markerInsertion"">north of Altis</marker> in order to perform a
quick attack at the <marker name=""markerAntiair"">enemy camp</marker>. The objective is to destroy their
air defence capabilities.<br/>
Due to the fact that the majority of the troops have been assigned to the central defense in order to
prevent the avance of enemy troops, the squad ""Schattenschlag"" will be completely alone. Nevertheless,
the artillery battery ""Feuer Regen"" has been able to infiltrate the enemy lines, and has positioned
itself close enough to give support during the attack. However, this is a high risk position. It is
advisable, therefore, speed and aggressiveness!<br/>
"]];

//============================================= END OF FILE =============================================//
