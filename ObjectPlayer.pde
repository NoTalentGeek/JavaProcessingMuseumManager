import java.util.*;

/*Create an internal class to be put in the list for easiness.
This is because List in Java must be homogenous.
This class is intended to make calculation on how many 
    exhibition with same tag has been visited.*/
class TagCounter{

    /*I create an array becuse comparator will not working on primitive data type.
    Hence, I put the value in one element List.*/
    int                 tagCounterInt       = -1;
    List<Integer>       tagCounterIntList   = new ArrayList<Integer>();
    String              tagNameAltString    = "";
    String              tagNameFullString   = "";
    Tag                 tagObject           ;

    TagCounter          (){}

    /*Getter and setter function for counting tha tags.*/
    void                SetTagObject            (Tag    _tagObject)         { tagObject         = _tagObject; }
    void                SetTagNameAltString     (String _tagNameAltString)  { tagNameAltString  = _tagNameAltString;    }
    void                SetTagNameFullString    (String _tagNameFullString) { tagNameFullString = _tagNameFullString;   }
    void                SetTagCounterIntVoid    (int    _tagCounterInt)     {

                        /*I create an array becuse comparator will not working on primitive data type.
                        Hence, I put the value in one element List.*/
                        tagCounterInt       = _tagCounterInt;
                        tagCounterIntList   = new ArrayList<Integer>();
                        tagCounterIntList   .add(tagCounterInt);

    }
    int                 GetTagCounterInt        (){ return tagCounterInt;       }
    Tag                 GetTagObject            (){ return tagObject;           }
    String              GetTagNameAltString     (){ return tagNameAltString;    }
    String              GetTagNameFullString    (){ return tagNameFullString;   }

}

/*A class of player object.
The player object will be the class that can be either played by the user (somekind like simulation)
    or being automated.*/
class ObjectPlayer{

    boolean             playerFinishedBoolean                                   = false;
    boolean             playerVisitCorrectExhibitionBoolean                     = false;
    float               timeCurrentExhibitionFloat                              = 0f;                               /*How many frame/tick this player already stay in an exhibition.                        */
    int                 playerIndexInt                                          = 0;                                /*Unique identifier for each player object, can be changed later to name.               */
    int                 playerMovementModeInt                                   = 2;                                /*The mode that runs this player.
                                                                                                                        editPlayerMode =    1, this player controlled by AIAutoVoid.
                                                                                                                        editPlayerMode =    2, this player controlled manually using this application.
                                                                                                                        editPlayerMode =    3, this player controlled manually using Arduino.               */
    int                 playerScoreInt                                          = 0;
    int                 playerSiblingIndexInt                                   = -1;                               /*The index of this object within the List of object player sibling.                    */
    ObjectMuseum        exhibitionCurrentObject                                 = null;
    String              exhibitionCurrentNameAltString                          = "";
    String              exhibitionCurrentNameFullString                         = "";
    String              exhibitionCurrentString                                 = "";       
    String              playerNameString                                        = "";

    /*Panel variable.*/
    boolean             hoverBoolean                                            = false;
    color               panelFinishedColor                                      = color(223, 113, 38 );
    color               panelUnfinishedColor                                    = color(217, 160, 102);
    int                 widthPanelInt                                           = 0;
    int                 heightPanelInt                                          = 0;
    int                 xPanelInt                                               = 0;
    int                 yPanelInt                                               = 0;
    Panel               panelObject                                             = null;

    List<ObjectPlayer>  playerSiblingObjectList                                 = new ArrayList<ObjectPlayer>();    /*How many player object are in the same exhibition.                                                                    */
    List<String>        adjectiveCurrentPrevTagStringList                       = new ArrayList<String>();
    List<String>        adverbCurrentPrevTagStringList                          = new ArrayList<String>();
    List<String>        exhibitionTagCounterNameAltStringList                   = new ArrayList<String>();          /*This is exactly the exhibitionTagCounter but with easy String coversion so that the value can be easily displayed.    */
    List<String>        exhibitionTagCounterNameFullStringList                  = new ArrayList<String>();          /*This is exactly the exhibitionTagCounter but with easy String coversion so that the value can be easily displayed.    */
    List<String>        exhibitionTargetNameAltStringList                       = new ArrayList<String>();          /*Target exhibition that will be given to the player.                                                                   */
    List<String>        exhibitionTargetNameFullStringList                      = new ArrayList<String>();          /*Target exhibition that will be given to the player.                                                                   */
    List<String>        exhibitionVisitedNameAltStringList                      = new ArrayList<String>();          /*Amount of exhibition that have just visited by the player.                                                            */
    List<String>        exhibitionVisitedNameFullStringList                     = new ArrayList<String>();          /*Amount of exhibition that have just visited by the player.                                                            */
    List<String>        explanationStringList                                   = new ArrayList<String>();
    List<String>        intransitiveVerb1CurrentPrevTagStringList               = new ArrayList<String>();
    List<String>        intransitiveVerb2CurrentPrevTagStringList               = new ArrayList<String>();
    List<String>        intransitiveVerb3CurrentPrevTagStringList               = new ArrayList<String>();
    List<String>        intransitiveVerbIngCurrentPrevTagStringList             = new ArrayList<String>();
    List<String>        intransitiveVerbSCurrentPrevTagStringList               = new ArrayList<String>();
    List<String>        negativeAdjectiveCurrentPrevTagStringList               = new ArrayList<String>();
    List<String>        negativeAdverbCurrentPrevTagStringList                  = new ArrayList<String>();
    List<String>        negativeIntransitiveVerb1CurrentPrevTagStringList       = new ArrayList<String>();
    List<String>        negativeIntransitiveVerb2CurrentPrevTagStringList       = new ArrayList<String>();
    List<String>        negativeIntransitiveVerb3CurrentPrevTagStringList       = new ArrayList<String>();
    List<String>        negativeIntransitiveVerbIngCurrentPrevTagStringList     = new ArrayList<String>();
    List<String>        negativeIntransitiveVerbSCurrentPrevTagStringList       = new ArrayList<String>();
    List<String>        negativeTransitiveVerb1CurrentPrevTagStringList         = new ArrayList<String>();
    List<String>        negativeTransitiveVerb2CurrentPrevTagStringList         = new ArrayList<String>();
    List<String>        negativeTransitiveVerb3CurrentPrevTagStringList         = new ArrayList<String>();
    List<String>        negativeTransitiveVerbIngCurrentPrevTagStringList       = new ArrayList<String>();
    List<String>        negativeTransitiveVerbSCurrentPrevTagStringList         = new ArrayList<String>();
    List<String>        nounAbstractCurrentPrevTagStringList                    = new ArrayList<String>();
    List<String>        nounAbstractSCurrentPrevTagStringList                   = new ArrayList<String>();
    List<String>        nounCurrentPrevTagStringList                            = new ArrayList<String>();
    List<String>        nounSCurrentPrevTagStringList                           = new ArrayList<String>();
    List<String>        sentenceStringList                                      = new ArrayList<String>();
    List<String>        subjectCurrentPrevTagStringList                         = new ArrayList<String>();
    List<String>        subjectPossesionCurrentPrevTagStringList                = new ArrayList<String>();
    List<String>        transitiveVerb1CurrentPrevTagStringList                 = new ArrayList<String>();
    List<String>        transitiveVerb2CurrentPrevTagStringList                 = new ArrayList<String>();
    List<String>        transitiveVerb3CurrentPrevTagStringList                 = new ArrayList<String>();
    List<String>        transitiveVerbIngCurrentPrevTagStringList               = new ArrayList<String>();
    List<String>        transitiveVerbSCurrentPrevTagStringList                 = new ArrayList<String>();;
    List<TagCounter>    exhibitionTagCounterList                                = new ArrayList<TagCounter>();      /*The amount of tag that have been collected by this player.                                                            */

    /*Constructor.*/
    ObjectPlayer(

        int     _playerIndexInt             ,
        String  _playerNameString           ,
        String  _exhibitionStartString

    ){

        playerIndexInt              = _playerIndexInt;
        playerNameString            = _playerNameString;
        playerObjectList            .add(this);
        panelObject                 = new Panel();
        ExhibitionMoveObject        (_exhibitionStartString);
        exhibitionCurrentObject     = FindObject(exhibitionObjectList, exhibitionCurrentString);

    }

