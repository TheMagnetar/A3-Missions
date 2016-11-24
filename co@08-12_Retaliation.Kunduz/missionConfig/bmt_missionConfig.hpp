//=======================================================================================================//
// File: bmt_missionConfig.hpp                                                                           //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/11/05                                                                             //
// Description: This document defines basicc information regarding the mission, like its name, respawn   //
//              type, loading images, ...                                                                //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

//=======================================================================================================//
// Mission header - Game type definition and minimum and maximum number of players.                      //
//=======================================================================================================//
class Header {
    gameType = Coop;           // Game type: https://community.bistudio.com/wiki/Multiplayer_Game_Types
    minPlayers = 8;            // Minimum number of players.
    maxPlayers = 12;           // Maximum number of players.
    playerCountMultipleOf = 1; // Balancing in tvt or pvp game types.
};

//=======================================================================================================//
// Mission configuration - Variables to configure different scripts of the template.                     //
//=======================================================================================================//
class bmt_config {
    // Variables affecting the admin briefing.
    bmt_config_testedAddons = "- Advanced Combat Environment 3 (ACE3) v3.5.1.<br/>- Advanced Combat Radio Environment 2 (ACRE2) v2.1.0.<br/>- Advanced Light Infantry Virtual Environment (ALIVE) v1.0.2.<br/>- Community Base Addons (CBA) v2.3.0.<br/>- Dynamic-AI-Creator (DAC) v3.1b (addon version).<br/>- Kunduz, Afghanistan v1.08.<br/>- Leights Opfor Pack (LOP) v1.7.1.<br/>- RHS United States Army Forces (RHS USAF) v0.4.0.2.<br/>- RHS Armed Forces of the Russian Federation (RHS AFRF) v0.4.0.2.<br/>- Task Force Arrowhead Radio (TFAR) v0.9.7.3.";
    bmt_config_templateVersion = "v1.0 (2016-05-14).";
    bmt_config_missionVersion = "v1.0 (2016-01-18).";
    bmt_config_missionCollaborators = "-.";
    bmt_config_missionDifficulty = "High.";
    bmt_config_missionSummary = """Retaliation"" is a mission in Kunduz, Afghanistan, after the events of the ""Home sweet home..."" mission. In this mission, the players must rescue the marines captured by the insurgent afghan forces and recover any information that could have been extracted from the marines. Tasks are not updated once they are completed and it is up to the players to decide if it has been completed or not. Patrols and enemy units are totally random, and the mission briefing is performed at the beginning using ACE 3 slideshow. Players have at their disposal CAS and EVAC.";
    bmt_config_missionNotesAndRemarks = "-.";


    bmt_config_jipAllowedTime = 300;     // JIP players are enabled until the specified time (in seconds).
                                         // To enable always JIP players set to -1.
    bmt_config_numAllowedRespawns = 0;   // Number of allowed respawns. Set to -1 to have unlimited respawns,
                                         // respawns, 0 to disable respawn and a positive number to limit
                                         // the number of respawns. As a side note, if ACE3 Revive system
                                         // is used, a positive number will effectively limit the amount of
                                         // times a player can be revived by a medic. Nevertheless,
                                         // activating ACE 3 Revive will disable respawning.
};

//=======================================================================================================//
// Loading screen: https://community.bistudio.com/wiki/Description.ext                                   //
//=======================================================================================================//

onLoadName = "Retaliation";                               // Mission name.
onLoadMission = "Rescue the surviving marines.";          // Brief mission description.
onLoadIntro = "Arma 3 - Basic Mission Template (A3-BMT)"; // Message shown while loading introduction.
onLoadIntroTime = 0;                                      // Show (1) or hide (0) date and time on when loading introduction.
onLoadMissionTime = 0;                                    // Show (1) or hide (0) date and time on when loading mission.
author = "TheMagnetar";                                   // Author.
loadScreen = "images\loadScreen.jpg";                     // Image displayed when loading mission.
overviewPicture = "images\overviewPicture.jpg";           // Imatge displayed when selecting mission (aspect 2:1).
overviewText = "After the attack of troops heading home, allied forces have decided to increase the intensity of the operations in Kunduz in order to deliver a clear message to the insurgent forces: all attacks will be answered in kind! The main objective is to rescue the few surviving marines and eliminate any evidence of leaked information obtained through torture.";          // Text shown when selecting mission.

//=======================================================================================================//
// Respawn Settings: https://community.bistudio.com/wiki/Arma_3_Respawn                                  //
//=======================================================================================================//
respawn             = "BASE";  // Respawn type BASE. Recommended. Allows JIP and the number of respawns
                               // can be limited in "bmt_config_numAllowedRespawns" side wise or player wise.
respawnDelay        = 10;      // Respawn delay in seconds.
respawnVehicleDelay = 30;      // Vehicle respawn delay in seconds.
RespawnDialog       = 0;       // Show (1) or hide (0) the scoreboard and respawn countdown timer for a
                               // player if he is killed with "respawnType = 3" (BASE).
respawnOnStart      = -1;      // 1: Respawn on start. Run respawn script on start. Available only for
                               //    INSTANT and BASE respawn types.
                               // 0: Don't respawn on start. Run respawn script on start. Available only for
                               //    INSTANT and BASE respawn types.
                               // -1: Don't respawn on start. Don't run respawn script on start.
joinUnassigned      = 1;       // Auto assign player (0) a free playable slot. Let player decide (1).
disabledAI          = 1;       // Hide playable units without an assigned player.
aiKills             = 0;       // Show (1) or hide (0) AI score.

respawnTemplates[]          = {"bmt_respawn"};
//respawnTemplatesWest[]      = {"bmt_respawn"};
//respawnTemplatesEast[]      = {"bmt_respawn"};
//respawnTemplatesCiv[]       = {"bmt_respawn"};
//respawnTemplatesVirtual[]   = {}; // Virtual Players.

class CfgRespawnTemplates {
    class bmt_respawn {
        onPlayerKilled = "src\respawn\scripts\bmt_respawn_onPlayerKilled.sqf";
        onPlayerRespawn = "src\respawn\scripts\bmt_respawn_onPlayerRespawn.sqf";
    };
};

//=======================================================================================================//
// BIS Debug Console: https://community.bistudio.com/wiki/Description.ext#enableDebugConsole             //
//=======================================================================================================//
enableDebugConsole = 1;  // Enabled for SP and MP administrators.

//=======================================================================================================//
// Configuration of several mission parameters.                                                          //
//=======================================================================================================//
showGPS     = 1;             // Shows (1) or hides (0) the GPS receiver on the map screen.
showCompass = 1;             // Shows (1) or hides (0) the compass on the map screen.
showMap     = 1;             // Shows (1) or hides (0) map after the mission starts.
showWatch   = 1;             // Shows (1) or hides (0) the watch on the map screen.
showUAVFeed = 0;             // Shows (1) or hides (0) the UAV feed.
forceRotorLibSimulation = 1; // Force enable or disable RotorLib: 0 = client options based,
                             // 1 = force enable, 2 = force disable.
disableChannels[]={1,2,3,4}; // Disable channels. MOTD and admin say have exception and will show in global.
                             // 0 = global, 1 = Side, 2 = Command, 3 = Group, 4 = Vehicle, 5 = Direct,
                             // 6 = System.

//============================================= END OF FILE =============================================//
