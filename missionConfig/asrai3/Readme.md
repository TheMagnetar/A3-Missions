## /missionConfig/asrai3

This folder is where functions and scripts that configure ASR AI 3 are located. In this way, each mission
can have its own values for ASR AI without having to modify them on the server.

### Files

* `functions/fn_asrai3_config.sqf` is where the ASR AI variables can be configured. In addition, it allow
activating or deactivating the functions of the mod without having to unload it. This is achieved through
the mission parameter `bmt_param_asrai3_enabled`.

### Mission parameters

Activating the ASR AI component in `missionConfig/bmt_components_addons.hpp` adds the following mission
parameters:

* `bmt_param_asrai3_enabled`: enables or disables ASR AI 3 enhancements.
