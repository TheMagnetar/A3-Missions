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
        title = "Total success";
        subtitle = "";
        description = "Allied forces rescued all the marines, and they have dealt with the insurgent Warlord.";
        pictureBackground = "";
        picture = "b_inf";
        pictureColor[] = {0.0,0.3,0.6,1};
    };

    class EndingSuccess2 {
        title = "Partial success";
        subtitle = "";
        description = "Allied forces were not able to rescue all the marines, but they dealt with the insurgent Warlord.";
        pictureBackground = "";
        picture = "b_inf";
        pictureColor[] = {0.0,0.3,0.6,1};
    };

    class EndingSuccess3 {
        title = "Partial success";
        subtitle = "";
        description = "Allied forces rescued all the captured marines, but they could not deal with the insurgent Warlord.";
        pictureBackground = "";
        picture = "b_inf";
        pictureColor[] = {0.0,0.3,0.6,1};
    };

    class EndingSuccess4 {
        title = "Partial success";
        subtitle = "";
        description = "Allied forces were not able to rescue all the marines, and they could not deal with the insurgent Warlord.";
        pictureBackground = "";
        picture = "b_inf";
        pictureColor[] = {0.0,0.3,0.6,1};
    };

    class EndingSuccess5 {
        title = "Partial success";
        subtitle = "";
        description = "Allied forces could not rescue any of the captured marines, but they dealt with the insurgent Warlord.";
        pictureBackground = "";
        picture = "b_inf";
        pictureColor[] = {0.0,0.3,0.6,1};
    };

    class EndingFailure1 {
        title = "Mission failed";
        subtitle = "";
        description = "Allied forces could not rescue any of the captured marines and they could not deal with the insurgent Warlord.";
        pictureBackground = "";
        picture = "KIA";
        pictureColor[] = {0.0,0.3,0.6,1};
    };

    class EndingFailure2 {
        title = "Mission failed";
        subtitle = "";
        description = "Allied forces have been taken down, but the insurgent Warlord have been dealt with.";
        pictureBackground = "";
        picture = "KIA";
        pictureColor[] = {0.0,0.3,0.6,1};
    };

    class Disaster {
        title = "Disaster";
        subtitle = "";
        description = "Allied forces have been taken down without accomplishing any objectives.";
        pictureBackground = "";
        picture = "KIA";
        pictureColor[] = {0.0,0.3,0.6,1};
    };
};

//============================================= END OF FILE =============================================//
