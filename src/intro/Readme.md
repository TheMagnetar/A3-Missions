## /src/intro

This folder contains the different types of introduction screen that can be used directly with this template. These scripts are called directly from
`missionConfig/intro/scripts/bmt_intro.sqf`. It is advisable to always use an introduction screen in order to give time for the several scripts included in the template
to properly execute without player intervention. For the moment, the introduction screens included are:

* **Black screen:** A black screen that fades into view is used before giving control to the players. It displays on the bottom right side the mission name, date and
location. Text, usually a quote, is displayed in the centre of the screen. It has three parameters:
  * *Mission name:* First parameter is a string detailing the mission name.
  * *Mission location:* initial position of the player.
  * *Introductory text:* the text shown in the middle of the screen.
* **Player camera:** It creates a camera targeted at the player with an overlay similar to the UAV feedback. Some animations are randomly selected for the player. It has
  four parameters:
    * *Mission name:* First parameter is a string detailing the mission name.
    * *Mission location:* initial position of the player.
    * *Use night vision:* if night vision effect is active.
    * *Animation list:* optional parameter where a single animation or an array of animations are randomly selected for the players. If this item is not specified one of the
    following animations is going to be randomly played: *AmovPercMstpSrasWrflDnon_Salute*, *c4coming2cdf_genericstani1*, *c4coming2cdf_genericstani2*,
    *c4coming2cdf_genericstani3* and *c4coming2cdf_genericstani4*.
* **UAV Feed:** It uses a UAV feedback as introduction that blurs into player view. The parameters that are passed allow, for a full customisation of the information
displayed in this introduction screen:
  * *Marker name:* is the argument detailing where the camera is centered.
  * *Text* displayed on the upper left corner.
  * *UAV movement:* is an array where the movement of the UAV can be configured: altitude, radius of rotation, viewing angle, and directon of rotationa direction (clockwise,
    counterclockwise and random).
  * *Markers:* array specifying the markers that are being displayed: color, marker text, shape, ... (sixth parameter of the function `BIS_fnc_establishingShot` (https://community.bistudio.com/wiki/BIS_fnc_establishingShot).
