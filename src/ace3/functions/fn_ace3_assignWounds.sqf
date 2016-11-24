//=======================================================================================================//
// File: fn_ace3_assignWounds.sqf                                                                        //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/11/06                                                                             //
// Description: Aquest document serveix per modificar les ferides a diferents parts del cos a una unitat //
//             fent servir el sistema mèdic de ACE3. http://ace3mod.com/wiki/index.html                  //
//                                                                                                       //
//             Arguments:                                                                                //
//               - 0: objecte al que se li modificaran les ferides <OBJECT>.                             //
//               - 1: part del cos <STRING>.                                                             //
//               - 2: quantitat de mal a assignar <FLOAT>.                                               //
//               - 3: projectil <STRING>.                                                                //
//               - 4: Actualitzar o reassignar <BOOL><OPTIONAL>.                                         //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

params ["_unit", "_partdelCos", "_assignarFerida", "_projectil", ["_actualitzar", false]];
private ["_estatActual"];

if (_actualitzar) then {
    // Obtenir l'estat de les diferents parts del cos.
    _estatActual = player getvariable ["ace_medical_bodyPartStatus", [0,0,0,0,0,0]];
    // Actualitzar la quantitat de mal a una determinada part del cos.
    _assignarFerida = _assignarFerida + _estatActual select ([_partdelCos] call ace_medical_fnc_selectionNameToNumber);
};

// Assignar la ferida.
[_unit, _partdelCos, _assignarFerida, _unit, _projectil, -1] call ace_medical_fnc_handleDamage;
