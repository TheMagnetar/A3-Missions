_gen = _this select 0;
_caller = _this select 1;
_id = _this select 2;

_caller createDiaryRecord[ "Diary", ["Warlord", "These documents, put together by the Afghan Police, provide with accurate information on where the new Warlord of Kunduz has his base of operations."]];
processDiaryLink (createDiaryLink ["Diary", _caller, "Warlord"]);

"markerWarlord" setMarkerAlphaLocal 1;
openMap true;

[[_caller], "bmt_fnc_createWarlordEntry", true, true] call BIS_fnc_MP;

_gen removeAction _id;
deleteVehicle _gen;
