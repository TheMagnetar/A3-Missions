//=======================================================================================================//
// File: bmt_briefing_rhs_usarmy_d.sqf                                                                   //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/02/22                                                                             //
// Description: This document generates the mission briefing for units belonging to the RHS faction      //
//              United States Army "rhs_faction_usarmy_d".                                               //
//              http://class.rhsmods.org/rhsusaf/CfgGroups_West_rhs_faction_usarmy_d.html                //
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
// NOTES: Target.                                                                                        //
//=======================================================================================================//
_admlog = player createDiaryRecord ["diary", ["Ohmid Raheem","
The colonel Ohmid Raheem a week ago.
<br/><br/>
<img image='images\OhmidRaheem.jpg' width='338' height='512'/>
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
- Fireteam ""Alpha 1-3"": 203 kHz.
"]];

//=======================================================================================================//
// NOTES: ADMINISTRATION/LOGISTICS.                                                                       //
//=======================================================================================================//
_adminLog = player createDiaryRecord ["diary", ["Administration/Logistics","
<font color='#FF0000' size='18'>Support</font>
<br/>
Without supports.
<br/><br/>
<font color='#FF0000' size='18'>Supply</font>
<br/>
Without resupply.
"]];

//=======================================================================================================//
// NOTES: INTEL.                                                                                         //
//=======================================================================================================//
_intel = player createDiaryRecord ["diary", ["Intel","
<br/><br/>
<font color='#FF0000' size='18'>Enemy forces</font>
<br/>
Strong presence of enemy forces in the area of operations. Armored vehicles have been sighted.
<br/><br/>
<font color='#FF0000' size='18'>Allied forces</font>
<br/>
Due to the possibility of an imminent enemy attack, no additional troops could be assigned to this mission. The presence of civilians in the area of operations make CAS support non-viable.
<br/><br/>
<font color='#FF0000' size='18'>Civillians</font>
<br/>
Strong presence of civilian population.
<br/><br/>
<font color='#FF0000' size='18'>Area of operations</font>
<br/>
Area of operations in summer.
<br/><br/>
<img image='images\AO_Summer.jpg' width='384' height='192'/>
"]];

//=======================================================================================================//
// NOTES: MISSION AND EXECUTION.                                                                         //
//=======================================================================================================//
_missionExecution = player createDiaryRecord ["diary", ["Mission and Execution","
<font color='#FF0000' size='18'>Mission</font>
<br/>
Two infatry teams and one sniper team will be deployed in the north-west of Sofia, Altis, with the objective of <font color='#FF0000'>eliminating the colonel Ohmid Raheem</font>. He coordinates the military operations in the north of Altis from the <marker name=""Assassinate"">coast</marker>.
<br/><br/>
Once the task is completed, the allied forces will head to <marker name=""Extraction"">Sofia</marker> in order to regroup with the rest of the alliead forces and prepare the offensive to retake the north part of Altis.
<br/><br/>
<font color='#FF0000' size='18'>Main tasks</font>
<br/>
- <font color='#00FFFF'>Main task</font>: Eliminate the enemy colonel in order to destabilise the military structure in the region.
<br/><br/>
<font color='#FF0000' size='18'>Execution</font>
<br/>
- Insertion at <marker name=""Insertion"">LZ1</marker>.
<br/>
- Approach the area of operations and <marker name=""Assassinate"">eliminate the objective</marker>.
<br/>
- Minimise civilian casualties in order to enhance further collaboration.
<br/>
- Regroup at <marker name=""Extraction"">Sofia</marker>.
"]];

//=======================================================================================================//
// NOTES: SITUATION.                                                                                     //
//=======================================================================================================//
_situation = player createDiaryRecord ["diary", ["SITREP","
The unrelenting advance of the CSAT forces has coerced the allied countries to intervene in order to stop
the constant annexion of territory using brute force. The island of Altis has been considered a key
strategic point to achieve control of de Mediterranean sea. After several trials, a foothold has been
secured at the north-east part of Altis but the situation is far from being considered safe.
<br/><br/>
Throug a series of cell phone interventions, the inteligence service has discovered that the latest defeats
of the CSAT forces in the Mediterranean have made one of their most charismatic leaders, colonel Ohmid
Raheem, to be at the centre of critics. The presence of two fations, those loial to the colonel and those
who believe his golden years are over, opens the possibility of generating internal conflicts if he is
eliminated that would facilitate future military operations in the island.
<br/><br/>
Conscious of the precariousness of his situation, colonel Ohmid Raheem has surrounded himself by his most
loial troops and moved to the north of Altis in order to personally command a supposed grand scale attack
to recover the total control of the island, establishing his base of operations in a holiday resort with
strong civilian presence. This is not the first time that Ohmid Raheem uses civilians as human shields.
"]];

//============================================= END OF FILE =============================================//
