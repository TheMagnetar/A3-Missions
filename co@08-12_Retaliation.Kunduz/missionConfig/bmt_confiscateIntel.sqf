_gen = _this select 0;
_caller = _this select 1;
_id = _this select 2;

_caller createDiaryRecord[ "Diary", ["Intel", "These documents have sensitive information regarding the location of allied forces in the region of Kunduz."]];
processDiaryLink (createDiaryLink ["Diary", _caller, "Intel"]);

["New Intel:","Sensitive Intel retrieved."] call BIS_fnc_infoText;

[[_caller], "bmt_fnc_createIntelEntry", true, true] call BIS_fnc_MP;

_gen removeAction _id;
deleteVehicle _gen;
