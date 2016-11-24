## /missionConfig/briefing

### Files

* The player briefing files are named using the convention `missionConfig/bmt_briefing_XXX.sqf` where `XXX` is the faction identifier.
* The administrator briefing is named `missionConfig/bmt_briefing_admin.sqf`.

### Player briefing

Each player sees the briefing belonging to the playable unit's faction. This is useful for TvT missions or missions in which two allied factions have different
objectives. T Each file has the following briefing
template.

* **SITREP:** Serves as a background for the mission and it sets its tone.
* **Mission and Execution:** Brief description of the mission and how it is envisaged to be accomplished.
* **Intel:** Intelligence report on enemy or allied units or any other mission relevant information.
* **Logistics:** Description of the available supports (CAS, MEDEVAC, ...) or resupply options available to the players.
* **Radio frequencies:** Summary of radio frequencies and callsigns.
* **Credits:** not mission relevant, but details mission author and collaborators.

Any other entry can be easily added using the following code:

```
player createDiaryRecord ["diary", ["Topic Title","Topic Text"]];
```

Note that the last entries in the file are displayed first in the in-game briefing screen!

### The administrator briefing

The administrator briefing has the following information and functionality.

#### Mission information

The mission section displays useful information regarding the mission. The following entries are present and are taken from `missionConfig/bmt_missionConfig.hpp`:

* **Required addons**: Specifies with which addons the mission has been tested with (`bmt_config_testedAddons`).
* **Mission name**: Name of the mission as specified in `onLoadName`.
* **Version** Verion of the mission as in `bmt_config_missionVersion`.
* **Author**: Auhtors of the mission as stated in `author`.
* **Collaborators**: Mission collaborators (`bmt_config_missionCollaborators`).
* **Basic Mission Template (BMT) version**: Version of the template as in `bmt_config_templateVersion`.
* **Game Type**: entry speified in the `gameType` variable.
* **Minimum number of players**: specified in `minPlayers`.
* **Maximum number of players**: specified in `maxPlayers`.
* **Respawn**: Describes the type of respawn the mission has (`respawn`).
* **Difficulty**: Estimated mission difficulty (`bmt_config_missionDifficulty`).
* **Mission summary**: Brief summary of the mission taken from `bmt_config_missionSummary`.
* **Additional notes and remarks**: Additional notes and remarks from the author. It should describe, for
example, if the administrator has to have a role in the mission (via Zeus) or known bugs.

#### Ending infromation

Each of the entries in `missionConfig/bmt_missionDebriefing.hpp` with their descriptions are listed in here. The administrator can activate any of these endings
by simply clicking on them.

#### JIP control

This is were the administrator can regulate JIP players. It currently presents three options:

* Increase JIP allowed time by 5 minutes.
* Disable JIP.
* Allow JIP.

Note that while JIP can be disabled, a player that suffered a disconnection and was able to reconnect will not be affected by this restriction. The A3-BMT template
treats those players as valid players throughout the mission.

### Supported factions

| **Faction**        | **Code**          |
| ------------- | ------------- |
| Blue Force                                                       | `blu_f`                            |
| Blue Force Pacific                                               | `blu_t_f`                          |
| CTRG                                                             | `blu_ctrg_f`                       |
| Gendarmerie                                                      | `blu_gen_f`                        |
| Civilians                                                        | `civ_f`                            |
| FIA                                                              | `blu_g_f`, `ind_g_f` and `opf_g_f` |
| Independent Force                                                | `ind_f`                            |
| Syndikat                                                         | `ind_c_f`                          |
| Opposing Force                                                   | `opf_f`                            |
| Opposing Force Pacific                                           | `opf_t_f`                          |
| Bundeswehr                                                       | `bwa3_faction`                     |
| RHS Insurgents                                                   | `rhs_faction_insurgents`           |
| RHS Russian Airborne Troops (Vozdushno-desantnye voyska)         | `rhs_faction_vdv`                  |
| RHS Soviet Air Defense Troops (Voyska protivovozdushnoy oborony) | `rhs_faction_vpvo`                 |
| RHS United States Army (Desert)                                  | `rhs_faction_usarmy_d`             |
| RHS United States Army (Woodland)                                | `rhs_faction_usarmy_wd`            |
| RHS United States Marine Corps (Desert)                          | `rhs_faction_usmc_d`               |
| RHS United States Marine Corps (Woodland)                        | `rhs_faction_usmc_wd`              |
| RHS United States Navy                                           | `rhs_faction_usn`                  |
