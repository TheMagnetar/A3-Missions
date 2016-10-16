//=======================================================================================================//
// File: bmt_briefing_rhs_usmc_d.sqf                                                                     //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/02/22                                                                             //
// Description: This document generates the mission briefing for units belonging to the RHS faction      //
//              United States Marine Corps "rhs_faction_usmc_d"                                          //
//              http://doc.rhsmods.org/index.php/United_States_Marine_Corps                              //
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
- ""November 1"": CAS support.<br/>
- ""Rain 1-3"": Three helicopters without offensive capabilities used mainly for transport.
<br/><br/>
<font color='#FF0000' size='18'>Supply</font>
<br/>
Without resupply.
"]];

//=======================================================================================================//
// NOTES: INTEL.                                                                                         //
//=======================================================================================================//
_intel = player createDiaryRecord ["diary", ["Intel","
<font color='#FF0000' size='18'>Enemy forces</font>
<br/>
A strong presence of enemy troops is expected. Insurgent forces are poorly equipped and they probably do
not have night vision capabilites.
<br/><br/>
<font color='#FF0000' size='18'>Allied forces</font>
<br/>
- Alpha squad with sniper team.<br/>
- CAS helicopter ""November"".<br/>
- Evacuation team ""Rain"": 3 helicopters without offensive capabilities.
<br/><br/>
<font color='#FF0000' size='18'>Civilians</font>
<br/>
Strong civilian presence in the area of operations. It has been observed in previous operations that they
simpathise with insurgent forces and they are slightly hostile towards allied forces.
"]];

//=======================================================================================================//
// NOTES: MISSION AND EXECUTION.                                                                         //
//=======================================================================================================//
_missionExecution = player createDiaryRecord ["diary", ["Mission and execution","
<font color='#FF0000' size='18'>Mission</font>
<br/>
Two infantry teams and one sniper team will be deployed in Kunduz, Afghanistan. Their objective will
consist on rescuing, with the collaboration of the Afghan Police, the marines captured last week in an
insurgent attack never seen before. With all probability, the captured marines have been subjected to
torture. It is of high priority to recover any information that could have been extracted.
<br/>
Due to the strong presence of enemy troops and the civilian hostility, it has been considered necessary to
assign the close air support unit (CAS) ""November"" and the evacuation team ""Rain"" to the alpha squad.
According to Intel reports, enemy units are poorly equipped and they have none or very few ways of
effectively counterattacking an air assault or an assault during the night.
<br/><br/>
<font color='#FF0000' size='18'>Main tasks</font>
<br/>
- <font color='#00FFFF'>Main task 1</font>: Rescue the captured marines during the enemy attack that took
place last week.
<br/>
- <font color='#00FFFF'>Main task 2</font>: Recover any leaked Intel report.
<br/><br/>
<font color='#FF0000' size='18'>Secondary tasks</font>
<br/>
- <font color='#00FFFF'>Secondary task</font>: Capture dead or alive the new insurgent warlord.
<br/><br/>
<font color='#FF0000' size='18'>Execution</font>
<br/>
- Insertion at <marker name=""markerStart"">LZ1</marker>.
<br/>
- Contact with the <marker name=""markerPolice"">Afghan police</marker> in order to exchange information on
the location of the new warlord.
<br/>
- Aproach the area of operations and <marker name=""markerRescue"">rescue the captured marines</marker>.
<br/>
- Minimise civilian casualties in order to gain their respect and collaboration.
<br/>
- Head towards the allied base Foxtrot from the <marker name=""markerEnd"">north-east</marker> in order to
provide with medical treatment to the rescued marines.
"]];

//=======================================================================================================//
// NOTES: SITUATION.                                                                                     //
//=======================================================================================================//
_situation = player createDiaryRecord ["diary", ["SITREP","
Last week, a marine convoy with troops heading home were brutally ambushed, and the few survivors were
captured. The attack authors are a new insurgent radical group in the region of Kunduz.
<br/>
Due to the active troop withdrawal due to political reasons, a small but highly trained infantry squad has
been charged with the task of rescuing the captured marines. It is expected, with this mission, to deliver
a clear message to any insurgent group: all attacks will be answered in kind!
"]];

//============================================= END OF FILE =============================================//
