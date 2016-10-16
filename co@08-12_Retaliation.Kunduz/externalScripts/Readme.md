## /externalScripts

Third party scripts go in this folder. At the moment, the following third party scripts are supported
by this template.

* T8-Units by T-800a (https://github.com/T-800a/T8_Units).

### Adding third party scripts

Usually third party scripts can be included easilly in any mission by simply calling the script from
`/missionConfig/bmt_init.sqf` (which is included in `init.sqf` through the `#include` directive). However
some scripts require to be declared within `CfgFunctions`. In this case, there are two options:

* Add a line directly in the `description.ext` file. This solution has a more temporary approach.
* Add a subfolder in `/src/` and make use of the declaration `BMT_FUNCTIONS_EXTERNAL` in a header file.
This approach will help in keeping the template organised and will allow activating/deactivating this
external script at will without having to modify the `description.ext` file. An example of this approach
can be seen in `/src/t8units/`, with default parameters vales defined in
`/missionConfig/bmt_missionParameters_definitions.hpp` and the ability to load the pluguin or not found in
`/missionConfig/bmt_components_addons.hpp`.