    /*A function to either add the tag or increase the tag value in this player.*/
    void AddTagCounterVoid(

        ObjectMuseum _exhibitionCurrentObject

    ){

        for(int i = 0; i < _exhibitionCurrentObject.tagMuseumObjectList.size(); i ++){

            /*Create new tag counter to count how many tags are in the user preference.*/
            TagCounter  tagCounterObject    = new TagCounter();
            /*PENDING: There might be an inconsistency error within these three lines of code below.
            PENDING: The solution probably to set the alternate and the full name directly from the tagCounterObject.tagObject.
            PENDING: At this moment the tag is set into three different List which might caused inconsistency later on.*/
                        tagCounterObject    .SetTagObject           (_exhibitionCurrentObject   .tagMuseumObjectList            .get(i));
                        tagCounterObject    .SetTagNameAltString    (_exhibitionCurrentObject   .tagMuseumNameAltStringList     .get(i));
                        tagCounterObject    .SetTagNameFullString   (_exhibitionCurrentObject   .tagMuseumNameFullStringList    .get(i));

            boolean     newBoolean          = true;     /*Whether the tag is new to the array or there is already existing one.*/
            int         indexInt            = -1;       /*If there is the corresponding tag already in the array return its index with this variable, otherwise it keeps -1.*/

            /*Iterate through all tag those already gathered to find if there any tag that
                is already registered in this player.*/
            for(int j = 0; j < exhibitionTagCounterList.size(); j ++){

                if(

                    exhibitionTagCounterList.get(j).GetTagNameAltString().equals(

                        tagCounterObject.GetTagNameAltString()

                    )

                ){

                    newBoolean              = false;    /*If newBoolean is false then the object is alrady inside the list.*/
                    indexInt                = j;        /*The index of the tag is the tag is already inside the list.*/

                }

            }

            /*If the tag received is new then set the initial tag value to 1 and
                add the tag to the tag counter.*/
            if      (newBoolean == true ){

                tagCounterObject                .SetTagCounterIntVoid(1);
                exhibitionTagCounterList        .add(tagCounterObject);

            }
            /*If the tag received is alredy filled in before then increase the tag counter.*/
            else if (newBoolean == false){

                exhibitionTagCounterList        .get(indexInt).SetTagCounterIntVoid(exhibitionTagCounterList.get(indexInt).GetTagCounterInt() + 1);

            }

        }

        /*Sort the object in the list based on tag counter int.*/
        Collections.sort(exhibitionTagCounterList, new Comparator<TagCounter>(){

                public int compare(TagCounter _tagCounter1Object, TagCounter _tagCounter2Object) {
                
                    return _tagCounter2Object.tagCounterIntList.get(0).compareTo(_tagCounter1Object.tagCounterIntList.get(0));
                
                }

            }

        );

    }

    /*A function to add or remove this object from parent child object.*/
    void AddRemoveChildVoid(boolean _isAdd)                 {

        ObjectMuseum exhibitionCurrentObject                = FindObject(exhibitionObjectList, exhibitionCurrentString);
        if      (_isAdd == true )                           { exhibitionCurrentObject.childPlayerObjectList.add(this);      }
        else if (_isAdd == false)                           { exhibitionCurrentObject.childPlayerObjectList.remove(this);   }

    }

    void AIAutoVoid()                                       {

        /*Check wether this player has already visited most exhibitions in the museum.
        I checked the whether the exhibition visited has the same amount of length with total exhibition length.
        It is not necessary for this player to have all exhibitions visited due to there is a chance that this player
            visited same exhibitions twice or more.*/
        if(playerFinishedBoolean == false){

            /*Increase the amount of time of this player in the current exhibition the visitor visits.
            The more time this player spent time in the exhibition the more chance the visitor will move to the
                new exhibition.
            PENDING: Change the time increment per second add and per frame.*/
            float   randomFloat                             = (float)(Math.random());
                    timeCurrentExhibitionFloat              += 0.01f;

            if(randomFloat > (1f - timeCurrentExhibitionFloat)){

                /*Move player to the new exhibition.*/
                int randomIndexInt          = (int)(Math.floor((Math.random()*exhibitionTargetNameAltStringList.size()) + 0));
                ExhibitionMoveObject        (exhibitionTargetNameAltStringList.get(randomIndexInt));
                timeCurrentExhibitionFloat  = 0;                                                                            /*Reset timer.*/

            }

        }

    }

    /*A function to update this player variables over time.*/
    void DrawVoid()                                                                     {

        SetHoverBoolean ();
        PanelDrawVoid   ();


        if(playerMovementModeInt == 1){ AIAutoVoid(); }

        /*PENDING: Give the codes below in the new own method and create commentation for these code below.*/
        exhibitionTagCounterNameAltStringList .clear();
        exhibitionTagCounterNameFullStringList.clear();
        for(int i = 0; i < exhibitionTagCounterList.size(); i ++){

            exhibitionTagCounterList.get(i).SetTagNameAltString (exhibitionTagCounterList.get(i).tagObject.tagNameAltString );
            exhibitionTagCounterList.get(i).SetTagNameFullString(exhibitionTagCounterList.get(i).tagObject.tagNameFullString);
            String  tempTagNameAltString                = "";
            String  tempTagNameFullString               = "";
                    tempTagNameAltString                = ("(" + exhibitionTagCounterList.get(i).GetTagCounterInt() + ") " + exhibitionTagCounterList.get(i).GetTagNameAltString ());
                    tempTagNameFullString               = ("(" + exhibitionTagCounterList.get(i).GetTagCounterInt() + ") " + exhibitionTagCounterList.get(i).GetTagNameFullString());
            exhibitionTagCounterNameAltStringList       .add(tempTagNameAltString);
            exhibitionTagCounterNameFullStringList      .add(tempTagNameFullString);

        }

        if(exhibitionVisitedNameAltStringList.size() > exhibitionObjectList.size()){ playerFinishedBoolean = true; }

    }

