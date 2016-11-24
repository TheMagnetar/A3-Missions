## /externalScripts/T8

The Basic Mission Template (A3-BMT) can configure automatically the T8 Units spawn scripts. T8 Units, is
a less dynamic AI creator than DAC and allows the mission editor to spawn predefined groups of units with
a specific task like attack, defend or patrol among others. T8 Units can also be made compatible with DAC.

In order for the scripts of this template to work, this folder must contain the T8 Units script that can be
found in:

* *Github*: https://github.com/T-800a/T8_Units.
* *BI Forums*: https://forums.bistudio.com/topic/172795-release-t8-units-a-less-dynamic-ai-creator/.

In addition, the line 20 in `missionConfig/bmt_components_addons.hpp` must be uncommented and enable the
variables under T8 Units in the file `missionConfig/bmt_missionParameters_definitions.hpp`
