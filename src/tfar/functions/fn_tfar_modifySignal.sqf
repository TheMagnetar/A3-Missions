//=======================================================================================================//
// File: fn_tfar_modifySignal.sqf                                                                        //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/05/26                                                                             //
// Description: This function reduces or enhances the capability of transmiting and/or receiving signals //
//              In this way, interferences or the presence of broadcast towers that amplify the signal   //
//              strength can be simulated. It requires Task Force Arrowhead Radio (TFAR).                //
//              https://github.com/michail-nikolaev/task-force-arma-3-radio/wiki                         //
//              Arguments:                                                                               //
//               - 0 receving factor. The higher this number, the closer the transmitter has to be in    //
//                 order to receive a clear signal <FLOAT>.                                              //
//               - 1 transmitting factor. It multiplies the signal strength and therefore the higher it  //
//                 is, the further the signal can be received <FLOAT>.                                   //
//               - 2 unit that has the effect applied <OBJECT>.                                          //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

params [["_receivingFactor",1], ["_transmittingFactor",1], ["_unit", objNull]];

if (_unit != objNull) then {
    _unit setVariable ["tf_receivingDistanceMultiplicator", _receivingFactor];
    _unit setVariable ["tf_sendingDistanceMultiplicator", _transmittingFactor];
} else {
    _unit sideChat format ["ERROR (bmt_fnc_tfar_modifySignal.sqf): invalid object (objNull) in thee third parameter."];
};

//============================================= END OF FILE =============================================//
