## /src/ace3

This folder contains functions that take care of ACE3 configuration (www.ace3mod.com). This is done in two
stages:

* *bmt_ace3_settings.hpp*: Contains the ACE3 settings as exported from the editor. In this way, the mission
is completely independent from the ACE3 mod. In addition, two of the mod parameters: advanced ballistics
and medical system can be configured at mission start by simply changing the mission parameters.
* *PreInit*: Function defined in `fn_ace3_config_preInit.sqf` configures all modules available in ACE3
without placing any module in the editor. In this way, the mission is completely independent from the ACE3
mod. In addition, two of the mod parameters: advanced ballistics and medical system can be configured at
mission start by simply changing the mission parameters. **Deprecated**.
* *PostInit*: Function defined in `fn_ace3_config_postInit.sqf` configures the units especified in
`missionconfig/ace3/scripts/bmt_ace3_configuration.sqf` accordingly: captive, medics, doctors, engineers,...

Additionally the following functions are defined that deal with ACE3 functionality:

* `fn_ace3_assignWounds.sqf`: function that can be called at the `init` field. It assigns wounds to the
desired unit.
* `bmt_ace3_assignRandomDamage.sqf`: script that can be called at the `init` field and in a trigger. It
assigns random wounds (bullet, vehicle crash or explosion) to a list of units.
