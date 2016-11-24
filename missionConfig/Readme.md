## /missionConfig

This folder contains those files that change between missions and it is where most of the editing will take
place. It is organised in several subfolders and files in order to separate the scripts and functions in a
manageable way. Below is a brief description of the purpose of each of the subfolders and files. Each of
the folders has its own readme file, which is more detailed.

### Folders

Each of the subfolders contains additionally the `scripts` and `functions` folders in order to separate the
files more clearly.

* *ace3*: ACE 3 dependent scripts. It configures especial units in ACE 3 (medics, doctors,
medical vehicles, medical facilities, engineers, repair vehicles, repair facilities, surrendered and
handcuffed units and helicopters with fast roping).
* *acre2*: ACRE 2 related scripts. Deals with acre 2 mission configuration, babel, difficulty and which
radios that are going to be distributed per role.
* *asrai3*:
* *briefing*:
* *configEquipment*:
* *core*:
* *endMission*:
* *intro*:
* *t8units*:
* *tfar*:

### Files

* *bmt_components_addons.hpp*: This file defines which addons will be automatically configured using the
scripts in the template. If, for whatever reason, a custom configuration of an addon is desired, the
corresponding line in this file must be commented. This will prevent any functions and scripts from being
compiled, loaded and executed during the mission.
* *bmt_init.sqf*: File included at the end of `init.sqf`. All scripts and variable definitions that would
normally go in `init.sqf` should go here instead. This will keep the `init.sqf` file independent from
mission to mission, avoiding errors with the scripts of the template and a more clear differentiation
between mission and template scripts and variables.
* *bmt_missionConfig.hpp*: It is the most important file. In here mission variables such as author, minimum
and maximum number of players, game type, respawn templates among others are defined.
* *bmt_missionDebriefing.hpp*: This file contains the different endings of a mission: the `CfgDebriefing`
class. In order for the custom respawn template to work, only the `Disaster` entry must be present if the
custom respawn template `bmt_respawn` is used. In this case the mission will then end once all players are
dead.
* *bmt_missionParameters_definitions.hpp*: This file is where the mission editor can configure the
different mission parameters so that the adequate values are loaded without having to edit them at mission
start. None of the definitions in the file should be manually removed, since only the parameters of the
loaded addons in `bmt_components_addons.hpp` are loaded.
