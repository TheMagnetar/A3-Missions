## /missionConfig/acre2

This folder is where ACRE 2 mission dependent scripts are placed. The purpose for configuring ACRE 2 using
scripts instead of making use of the modules and functions in the editor is to have a mission independent
of the addon. In this way, the mission can be played with and without ACRE 2 without requiring any editing
changes.

### Files

* `scripts/bmt_acre2_configuration.sqf`: This script is where ACRE 2 mission dependent variables can be
configured. It allows the editor to configure the following aspects of ACRE 2 without having to place
modules.
  * **General ACRE 2**: Is Babel used? Do each side gets its own radio channels?
  * **Reveal to AI**: Is AI detecting players when they speak?
  * **Babel languages**: The mission editor can configure in the variable `bmt_acre2_languages` which
  languages are available in the mission. Each entry of the array consists of two entries: a unique
  language identifier and text that is displayed to the user when switching languages. In order to
  configure which languages can each faction speak, the variables `bmt_acre_language_XXX` can be used. For
  example, if the Bundeswehr faction can speak German and English, it can be accomplished by setting
  `bmt_acre2_language_bwa3 = ["german", "english"];`. If more faction variables are added, the function
  defined in `src/acre2/functions/fn_acre2_configureLanguages.sqf` should be modified as well.

  | **Faction**        | **Code**          | **Controlling Babel variable** |
  | ------------- | ------------- | ------------- |
  | Blue Force                                                       | `blu_f`                            | `bmt_acre2_language_blufor`  |
  | Blue Force Pacific                                               | `blu_t_f`                          | `bmt_acre2_language_blufor`  |
  | CTRG                                                             | `blu_ctrg_f`                       | `bmt_acre2_language_blufor`  |
  | Gendarmerie                                                      | `blu_gen_f`                        | `bmt_acre2_language_blufor`  |
  | Civilians                                                        | `civ_f`                            | `bmt_acre2_language_civ`     |
  | FIA                                                              | `blu_g_f`, `ind_g_f` and `opf_g_f` | `bmt_acre2_language_fia`     |
  | Independent Force                                                | `ind_f`                            | `bmt_acre2_language_indfor`  |
  | Syndikat                                                         | `ind_c_f`                          | `bmt_acre2_language_indfor`  |
  | Opposing Force                                                   | `opf_f`                            | `bmt_acre2_language_opfor`   |
  | Opposing Force Pacific                                           | `opf_t_f`                          | `bmt_acre2_language_opfor`   |
  | Bundeswehr                                                       | `bwa3_faction`                     | `bmt_acre2_language_bwa3`    |
  | RHS Insurgents                                                   | `rhs_faction_insurgents`           | `bmt_acre2_language_rhsins`  |
  | RHS Russian Airborne Troops (Vozdushno-desantnye voyska)         | `rhs_faction_vdv`                  | `bmt_acre2_language_rhsafrf` |
  | RHS Soviet Air Defense Troops (Voyska protivovozdushnoy oborony) | `rhs_faction_vpvo`                 | `bmt_acre2_language_rhsafrf` |
  | RHS United States Army (Desert)                                  | `rhs_faction_usarmy_d`             | `bmt_acre2_language_rhsusaf` |
  | RHS United States Army (Woodland)                                | `rhs_faction_usarmy_wd`            | `bmt_acre2_language_rhsusaf` |
  | RHS United States Marine Corps (Desert)                          | `rhs_faction_usmc_d`               | `bmt_acre2_language_rhsusaf` |
  | RHS United States Marine Corps (Woodland)                        | `rhs_faction_usmc_wd`              | `bmt_acre2_language_rhsusaf` |
  | RHS United States Navy                                           | `rhs_faction_usn`                  | `bmt_acre2_language_rhsusaf` |

  * **Difficulty parameters**: Loss model configuration, full/half duplex radios, interference simulation,
  and antena direction can be configured on a mission basis.
  * **Basic mission Template parameters**: allow to configure if radio presets (channels and frequencies)
  are shared by side, and if the rifleman radio specified by `bmt_acre2_riflemanRadioEverybody` is given
  to everybody regardless of the `bmt_array_riflemanRadio` specifications (defined in
  `missionConfig/core/functions/fn_core_commonVariables.sqf`). Additionally, the following
  variables hold information on which radios are used:
    * *Rifleman radio* (`bmt_acre2_riflemanRadio`) given to the units in `bmt_array_riflemanRadio`.
    * *Short range radio* (`bmt_acre2_shortRangeRadio`) given to the units in `bmt_array_shortRangeRadio`.
    * *Long range radio* (`bmt_acre2_longRangeRadio`) given to the units in `bmt_array_longRangeRadio`.

### Mission parameters

Activating the ACRE 2 component in `missionConfig/bmt_components_addons.hpp` adds the following mission
parameters:

* `bmt_param_acre2_configureChannels`: Configure radio channels and frequencies (1) or leave them as
is (0).
* `bmt_param_acre2_distributeRadios`: Redistribute radios (1) or simply remove all radios from the
players (0).
