//=======================================================================================================//
// File: bmt_debriefingMissio.hpp                                                                        //
// Author: TheMagnetar                                                                                   //
// Version: 1.0                                                                                          //
// File creation: 2015/11/06                                                                             //
// Description: In this document, the different endings of the mission are defined. Only the ending      //
//              labelled as Disaster must be present if the custom respawn template provided in this     //
//              project is used.                                                                         //
// Changes: 1.0 (2015/11/26) First public version.                                                       //
//=======================================================================================================//

//=======================================================================================================//
// DEBRIEFING: Informació per quan acaba la missió.                                                      //
//=======================================================================================================//
class CfgDebriefing {
    class EndingSuccess1 {
        title = "Total success!";
        subtitle = "";
        description = "All enemy defense units have been destroyed.";
        pictureBackground = "";
        picture = "b_inf";
        pictureColor[] = {0.0,0.3,0.6,1};
    };

    class EndingSuccess2 {
        title = "Partial success";
        subtitle = "";
        description = "Not all enemy air defenses have been destroyed";
        pictureBackground = "";
        picture = "b_inf";
        pictureColor[] = {0.0,0.3,0.6,1};
    };

    class EndingFailure1 {
        title = "Mission failed";
        subtitle = "";
        description = "All marines are dead, but they managed to destroy the enemy air defenses";
        pictureBackground = "";
        picture = "KIA";
        pictureColor[] = {0.0,0.3,0.6,1};
    };

    class EndingFailure2 {
        title = "Mission failed";
        subtitle = "";
        description = "All marines are dead without having destroyed all enemy air defenses";
        pictureBackground = "";
        picture = "KIA";
        pictureColor[] = {0.0,0.3,0.6,1};
    };

    //class EndingFailure3, EndingFailure4, ....

    class Disaster {
        title = "Disaster";
        subtitle = "";
        description = "All marines are dead without having destroyed any of the air defenses";
        pictureBackground = "";
        picture = "KIA";
        pictureColor[] = {0.0,0.3,0.6,1};
    };
};

//============================================= END OF FILE =============================================//
