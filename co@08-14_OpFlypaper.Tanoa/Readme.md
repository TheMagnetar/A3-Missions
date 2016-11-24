# Operation Flypaper

<p align="center">
    <img src="https://github.com/TheMagnetar/A3-Missions/blob/master/co%4008-14_OpFlypaper.Tanoa/images/PortadaForum.jpg">
</p>

Mission generated using the "Arma 3 Basic Mission Template" (A3-BMT).

**Mission name**: Operation Flypaper.

**Version**: v1.0 (2016/10/15).

**Author**: TheMagnetar.

**Contributors**: -.

**Game type**: Coop.

**Minimum number of players**: 8.

**Minimum number of players**: 14.

**Respawn**: None (Spectator).

**Dificulty**: High.

**Mission summary**: "Operation Flypaper" is a mission in Tanoa in which the players have to sabotage the
enemy airbase. The airbase does not have static defenses and only infantry patrols and one wheeled vehicle
are present. The players are inserted using HALO. Tasks are not updated once they are completed and it is
up to the players to decide if it has been completed or not. Patrols and enemy units are totally random.

**Arma 3 Basic Mission Template (A3-BMT)**: v1.0 (https://github.com/TheMagnetar/Basic-Mission-Template)
by TheMagnetar.

**Necessary or recommended addons**: List of necessary and/or recommended addons.

* Advanced Combat Environment (ACE 3) v3.8.0.
* Advanced Combat Radio Environment (ACRE 2) v2.2.0.
* Advanced Light Infantry Virtual Environment (ALiVE) v1.2.0. **Required**.
* Community Base Addons (CBA) v3.1.0. **Required**.
* Dynamic-AI-Creator (DAC) v3.1b addon version. **Required**.
* RHS United States Armed Forces (RHS USAF) v0.4.1.1. **Required**.
* RHS Armed Forces of the Russian Federation (RHS AFRF) v0.4.1.1. **Required**.
* Task Force Arrowhead Radio (TFAR) v0.9.12.

## Detailed mission description

### SITREP

The Russian presence on Tanoa is reaching highly threating levels. For the past months they have been
sending high amount of troops. The Russian interests on the island have collided several times with the
allied forces and an all-out war is inevitable after the air attack last week on the allied forces on the
island. The attack wiped out most of our forward bases. However, the rush of the Russian Federation in
order to establish dominance has opened a window for us to counter attack and deliver a major blow to their
aerial assets. The airfield defenses are still not completed and a small team should be able to infiltrate
and sabotage them.

### MISSION AND EXECUTION

The Russian airfield has its static defenses not yet completed. The team should infiltrate the airfield and
sabotage the enemy air assets. Contact with enemy patrols should be minimised: stealth is a priority.

<p align="center">
    <img src="https://github.com/TheMagnetar/A3-Missions/blob/master/co@08-14_OpFlypaper.Tanoa/images/Map.png">
</p>

**Main task**
* Destroy the enemy air assets on the Russian airfield.

**Execution**
* *Alpha* squad will HALO jump at the insertion point.
* Destroy as many enemy air assets as possible.
* Head towards the extraction point and blend in with the population.

### INTEL

**Allied forces**
* Squad *Alpha 1*.

**Enemy forces**
* Enemy does not possess any static defenses.
* Strong presence of infantry enemy patrols.
* Low presence of wheeled vehicles.
* Very low presence of mecanised infantry or armored vehicles.

**Civilians**
* Civilians live in the adjacent towns.

### ADMINISTRATION/LOGISTICS

**Support**
* None

**Supply**
* Ammo box is delivered during HALO.

### ROLES AND RADIO FREQUENCIES

* Squad *Alpha 1*: frequency 200 kHz.
  * Fireteam *Alpha 1-1*: Radio frequency 201 kHz.
    * Squad leader.
    * Explosives specialist.
    * Rifleman (UAV).
    * Automatic rifleman (M249).
    * Combat medic.
  * Fireteam *Alpha 1-2*: Radio frequency 202 kHz.
    * Team leader.
    * Rifleman (AT4).
    * Machine gunner (M240B).
    * Explosives specialist.
    * Grenadier.
    * Rifleman.
  * Sniper team *Alpha 1-3*: Radio frequency 203 kHz.
    * Sniper.
    * Spotter.

# Arma 3 Basic Mission Template (A3-BMT)

**Author**: TheMagnetar.

**Version**: 1.0.

**Last modified**: 2016/04/06.

**Description**: The "Arma 3 Basic Mission Template" (A3-BMT) was designed in order to ease the amount of
work required when editing a mission for Arma 3. Although originally envisaged to satisfy the needs of the
"1er Regiment Aerotransportat (1RA)" of the Catalan community of simulation "Cavallers del Cel", its scope
has broaden and has become more general.

### Requirements:

The "Arma 3 Basic Mission Template (A3-BMT)" has been designed to be flexible and to be independent from
external addons. Any contributer that wants to add an external script must include it with an option to
deactivate it.

### Structure:

The template has the following folder structure:

* "\" (root foler): This folder contains those files that are essential for the mission and the template:
description.ext, init.sqf, mission.sqm, bmt_components.hpp and this Readme file.
* "\dac": This folder contains the configuration files for the addon Dynamic-AI-Creator. The mission
creator does not need to place External DAC Logic since this is handled automatically by the template. This
tool, created by Silola, allow generating AI quickly and dynamically and it allows to save some resources
through AI caching techniques. More information can be found in
http://forums.bistudio.com/showthread.php?176926-DAC-V3-1-(Dynamic-AI-Creator)-released.
* "\externalScripts": This folder contains third party addons and scripts.
  * "\externalScripts\T8": The `T8 Units` script by T-800a. This is a less dynamic AI creator that is
  compatible with DAC. More information can be found in
  https://forums.bistudio.com/topic/172795-release-t8-units-a-less-dynamic-ai-creator/.
* "\images": Folder where all images are stored.
* "\missionConfig": Folder where scripts and functions, that need to be modified for every mission are
stored. It contains:
  * "\missionConfig\ace3": Scripts and functions to configure ACE3.
  * "\missionConfig\acre2": Scripts and functions to configure ACRE2.
  * "\missionConfig\asrai3": Script to configure ASR AI 3.
  * "\missionConfig\briefing": Scripts to generate the briefings for each of the supported factions.
  Server administrator has a especial briefing.
  * "\missionConfig\configEquipment": Scripts and functions to equip the unit for each of the supported
  factions. They can be used for vehicles, infantry and ammo boxes.
  * "\missionConfig\core": Scripts and functions that define core variables and/or check the configuration
  of loaded addons.
  * "\missionConfig\endMission": Functions that allow ending the mission once certain conditions are met.
  * "\missionConfig\intro": Scripts for mission introduction screens. Each of the supported factions has an
  own introduction.
  * "\missionConfig\t8units": Scripts to configure the `T8 Units` unit generation script by T-800a. More
  information can be found in
  https://forums.bistudio.com/topic/172795-release-t8-units-a-less-dynamic-ai-creator/.
  * "\missionConfig\tfar": Scripts and functions to configure el TFAR.  
  * "\missionConfig\bmt_components_addons.hpp": File where the configuration of external addons using the
  scripts included in the template can be enabled or disabled.
  * "\missionConfig\bmt_missionConfig.hpp": File included in `description.ext`. It declares variables such
  as mission name, game type, author, respawn, ...
  * "\missionConfig\bmt_missionDebriefing.hpp": File included in `description.ext`. It defines the
  different endings of the mission.
* "\src": Folder where scripts and functions, organised in subfolders, that must not be modified for a
especific mission are stored. It contains:
  * "\src\ace3": Scripts and functions to configure ACE3.
  * "\src\acre2": Scripts and functions to configure ACRE2.
  * "\src\briefing": Scripts to generate the briefings for each of the supported factions. Server
  administrator has a especial briefing.
  * "\src\configEquipment": Scripts and functions to equip the unit for each of the supported factions.
  They can be used for vehicles, infantry and ammo boxes.
  * "\src\configGroup": Scripts and functions that defines to which squad and fireteam the unit belongs to.
  * "\src\configUnit": Scripts and functions to configure the unit, squad and fireteam as well as the
  loadout of the unit depending on the role. Virtual arsenal profiles.
  * "\src\core": Scripts and functions that define core variables and/or check the configuration of loaded
  addons.
  * "\src\dac": Scripts and functions to configure DAC. They automatically place the necessary game logics
  for a proper DAC initialisation.
  * "\src\intro": Effects during mission introduction screen.
  * "\src\jip": Script for supporting JIP players. It can be configured in order to deny JIP players since
  mission start, allow them to join only before a certain time has passed or to join at any time.
  * "\src\misc": Miscellaneous scripts and functions.
  * "\src\respawn": Contains a custom respawn template that supports tickets, unlimited respawns or no
  respawn. It is integrated together with spectator scripts such as ACE3 or End Game (BI). JIP players are
  also supported.
  * "\src\t8units": Scripts to initialise T8 Units.
  * "\src\tfar": Scripts and functions to configure TFAR.
  * "\src\zeus": Scripts and functions to configure Zeus.

### Supported addons

The following is a list showing the currently supported addons.

* Contents:
  * RHS Armed Forces of the Russian Federation (AFRF): http://www.rhsmods.org/mod/1.
  * RHS United States Armed Forces (USAF): http://www.rhsmods.org/mod/2.
  * Bundeswehr A3 (BWA3): http://www.bwmod.de/.
* Artificial Intelligence (AI):
  * ASR AI 3: https://github.com/robalo/mods/tree/master/asr_ai3/addons.
* Realism:
  * Advanced Combat Environment (ACE3): https://github.com/acemod/ACE3 or http://ace3mod.com/.
  * Advanced Gameplay Modification (AGM): https://github.com/KoffeinFlummi/AGM. **Obsolete**.
* Radio system:
  * Advanced Combat Radio Environment 2 (ACRE2): http://forums.bistudio.com/showthread.php?191848-ACRE2-Stable-Release.
  * Task Force Arrowhead Radio (TFAR): https://github.com/michail-nikolaev/task-force-arma-3-radio.
* Unit spawning:
  * Dynamic-AI-Creator v3.1b: https://forums.bistudio.com/topic/167033-dac-v31-dynamic-ai-creator-released/.
  * T8 Units: https://github.com/T-800a/T8_Units.

### Supported factions

The following list shows the supported factions for those scripts that allow a greater control degree of
equipment and tasks:

* Briefing: *src\briefing\scripts\bmt_briefing.sqf* and its child files in folder *missionConfig\briefing\scripts*.
* Equipment: *src\configEquipment\functions\fn_configEquipment.sqf* and its child files in folder *missionConfig\configEquipment\scripts*.
* Babel (ACRE2): *missionConfig\acre2\scripts\bmt_acre2_configuration.sqf* (babel).
* Introduction: *missionConfig\intro\scripts\bmt_intro.sqf*.

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