    void ResetVoid(){

        if(adjectiveCurrentPrevTagStringList                    .size() > 0){ adjectiveCurrentPrevTagStringList                     .clear(); }
        if(adverbCurrentPrevTagStringList                       .size() > 0){ adverbCurrentPrevTagStringList                        .clear(); }
        if(exhibitionTagCounterList                             .size() > 0){ exhibitionTagCounterList                              .clear(); }
        if(exhibitionTagCounterNameAltStringList                .size() > 0){ exhibitionTagCounterNameAltStringList                 .clear(); }
        if(exhibitionTagCounterNameFullStringList               .size() > 0){ exhibitionTagCounterNameFullStringList                .clear(); }
        if(exhibitionTargetNameAltStringList                    .size() > 0){ exhibitionTargetNameAltStringList                     .clear(); }
        if(exhibitionTargetNameFullStringList                   .size() > 0){ exhibitionTargetNameFullStringList                    .clear(); }
        if(exhibitionVisitedNameAltStringList                   .size() > 0){ exhibitionVisitedNameAltStringList                    .clear(); }
        if(exhibitionVisitedNameFullStringList                  .size() > 0){ exhibitionVisitedNameFullStringList                   .clear(); }
        if(explanationStringList                                .size() > 0){ explanationStringList                                 .clear(); }
        if(explanationStringList                                .size() > 0){ explanationStringList                                 .clear(); }
        if(intransitiveVerb1CurrentPrevTagStringList            .size() > 0){ intransitiveVerb1CurrentPrevTagStringList             .clear(); }
        if(intransitiveVerb2CurrentPrevTagStringList            .size() > 0){ intransitiveVerb2CurrentPrevTagStringList             .clear(); }
        if(intransitiveVerb3CurrentPrevTagStringList            .size() > 0){ intransitiveVerb3CurrentPrevTagStringList             .clear(); }
        if(intransitiveVerbIngCurrentPrevTagStringList          .size() > 0){ intransitiveVerbIngCurrentPrevTagStringList           .clear(); }
        if(intransitiveVerbSCurrentPrevTagStringList            .size() > 0){ intransitiveVerbSCurrentPrevTagStringList             .clear(); }
        if(negativeAdjectiveCurrentPrevTagStringList            .size() > 0){ negativeAdjectiveCurrentPrevTagStringList             .clear(); }
        if(negativeAdverbCurrentPrevTagStringList               .size() > 0){ negativeAdverbCurrentPrevTagStringList                .clear(); }
        if(negativeIntransitiveVerb1CurrentPrevTagStringList    .size() > 0){ negativeIntransitiveVerb1CurrentPrevTagStringList     .clear(); }
        if(negativeIntransitiveVerb2CurrentPrevTagStringList    .size() > 0){ negativeIntransitiveVerb2CurrentPrevTagStringList     .clear(); }
        if(negativeIntransitiveVerb3CurrentPrevTagStringList    .size() > 0){ negativeIntransitiveVerb3CurrentPrevTagStringList     .clear(); }
        if(negativeIntransitiveVerbIngCurrentPrevTagStringList  .size() > 0){ negativeIntransitiveVerbIngCurrentPrevTagStringList   .clear(); }
        if(negativeIntransitiveVerbSCurrentPrevTagStringList    .size() > 0){ negativeIntransitiveVerbSCurrentPrevTagStringList     .clear(); }
        if(negativeTransitiveVerb1CurrentPrevTagStringList      .size() > 0){ negativeTransitiveVerb1CurrentPrevTagStringList       .clear(); }
        if(negativeTransitiveVerb2CurrentPrevTagStringList      .size() > 0){ negativeTransitiveVerb2CurrentPrevTagStringList       .clear(); }
        if(negativeTransitiveVerb3CurrentPrevTagStringList      .size() > 0){ negativeTransitiveVerb3CurrentPrevTagStringList       .clear(); }
        if(negativeTransitiveVerbIngCurrentPrevTagStringList    .size() > 0){ negativeTransitiveVerbIngCurrentPrevTagStringList     .clear(); }
        if(negativeTransitiveVerbSCurrentPrevTagStringList      .size() > 0){ negativeTransitiveVerbSCurrentPrevTagStringList       .clear(); }
        if(nounAbstractCurrentPrevTagStringList                 .size() > 0){ nounCurrentPrevTagStringList                          .clear(); }
        if(nounAbstractSCurrentPrevTagStringList                .size() > 0){ nounSCurrentPrevTagStringList                         .clear(); }
        if(nounCurrentPrevTagStringList                         .size() > 0){ nounCurrentPrevTagStringList                          .clear(); }
        if(nounSCurrentPrevTagStringList                        .size() > 0){ nounSCurrentPrevTagStringList                         .clear(); }
        if(playerSiblingObjectList                              .size() > 0){ playerSiblingObjectList                               .clear(); }
        if(sentenceStringList                                   .size() > 0){ sentenceStringList                                    .clear(); }
        if(subjectCurrentPrevTagStringList                      .size() > 0){ subjectCurrentPrevTagStringList                       .clear(); }
        if(subjectPossesionCurrentPrevTagStringList             .size() > 0){ subjectPossesionCurrentPrevTagStringList              .clear(); }
        if(transitiveVerb1CurrentPrevTagStringList              .size() > 0){ transitiveVerb1CurrentPrevTagStringList               .clear(); }
        if(transitiveVerb2CurrentPrevTagStringList              .size() > 0){ transitiveVerb2CurrentPrevTagStringList               .clear(); }
        if(transitiveVerb3CurrentPrevTagStringList              .size() > 0){ transitiveVerb3CurrentPrevTagStringList               .clear(); }
        if(transitiveVerbIngCurrentPrevTagStringList            .size() > 0){ transitiveVerbIngCurrentPrevTagStringList             .clear(); }
        if(transitiveVerbSCurrentPrevTagStringList              .size() > 0){ transitiveVerbSCurrentPrevTagStringList               .clear(); }

        playerSiblingIndexInt                           = -1;
        timeCurrentExhibitionFloat                      = 0f;
        ExhibitionMoveObject                            (exhibitionCurrentString);
        exhibitionCurrentObject                         = FindObject(exhibitionObjectList, exhibitionCurrentString);
        playerFinishedBoolean                           = false;
        playerScoreInt                                  = 0;
        playerVisitCorrectExhibitionBoolean             = false;
        playerFinishedBoolean                           = false;

    }

