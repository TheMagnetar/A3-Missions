## /src/configEquipment

In this folder the scripts and functions that equip a unit, vehicle or any other container are defined. The
mission editor has essentially two options to equip a playable unit:

* Using the `bmt_fnc_configEquipment` function (found in `./functions/fn_configEquipment.sqf`), where each
playable faction recognised in *A3-BMT* has a separate entry. Each of these entries call one of the
functions included, since they are mission dependent, in `/missionConfig/configEquipment/functions`.
Although the direct use of this function is not advised in playable units directly (it is better to use
`bmt_fnc_configUnit` defined in `/src/configUnit/functions`) it is the only option in *A3-BMT* to equip
emtpy vehicles, ammo boxes and AI units.

  Examples:

  * Unit is a Fire Team Leader: `["tl", this] call bmt_fnc_configEquipment;`
  * Unit is a Squad Leader with optional equipment foo: `[["sl", "foo"], this] call bmt_fnc_configEquipment;`
  * Unit is a medic and has the equipment of the RHS faction *United States Marine Corps (D)* despite not
  belonging to it: `["me", this, "rhs_faction_usmc_d"] call bmt_fnc_configEquipment;`
  * Ammo Box belonging to the RHS faction *United States Army (D)*:
  `["ammobox", this, "rhs_faction_usarmy_d"] call bmt_fnc_configEquipment;`

* Using Virtual Arsenal (VA) profiles. The mission editor can define which VA profiles are used given a
specific role. Since this executes during `init.sqf`, having this option enabled will override any
equipment defined using `bmt_fnc_configEquipment` and it cannot be applied to AI units directly. Note that
*the script requires a defined unit role and it  is not faction dependent*.

### The `bmt_fnc_configEquipment_*` functions

These functions are defined in `/missionConfig/configEquipment/functions` and they contain the entries for
the different roles. Medical equipment depends on the loaded mods (ACE 3, AGM or Vanilla) and some options
can be  further customised modifying the
`/missionConfig/configEquipment/scripts/bmt_configEquipment_options.sqf` file. For more detailed
information, refer to the Readme file in `/missionConfig/configEquipment/`.

### Adding new faction entries

New faction entries can be added to the `./functions/fn_configEquipment.sqf` file. However, in order to
maintain the structure of the template, the newly added faction should have its file in
`/missionConfig/configEquipment/functions`. The new function has to be also defined in
`/missionConfig/configEquipment/bmt_configEquipment.hpp` in order to be compiled. For more information, see
the **Advanced Topics** page on the wiki.

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
