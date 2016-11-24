# Retaliation

<p align="center">
    <img src="https://github.com/TheMagnetar/A3-Missions/blob/master/co%4008-12_Retaliation.Kunduz/images/PortadaForum.jpg">
</p>

Mission generated using the "Arma 3 Basic Mission Template" (A3-BMT).

**Mission name**: Retaliation.

**Version**: v1.0 (2016-01-18).

**Author**: Magnetar.

**Contributors**: -.

**Game type**: Coop, TvT, PvP, ZvZ.

**Minimum number of players**: 8.

**Minimum number of players**: 12.

**Respawn**: None (Spectator).

**Dificulty**: High.

**Mission summary**: *Retaliation* is a mission in Kunduz, Afghanistan, after the events of the
*Home sweet home...* mission. In this mission, the players must rescue the marines captured by the
insurgent afghan forces and recover any information that could have been extracted from the marines. Tasks
are not updated once they are completed and it is up to the players to decide if it has been completed or
not. Patrols and enemy units are totally random, and the mission briefing is performed at the beginning
using ACE 3 slideshow. Players have at their disposal CAS and EVAC.

**Arma 3 Basic Mission Template (A3-BMT)**: v1.0 (https://github.com/TheMagnetar/Basic-Mission-Template)
by TheMagnetar.

**Necessary or recommended addons**: This mission works with the following set of addons:
* Advanced Combat Environment 3 (ACE3) v3.5.1. **Required**.
* Advanced Combat Radio Environment 2 (ACRE2) v2.1.0.
* Advanced Light Infantry Virtual Environment (ALIVE) v1.0.2. **Required**.
* Community Base Addons (CBA) v2.3.0. **Required**.
* Dynamic-AI-Creator (DAC) v3.1b (addon version). **Required**.
* Kunduz, Afghanistan v1.08. **Required**.
* Leights Opfor Pack (LOP) v1.7.1. **Required**.
* RHS United States Army Forces (RHS USAF) v0.4.0.2. **Required**.
* RHS Armed Forces of the Russian Federation (RHS AFRF) v0.4.0.2. **Required**.
* Task Force Arrowhead Radio (TFAR) v0.9.7.3.

## Detailed mission description

### SITREP

Last week, a marine convoy with troops heading home were brutally ambushed, and the few survivors were
captured. The attack authors are a new insurgent radical group in the region of Kunduz.

Due to the active troop withdrawal due to political reasons, a small but highly trained infantry squad has
been charged with the task of rescuing the captured marines. It is expected, with this mission, to deliver
a clear message to any insurgent group: all attacks will be answered in kind!

### MISSION AND EXECUTION

Two infantry teams and one sniper team will be deployed in Kunduz, Afghanistan. Their objective will
consist on rescuing, with the collaboration of the Afghan Police, the marines captured last week in an
insurgent attack never seen before. With all probability, the captured marines have been subjected to
torture. It is of high priority to recover any information that could have been extracted.

Due to the strong presence of enemy troops and the civilian hostility, it has been considered necessary to
assign the close air support unit (CAS) *November* and the evacuation team *Rain* to the *Alpha 1* squad.
According to Intel reports, enemy units are poorly equipped and they have none or very few ways of
effectively counterattacking an air assault or an assault during the night.

**Main tasks**
* Rescue the captured marines during the enemy attack that took place last week.
* Recover any leaked Intel report.

**Secondary tasks**
* Capture dead or alive the new insurgent warlord.

**Execution**
* Insertion at __LZ1__.
* Contact with the __Afghan police__ in order to exchange information on the location of the new warlord.
* Approach the area of operations and __rescue the captured marines__.
* Minimise civilian casualties in order to gain their respect and collaboration.
* Head towards the allied base Foxtrot from the __north-east__ in order to provide with medical treatment
to the rescued marines.

### INTEL

**Allied forces**
* Squad *Alpha 1*.
* CAS helicopter *November*.
* Evacuation team *Rain*: 3 helicopters without offensive capabilities.

**Enemy forces**
* A strong presence of enemy troops is expected. Insurgent forces are poorly equipped and they probably do
not have night vision.

**Civilians**
Strong civilian presence in the area of operations. It has been observed in previous operations that they
simpathise with insurgent forces and they are slightly hostile towards allied forces.

### ADMINISTRATION / LOGISTICS

**Support**
* *November 1*: CAS support.
* *Rain 1-3*: Three helicopters without offensive capabilities used mainly for transport.

**Supply**
* Without resupply.

### ROLES AND RADIO FREQUENCIES

* Squad *Alpha 1*: Radio frequency 200 kHz.
  * Fireteam *Alpha 1-1*: Radio frequency 201 kHz.
    * Squad leader.
    * Rifleman (UAV).
    * Automatic rifleman (M249).
    * Grenadier.
    * Combat medic.
  * Fireteam *Alpha 1-2*: Radio frequency 202 kHz.
    * Team leader.
    * AT (Javelin).
    * Machinegunner (M240B).
    * Rifleman (AT4).
    * Grenadier.
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

## Requirements:

The "Arma 3 Basic Mission Template (A3-BMT)" has been designed to be flexible and to be independent from
external addons. Any contributer that wants to add an external script must include it with an option to
deactivate it.

## Structure:

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

## Supported addons

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

## Supported factions

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
