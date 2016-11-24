//=======================================================================================================//
// File: fn_tfar_configureFrequencies.sqf                                                                //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 06/03/2015                                                                             //
// Description: Function to configure default frequencies of the Task Force Arrowhead Radio (TFAR)       //
//              https://github.com/michail-nikolaev/task-force-arma-3-radio/wiki                         //
//                                                                                                       //
//              Arguments:                                                                               //
//               - none                                                                                  //
//                                                                                                       //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

// [Channel, Volume, [Frequencies], Stereo, Encryption, Additional Channel, ?].
tf_freq_west =    [0 ,7, ["200","201","202","203","41","51","61","71","81"],0, "b", -1, 0];
tf_freq_west_lr = [0 ,7, ["30","40","41","42","43","50","60","70","62"],0, "b", -1, 0];
tf_freq_east  =   [0 ,7, ["201","202","203","200","41","51","61","71","81"],0, "o", -1, 0];
tf_freq_east_lr = [0 ,7, ["30","40","41","42","43","50","60","70","62"],0, "o", -1, 0];
tf_freq_guer  =   [0 ,7, ["201","202","203","200","41","51","61","71","81"],0, "g", -1, 0];
tf_freq_guer_lr = [0 ,7, ["30","40","41","42","43","50","60","70","62"],0, "g", -1, 0];

//============================================= END OF FILE =============================================//