    /*A function to populate tag string received from the current exhibition.*/
    void PopulateTagStringList(boolean _isPreviousBoolean)                              {

        /*Determine the current exhibition.
        PENDING: Please put current exhibition, current room , and current floor to be public variable of this class.*/
        ObjectMuseum exhibitionCurrentObject = FindObject(exhibitionObjectList, exhibitionCurrentString);

        /*If there is a previous exhibition visited before you visit new exhibition clear all TagStringList before adding new one.*/
        if(_isPreviousBoolean == true){

            if(adjectiveCurrentPrevTagStringList                    .size() > 0){ adjectiveCurrentPrevTagStringList                     .clear(); }
            if(adverbCurrentPrevTagStringList                       .size() > 0){ adverbCurrentPrevTagStringList                        .clear(); }
            if(intransitiveVerb1CurrentPrevTagStringList            .size() > 0){ intransitiveVerb1CurrentPrevTagStringList             .clear(); }
            if(intransitiveVerb2CurrentPrevTagStringList            .size() > 0){ intransitiveVerb2CurrentPrevTagStringList             .clear(); }
            if(intransitiveVerb3CurrentPrevTagStringList            .size() > 0){ intransitiveVerb3CurrentPrevTagStringList             .clear(); }
            if(intransitiveVerbIngCurrentPrevTagStringList          .size() > 0){ intransitiveVerbIngCurrentPrevTagStringList           .clear(); }
            if(intransitiveVerbSCurrentPrevTagStringList            .size() > 0){ intransitiveVerbSCurrentPrevTagStringList             .clear(); }
            if(negativeAdjectiveCurrentPrevTagStringList            .size() > 0){ negativeAdjectiveCurrentPrevTagStringList             .clear(); }
            if(negativeAdverbCurrentPrevTagStringList               .size() > 0){ negativeAdverbCurrentPrevTagStringList                .clear(); }
            if(negativeIntransitiveVerb1CurrentPrevTagStringList    .size() > 0){ negativeIntransitiveVerb1CurrentPrevTagStringList     .clear(); }
            if(negativeIntransitiveVerb2CurrentPrevTagStringList    .size() > 0){ negativeIntransitiveVerb2CurrentPrevTagStringList     .clear(); }
            if(negativeIntransitiveVerb3CurrentPrevTagStringList    .size() > 0){ negativeIntransitiveVerb3CurrentPrevTagStringList     .clear(); }
            if(negativeIntransitiveVerbIngCurrentPrevTagStringList  .size() > 0){ negativeIntransitiveVerbIngCurrentPrevTagStringList   .clear(); }
            if(negativeIntransitiveVerbSCurrentPrevTagStringList    .size() > 0){ negativeIntransitiveVerbSCurrentPrevTagStringList     .clear(); }
            if(negativeTransitiveVerb1CurrentPrevTagStringList      .size() > 0){ negativeTransitiveVerb1CurrentPrevTagStringList       .clear(); }
            if(negativeTransitiveVerb2CurrentPrevTagStringList      .size() > 0){ negativeTransitiveVerb2CurrentPrevTagStringList       .clear(); }
            if(negativeTransitiveVerb3CurrentPrevTagStringList      .size() > 0){ negativeTransitiveVerb3CurrentPrevTagStringList       .clear(); }
            if(negativeTransitiveVerbIngCurrentPrevTagStringList    .size() > 0){ negativeTransitiveVerbIngCurrentPrevTagStringList     .clear(); }
            if(negativeTransitiveVerbSCurrentPrevTagStringList      .size() > 0){ negativeTransitiveVerbSCurrentPrevTagStringList       .clear(); }
            if(nounAbstractCurrentPrevTagStringList                 .size() > 0){ nounCurrentPrevTagStringList                          .clear(); }
            if(nounAbstractSCurrentPrevTagStringList                .size() > 0){ nounSCurrentPrevTagStringList                         .clear(); }
            if(nounCurrentPrevTagStringList                         .size() > 0){ nounCurrentPrevTagStringList                          .clear(); }
            if(nounSCurrentPrevTagStringList                        .size() > 0){ nounSCurrentPrevTagStringList                         .clear(); }
            if(subjectCurrentPrevTagStringList                      .size() > 0){ subjectCurrentPrevTagStringList                       .clear(); }
            if(subjectPossesionCurrentPrevTagStringList             .size() > 0){ subjectPossesionCurrentPrevTagStringList              .clear(); }
            if(transitiveVerb1CurrentPrevTagStringList              .size() > 0){ transitiveVerb1CurrentPrevTagStringList               .clear(); }
            if(transitiveVerb2CurrentPrevTagStringList              .size() > 0){ transitiveVerb2CurrentPrevTagStringList               .clear(); }
            if(transitiveVerb3CurrentPrevTagStringList              .size() > 0){ transitiveVerb3CurrentPrevTagStringList               .clear(); }
            if(transitiveVerbIngCurrentPrevTagStringList            .size() > 0){ transitiveVerbIngCurrentPrevTagStringList             .clear(); }
            if(transitiveVerbSCurrentPrevTagStringList              .size() > 0){ transitiveVerbSCurrentPrevTagStringList               .clear(); }

        }

        /*Adding all the string into player word database.
        Here, I make sure that the word entered is always unique to the words that is already in the List.
        PENDING: Use HashSet instead of List.*/
        for(int i = 0; i < exhibitionCurrentObject.tagMuseumObjectList.size(); i ++){

            if      (exhibitionCurrentObject.tagMuseumObjectList.get(i).tagTypeString.equals("SUB")){
                if(!subjectCurrentPrevTagStringList                         .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagSubjectString                       )){ subjectCurrentPrevTagStringList                         .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagSubjectString                        ); }
                if(!subjectPossesionCurrentPrevTagStringList                .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagSubjectPossesionString              )){ subjectPossesionCurrentPrevTagStringList                .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagSubjectPossesionString               ); }
            }
            else if (exhibitionCurrentObject.tagMuseumObjectList.get(i).tagTypeString.equals("IVR")){

                if(!intransitiveVerb1CurrentPrevTagStringList               .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagIntransitiveVerb1String             )){ intransitiveVerb1CurrentPrevTagStringList               .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagIntransitiveVerb1String              ); }
                if(!intransitiveVerb2CurrentPrevTagStringList               .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagIntransitiveVerb2String             )){ intransitiveVerb2CurrentPrevTagStringList               .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagIntransitiveVerb2String              ); }
                if(!intransitiveVerb3CurrentPrevTagStringList               .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagIntransitiveVerb3String             )){ intransitiveVerb3CurrentPrevTagStringList               .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagIntransitiveVerb3String              ); }
                if(!intransitiveVerbSCurrentPrevTagStringList               .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagIntransitiveVerbSString             )){ intransitiveVerbSCurrentPrevTagStringList               .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagIntransitiveVerbSString              ); }
                if(!intransitiveVerbIngCurrentPrevTagStringList             .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagIntransitiveVerbIngString           )){ intransitiveVerbIngCurrentPrevTagStringList             .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagIntransitiveVerbIngString            ); }
            }
            else if (exhibitionCurrentObject.tagMuseumObjectList.get(i).tagTypeString.equals("NIV")){
                if(!negativeIntransitiveVerb1CurrentPrevTagStringList       .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagNegativeIntransitiveVerb1String     )){ negativeIntransitiveVerb1CurrentPrevTagStringList       .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagNegativeIntransitiveVerb1String      ); }
                if(!negativeIntransitiveVerb2CurrentPrevTagStringList       .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagNegativeIntransitiveVerb2String     )){ negativeIntransitiveVerb2CurrentPrevTagStringList       .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagNegativeIntransitiveVerb2String      ); }
                if(!negativeIntransitiveVerb3CurrentPrevTagStringList       .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagNegativeIntransitiveVerb3String     )){ negativeIntransitiveVerb3CurrentPrevTagStringList       .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagNegativeIntransitiveVerb3String      ); }
                if(!negativeIntransitiveVerbSCurrentPrevTagStringList       .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagNegativeIntransitiveVerbSString     )){ negativeIntransitiveVerbSCurrentPrevTagStringList       .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagNegativeIntransitiveVerbSString      ); }
                if(!negativeIntransitiveVerbIngCurrentPrevTagStringList     .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagNegativeIntransitiveVerbIngString   )){ negativeIntransitiveVerbIngCurrentPrevTagStringList     .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagNegativeIntransitiveVerbIngString    ); }
            }
            else if (exhibitionCurrentObject.tagMuseumObjectList.get(i).tagTypeString.equals("TVR")){
                if(!transitiveVerb1CurrentPrevTagStringList                 .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagTransitiveVerb1String               )){ transitiveVerb1CurrentPrevTagStringList                 .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagTransitiveVerb1String                ); }
                if(!transitiveVerb2CurrentPrevTagStringList                 .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagTransitiveVerb2String               )){ transitiveVerb2CurrentPrevTagStringList                 .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagTransitiveVerb2String                ); }
                if(!transitiveVerb3CurrentPrevTagStringList                 .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagTransitiveVerb3String               )){ transitiveVerb3CurrentPrevTagStringList                 .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagTransitiveVerb3String                ); }
                if(!transitiveVerbSCurrentPrevTagStringList                 .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagTransitiveVerbSString               )){ transitiveVerbSCurrentPrevTagStringList                 .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagTransitiveVerbSString                ); }
                if(!transitiveVerbIngCurrentPrevTagStringList               .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagTransitiveVerbIngString             )){ transitiveVerbIngCurrentPrevTagStringList               .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagTransitiveVerbIngString              ); }
            }
            else if (exhibitionCurrentObject.tagMuseumObjectList.get(i).tagTypeString.equals("NTV")){
                if(!negativeTransitiveVerb1CurrentPrevTagStringList         .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagNegativeTransitiveVerb1String       )){ negativeTransitiveVerb1CurrentPrevTagStringList         .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagNegativeTransitiveVerb1String        ); }
                if(!negativeTransitiveVerb2CurrentPrevTagStringList         .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagNegativeTransitiveVerb2String       )){ negativeTransitiveVerb2CurrentPrevTagStringList         .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagNegativeTransitiveVerb2String        ); }
                if(!negativeTransitiveVerb3CurrentPrevTagStringList         .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagNegativeTransitiveVerb3String       )){ negativeTransitiveVerb3CurrentPrevTagStringList         .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagNegativeTransitiveVerb3String        ); }
                if(!negativeTransitiveVerbSCurrentPrevTagStringList         .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagNegativeTransitiveVerbSString       )){ negativeTransitiveVerbSCurrentPrevTagStringList         .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagNegativeTransitiveVerbSString        ); }
                if(!negativeTransitiveVerbIngCurrentPrevTagStringList       .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagNegativeTransitiveVerbIngString     )){ negativeTransitiveVerbIngCurrentPrevTagStringList       .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagNegativeTransitiveVerbIngString      ); }
            }
            else if (exhibitionCurrentObject.tagMuseumObjectList.get(i).tagTypeString.equals("NOA")){
                if(!nounAbstractCurrentPrevTagStringList                    .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagNounAbstractString                  )){ nounAbstractCurrentPrevTagStringList                    .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagNounAbstractString                   ); }
                if(!nounAbstractSCurrentPrevTagStringList                   .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagNounAbstractSString                 )){ nounAbstractSCurrentPrevTagStringList                   .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagNounAbstractSString                  ); }
            }
            else if (exhibitionCurrentObject.tagMuseumObjectList.get(i).tagTypeString.equals("NOU")){
                if(!nounCurrentPrevTagStringList                            .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagNounString                          )){ nounCurrentPrevTagStringList                            .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagNounString                           ); }
                if(!nounSCurrentPrevTagStringList                           .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagNounSString                         )){ nounSCurrentPrevTagStringList                           .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagNounSString                          ); }
            }
            else if (exhibitionCurrentObject.tagMuseumObjectList.get(i).tagTypeString.equals("ADJ")){
                if(!adjectiveCurrentPrevTagStringList                       .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagAdjectiveString                     )){ adjectiveCurrentPrevTagStringList                       .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagAdjectiveString                      ); }
            }
            else if (exhibitionCurrentObject.tagMuseumObjectList.get(i).tagTypeString.equals("NDJ")){
                if(!negativeAdjectiveCurrentPrevTagStringList               .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagAdjectiveString                     )){ negativeAdjectiveCurrentPrevTagStringList               .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagNegativeAdjectiveString              ); }
            }
            else if (exhibitionCurrentObject.tagMuseumObjectList.get(i).tagTypeString.equals("ADV")){
                if(!adverbCurrentPrevTagStringList                          .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagNegativeAdverbString                )){ adverbCurrentPrevTagStringList                          .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagAdverbString                         ); }
            }
            else if (exhibitionCurrentObject.tagMuseumObjectList.get(i).tagTypeString.equals("NDV")){
                if(!negativeAdverbCurrentPrevTagStringList                  .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagNegativeAdverbString                )){ negativeAdverbCurrentPrevTagStringList                  .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagNegativeAdverbString                 ); }
            }

        }

    }

    /*A function to manage this player graphical user interface.
    In this function the width, height, x position, and y position are set.*/
    void SetPanelVariableInsideVoid()                                                   {

        /*Panel layout calculations.*/
        ObjectMuseum    exhibitionCurrentObject =  FindObject(exhibitionObjectList, exhibitionCurrentString);
        if(             exhibitionCurrentObject == null){ exhibitionCurrentObject = exhibitionObjectList.get(0); }
        widthPanelInt   = exhibitionCurrentObject.widthPanelInt;
        heightPanelInt  = exhibitionCurrentObject.heightPanelInt;
        xPanelInt       = exhibitionCurrentObject.xPanelInt;
        yPanelInt       = exhibitionCurrentObject.yPanelInt + ((playerSiblingIndexInt + 1)*heightPanelInt) + ((playerSiblingIndexInt + 1)*panelLayoutOffsetInt);
        if              (widthPanelInt <= 10 ){ widthPanelInt = 10;  }
        else if         (heightPanelInt <= 10){ heightPanelInt = 10; }
        
    }

    /*A function to determine whether this object is hovered by mouse or not.*/
    boolean SetHoverBoolean()                                                           {

        if(

            (mouseX < panelObject.xPanelInt + panelObject.widthPanelInt )   &&
            (mouseX > panelObject.xPanelInt                             )   &&
            (mouseY < panelObject.yPanelInt + panelObject.heightPanelInt)   &&
            (mouseY > panelObject.yPanelInt                             )

        )   { hoverBoolean = true ; }
        else{ hoverBoolean = false; }

        return hoverBoolean;

    }

    /*A function to return the position of this player in the player sibling list*/
    int SetPlayerSiblingIndexInt(

        List<ObjectPlayer> _playerSiblingObjectList

    ){

        playerSiblingIndexInt = -1;
        for(int i = 0; i < _playerSiblingObjectList.size(); i ++){ if(_playerSiblingObjectList.get(i) == this){ playerSiblingIndexInt = i; } }
        return playerSiblingIndexInt;

    }

    /*A function to automatically add other player of which in the same exhibition.*/
    List<ObjectPlayer> SetSiblingObjectList()               {

        playerSiblingObjectList = new ArrayList<ObjectPlayer>();
        for(int i = 0; i < playerObjectList.size(); i ++){
            if(playerObjectList.get(i).exhibitionCurrentString.equals(exhibitionCurrentString)){
                playerSiblingObjectList.add(playerObjectList.get(i));
            }
        }

        /*Set the new index of this player object.*/
        playerSiblingIndexInt = SetPlayerSiblingIndexInt(playerSiblingObjectList);

        return playerSiblingObjectList;

    }

    /*A function to determine target exhibition.*/
    List<String> SetExhibitionTargetNameAltStringList()      {

        exhibitionTargetNameAltStringList  = new ArrayList<String>();
        exhibitionTargetNameFullStringList = new ArrayList<String>();

        /*Stage one sort.
        Stage one sort is to remove the currently visited exhibition from the target exhibition index.
        So that the player have no chance on visiting the exhibition that he/she  currently visits.*/
        for(int i = 0; i < exhibitionObjectList.size(); i ++){

            /*Compare the current exihibition with the object exhibitiob array.
            After that remove the object exhibition that is the current exhibition and put the rest
                of the exhibition in the target exhibition array string.*/
            if(

                !(exhibitionObjectList.get(i).nameAltString.equals(exhibitionCurrentString))

            ){

                exhibitionTargetNameAltStringList .add(exhibitionObjectList.get(i).nameAltString );
                exhibitionTargetNameFullStringList.add(exhibitionObjectList.get(i).nameFullString);

            }

        }

        /*Stage two sort.
        Remove all exhibition target that is full of visitor.*/
        for(int i = 0; i < exhibitionObjectList.size(); i ++){

            if(

                 (exhibitionObjectList.get(i).fullBoolean       == true)                                               &&
                !(exhibitionCurrentString                       .equals(exhibitionObjectList.get(i).nameAltString))

            ){
                
                /*After each remove make sure to have the exhibition target length to be 3.
                If not 3 elements in the target exhibition array, then return the last 3 elements
                    of target exhibition array ever exist.*/
                exhibitionTargetNameAltStringList                       .remove(exhibitionObjectList.get(i).nameAltString );
                exhibitionTargetNameFullStringList                      .remove(exhibitionObjectList.get(i).nameFullString);
                if(exhibitionTargetNameAltStringList.size() == 3)       { return exhibitionTargetNameAltStringList; }

            }

        }

        /*Stage three sort.
        Stage three sort is to make the exhibition that has been visited before has 90% chance to make into target exhibition.
        For example the visitor is now in the Exhibition C as he/she used to visits Exhibition A and Exhibition B before,
            the system now will let Exhibition A and Exhibition B to have 10% chance to be not removed from the target
            exhibition array.*/
        for(int i = 0; i < exhibitionVisitedNameAltStringList.size(); i ++){

            for(int j = 0; j < exhibitionTargetNameAltStringList.size(); j ++){

                /*Compare the target exhibitions with all visited exhibition.
                If it matches then the corresponding exhibition has 90% chance to be deleted
                    from target exhibition array.*/
                if(exhibitionTargetNameAltStringList.get(j).equals(exhibitionVisitedNameAltStringList.get(i))){

                    if(Math.random() < 0.90f){

                        exhibitionTargetNameAltStringList .remove(exhibitionTargetNameAltStringList .get(j));
                        exhibitionTargetNameFullStringList.remove(exhibitionTargetNameFullStringList.get(j));
                        j --;

                    }

                    /*After each remove make sure to have the exhibition target length to be 3.
                    If not 3 elements in the target exhibition array, then return the last 3 elements
                        of target exhibition array ever exist.*/
                    if(exhibitionTargetNameAltStringList.size() == 3)  { return exhibitionTargetNameAltStringList; }

                }

            }

        }

        /*Stage four sort.
        So now this application compare the the most visited tags from this player profile (take three most visited tags)
            and compared to the exhibition tag.
        Each exhibition has 3 tags so,
            if nothing match the exhibition is excluded from from the target exhibition array,
            if one tag is match the exhibition has 66% chance of being removed from the target exhibition array,
            if two tags are match the exhibition has 33% chance of being removed from the target exhibition array,
            if three tags are match the exhibition will stay in the target exhibition array.*/
        String tempTagStringArray[] = new String[3];
        for(int i = 0; i < tempTagStringArray.length                    ; i ++){ tempTagStringArray[i] = exhibitionTagCounterList.get(i).GetTagNameAltString(); }
        for(int i = 0; i < exhibitionTargetNameAltStringList.size()     ; i ++){

            ObjectMuseum    exhibitionTargetObject  = FindObject(exhibitionObjectList, exhibitionTargetNameAltStringList.get(i));
            int             tagSameCountInt         = 0;

            for(int j = 0; j < exhibitionTargetObject.tagMuseumNameAltStringList.size(); j ++){

                for(int k = 0; k < tempTagStringArray.length; k ++){

                    if(exhibitionTargetObject.tagMuseumNameAltStringList.get(j) == tempTagStringArray[k]){ tagSameCountInt ++; }

                }

            }
            
            if      (tagSameCountInt == 0)          {                            exhibitionTargetNameAltStringList.remove(exhibitionTargetNameAltStringList.get(i)); exhibitionTargetNameFullStringList.remove(exhibitionTargetNameFullStringList.get(i)); i --; }
            else if (tagSameCountInt == 1)          { if(Math.random() < 0.66f){ exhibitionTargetNameAltStringList.remove(exhibitionTargetNameAltStringList.get(i)); exhibitionTargetNameFullStringList.remove(exhibitionTargetNameFullStringList.get(i)); i --; } }
            else if (tagSameCountInt == 2)          { if(Math.random() < 0.33f){ exhibitionTargetNameAltStringList.remove(exhibitionTargetNameAltStringList.get(i)); exhibitionTargetNameFullStringList.remove(exhibitionTargetNameFullStringList.get(i)); i --; } }
            else if (tagSameCountInt == 3)          {  }

            /*After each remove make sure to have the exhibition target length to be 3.
            If not 3 elements in the target exhibition array, then return the last 3 elements
                of target exhibition array ever exist.*/
            if(exhibitionTargetNameAltStringList.size() == 3)  { return exhibitionTargetNameAltStringList; }

        }

        ObjectMuseum    exhibitionCurrentObject     = FindObject(exhibitionObjectList, exhibitionCurrentString);
        String          roomCurrentString           = exhibitionCurrentObject.parentNameAltString;
        ObjectMuseum    roomCurrentObject           = FindObject(roomObjectList, roomCurrentString);
        String          floorCurrentString          = roomCurrentObject.parentNameAltString;
        ObjectMuseum    floorCurrentObject          = FindObject(floorObjectList, floorCurrentString);

        /*Stage five sort.
        The fourth sort is to make the exhibition target that are not in the same floor or room of which player's
            current exhibition to have 50% chance of stay.*/
        for(int i = 0; i < exhibitionTargetNameAltStringList.size(); i ++){

            ObjectMuseum    exhibitionTargetObject  = FindObject(exhibitionObjectList, exhibitionTargetNameAltStringList.get(i));
            String          roomTargetString        = exhibitionTargetObject.parentNameAltString;
            ObjectMuseum    roomTargetObject        = FindObject(roomObjectList, roomTargetString);
            String          floorTargetString       = roomTargetObject.parentNameAltString;
            ObjectMuseum    floorTargetObject       = FindObject(floorObjectList, floorTargetString);

            if(roomCurrentString    != roomTargetString ){

                if(Math.random() < 0.20f){ exhibitionTargetNameAltStringList.remove(exhibitionTargetNameAltStringList.get(i)); exhibitionTargetNameFullStringList.remove(exhibitionTargetNameFullStringList.get(i)); i --; }
                else{

                    if(floorCurrentString != floorTargetString){ if(Math.random() < 0.50f){ exhibitionTargetNameAltStringList.remove(exhibitionTargetNameAltStringList.get(i)); exhibitionTargetNameFullStringList.remove(exhibitionTargetNameFullStringList.get(i)); i --; } }

                }

            }
            
            /*After each remove make sure to have the exhibition target length to be 3.
            If not 3 elements in the target exhibition array, then return the last 3 elements
                of target exhibition array ever exist.*/
            if(exhibitionTargetNameAltStringList.size() == 3)  { return exhibitionTargetNameAltStringList; }

        }

        /*Make sure to only have three exhibition target at the end of this function.*/
        if(exhibitionTargetNameAltStringList.size() > 3){

            int listIndexInt = exhibitionTargetNameAltStringList.size() - 1;

            while(exhibitionTargetNameAltStringList.size() > 3){

                exhibitionTargetNameAltStringList   .remove(listIndexInt);
                exhibitionTargetNameFullStringList  .remove(listIndexInt);
                listIndexInt                        --;

            }

        }

        return                              exhibitionTargetNameAltStringList;

    }

    /*A function to move this player into new exhibition and add the tags to the tag coutner list.*/
    ObjectMuseum ExhibitionMoveObject(String _targetNameAltString){

        /*Variable to hold currently visited museum object.*/
        ObjectMuseum exhibitionCurrentObject    = null;
        ObjectMuseum roomCurrentObject          = null;
        ObjectMuseum floorCurrentObject         = null;

        /*If this player has a parent (means that this is not the first move).
        So that, this if statement is only when the player is first time
            initiated.*/
        if(exhibitionCurrentString != ""){

            /*Remove this player from the current child list of the parent,
                before we move this player into another exhibition.*/
            AddRemoveChildVoid          (false);

            exhibitionCurrentObject     = FindObject(exhibitionObjectList   , exhibitionCurrentString                           );
            roomCurrentObject           = FindObject(roomObjectList         , exhibitionCurrentObject   .parentNameAltString    );
            floorCurrentObject          = FindObject(floorObjectList        , roomCurrentObject         .parentNameAltString    );
            exhibitionCurrentObject     .visitorCurrentInt --;
            roomCurrentObject           .visitorCurrentInt --;
            floorCurrentObject          .visitorCurrentInt --;

            PopulateTagStringList       (true);
            
        }

        /*Calculate whether player score is increasing or decreasing.*/
        for(int i = 0; i < exhibitionTargetNameAltStringList.size(); i ++){

            if(exhibitionTargetNameAltStringList.get(i).equals(_targetNameAltString)){ playerScoreInt ++; playerVisitCorrectExhibitionBoolean = true; break; }
            if(i == (exhibitionTargetNameAltStringList.size() - 1)){ playerScoreInt --; playerVisitCorrectExhibitionBoolean = false; }

        }

        /*Change this player current exhibition into the new exhibition.*/
        exhibitionCurrentString             =  _targetNameAltString;                                        /*Change the current exhibition object String.                                                                                                                                          */
        exhibitionCurrentObject             =  FindObject(exhibitionObjectList, exhibitionCurrentString);   /*From the String we find the object in the List of exhibition objects.                                                                                                                 */
        if(exhibitionCurrentObject          == null){                                                       /*If there is nothing in the exhibition object list with the name listed in exhibitionCurrentString variable. Move the player into the first exhibition in the exhibition object List.  */

            exhibitionCurrentString         =  exhibitionObjectList.get(0).nameAltString;
            exhibitionCurrentObject         =  exhibitionObjectList.get(0);

        }
        exhibitionVisitedNameAltStringList  .add(exhibitionCurrentObject.nameAltString );                   /*Put the new current exhibition into the String List of visited object.*/
        exhibitionVisitedNameFullStringList .add(exhibitionCurrentObject.nameFullString);                   /*Put the new current exhibition into the String List of visited object.*/
        
        /*Re - instantiated all newly visited museum objects.*/
        exhibitionCurrentObject         = FindObject(exhibitionObjectList   , exhibitionCurrentString                           );
        roomCurrentObject               = FindObject(roomObjectList         , exhibitionCurrentObject   .parentNameAltString    );
        floorCurrentObject              = FindObject(floorObjectList        , roomCurrentObject         .parentNameAltString    );

        /*Add total number museum visit.*/
        exhibitionCurrentObject         .visitorCurrentInt  ++;
        roomCurrentObject               .visitorCurrentInt  ++;
        floorCurrentObject              .visitorCurrentInt  ++;
        exhibitionCurrentObject         .visitorTotalInt    ++;
        roomCurrentObject               .visitorTotalInt    ++;
        floorCurrentObject              .visitorTotalInt    ++;

        /*Get the explanation of the new exhibition.*/
        int             counterInt      = 0;
        int             indexRandomInt  = (int)Math.floor(Math.random()*exhibitionCurrentObject.explanationStringArray.length);
        List<Integer>   indexIntList    = new ArrayList<Integer>();
                        indexIntList    .add(indexRandomInt);
        while(

            (explanationStringList.contains(exhibitionCurrentObject.explanationStringArray[indexRandomInt])) ||
            (counterInt                  >= exhibitionCurrentObject.explanationStringArray.length)

        ){

            Integer[]   indexIntArray    = new Integer[indexIntList.size()];
                        indexIntList    .toArray(indexIntArray);
                        indexRandomInt  = RandomNumberWithExclusionInt(0, (exhibitionCurrentObject.explanationStringArray.length - 1), indexIntArray);
                        indexIntList    .add(indexRandomInt);

            counterInt ++;

        }
        if(counterInt < exhibitionCurrentObject.explanationStringArray.length){
            explanationStringList.add(exhibitionCurrentObject.explanationStringArray[indexRandomInt]);
        }

        PopulateTagStringList           (false);

        AddTagCounterVoid               (exhibitionCurrentObject);
        AddRemoveChildVoid              (true);
        
        SetExhibitionTargetNameAltStringList    ();
        SetSiblingObjectList                    ();

        /*For everytime a player move to another exhibition iterate through all player to re - add the siblings.*/
        for(int i = 0; i < playerObjectList.size(); i ++){

            playerObjectList.get(i).SetExhibitionTargetNameAltStringList    ();
            playerObjectList.get(i).SetSiblingObjectList                    ();

        }

        /*If this is the second exhibition visited than put the sentence into the sentence List.
        The sentence List is will the container of every sentences that has been collected by this player.*/
        if(

            (exhibitionVisitedNameAltStringList  .size() > 1) &&
            (exhibitionVisitedNameFullStringList .size() > 1)

        ){

            String tempThreeSentencesString = SentenceMultipleGenerateString(3);
            sentenceStringList.add(tempThreeSentencesString);

        }

        /*
        if(playerIndexInt == 1){

            println("===");
            println(adjectiveCurrentPrevTagStringList);
            println(adverbCurrentPrevTagStringList);
            println(intransitiveVerb1CurrentPrevTagStringList);
            println(intransitiveVerb2CurrentPrevTagStringList);
            println(intransitiveVerb3CurrentPrevTagStringList);
            println(intransitiveVerbIngCurrentPrevTagStringList);
            println(intransitiveVerbSCurrentPrevTagStringList);
            println(negativeAdjectiveCurrentPrevTagStringList);
            println(negativeAdverbCurrentPrevTagStringList);
            println(negativeIntransitiveVerb1CurrentPrevTagStringList);
            println(negativeIntransitiveVerb2CurrentPrevTagStringList);
            println(negativeIntransitiveVerb3CurrentPrevTagStringList);
            println(negativeIntransitiveVerbIngCurrentPrevTagStringList);
            println(negativeIntransitiveVerbSCurrentPrevTagStringList);
            println(negativeTransitiveVerb1CurrentPrevTagStringList);
            println(negativeTransitiveVerb2CurrentPrevTagStringList);
            println(negativeTransitiveVerb3CurrentPrevTagStringList);
            println(negativeTransitiveVerbIngCurrentPrevTagStringList);
            println(negativeTransitiveVerbSCurrentPrevTagStringList);
            println(nounAbstractCurrentPrevTagStringList);
            println(nounAbstractSCurrentPrevTagStringList);
            println(nounCurrentPrevTagStringList);
            println(nounSCurrentPrevTagStringList);
            println(subjectCurrentPrevTagStringList);
            println(subjectPossesionCurrentPrevTagStringList);
            println(transitiveVerb1CurrentPrevTagStringList);
            println(transitiveVerb2CurrentPrevTagStringList);
            println(transitiveVerb3CurrentPrevTagStringList);
            println(transitiveVerbIngCurrentPrevTagStringList);
            println(transitiveVerbSCurrentPrevTagStringList);
            println("===");
            println(exhibitionCurrentObject.tagMuseumNameAltStringList);
            println("===");
            println(SentenceMultipleGenerateString(3));
            println("===");

        }
        */

        return exhibitionCurrentObject;

    }

    /*A function to find an object from an array.
    PROTOTYPE: Change this function so that it can also search from the full name.
    PENDING: Change this so that it follows convention of String first then the List.*/
    ObjectMuseum FindObject(

        List<ObjectMuseum>  _targetObjectList       ,
        String              _targetNameString

    ){

        ObjectMuseum objectMuseum = null;
        for(int i = 0; i < _targetObjectList.size(); i ++){

            if(_targetObjectList.get(i).nameAltString .equals(_targetNameString)){ objectMuseum = _targetObjectList.get(i); return objectMuseum; }
            if(_targetObjectList.get(i).nameFullString.equals(_targetNameString)){ objectMuseum = _targetObjectList.get(i); return objectMuseum; }

        }

        return null;

    }
    
    /*A function to draw panel.*/
    Panel PanelDrawVoid()                                                                 {

        exhibitionCurrentObject         = FindObject(exhibitionObjectList, exhibitionCurrentString);
        exhibitionCurrentNameAltString  = exhibitionCurrentObject.nameAltString;
        exhibitionCurrentNameFullString = exhibitionCurrentObject.nameFullString;

        SetPanelVariableInsideVoid      ();

        /*Here we determine the color based whether this player/visitor has visited total amount exhibition or not.*/
        color   usedColor;
        if      (exhibitionVisitedNameAltStringList.size() >= exhibitionObjectList.size())  { usedColor = panelFinishedColor;   }
        else                                                                                { usedColor = panelUnfinishedColor; }

        panelObject                     .DrawVoid(

            usedColor                   ,
            widthPanelInt               ,
            heightPanelInt              ,
            xPanelInt                   ,
            yPanelInt                   ,
            ("" + playerIndexInt)

        );

        return panelObject;

    }

    /*Generate random number with exclusion.*/
    int RandomNumberWithExclusionInt(int _startInt, int _endInt, Integer... _excludeIntArray){

        int randomInt = 0;
        do{ randomInt = (int)random(_startInt, _endInt); }
        while(Arrays.binarySearch(_excludeIntArray, randomInt) >= 0);
        return randomInt;

    }

    /*Set of functions to generate sentence.
    PENDING: Make this functions into a class.*/
    int     SentenceRandomNumberGeneratorInt    (int        _randomNumber)          { return (int)(Math.round(Math.random()*(_randomNumber - 1))); }
    String  SentenceWordFixString               (String     _fixString)             { return _fixString.substring(0, 1).toUpperCase() + _fixString.substring(1, _fixString.length()); }
    String  SentenceMultipleGenerateString      (int        _numberOfSentenceInt)   {

        /*Subject VerbIng Habit.
        Subject VerbVerbS to Verb1.
        Iwill VerbVerb Subject to Verb1.
        
        Subject Is Noun.
        VerbIng A Noun Adv.
        Habit VerbS Adj.
        
        A Adj Adj Noun.
        A Subject VerbS To Noun.
        Verb Habit.
        
        Noun Verbs.
        What Subject Was VerbS.
        Are Adj of NounS.

        As the Subject does Verb1
        Across the Noun, Subject sees the...
        Subject Verb in Habit
        */

        String[][]  patternStringArray      = new String[][]{

            {
                "{ % +."              ,
                "{ * to @."           ,
                "I will & { to @."
            },
            {

                "{ is a _ (."   ,
                "% a ( =."  ,
                "+ ^ _."

            },
            {

                "A _ _ (."      ,
                "{ ^ to (."   ,
                "^ +."

            },
            {

                "{ ^."          ,
                "What { was ^." ,
                "Are _ )."

            },
            {

                "As the { does @.",
                "Across the (, { sees the...",
                "{ @ in +."

            }

        };

        int         stringPatternIndexInt = SentenceRandomNumberGeneratorInt(patternStringArray.length);
        String[]    stringPatternIndexString = patternStringArray[stringPatternIndexInt];
        String      textString = "";
        for     (int i = 0; i < _numberOfSentenceInt; i ++){

            if  (i == 0)    { textString = SentenceSingleGenerateString(stringPatternIndexString[i]);                          }
            else            { textString = textString + "\n" + SentenceSingleGenerateString(stringPatternIndexString[i]);      }
            

        }
        return  textString;

    }
    String  SentenceSingleGenerateString        (String _patternString){

        /*Change these two lines of code below into transitive and intransitive verbs.*/
        //String[]  verbVerbCurrentPrevTagStringList           = new String[]{ "agree", "demand", "desire", "expect", "know how", "like", "need", "offer", "promise", "refuse", "want", "wish" };
        //String[]  verbVerbSCurrentPrevTagStringList          = new String[]{ "agrees", "demands", "desires", "expects", "knows how", "likes", "needs", "offers", "promises", "refuses", "wants", "wishes" };
        String[]    adjectiveHabitCurrentPrevTagStringList     = new String[]{ "every day", "about once a week", "all the time", "as often as possible", "at least twice a week", "every evening", "every month", "every night", "every other day", "every other month", "every other week", "every third day", "every thirty minutes", "every year", "four or five times a day", "three times a day", "more than four times a month", "once a week", "once or twice a year", "three times a year", "twice a day", "twice a month" };

        String      patternString   = _patternString;
        String      sentenceString  = "";

        for         (int i = 0; i   < patternString.length(); i ++){

            String  scanString      = patternString.substring(i, i + 1);
            String  wordString      = "";

                    if(scanString.equals("~")){ /*Subject.                            */
                            if(playerNameString == ""){
                                                    wordString = subjectCurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(subjectCurrentPrevTagStringList.size())); 
                    }
                    else    if(playerNameString != ""){
                                                    wordString = playerNameString;
                        if(Math.random() <= 0.50){  wordString = subjectCurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(subjectCurrentPrevTagStringList.size())); }
                    }
            }
            else    if(scanString.equals("`")){ /*Subject possesion.                  */
                            if(playerNameString == ""){
                                                    wordString = subjectPossesionCurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(subjectPossesionCurrentPrevTagStringList.size())); 
                    }
                    else    if(playerNameString != ""){
                                                    wordString = playerNameString + "'s";
                        if(Math.random() <= 0.50){  wordString = subjectPossesionCurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(subjectPossesionCurrentPrevTagStringList.size())); }
                    }
            }
            else    if(scanString.equals("!")){ /*Intransitive verb 1.                */
                            if(playerVisitCorrectExhibitionBoolean == true ){ wordString = intransitiveVerb1CurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(intransitiveVerb1CurrentPrevTagStringList.size())); }
                    else    if(playerVisitCorrectExhibitionBoolean == false){
                        if  (Math.random() > 0.80)  { wordString = negativeIntransitiveVerb1CurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(negativeIntransitiveVerb1CurrentPrevTagStringList.size())); }
                        else                        { wordString = intransitiveVerb1CurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(intransitiveVerb1CurrentPrevTagStringList.size())); }
                    }
            }
            else    if(scanString.equals("@")){ /*Intransitive verb 2.                */
                            if(playerVisitCorrectExhibitionBoolean == true ){ wordString = intransitiveVerb2CurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(intransitiveVerb2CurrentPrevTagStringList.size())); }
                    else    if(playerVisitCorrectExhibitionBoolean == false){
                        if  (Math.random() > 0.80)  { wordString = negativeIntransitiveVerb2CurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(negativeIntransitiveVerb2CurrentPrevTagStringList.size())); }
                        else                        { wordString = intransitiveVerb2CurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(intransitiveVerb2CurrentPrevTagStringList.size())); }
                    }
            }
            else    if(scanString.equals("#")){ /*Intransitive verb 3.                */
                            if(playerVisitCorrectExhibitionBoolean == true ){ wordString = intransitiveVerb3CurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(intransitiveVerb3CurrentPrevTagStringList.size())); }
                    else    if(playerVisitCorrectExhibitionBoolean == false){
                        if  (Math.random() > 0.80)  { wordString = negativeIntransitiveVerb3CurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(negativeIntransitiveVerb3CurrentPrevTagStringList.size())); }
                        else                        { wordString = intransitiveVerb3CurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(intransitiveVerb3CurrentPrevTagStringList.size())); }
                    }
            }
            else    if(scanString.equals("$")){ /*Intransitive verb + Ing.            */
                            if(playerVisitCorrectExhibitionBoolean == true ){ wordString = intransitiveVerbIngCurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(intransitiveVerbIngCurrentPrevTagStringList.size())); }
                    else    if(playerVisitCorrectExhibitionBoolean == false){
                        if  (Math.random() > 0.80)  { wordString = negativeIntransitiveVerbIngCurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(negativeIntransitiveVerbIngCurrentPrevTagStringList.size())); }
                        else                        { wordString = intransitiveVerbIngCurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(intransitiveVerbIngCurrentPrevTagStringList.size())); }
                    }
            }
            else    if(scanString.equals("$")){ /*Intransitive verb + s.              */
                            if(playerVisitCorrectExhibitionBoolean == true ){ wordString = intransitiveVerbSCurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(intransitiveVerbSCurrentPrevTagStringList.size())); }
                    else    if(playerVisitCorrectExhibitionBoolean == false){
                        if  (Math.random() > 0.80)  { wordString = negativeIntransitiveVerbSCurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(negativeIntransitiveVerbSCurrentPrevTagStringList.size())); }
                        else                        { wordString = intransitiveVerbSCurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(intransitiveVerbSCurrentPrevTagStringList.size())); }
                    }
            }
            else    if(scanString.equals(")")){ /*Transitive verb 1.                  */
                            if(playerVisitCorrectExhibitionBoolean == true ){ wordString = transitiveVerb1CurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(transitiveVerb1CurrentPrevTagStringList.size())); }
                    else    if(playerVisitCorrectExhibitionBoolean == false){
                        if  (Math.random() > 0.80)  { wordString = negativeTransitiveVerb1CurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(negativeTransitiveVerb1CurrentPrevTagStringList.size())); }
                        else                        { wordString = transitiveVerb1CurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(transitiveVerb1CurrentPrevTagStringList.size())); }
                    }
            }
            else    if(scanString.equals("-")){ /*Transitive verb 2.                  */
                            if(playerVisitCorrectExhibitionBoolean == true ){ wordString = transitiveVerb2CurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(transitiveVerb2CurrentPrevTagStringList.size())); }
                    else    if(playerVisitCorrectExhibitionBoolean == false){
                        if  (Math.random() > 0.80)  { wordString = negativeTransitiveVerb2CurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(negativeTransitiveVerb2CurrentPrevTagStringList.size())); }
                        else                        { wordString = transitiveVerb2CurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(transitiveVerb2CurrentPrevTagStringList.size())); }
                    }
            }
            else    if(scanString.equals("_")){ /*Transitive verb 3.                  */
                            if(playerVisitCorrectExhibitionBoolean == true ){ wordString = transitiveVerb3CurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(transitiveVerb3CurrentPrevTagStringList.size())); }
                    else    if(playerVisitCorrectExhibitionBoolean == false){
                        if  (Math.random() > 0.80)  { wordString = negativeTransitiveVerb3CurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(negativeTransitiveVerb3CurrentPrevTagStringList.size())); }
                        else                        { wordString = transitiveVerb3CurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(transitiveVerb3CurrentPrevTagStringList.size())); }
                    }
            }
            else    if(scanString.equals("+")){ /*Transitive verb + Ing.              */
                            if(playerVisitCorrectExhibitionBoolean == true ){ wordString = transitiveVerbIngCurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(transitiveVerbIngCurrentPrevTagStringList.size())); }
                    else    if(playerVisitCorrectExhibitionBoolean == false){
                        if  (Math.random() > 0.80)  { wordString = negativeTransitiveVerbIngCurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(negativeTransitiveVerbIngCurrentPrevTagStringList.size())); }
                        else                        { wordString = transitiveVerbIngCurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(transitiveVerbIngCurrentPrevTagStringList.size())); }
                    }
            }
            else    if(scanString.equals("=")){ /*Transitive verb + s.                */
                            if(playerVisitCorrectExhibitionBoolean == true ){ wordString = transitiveVerbSCurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(transitiveVerbSCurrentPrevTagStringList.size())); }
                    else    if(playerVisitCorrectExhibitionBoolean == false){
                        if  (Math.random() > 0.80)  { wordString = negativeTransitiveVerbSCurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(negativeTransitiveVerbSCurrentPrevTagStringList.size())); }
                        else                        { wordString = transitiveVerbSCurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(transitiveVerbSCurrentPrevTagStringList.size())); }
                    }
            }
            else    if(scanString.equals(":")){ /*Noun abstract.                      */
                    wordString = nounAbstractCurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(nounAbstractCurrentPrevTagStringList.size()));
            }
            else    if(scanString.equals(";")){ /*Noun + s abstract                   */
                    wordString = nounAbstractSCurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(nounAbstractSCurrentPrevTagStringList.size()));
            }
            else    if(scanString.equals("<")){ /*Noun.                               */
                    wordString = nounCurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(nounCurrentPrevTagStringList.size()));
            }
            else    if(scanString.equals(">")){ /*Noun + s                            */
                    wordString = nounSCurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(nounSCurrentPrevTagStringList.size()));
            }
            else    if(scanString.equals("/")){ /*Adjective.                          */
                            if(playerVisitCorrectExhibitionBoolean == true ){ wordString = adjectiveCurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(adjectiveCurrentPrevTagStringList.size())); }
                    else    if(playerVisitCorrectExhibitionBoolean == false){
                        if  (Math.random() > 0.80)  { wordString = negativeAdjectiveCurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(negativeAdjectiveCurrentPrevTagStringList.size())); }
                        else                        { wordString = adjectiveCurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(adjectiveCurrentPrevTagStringList.size())); }
                    }
            }
            else    if(scanString.equals("1")){ /*Adverb.                             */
                            if(playerVisitCorrectExhibitionBoolean == true ){ wordString = adverbCurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(adverbCurrentPrevTagStringList.size())); }
                    else    if(playerVisitCorrectExhibitionBoolean == false){
                        if  (Math.random() > 0.80)  { wordString = negativeAdverbCurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(negativeAdverbCurrentPrevTagStringList.size())); }
                        else                        { wordString = adverbCurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(adverbCurrentPrevTagStringList.size())); }
                    }
            }
            else    if(scanString.equals("2")){ /*Adjective habit.                      */
                    wordString = adjectiveHabitCurrentPrevTagStringList[SentenceRandomNumberGeneratorInt(adjectiveHabitCurrentPrevTagStringList.length)];
            }      
            else                                    { wordString = scanString; }
    
            sentenceString += wordString;

        }

        return SentenceWordFixString(sentenceString);

    }

}