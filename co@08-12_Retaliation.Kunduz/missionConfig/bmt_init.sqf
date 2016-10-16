//=======================================================================================================//
// File: bmt_init.sqf                                                                                    //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/11/27                                                                             //
// Description: This file is used to add those scripts and variables that are mission dependant to the   //
//              init.sqf file.                                                                           //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

"markerWarlord" setMarkerAlpha 0;
warlordDead = 0;
intelConfiscated = 0;
rescuedMarines = 0;

bmt_fnc_checkMarines = compileFinal "
    if (isServer) then {
        private _listMarines = [bmt_marine1, bmt_marine2, bmt_marine3, bmt_marine4];

        {
            if ((_x in thisList) and (alive _x)) then {
                rescuedMarines = rescuedMarines + 1;
            };
        } forEach _listMarines;
        publicVariable rescuedMarines;
    };
";

bmt_fnc_createIntelEntry = compileFinal "
    params[""_unit""];
    {

        _x createDiaryRecord[ ""Diary"", [""Intel"", ""These documents have sensitive information regarding the location of allied forces in the region of Kunduz.""]];
        processDiaryLink (createDiaryLink [""Diary"", _x, ""Intel""]);
        [""New Intel:","Sensitive intel retrieved.""] call BIS_fnc_infoText;
    } forEach units (group _unit) - [_unit];
";

bmt_fnc_createWarlordEntry = compileFinal "
    params[""_unit""];
    {

        _x createDiaryRecord[ ""Diary"", [""Warlord"", ""These documents, put together by the Afghan Police, provide with accurate information on where the new Warlord of Kunduz has his base of operations.""]];
        processDiaryLink (createDiaryLink [""Diary"", _x, ""Warlord""]);
        [""New Intel:"",""Warlord location added to the map.""] call BIS_fnc_infoText;
    } forEach units (group _unit) - [_unit];
";

//============================================= END OF FILE =============================================//
