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
    minPlayers = 1;            // Minimum number of players.
    maxPlayers = 14;           // Maximum number of players.
    playerCountMultipleOf = 1; // Balancing in tvt or pvp game types.
};

//=======================================================================================================//
// Mission configuration - Variables to configure different scripts of the template.                     //
//=======================================================================================================//
class bmt_config {
    // Variables affecting the admin briefing.
    bmt_config_testedAddons = "*** List of addons with the corresponding tested version number. ***<br/>*** Each addon must have its own line. ***";
    bmt_config_templateVersion = "v1.0 (2016-05-14).";
    bmt_config_missionVersion = "vX.Y (date).";
    bmt_config_missionCollaborators = "TheMagnetar (A3-BMT) and *** Possible collaborators ***.";
    bmt_config_missionDifficulty = "*** Expected mission difficulty. ***";
    bmt_config_missionSummary = "*** Mission summary for administrators. ***";
    bmt_config_missionNotesAndRemarks = "*** Additional notes and remarks from the mission author. ***";


    bmt_config_jipAllowedTime = 300;     // JIP players are enabled until the specified time (in seconds).
                                         // To enable always JIP players set to -1.
    bmt_config_numAllowedRespawns = -99; // Number of allowed respawns. Set to -99 to have unlimited
                                         // respawns, 0 to disable respawn and a positive number to limit
                                         // the number of respawns. As a side note, if ACE3 Revive system
                                         // is used, a positive number will effectively limit the amount of
                                         // times a player can be revived by a medic. Nevertheless,
                                         // activating ACE 3 Revive will disable respawning.
};

//=======================================================================================================//
// Loading screen: https://community.bistudio.com/wiki/Description.ext                                   //
//=======================================================================================================//

onLoadName = "*** Mission name. ***";                     // Mission name.
onLoadMission = "*** Mission description. ***";           // Brief mission description.
onLoadIntro = "Arma 3 - Basic Mission Template (A3-BMT)"; // Message shown while loading introduction.
onLoadIntroTime = 0;                                      // Show (1) or hide (0) date and time on when loading introduction.
onLoadMissionTime = 0;                                    // Show (1) or hide (0) date and time on when loading mission.
author = "*** Author(s). ***";                            // Author.
loadScreen = "images\loadScreen.jpg";                     // Image displayed when loading mission.
overviewPicture = "images\overviewPicture.jpg";           // Imatge displayed when selecting mission (aspect 2:1).
overviewText = "*** Text to show. ***";                   // Text shown when selecting mission.

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
