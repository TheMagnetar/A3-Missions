/*
 =======================================================================================================================

    T8 Units Script

    File:        T8_missionEXEC.sqf
    Author:        T-800a
    E-Mail:        t-800a@gmx.net

    This file creates the Units, kind of


    This work is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.
    To view a copy of this license, visit http://creativecommons.org/licenses/by-nc-sa/4.0/ or send a letter to
    Creative Commons, 444 Castro Street, Suite 900, Mountain View, California, 94041, USA.

 =======================================================================================================================
*/

// include the few macros we use ...
#include <..\..\..\externalScripts\T8\MACRO.hpp>

// wait until everything is initalized correctly
waitUntil { !isNil "T8U_var_useHC" };
waitUntil { !isNil "T8U_var_InitDONE" };

// cancel execute if not server / hc
__allowEXEC(__FILE__);


sleep 5;

//////////////////////////////////////  CUSTOM FUNCTION  //////////////////////////////////////
//
//            This function is called for every unit in a group
//            where it is defined in the groups definiton below
//

T8U_fnc_rmNVG_TEST =
{
    _this spawn
    {
        sleep 5;

        private ["_i"];
        _i = true;
        switch ( side _this ) do
        {
            case WEST:            { _this unlinkItem "NVGoggles"; };
            case EAST:            { _this unlinkItem "NVGoggles_OPFOR"; };
            case RESISTANCE:    { _this unlinkItem "NVGoggles_INDEP";  };
            default                { _i = false; };
        };

        if ( _i ) then
        {
            _this removePrimaryWeaponItem "abmt_pointer_IR";
            _this addPrimaryWeaponItem "abmt_flashlight";

            sleep 1;

            group _this enableGunLights "forceon";
        };
    };
};

//////////////////////////////////////  UNIT SETUP  //////////////////////////////////////

// Vanilla group configs.
#include "bmt_t8_groupConfigs_blu_f.sqf"
#include "bmt_t8_groupConfigs_opf_f.sqf"

// Leights Opfor Pack group configs.
#include "bmt_t8_groupConfigs_LOP.sqf"

// ------------------------------------------------ THE END ---------------------------------------------------
