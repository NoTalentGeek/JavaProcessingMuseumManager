import controlP5.*;
import java.util.*;

/*Panel card variables.*/
boolean                     panelCardChangeBoolean                          = true                          ;
color                       panelCardColor                                  = color(63, 63, 116)            ;
int                         panelLineSpacingInt                             = 5                             ;
int                         rowInt                                          = 0                             ;
int                         textSizePanelInt                                = 16                            ;
int                         xPanelCardInt                                   = -1                            ;
int                         yPanelCardInt                                   = -1                            ;
int                         heightPanelCardInt                              = 280                           ;
int                         widthPanelCardInt                               = 200                           ;
ObjectMuseum                tempSelectedMuseumObject                        = null                          ;
ObjectPlayer                tempSelectedPlayerObject                        = null                          ;
PFont                       panelCardPFont                                  ;
String                      panelFontString                                 = "Monospaced.plain"            ;
String                      panelString                                     = ""                            ;   
String                      tempFullString                                  ;
String                      tempVisitorCurrentString                        ;
String                      tempVisitorTotalString                          ;
/*Animation and universal GUI variables.*/
float                       animationStepFloat                              = (255f/45f)                    ;   /*Animation time step.*/
float                       dropdownMObjectAlphaFloat                       = 0                             ;
float                       dropdownPlayerAlphaFloat                        = 0                             ;
int                         guiLayoutOffsetInt                              = 20                            ;
int                         panelLayoutOffsetInt                            = 5                             ;
int                         panelLayoutOffsetSideInt                        = 50                            ;
int                         panelLayoutTotalRowInt                          ;
/*Controller variables.*/
int                         buttonSizeInt                                   ;
int                         menuWidthInt                                    ;
int                         menuHeightInt                                   ;
int                         leftMenuXInt                                    ;
int                         rightMenuXInt                                   ;
int                         menuYInt                                        ;
int                         addMuseumGroupHeightInt                         = 450;
int                         addPlayerGroupHeightInt                         = 144;
int                         addTagGroupHeightInt                            = 245;
int                         editMuseumGroupHeightInt                        = 100;
int                         editPlayerGroupHeightInt                        = 448;
int                         editTagGroupHeightInt                           = 245;
int                         removeMuseumGroupHeightInt                      = 100;
int                         removePlayerGroupHeightInt                      = 104;
int                         removeTagGroupHeightInt                         = 100;
ControlP5                   cp5Object                                       ;
Accordion                   leftMenuAccordionObject                         ;
Accordion                   rightMenuAccordionObject                        ;
ScrollableList              selectMuseumObjectScrollableListObject          ;
ScrollableList              selectPlayerScrollableListObject                ;
ButtonOpenClose             buttonOpenCloseMuseumObject                     ;
ButtonOpenClose             buttonOpenClosePlayerObject                     ;
AddMuseumGroupGUIObject     addMuseumGroupGUIObject                         ;
AddPlayerGroupGUIObject     addPlayerGroupGUIObject                         ;
AddTagGroupGUIObject        addTagGroupGUIObject                            ;
EditMuseumGroupGUIObject    editMuseumGroupGUIObject                        ;
EditPlayerGroupGUIObject    editPlayerGroupGUIObject                        ;
EditTagGroupGUIObject       editTagGroupGUIObject                           ;
RemoveMuseumGroupGUIObject  removeMuseumGroupGUIObject                      ;
RemovePlayerGroupGUIObject  removePlayerGroupGUIObject                      ;
RemoveTagGroupGUIObject     removeTagGroupGUIObject                         ;
/*Misc variables.*/
boolean                     buttonOpenCloseBoolean                          = false                         ;
int                         biggestPlayerIndexInt                           = 0                             ;
int                         nextBiggestPlayerIndexInt                       = 0                             ;
int                         museumObjectFullThresholdInt                    = 0                             ;
int                         playerAmountInt                                 = 100                           ;

JSONArray                   exhibitionSaveJSONArrayObject                   = new JSONArray();
JSONArray                   floorSaveJSONArrayObject                        = new JSONArray();
JSONArray                   roomSaveJSONArrayObject                         = new JSONArray();
JSONArray                   playerSaveJSONArrayObject                       = new JSONArray();
JSONObject                  exhibitionSaveJSONObject                        = new JSONObject();
JSONObject                  floorSaveJSONObject                             = new JSONObject();
JSONObject                  roomSaveJSONObject                              = new JSONObject();
JSONObject                  playerSaveJSONObject                            = new JSONObject();

JSONArray                   adjectiveTagSaveJSONArrayObject                 = new JSONArray();
JSONArray                   adverbTagSaveJSONArrayObject                    = new JSONArray();
JSONArray                   intransitiveVerbTagSaveJSONArrayObject          = new JSONArray();
JSONArray                   negativeAdjectiveTagSaveJSONArrayObject         = new JSONArray();
JSONArray                   negativeAdverbTagSaveJSONArrayObject            = new JSONArray();
JSONArray                   negativeIntransitiveVerbTagSaveJSONArrayObject  = new JSONArray();
JSONArray                   negativeTransitiveVerbTagSaveJSONArrayObject    = new JSONArray();
JSONArray                   nounAbstractTagSaveJSONArrayObject              = new JSONArray();
JSONArray                   nounTagSaveJSONArrayObject                      = new JSONArray();
JSONArray                   subjectTagSaveJSONArrayObject                   = new JSONArray();
JSONArray                   transitiveVerbTagSaveJSONArrayObject            = new JSONArray();
JSONObject                  adjectiveTagSaveJSONObject                      = new JSONObject();
JSONObject                  adverbTagSaveJSONObject                         = new JSONObject();
JSONObject                  intransitiveVerbTagSaveJSONObject               = new JSONObject();
JSONObject                  negativeAdjectiveTagSaveJSONObject              = new JSONObject();
JSONObject                  negativeAdverbTagSaveJSONObject                 = new JSONObject();
JSONObject                  negativeIntransitiveVerbTagSaveJSONObject       = new JSONObject();
JSONObject                  negativeTransitiveVerbTagSaveJSONObject         = new JSONObject();
JSONObject                  nounAbstractTagSaveJSONObject                   = new JSONObject();
JSONObject                  nounTagSaveJSONObject                           = new JSONObject();
JSONObject                  subjectTagSaveJSONObject                        = new JSONObject();
JSONObject                  transitiveVerbTagSaveJSONObject                 = new JSONObject();

/*Database of all important objects in this applications.*/
List<Tag>                   adjectiveTagObjectList                          = new ArrayList<Tag>            ();
List<Tag>                   adverbTagObjectList                             = new ArrayList<Tag>            ();
List<Tag>                   intransitiveVerbTagObjectList                   = new ArrayList<Tag>            ();
List<Tag>                   negativeAdjectiveTagObjectList                  = new ArrayList<Tag>            ();
List<Tag>                   negativeAdverbTagObjectList                     = new ArrayList<Tag>            ();
List<Tag>                   negativeIntransitiveVerbTagObjectList           = new ArrayList<Tag>            ();
List<Tag>                   negativeTransitiveVerbTagObjectList             = new ArrayList<Tag>            ();
List<Tag>                   nounAbstractTagObjectList                       = new ArrayList<Tag>            ();
List<Tag>                   nounTagObjectList                               = new ArrayList<Tag>            ();
List<Tag>                   subjectTagObjectList                            = new ArrayList<Tag>            ();
List<Tag>                   transitiveVerbTagObjectList                     = new ArrayList<Tag>            ();
List<String>                adjectiveTagNameAltStringList                   = new ArrayList<String>         ();
List<String>                adjectiveTagNameFullStringList                  = new ArrayList<String>         ();
List<String>                adverbTagNameAltStringList                      = new ArrayList<String>         ();
List<String>                adverbTagNameFullStringList                     = new ArrayList<String>         ();
List<String>                intransitiveVerbTagNameAltStringList            = new ArrayList<String>         ();
List<String>                intransitiveVerbTagNameFullStringList           = new ArrayList<String>         ();
List<String>                negativeAdjectiveTagNameAltStringList           = new ArrayList<String>         ();
List<String>                negativeAdjectiveTagNameFullStringList          = new ArrayList<String>         ();
List<String>                negativeAdverbTagNameAltStringList              = new ArrayList<String>         ();
List<String>                negativeAdverbTagNameFullStringList             = new ArrayList<String>         ();
List<String>                negativeIntransitiveVerbTagNameAltStringList    = new ArrayList<String>         ();
List<String>                negativeIntransitiveVerbTagNameFullStringList   = new ArrayList<String>         ();
List<String>                negativeTransitiveVerbTagNameAltStringList      = new ArrayList<String>         ();
List<String>                negativeTransitiveVerbTagNameFullStringList     = new ArrayList<String>         ();
List<String>                nounAbstractTagNameAltStringList                = new ArrayList<String>         ();
List<String>                nounAbstractTagNameFullStringList               = new ArrayList<String>         ();
List<String>                nounTagNameAltStringList                        = new ArrayList<String>         ();
List<String>                nounTagNameFullStringList                       = new ArrayList<String>         ();
List<String>                subjectTagNameAltStringList                     = new ArrayList<String>         ();
List<String>                subjectTagNameFullStringList                    = new ArrayList<String>         ();
List<String>                transitiveVerbTagNameAltStringList              = new ArrayList<String>         ();
List<String>                transitiveVerbTagNameFullStringList             = new ArrayList<String>         ();
List<ObjectMuseum>          exhibitionObjectList                            = new ArrayList<ObjectMuseum>   ();
List<ObjectMuseum>          floorObjectList                                 = new ArrayList<ObjectMuseum>   ();
List<ObjectMuseum>          roomObjectList                                  = new ArrayList<ObjectMuseum>   ();
List<ObjectPlayer>          playerObjectList                                = new ArrayList<ObjectPlayer>   ();
List<String>                exhibitionNameAltStringList                     = new ArrayList<String>         ();
List<String>                exhibitionNameFullStringList                    = new ArrayList<String>         ();
List<String>                floorNameAltStringList                          = new ArrayList<String>         ();
List<String>                floorNameFullStringList                         = new ArrayList<String>         ();
List<String>                roomNameAltStringList                           = new ArrayList<String>         ();
List<String>                roomNameFullStringList                          = new ArrayList<String>         ();
List<String>                playerStringList                                = new ArrayList<String>         ();
List<String>                museumNameAltStringList                         = new ArrayList<String>         ();
List<String>                museumNameFullStringList                        = new ArrayList<String>         ();
List<String>                defaultStringList                               ;

/*Name class to manage an object name.*/
class Name{

    String nameAltString   = "";
    String nameFullString  = "";
    Name(

        String _nameAltString   , 
        String _nameFullString

    ){

        nameAltString   = _nameAltString    ;
        nameFullString  = _nameFullString   ;

    }

};

/*A tag class to manage tag object.
This is not quite necessary because you can use the Name class instead.
I guess I will put it here for the time being :).*/
class Tag{

    Name    tagNameObject                           = null;
    String  tagNameAltString                        = "";
    String  tagNameFullString                       = "";

    String  tagTypeString                           = "";

    String  tagAdjectiveString                      = "";
    String  tagAdverbString                         = "";
    String  tagIntransitiveVerb1String              = "";
    String  tagIntransitiveVerb2String              = "";
    String  tagIntransitiveVerb3String              = "";
    String  tagIntransitiveVerbIngString            = "";
    String  tagIntransitiveVerbSString              = "";
    String  tagNegativeAdjectiveString              = "";
    String  tagNegativeAdverbString                 = "";
    String  tagNegativeIntransitiveVerb1String      = "";
    String  tagNegativeIntransitiveVerb2String      = "";
    String  tagNegativeIntransitiveVerb3String      = "";
    String  tagNegativeIntransitiveVerbIngString    = "";
    String  tagNegativeIntransitiveVerbSString      = "";
    String  tagNegativeTransitiveVerb1String        = "";
    String  tagNegativeTransitiveVerb2String        = "";
    String  tagNegativeTransitiveVerb3String        = "";
    String  tagNegativeTransitiveVerbIngString      = "";
    String  tagNegativeTransitiveVerbSString        = "";
    String  tagNounAbstractSString                  = "";
    String  tagNounAbstractString                   = "";
    String  tagNounSString                          = "";
    String  tagNounString                           = "";
    String  tagSubjectPossesionString               = "";
    String  tagSubjectString                        = "";
    String  tagTransitiveVerb1String                = "";
    String  tagTransitiveVerb2String                = "";
    String  tagTransitiveVerb3String                = "";
    String  tagTransitiveVerbIngString              = "";
    String  tagTransitiveVerbSString                = "";

    Tag(

        Name        _tagNameObject              ,
        String      _tagTypeString              ,
        String...   _wordDerivativeStringArray

    ){
 
        tagNameObject       = _tagNameObject;
        tagNameAltString    = tagName.nameAltString;
        tagNameFullString   = tagName.nameFullString;
        tagTypeString       = _tagTypeString;

                if(typeString.equals("ADJ")){ /*Adjective.                    */
            tagAdjectiveString                      = _wordDerivativeStringArray[0];
        }
        else    if(typeString.equals("ADV")){ /*Adverb.                       */
            tagAdverbString                         = _wordDerivativeStringArray[0];
        }
        else    if(typeString.equals("IVR")){ /*Intransitive Verb.            */
            tagIntransitiveVerb1String              = _wordDerivativeStringArray[0];
            tagIntransitiveVerb2String              = _wordDerivativeStringArray[1];
            tagIntransitiveVerb3String              = _wordDerivativeStringArray[2];
            tagIntransitiveVerbIngString            = _wordDerivativeStringArray[3];
            tagIntransitiveVerbSString              = _wordDerivativeStringArray[4];
        }
        else    if(typeString.equals("NDV")){ /*Negative Adverb.              */
            tagNegativeAdverbString                 = _wordDerivativeStringArray[0];
        }
        else    if(typeString.equals("NDJ")){ /*Negative Adjective.           */
            tagNegativeAdjectiveString              = _wordDerivativeStringArray[0];
        }
        else    if(typeString.equals("NIV")){ /*Negative Intransitive Verb.   */
            tagNegativeIntransitiveVerb1String      = _wordDerivativeStringArray[0];
            tagNegativeIntransitiveVerb2String      = _wordDerivativeStringArray[1];
            tagNegativeIntransitiveVerb3String      = _wordDerivativeStringArray[2];
            tagNegativeIntransitiveVerbIngString    = _wordDerivativeStringArray[3];
            tagNegativeIntransitiveVerbSString      = _wordDerivativeStringArray[];
        }
        else    if(typeString.equals("NOA")){ /*Noun.                         */
            tagNounAbstractSString                  = _wordDerivativeStringArray[0];
            tagNounAbstractString                   = _wordDerivativeStringArray[1];
        }
        else    if(typeString.equals("NOU")){ /*Noun.                         */
            tagNounSString                          = _wordDerivativeStringArray[0];
            tagNounString                           = _wordDerivativeStringArray[1];
        }
        else    if(typeString.equals("NTV")){ /*Negative Transitive Verb.     */
            tagNegativeTransitiveVerb1String        = _wordDerivativeStringArray[0];
            tagNegativeTransitiveVerb2String        = _wordDerivativeStringArray[1];
            tagNegativeTransitiveVerb3String        = _wordDerivativeStringArray[2];
            tagNegativeTransitiveVerbIngString      = _wordDerivativeStringArray[3];
            tagNegativeTransitiveVerbSString        = _wordDerivativeStringArray[4];
        }
        else    if(typeString.equals("SUB")){ /*Subject.                      */
            tagSubjectString                        = _wordDerivativeStringArray[0];
            tagSubjectPossesionString               = _wordDerivativeStringArray[1];
        }
        else    if(typeString.equals("TVR")){ /*Transitive Verb.              */
            tagTransitiveVerb1String                = _wordDerivativeStringArray[0];
            tagTransitiveVerb2String                = _wordDerivativeStringArray[1];
            tagTransitiveVerb3String                = _wordDerivativeStringArray[2];
            tagTransitiveVerbIngString              = _wordDerivativeStringArray[3];
            tagTransitiveVerbSString                = _wordDerivativeStringArray[4];
        }        

    }

}

void setup(){

    size                                                        (1152, 648, P2D);
    noStroke                                                    ();
    LoadVoid                                                    ();
    OnExit                                                      ();
    adjectiveTagObjectList                                      = new ArrayList<Tag>            (adjectiveTagObjectList                 );
    adverbTagObjectList                                         = new ArrayList<Tag>            (adverbTagObjectList                    );
    intransitiveVerbTagObjectList                               = new ArrayList<Tag>            (intransitiveVerbTagObjectList          );
    negativeAdjectiveTagObjectList                              = new ArrayList<Tag>            (negativeAdjectiveTagObjectList         );
    negativeAdverbTagObjectList                                 = new ArrayList<Tag>            (negativeAdverbTagObjectList            );
    negativeIntransitiveVerbTagObjectList                       = new ArrayList<Tag>            (negativeIntransitiveVerbTagObjectList  );
    negativeTransitiveVerbTagObjectList                         = new ArrayList<Tag>            (negativeTransitiveVerbTagObjectList    );
    nounTagObjectList                                           = new ArrayList<Tag>            (nounTagObjectList                      );
    subjectTagObjectList                                        = new ArrayList<Tag>            (subjectTagObjectList                   );
    transitiveVerbTagObjectList                                 = new ArrayList<Tag>            (transitiveVerbTagObjectList            );
    floorObjectList                                             = new ArrayList<ObjectMuseum>   (floorObjectList                        );
    roomObjectList                                              = new ArrayList<ObjectMuseum>   (roomObjectList                         );
    exhibitionObjectList                                        = new ArrayList<ObjectMuseum>   (exhibitionObjectList                   );
    playerObjectList                                            = new ArrayList<ObjectPlayer>   (playerObjectList                       );
    /*Initiate object parents and children for all object museum.*/
    for(int i = 0; i < floorObjectList                          .size(); i ++){ floorObjectList                                 .get(i).SetChildObjectList      (roomObjectList ); }
    for(int i = 0; i < roomObjectList                           .size(); i ++){ roomObjectList                                  .get(i).SetInitialParentObject  (floorObjectList); roomObjectList.get(i).SetChildObjectList(exhibitionObjectList); }
    for(int i = 0; i < exhibitionObjectList                     .size(); i ++){ exhibitionObjectList                            .get(i).SetInitialParentObject  (roomObjectList ); }
    /*Determine index for all museum object.*/
    for(int i = 0; i < floorObjectList                          .size(); i ++){ floorObjectList                                 .get(i).SetIndexInsideVoid(); }
    for(int i = 0; i < roomObjectList                           .size(); i ++){ roomObjectList                                  .get(i).SetIndexInsideVoid(); }
    for(int i = 0; i < exhibitionObjectList                     .size(); i ++){ exhibitionObjectList                            .get(i).SetIndexInsideVoid(); }
    /*Populate String list.*/
    for(int i = 0; i < exhibitionObjectList                     .size(); i ++){ exhibitionNameAltStringList                     .add(     exhibitionObjectList                  .get(i).nameAltString    ); floorNameFullStringList                         .add(exhibitionObjectList                   .get(i).nameFullString   ); }
    for(int i = 0; i < floorObjectList                          .size(); i ++){ floorNameAltStringList                          .add(     floorObjectList                       .get(i).nameAltString    ); roomNameFullStringList                          .add(floorObjectList                        .get(i).nameFullString   ); }
    for(int i = 0; i < roomObjectList                           .size(); i ++){ roomNameAltStringList                           .add(     roomObjectList                        .get(i).nameAltString    ); exhibitionNameFullStringList                    .add(roomObjectList                         .get(i).nameFullString   ); }
    for(int i = 0; i < playerObjectList                         .size(); i ++){ playerStringList                                .add("" + playerObjectList                      .get(i).playerIndexInt   ); }
    for(int i = 0; i < adjectiveTagObjectList                   .size(); i ++){ adjectiveTagNameAltStringList                   .add(     adjectiveTagObjectList                .get(i).tagNameAltString ); adjectiveTagNameAltStringList                   .add(adjectiveTagObjectList                 .get(i).tagNameFullString); }
    for(int i = 0; i < adverbTagObjectList                      .size(); i ++){ adverbTagNameAltStringList                      .add(     adverbTagObjectList                   .get(i).tagNameAltString ); adverbTagNameAltStringList                      .add(adverbTagObjectList                    .get(i).tagNameFullString); }
    for(int i = 0; i < intransitiveVerbTagObjectList            .size(); i ++){ intransitiveVerbTagNameAltStringList            .add(     intransitiveVerbTagObjectList         .get(i).tagNameAltString ); intransitiveVerbTagNameAltStringList            .add(intransitiveVerbTagObjectList          .get(i).tagNameFullString); }
    for(int i = 0; i < negativeAdjectiveTagObjectList           .size(); i ++){ negativeAdjectiveTagNameAltStringList           .add(     negativeAdjectiveTagObjectList        .get(i).tagNameAltString ); negativeAdjectiveTagNameAltStringList           .add(negativeAdjectiveTagObjectList         .get(i).tagNameFullString); }
    for(int i = 0; i < negativeAdverbTagObjectList              .size(); i ++){ negativeAdverbTagNameAltStringList              .add(     negativeAdverbTagObjectList           .get(i).tagNameAltString ); negativeAdverbTagNameAltStringList              .add(negativeAdverbTagObjectList            .get(i).tagNameFullString); }
    for(int i = 0; i < negativeIntransitiveVerbTagObjectList    .size(); i ++){ negativeIntransitiveVerbTagNameAltStringList    .add(     negativeIntransitiveVerbTagObjectList .get(i).tagNameAltString ); negativeIntransitiveVerbTagNameAltStringList    .add(negativeIntransitiveVerbTagObjectList  .get(i).tagNameFullString); }
    for(int i = 0; i < negativeTransitiveVerbTagObjectList      .size(); i ++){ negativeTransitiveVerbTagNameAltStringList      .add(     negativeTransitiveVerbTagObjectList   .get(i).tagNameAltString ); negativeTransitiveVerbTagNameAltStringList      .add(negativeTransitiveVerbTagObjectList    .get(i).tagNameFullString); }
    for(int i = 0; i < nounAbstractTagObjectList                .size(); i ++){ nounAbstractAltNameStringList                   .add(     nounAbstractTagObjectList             .get(i).tagNameAltString ); nounAbstractAltNameStringList                   .add(nounAbstractTagObjectList              .get(i).tagNameFullString); }
    for(int i = 0; i < nounTagObjectList                        .size(); i ++){ nounTagNameAltStringList                        .add(     nounTagObjectList                     .get(i).tagNameAltString ); nounTagNameAltStringList                        .add(nounTagObjectList                      .get(i).tagNameFullString); }
    for(int i = 0; i < subjectTagObjectList                     .size(); i ++){ subjectTagNameAltStringList                     .add(     subjectTagObjectList                  .get(i).tagNameAltString ); subjectTagNameAltStringList                     .add(subjectTagObjectList                   .get(i).tagNameFullString); }
    for(int i = 0; i < transitiveVerbTagObjectList              .size(); i ++){ transitiveVerbTagNameAltStringList              .add(     transitiveVerbTagObjectList           .get(i).tagNameAltString ); transitiveVerbTagNameAltStringList              .add(transitiveVerbTagObjectList            .get(i).tagNameFullString); }
    /*Create empty list to display if the object created has no parent (for example, floor object will have no parent).*/
    defaultStringList                                           = Arrays.asList();
    SetupGUIVoid                                                ();

}

void draw(){

    /*Set the background color for this application.*/
    background                              (34, 32, 52);
    /*Always update the full threshold and layout total row int.*/
    museumObjectFullThresholdInt            = 2 + (int)(Math.ceil(playerObjectList.size()/exhibitionObjectList.size()));
    panelLayoutTotalRowInt                  = (int)(Math.ceil(playerObjectList.size()/exhibitionObjectList.size()) + 5)*2;
    /*Update function for all museum objects and player objects.
    Also within these four for loops we need to get which object is hovered.*/
    for(int i = 0; i < exhibitionObjectList .size(); i ++){ exhibitionObjectList    .get(i).DrawVoid(); CheckMuseumObjectHoverVoid(i, exhibitionObjectList  ); }
    for(int i = 0; i < floorObjectList      .size(); i ++){ floorObjectList         .get(i).DrawVoid(); CheckMuseumObjectHoverVoid(i, floorObjectList       ); }
    for(int i = 0; i < roomObjectList       .size(); i ++){ roomObjectList          .get(i).DrawVoid(); CheckMuseumObjectHoverVoid(i, roomObjectList        ); }
    for(int i = 0; i < playerObjectList     .size(); i ++){ playerObjectList        .get(i).DrawVoid(); CheckPlayerObjectHoverVoid(i                        ); }
    /*This one is to check wether we need to replace the current showed card with a new one.*/
    if      (tempSelectedMuseumObject       != null){

        if(

            (mouseX > xPanelCardInt         + (tempSelectedMuseumObject.panelObject.widthPanelInt /2)) ||
            (mouseX < xPanelCardInt         - (tempSelectedMuseumObject.panelObject.widthPanelInt /2)) ||
            (mouseY > yPanelCardInt         + (tempSelectedMuseumObject.panelObject.heightPanelInt/2)) ||
            (mouseY < yPanelCardInt         - (tempSelectedMuseumObject.panelObject.heightPanelInt/2))

        ){ panelCardChangeBoolean           =  true; }

    }
    else if (tempSelectedPlayerObject       != null){

        if(

            (mouseX > xPanelCardInt         + (tempSelectedPlayerObject.panelObject.widthPanelInt /2)) ||
            (mouseX < xPanelCardInt         - (tempSelectedPlayerObject.panelObject.widthPanelInt /2)) ||
            (mouseY > yPanelCardInt         + (tempSelectedPlayerObject.panelObject.heightPanelInt/2)) ||
            (mouseY < yPanelCardInt         - (tempSelectedPlayerObject.panelObject.heightPanelInt/2))

        ){ panelCardChangeBoolean           =  true; }

    }
    /*In case we need a new card then we reset all card properties.*/
    if(panelCardChangeBoolean               == true){

        xPanelCardInt                       = -1    ;
        yPanelCardInt                       = -1    ;
        rowInt                              = 0     ;
        tempSelectedMuseumObject            = null  ;
        tempSelectedPlayerObject            = null  ;

    }
    /*Create the card.*/
    if(buttonOpenCloseBoolean               == false){ CreatePanelCardVoid(); }
    SetButtonOpenCloseBoolean               (); /*Update buttonOpenCloseBoolean.*/
    /*Set the biggest player index so everytime new player added it will be the highest index.*/
    biggestPlayerIndexInt                   = GetBiggestPlayerIndexInt();
    nextBiggestPlayerIndexInt               = biggestPlayerIndexInt + 1; 
    addPlayerGroupGUIObject                 .addPlayerGroupPlayerIndexValueTextlabelObject.setText("" + nextBiggestPlayerIndexInt);
    DrawGUIVoid                             ();

}

/*The mouse pressed override function is for the open and close button.*/
void mousePressed(){

    if(buttonOpenClosePlayerObject.MouseOverBoolean() == true){ buttonOpenClosePlayerObject.isAnimatingBoolean = true; }
    if(buttonOpenCloseMuseumObject.MouseOverBoolean() == true){ buttonOpenCloseMuseumObject.isAnimatingBoolean = true; }

}

/*Function to assign specific tag into the whole tag of object player.*/
void AssignRandomTagLoopVoid(

    List<Tag>   _sourceTagObjectList,
    List<Tag>   _targetTagObjectList

){

    /*Counter on how many tag is already in the museum object.*/
    int     counterInt                      = 0;

    /*This function need to be atleast gives three tags to a museum object.
    After three tags is inside the List then we can randomly add another tag with a chance.
    The thing is that every tag added the chance of another tag will be added/pushed
        is lower.*/
    float   randomCounterFloat              = 1f;
    while(

        (counterInt                         <= (_sourceTagObjectList.size()/2)) ||
        (Math.random()                      <  randomCounterFloat)

    ){

        /*Need to make sure the inputted random tag is not something that is already in the museum object
        Create a temporary tag object to hold.*/
        boolean insideBoolean               = false;
        int     randomIndexInt              = (int)((Math.random()*_sourceTagObjectList.size()) + 0);
        Tag     tagObject                   = _sourceTagObjectList.get(randomIndexInt);
        
        /*Keep looping over and over until the random index is not a tag that is already in the list.*/
        for(int i = 0; i                    < _targetTagObjectList.size(); i ++){

            while(_targetTagObjectList.get(i).nameAltString.equals(tagObject.nameAltString)){

                insideBoolean               = true;
                randomIndexInt              = (int)((Math.random()*_sourceTagObjectList.size()) + 0);
                tagObject                   = _sourceTagObjectList.get(randomIndexInt);
                
            }

        }
        
        /*If the assignTagObjectList has three or more elements then we need to start reducing the chance.*/
        if(_targetTagObjectList .size()     >= (_sourceTagObjectList.size()/2)) { randomCounterFloat -= 0.2f; }
        counterInt                                                          ++;
        /*Add/push a tag object into the temporary list.*/
        if(insideBoolean                    == false)                           { _targetTagObjectList.add(tagObject); }

    }

}

/*A function to check whether an object of museum is hovered by mouse pointer.*/
void CheckMuseumObjectHoverVoid(

    int                 _indexInt           , 
    List<ObjectMuseum>  _targetObjectList

){

    /*This is to check which museum/player object is hovered, then create panel based on that object position.*/
    if(_targetObjectList.get(_indexInt).SetHoverBoolean() == true && panelCardChangeBoolean == true && buttonOpenCloseBoolean == false){

        xPanelCardInt               = _targetObjectList.get(_indexInt).panelObject.xPanelInt + (_targetObjectList.get(_indexInt).panelObject.widthPanelInt /2 );
        yPanelCardInt               = _targetObjectList.get(_indexInt).panelObject.yPanelInt + (_targetObjectList.get(_indexInt).panelObject.heightPanelInt/2);
        tempSelectedMuseumObject    = _targetObjectList.get(_indexInt);

        panelCardChangeBoolean      = false;

    }

}

/*A function to check whether an object of player is hovered by mouse pointer.*/
void CheckPlayerObjectHoverVoid(int _indexInt){

    /*This is to check which museum/player object is hovered, then create panel based on that object position.*/
    if(playerObjectList.get(_indexInt).SetHoverBoolean() == true && panelCardChangeBoolean == true && buttonOpenCloseBoolean == false){

        xPanelCardInt           = playerObjectList.get(_indexInt).panelObject.xPanelInt + (playerObjectList.get(_indexInt).panelObject.widthPanelInt/2 );
        yPanelCardInt           = playerObjectList.get(_indexInt).panelObject.yPanelInt + (playerObjectList.get(_indexInt).panelObject.heightPanelInt/2);
        tempSelectedPlayerObject    = playerObjectList.get(_indexInt);

        panelCardChangeBoolean  = false;

    }

}

/*A function to control color for each possible type of museum object buttons.*/
void ColorControlVoid(

    CColor          _floorCColorObject      ,
    CColor          _roomCColorObject       ,
    CColor          _exhibitionCColorObject ,
    ScrollableList  _scrollableList

){

    if(_scrollableList.getName().toString().equals("SelectMuseumObjectScrollableListObject")){

        for(int i = 0; i < museumNameAltStringList.size(); i ++){

            String  itemScrollableString        = _scrollableList.getItem(i).get("text").toString();
            String  tempTypeString              = "";
            if      (FindObjectMuseumIndexInt   (itemScrollableString, floorObjectList)        != -1){ tempTypeString = "FLR";    }
            else if (FindObjectMuseumIndexInt   (itemScrollableString, roomObjectList)         != -1){ tempTypeString = "ROM";    }
            else if (FindObjectMuseumIndexInt   (itemScrollableString, exhibitionObjectList)   != -1){ tempTypeString = "EXH";    }
            if      (tempTypeString             .equals("FLR")){ _scrollableList.getItem(i).put("color", _floorCColorObject);        }
            else if (tempTypeString             .equals("ROM")){ _scrollableList.getItem(i).put("color", _roomCColorObject);         }
            else if (tempTypeString             .equals("EXH")){ _scrollableList.getItem(i).put("color", _exhibitionCColorObject);   }

        }

    }

}

/*A function to create panel card.*/
void CreatePanelCardVoid(){

    if(panelCardChangeBoolean == false){

        fill                (panelCardColor);
        noStroke            ();

        int tempXPanelInt = xPanelCardInt;
        int tempYPanelInt = yPanelCardInt;
        if((xPanelCardInt + widthPanelCardInt)  > width ){ tempXPanelInt = xPanelCardInt - widthPanelCardInt;  }
        if((yPanelCardInt + heightPanelCardInt) > height){ tempYPanelInt = yPanelCardInt - heightPanelCardInt; }

        rect                (tempXPanelInt, tempYPanelInt, widthPanelCardInt, heightPanelCardInt, 10);
        noFill              ();

        fill                (255);
        textAlign           (CENTER);
        panelCardPFont      = createFont(panelFontString, textSizePanelInt);
        textFont            (panelCardPFont);

        /*String display for the player object.*/
        if          (tempSelectedMuseumObject == null){

            rowInt      = 9;

            ObjectMuseum exhibitionCurrentObject    = tempSelectedPlayerObject.FindObject(exhibitionObjectList  , tempSelectedPlayerObject.exhibitionCurrentString          );
            ObjectMuseum roomCurrentObject          = tempSelectedPlayerObject.FindObject(roomObjectList        , exhibitionCurrentObject   .parentObject.nameAltString );
            ObjectMuseum floorCurrentObject         = tempSelectedPlayerObject.FindObject(floorObjectList       , roomCurrentObject         .parentObject.nameAltString );

            panelString  =

                "FLR_CUR = " + exhibitionCurrentObject  .nameAltString                                                  + "\n" +
                "ROM_CUR = " + roomCurrentObject        .nameAltString                                                  + "\n" +
                "EXH_CUR = " + exhibitionCurrentObject  .nameAltString                                                  + "\n" +
                "EXH_TAR = " + tempSelectedPlayerObject .exhibitionTargetNameAltStringList .get(0)                      + "\n" +
                "EXH_TAR = " + tempSelectedPlayerObject .exhibitionTargetNameAltStringList .get(1)                      + "\n" +
                "EXH_TAR = " + tempSelectedPlayerObject .exhibitionTargetNameAltStringList .get(2)                      + "\n" +
                "EXH_TAG = " + tempSelectedPlayerObject .exhibitionTagCounterList   .get(0).GetTagNameAltString()       + "\n" +
                "EXH_TAG = " + tempSelectedPlayerObject .exhibitionTagCounterList   .get(1).GetTagNameAltString()       + "\n" +
                "EXH_TAG = " + tempSelectedPlayerObject .exhibitionTagCounterList   .get(2).GetTagNameAltString()

            ;

        }
        /*String display for the museum object.*/
        else if     (tempSelectedPlayerObject == null){

            rowInt      = 4;

            if      (tempSelectedMuseumObject.visitorCurrentInt < 10   ){ tempVisitorCurrentString = "______"   + tempSelectedMuseumObject.visitorCurrentInt; }
            else if (tempSelectedMuseumObject.visitorCurrentInt < 100  ){ tempVisitorCurrentString = "_____"    + tempSelectedMuseumObject.visitorCurrentInt; }
            else if (tempSelectedMuseumObject.visitorCurrentInt < 1000 ){ tempVisitorCurrentString = "____"     + tempSelectedMuseumObject.visitorCurrentInt; }
            else if (tempSelectedMuseumObject.visitorCurrentInt < 10000){ tempVisitorCurrentString = "___"      + tempSelectedMuseumObject.visitorCurrentInt; }

            if      (tempSelectedMuseumObject.visitorTotalInt   < 10   ){ tempVisitorTotalString = "______"     + tempSelectedMuseumObject.visitorTotalInt; }
            else if (tempSelectedMuseumObject.visitorTotalInt   < 100  ){ tempVisitorTotalString = "_____"      + tempSelectedMuseumObject.visitorTotalInt; }
            else if (tempSelectedMuseumObject.visitorTotalInt   < 1000 ){ tempVisitorTotalString = "____"       + tempSelectedMuseumObject.visitorTotalInt; }
            else if (tempSelectedMuseumObject.visitorTotalInt   < 10000){ tempVisitorTotalString = "___"        + tempSelectedMuseumObject.visitorTotalInt; }

            if      (tempSelectedMuseumObject.fullBoolean == true ){ tempFullString = "____TRU"; }
            else if (tempSelectedMuseumObject.fullBoolean == false){ tempFullString = "____FAL"; }

            panelString = 

                "NAM_ALT = " + tempSelectedMuseumObject.nameAltString   + "\n" + 
                "VIS_CUR = " + tempVisitorCurrentString             + "\n" + 
                "VIS_TOT = " + tempVisitorTotalString               + "\n" + 
                "_IS_FUL = " + tempFullString

            ;

        }

        text                (panelString, tempXPanelInt + (widthPanelCardInt/2), tempYPanelInt + (textSizePanelInt));
        textAlign           (LEFT);
        noFill              ();

    }

}

void OnExit(){ Runtime.getRuntime().addShutdownHook(new Thread(new Runnable(){ public void run(){ SaveVoid(); } })); }

void LoadVoid(){

    boolean initBool    =  true;

    if      (initBool   == true ){

        String[] exampleExplanationStringArray = {

            "Explanation 1",
            "Explanation 2",
            "Explanation 3",
            "Explanation 4"

        };

        subjectTagObjectList            = Arrays.asList(
            new Tag(new Name("SUB_NAP", "Subject Napoleon"              ), "SUB", "Napoleon"            ),
            new Tag(new Name("SUB_WAS", "Subject Washington"            ), "SUB", "Washington"          ),
            new Tag(new Name("SUB_ASS", "Subject Assasin"               ), "SUB", "assasin"             ),
            new Tag(new Name("SUB_BOD", "Subject Bodhisattva"           ), "SUB", "Bodhisattva"         ),
            new Tag(new Name("SUB_BUD", "Subject Buddha"                ), "SUB", "Buddha"              ),
            new Tag(new Name("SUB_DIM", "Subject Dimitri"               ), "SUB", "Dimitri"             ),
            new Tag(new Name("SUB_DMI", "Subject DimitriMitropoulos"    ), "SUB", "Dimitri Mitropoulos" ),
            new Tag(new Name("SUB_DRA", "Subject Dragon"                ), "SUB", "dragon"              ),
            new Tag(new Name("SUB_FIR", "Subject TheFirst"              ), "SUB", "the first"           ),
            new Tag(new Name("SUB_IRQ", "Subject Iraqi"                 ), "SUB", "iraqi"               ),
            new Tag(new Name("SUB_ITA", "Subject Italian"               ), "SUB", "italian"             ),
            new Tag(new Name("SUB_JUC", "Subject JuliusCaesar"          ), "SUB", "Julius Caesar"       ),
            new Tag(new Name("SUB_JUL", "Subject Julius"                ), "SUB", "Julius"              ),
            new Tag(new Name("SUB_KIL", "Subject Killer"                ), "SUB", "killer"              ),
            new Tag(new Name("SUB_KOS", "Subject Koshchey"              ), "SUB", "Koshchey"            ),
            new Tag(new Name("SUB_MAR", "Subject Maria"                 ), "SUB", "Maria"               ),
            new Tag(new Name("SUB_MED", "Subject Medusa"                ), "SUB", "Medusa"              ),
            new Tag(new Name("SUB_MMO", "Subject MariaMorevna"          ), "SUB", "Maria Morevna"       ),
            new Tag(new Name("SUB_PAI", "Subject Painter"               ), "SUB", "painter"             ),
            new Tag(new Name("SUB_ROM", "Subject Romanian"              ), "SUB", "romanian"            ),
            new Tag(new Name("SUB_RUS", "Subject Russian"               ), "SUB", "russian"             ),
            new Tag(new Name("SUB_SPH", "Subject Sphinx"                ), "SUB", "Sphinx"              )
        );
        verbTagObjectList               = Arrays.asList(
            new Tag(new Name("VER_CAL", "Verb Run"                      ), "VER", "call"    , "called"  , "called"  , "calling"     , "calls"   ),
            new Tag(new Name("VER_DRI", "Verb Run"                      ), "VER", "drink"   , "drunk"   , "drank"   , "drinking"    , "drinks"  ),
            new Tag(new Name("VER_EAT", "Verb Run"                      ), "VER", "eat"     , "ate"     , "eaten"   , "eating"      , "eats"    ),
            new Tag(new Name("VER_JUM", "Verb Jump"                     ), "VER", "jump"    , "jumped"  , "jumped"  , "jumping"     , "jumps"   ),
            new Tag(new Name("VER_PAI", "Verb Paint"                    ), "VER", "paint"   , "painted" , "painted" , "painting"    , "paints"  ),
            new Tag(new Name("VER_RUN", "Verb Run"                      ), "VER", "run"     , "ran"     , "run"     , "running"     , "runs"    ),
            new Tag(new Name("VER_SIN", "Verb Run"                      ), "VER", "sing"    , "sang"    , "sung"    , "singing"     , "sings"   ),
            new Tag(new Name("VER_SIT", "Verb Run"                      ), "VER", "sit"     , "sat"     , "sat"     , "sitting"     , "sits"    ),
            new Tag(new Name("VER_SLE", "Verb Run"                      ), "VER", "sleep"   , "slept"   , "slept"   , "sleeping"    , "sleeps"  ),
            new Tag(new Name("VER_TAL", "Verb Run"                      ), "VER", "talk"    , "told"    , "told"    , "talking"     , "talks"   )
        );
        negativeVerbTagObjectList       = Arrays.asList(
            new Tag(new Name("NVE_ASS", "Verb Assasinate"               ), "NVE", "assasinate"  , "assasinated" , "assasinated" , "assasinating"    , "assasinates" ),
            new Tag(new Name("NVE_DIE", "Verb Die"                      ), "NVE", "die"         , "died"        , "died"        , "dies"            , "dying"       ),
            new Tag(new Name("NVE_KIL", "Verb Kill"                     ), "NVE", "kill"        , "killed"      , "killed"      , "killing"         , "kills"       ),
            new Tag(new Name("NVE_KIL", "Verb Kill"                     ), "NVE", "kill"        , "killed"      , "killed"      , "kills"           , "killing"     )
        );
        nounTagObjectList               = Arrays.asList(
            new Tag(new Name("NOU_ANK", "Noun Anklet"                   ), "NOU", "anklet"          , "anklets"         ),
            new Tag(new Name("NOU_BAL", "Noun Ball"                     ), "NOU", "ball"            , "balls"           ),
            new Tag(new Name("NOU_CRO", "Noun Crown"                    ), "NOU", "crown"           , "crowns"          ),
            new Tag(new Name("NOU_DCR", "Noun DoubleCrown"              ), "NOU", "double crown"    , "double crown"    ),
            new Tag(new Name("NOU_FIG", "Noun Figure"                   ), "NOU", "figure"          , "figures"         ),
            new Tag(new Name("NOU_GUN", "Noun Gun"                      ), "NOU", "gun"             , "guns"            ),
            new Tag(new Name("NOU_HIE", "Noun Hierogliph"               ), "NOU", "hierogliph"      , "hierogliphs"     ),
            new Tag(new Name("NOU_IRQ", "Noun Iraq"                     ), "NOU", "Iraq"            , "Iraq"            ),
            new Tag(new Name("NOU_ITA", "Noun Italy"                    ), "NOU", "Italy"           , "Italy"           ),
            new Tag(new Name("NOU_PAP", "Noun Paper"                    ), "NOU", "paper"           , "papers"          ),
            new Tag(new Name("NOU_PLA", "Noun Plaque"                   ), "NOU", "plaque"          , "plaques"         ),
            new Tag(new Name("NOU_ROM", "Noun Rome"                     ), "NOU", "Rome"            , "Rome"            ),
            new Tag(new Name("NOU_RUS", "Noun Russia"                   ), "NOU", "Russia"          , "Russia"          ),
            new Tag(new Name("NOU_STA", "Noun Statue"                   ), "NOU", "statue"          , "statues"         ),
            new Tag(new Name("NOU_STO", "Noun Stone"                    ), "NOU", "stone"           , "stones"          ),
            new Tag(new Name("NOU_STO", "Noun Stone"                    ), "NOU", "stone"           , "stones"          ),
            new Tag(new Name("NOU_WAT", "Noun Water"                    ), "NOU", "water"           , "water"           )
        );
        adjectiveTagObjectList          = Arrays.asList(
            new Tag(new Name("ADJ_BAD", "Adjective Excellent"           ), "ADJ", "excellent"   ),
            new Tag(new Name("ADJ_CRO", "Adjective Crossed"             ), "ADJ", "crossed"     ),
            new Tag(new Name("ADJ_GOD", "Adjective Good"                ), "ADJ", "good"        ),
            new Tag(new Name("ADJ_HAR", "Adjective Hard"                ), "ADJ", "hard"        ),
            new Tag(new Name("ADJ_SOF", "Adjective Soft"                ), "ADJ", "soft"        )
        );
        negativeAdjectiveTagObjectList  = Arrays.asList(
            new Tag(new Name("NDJ_AWF", "Adjective Awful"               ), "NDJ", "awful"),
            new Tag(new Name("NDJ_BAD", "Adjective Bad"                 ), "NDJ", "bad")
        );
        adverbTagObjectList             = Arrays.asList(
            new Tag(new Name("ADV_PER", "Adverb Perfectly"              ), "ADV", "perfectly"),
            new Tag(new Name("ADV_QUI", "Adverb Quickly"                ), "ADV", "quickly")
        );
        negativeAdverbTagObjectList     = Arrays.asList(
            new Tag(new Name("NDV_DES", "Adverb Desperately"            ), "NDV", "desperately"),
            new Tag(new Name("NDV_SLO", "Adverb Slowly"                 ), "NDV", "slowly")
        );
        floorObjectList         = Arrays.asList(
            new ObjectMuseum(new Name("FLR_001", "First Floor"                                                  ), "XXX_XXX", "FLR", exampleExplanationStringArray, AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
            new ObjectMuseum(new Name("FLR_002", "Second Floor"                                                 ), "XXX_XXX", "FLR", exampleExplanationStringArray, AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList))
        );
        roomObjectList          = Arrays.asList(
            new ObjectMuseum(new Name("ROM_CHN", "Room China"                                                   ), "FLR_001", "ROM", exampleExplanationStringArray, AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
            new ObjectMuseum(new Name("ROM_IRQ", "Room Iraq"                                                    ), "FLR_001", "ROM", exampleExplanationStringArray, AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
            new ObjectMuseum(new Name("ROM_ROM", "Room Rome"                                                    ), "FLR_002", "ROM", exampleExplanationStringArray, AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
            new ObjectMuseum(new Name("ROM_RUS", "Room Russia"                                                  ), "FLR_002", "ROM", exampleExplanationStringArray, AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList))
        );
        exhibitionObjectList    = Arrays.asList(
            new ObjectMuseum(new Name("EXH_ZOD", "Exhibition Zodiac Figure Dragon"                              ), "ROM_CHN", "EXH", exampleExplanationStringArray, AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
            new ObjectMuseum(new Name("EXH_BOD", "Exhibition Bodhisattva Crossed Ankle"                         ), "ROM_CHN", "EXH", exampleExplanationStringArray, AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
            new ObjectMuseum(new Name("EXH_SPH", "Exhibition Plaque With A Sphinx"                              ), "ROM_IRQ", "EXH", exampleExplanationStringArray, AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
            new ObjectMuseum(new Name("EXH_USH", "Exhibition Stele Of Ushumgal"                                 ), "ROM_IRQ", "EXH", exampleExplanationStringArray, AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
            new ObjectMuseum(new Name("EXH_ASS", "Exhibition The Assasination"                                  ), "ROM_ROM", "EXH", exampleExplanationStringArray, AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
            new ObjectMuseum(new Name("EXH_MED", "Exhibition Head Of Medusa"                                    ), "ROM_ROM", "EXH", exampleExplanationStringArray, AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
            new ObjectMuseum(new Name("EXH_KOS", "Exhibition Koshchey"                                          ), "ROM_RUS", "EXH", exampleExplanationStringArray, AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
            new ObjectMuseum(new Name("EXH_DIM", "Exhibition Dimitri Mitropoulos"                               ), "ROM_RUS", "EXH", exampleExplanationStringArray, AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList))
        );
        for(int i = 0; i < playerAmountInt; i ++)                   {
            ObjectPlayer objectPlayer = new ObjectPlayer(
                (i + 1),
                "DUMMY_NAME",
                exhibitionObjectList.get((int)(Math.floor((Math.random()*exhibitionObjectList.size()) + 0))).nameAltString      /*Generate random starting exhibition for the player.*/
            );
        }

    }
    else if (initBool   == false){
        JSONArray       subjectTagLoadJSONArrayObject                                       = loadJSONArray("data/subjectTag.json");
        for(int i = 0; i < subjectTagLoadJSONArrayObject.size(); i ++){
            JSONObject  subjectTagLoadJSONObject                                            = subjectTagLoadJSONArrayObject                     .getJSONObject  (i);
            String      tempTagNameAltString                                                = subjectTagLoadJSONObject                          .getString      ("tagNameAltString"                         );
            String      tempTagNameFullString                                               = subjectTagLoadJSONObject                          .getString      ("tagNameFullString"                        );
            String      tempTagSubjectString                                                = subjectTagLoadJSONObject                          .getString      ("tagSubjectString"                         );
            String      tempTagSubjectPossesionString                                       = subjectTagLoadJSONObject                          .getString      ("tagSubjectPossesionString"                );
            String      tempTagTypeString                                                   = subjectTagLoadJSONObject                          .getString      ("tagTypeString"                            );
            Tag         tempTagObject                                                       = new Tag(new Name(tempTagNameAltString, tempTagNameFullString), tempTagTypeString, tempTagSubjectString, tempTagSubjectPossesionString);
                        subjectTagObjectList                                                .add(tempTagObject);
        }
        JSONArray intransitiveVerbTagLoadJSONArrayObject                                    = loadJSONArray("data/intransitiveVerbTag.json");
        for(int i = 0; i < intransitiveVerbTagLoadJSONArrayObject.size(); i ++){
            JSONObject  intransitiveVerbTagLoadJSONObject                                   = intransitiveVerbTagLoadJSONArrayObject            .getJSONObject  (i);
            String      tempTagNameAltString                                                = intransitiveVerbTagLoadJSONObject                 .getString      ("tagNameAltString"                         );
            String      tempTagNameFullString                                               = intransitiveVerbTagLoadJSONObject                 .getString      ("tagNameFullString"                        );
            String      tempTagTypeString                                                   = intransitiveVerbTagLoadJSONObject                 .getString      ("tagTypeString"                            );
            String      tempTagIntransitiveVerb1String                                      = intransitiveVerbTagLoadJSONObject                 .getString      ("tagIntransitiveVerb1String"               );
            String      tempTagIntransitiveVerb2String                                      = intransitiveVerbTagLoadJSONObject                 .getString      ("tagIntransitiveVerb2String"               );
            String      tempTagIntransitiveVerb3String                                      = intransitiveVerbTagLoadJSONObject                 .getString      ("tagIntransitiveVerb3String"               );
            String      tempTagIntransitiveVerbIngString                                    = intransitiveVerbTagLoadJSONObject                 .getString      ("tagIntransitiveVerbIngString"             );
            String      tempTagIntransitiveVerbSString                                      = intransitiveVerbTagLoadJSONObject                 .getString      ("tagIntransitiveVerbSString"               );
            Tag         tempTagObject                                                       = new Tag(new Name(tempTagNameAltString, tempTagNameFullString), tempTagTypeString, tempTagIntransitiveVerb1String, tempTagIntransitiveVerb2String, tempTagIntransitiveVerb3String, tempTagIntransitiveVerbIngString, tempTagIntransitiveVerbSString);
                        intransitiveVerbTagObjectList                                       .add(tempTagObject);
        }
        JSONArray       negativeIntransitiveVerbTagLoadJSONArrayObject                      = loadJSONArray("data/negativeIntransitiveVerbTag.json");
        for(int i = 0; i < negativeIntransitiveVerbTagLoadJSONArrayObject.size(); i ++){
            JSONObject  negativeIntransitiveVerbTagLoadJSONObject                           = negativeIntransitiveVerbTagLoadJSONArrayObject    .getJSONObject  (i);
            String      tempTagNameAltString                                                = negativeIntransitiveVerbTagLoadJSONObject         .getString      ("tagNameAltString"                         );
            String      tempTagNameFullString                                               = negativeIntransitiveVerbTagLoadJSONObject         .getString      ("tagNameFullString"                        );
            String      tempTagTypeString                                                   = negativeIntransitiveVerbTagLoadJSONObject         .getString      ("tagTypeString"                            );
            String      tempTagNegativeIntransitiveVerb1String                              = negativeIntransitiveVerbTagLoadJSONObject         .getString      ("tagNegativeIntransitiveVerb1String"       );
            String      tempTagNegativeIntransitiveVerb2String                              = negativeIntransitiveVerbTagLoadJSONObject         .getString      ("tagNegativeIntransitiveVerb2String"       );
            String      tempTagNegativeIntransitiveVerb3String                              = negativeIntransitiveVerbTagLoadJSONObject         .getString      ("tagNegativeIntransitiveVerb3String"       );
            String      tempTagNegativeIntransitiveVerbIngString                            = negativeIntransitiveVerbTagLoadJSONObject         .getString      ("tagNegativeIntransitiveVerbIngString"     );
            String      tempTagNegativeIntransitiveVerbSString                              = negativeIntransitiveVerbTagLoadJSONObject         .getString      ("tagNegativeIntransitiveVerbSString"       );
            Tag         tempTagObject                                                       = new Tag(new Name(tempTagNameAltString, tempTagNameFullString), tempTagTypeString, tempTagNegativeIntransitiveVerb1String, tempTagNegativeIntransitiveVerb2String, tempTagNegativeIntransitiveVerb3String, tempTagNegativeIntransitiveVerbIngString, tempTagNegativeIntransitiveVerbSString);
                        negativeIntransitiveVerbTagObjectList                               .add(tempTagObject);
        }
        JSONArray       transitiveVerbTagLoadJSONArrayObject                                = loadJSONArray("data/transitiveVerbTag.json");
        for(int i = 0; i < transitiveVerbTagLoadJSONArrayObject.size(); i ++){
            JSONObject  transitiveVerbTagLoadJSONObject                                     = transitiveVerbTagLoadJSONArrayObject              .getJSONObject  (i);
            String      tempTagNameAltString                                                = transitiveVerbTagLoadJSONObject                   .getString      ("tagNameAltString"                         );
            String      tempTagNameFullString                                               = transitiveVerbTagLoadJSONObject                   .getString      ("tagNameFullString"                        );
            String      tempTagTypeString                                                   = transitiveVerbTagLoadJSONObject                   .getString      ("tagTypeString"                            );
            String      tempTagTransitiveVerb1String                                        = transitiveVerbTagLoadJSONObject                   .getString      ("tagTransitiveVerb1String"                 );
            String      tempTagTransitiveVerb2String                                        = transitiveVerbTagLoadJSONObject                   .getString      ("tagTransitiveVerb2String"                 );
            String      tempTagTransitiveVerb3String                                        = transitiveVerbTagLoadJSONObject                   .getString      ("tagTransitiveVerb3String"                 );
            String      tempTagTransitiveVerbIngString                                      = transitiveVerbTagLoadJSONObject                   .getString      ("tagTransitiveVerbIngString"               );
            String      tempTagTransitiveVerbSString                                        = transitiveVerbTagLoadJSONObject                   .getString      ("tagTransitiveVerbSString"                 );
            Tag         tempTagObject                                                       = new Tag(new Name(tempTagNameAltString, tempTagNameFullString), tempTagTypeString, tempTagTransitiveVerb1String, tempTagTransitiveVerb2String, tempTagTransitiveVerb3String, tempTagTransitiveVerbIngString, tempTagTransitiveVerbSString);
                        transitiveVerbTagObjectList                                         .add(tempTagObject);
        }
        JSONArray       negativeTransitiveVerbTagLoadJSONArrayObject                        = loadJSONArray("data/negativeTransitiveVerbTag.json");
        for(int i = 0; i < negativeTransitiveVerbTagLoadJSONArrayObject.size(); i ++){
            JSONObject  negativeTransitiveVerbTagLoadJSONObject                             = negativeTransitiveVerbTagLoadJSONArrayObject      .getJSONObject  (i);
            String      tempTagNameAltString                                                = negativeTransitiveVerbTagLoadJSONObject           .getString      ("tagNameAltString"                         );
            String      tempTagNameFullString                                               = negativeTransitiveVerbTagLoadJSONObject           .getString      ("tagNameFullString"                        );
            String      tempTagTypeString                                                   = negativeTransitiveVerbTagLoadJSONObject           .getString      ("tagTypeString"                            );
            String      tempTagNegativeTransitiveVerb1String                                = negativeTransitiveVerbTagLoadJSONObject           .getString      ("tagNegativeTransitiveVerb1String"         );
            String      tempTagNegativeTransitiveVerb2String                                = negativeTransitiveVerbTagLoadJSONObject           .getString      ("tagNegativeTransitiveVerb2String"         );
            String      tempTagNegativeTransitiveVerb3String                                = negativeTransitiveVerbTagLoadJSONObject           .getString      ("tagNegativeTransitiveVerb3String"         );
            String      tempTagNegativeTransitiveVerbIngString                              = negativeTransitiveVerbTagLoadJSONObject           .getString      ("tagNegativeTransitiveVerbIngString"       );
            String      tempTagNegativeTransitiveVerbSString                                = negativeTransitiveVerbTagLoadJSONObject           .getString      ("tagNegativeTransitiveVerbSString"         );
            Tag         tempTagObject                                                       = new Tag(new Name(tempTagNameAltString, tempTagNameFullString), tempTagTypeString, tempTagNegativeTransitiveVerb1String, tempTagNegativeTransitiveVerb2String, tempTagNegativeTransitiveVerb3String, tempTagNegativeTransitiveVerbIngString, tempTagNegativeTransitiveVerbSString);
                        negativeTransitiveVerbTagObjectList                                 .add(tempTagObject);
        }
        JSONArray       nounAbstractTagLoadJSONArrayObject                                  = loadJSONArray("data/nounAbstractTag.json");
        for(int i = 0; i < nounAbstractTagLoadJSONArrayObject.size(); i ++){
            JSONObject  nounAbstractTagLoadJSONObject                                       = nounAbstractTagLoadJSONArrayObject                .getJSONObject  (i);
            String      tempTagNameAltString                                                = nounAbstractTagLoadJSONObject                     .getString      ("tagNameAltString"                         );
            String      tempTagNameFullString                                               = nounAbstractTagLoadJSONObject                     .getString      ("tagNameFullString"                        );
            String      tempTagNounAbstractSString                                          = nounAbstractTagLoadJSONObject                     .getString      ("tagNounAbstractSString"                   );
            String      tempTagNounAbstractString                                           = nounAbstractTagLoadJSONObject                     .getString      ("tagNounAbstractString"                    );
            String      tempTagTypeString                                                   = nounAbstractTagLoadJSONObject                     .getString      ("tagTypeString"                            );
            Tag         tempTagObject                                                       = new Tag(new Name(tempTagNameAltString, tempTagNameFullString), tempTagTypeString, tempTagNounAbstractString, tempTagNounAbstractSString);
                        nounAbstractTagObjectList                                           .add(tempTagObject);
        }
        JSONArray       nounTagLoadJSONArrayObject                                          = loadJSONArray("data/nounTag.json");
        for(int i = 0; i < nounTagLoadJSONArrayObject.size(); i ++){
            JSONObject  nounTagLoadJSONObject                                               = nounTagLoadJSONArrayObject                        .getJSONObject  (i);
            String      tempTagNameAltString                                                = nounTagLoadJSONObject                             .getString      ("tagNameAltString"                         );
            String      tempTagNameFullString                                               = nounTagLoadJSONObject                             .getString      ("tagNameFullString"                        );
            String      tempTagNounSString                                                  = nounTagLoadJSONObject                             .getString      ("tagNounSString"                           );
            String      tempTagNounString                                                   = nounTagLoadJSONObject                             .getString      ("tagNounString"                            );
            String      tempTagTypeString                                                   = nounTagLoadJSONObject                             .getString      ("tagTypeString"                            );
            Tag         tempTagObject                                                       = new Tag(new Name(tempTagNameAltString, tempTagNameFullString), tempTagTypeString, tempTagNounString, tempTagNounSString);
                        nounTagObjectList                                                   .add(tempTagObject);
        }
        JSONArray       adjectiveTagLoadJSONArrayObject                                     = loadJSONArray("data/adjectiveTag.json");
        for(int i = 0; i < adjectiveTagLoadJSONArrayObject.size(); i ++){
            JSONObject  adjectiveTagLoadJSONObject                                          = adjectiveTagLoadJSONArrayObject                   .getJSONObject  (i);
            String      tempTagNameAltString                                                = adjectiveTagLoadJSONObject                        .getString      ("tagNameAltString"                         );
            String      tempTagNameFullString                                               = adjectiveTagLoadJSONObject                        .getString      ("tagNameFullString"                        );
            String      tempTagAdjectiveString                                              = adjectiveTagLoadJSONObject                        .getString      ("tagAdjectiveString"                       );
            String      tempTagTypeString                                                   = adjectiveTagLoadJSONObject                        .getString      ("tagTypeString"                            );
            Tag         tempTagObject                                                       = new Tag(new Name(tempTagNameAltString, tempTagNameFullString), tempTagTypeString, tempTagAdjectiveString);
                        adjectiveTagObjectList                                              .add(tempTagObject);
        }
        JSONArray       negativeAdjectiveTagLoadJSONArrayObject                             = loadJSONArray("data/negativeAdjectiveTag.json");
        for(int i = 0; i < negativeAdjectiveTagLoadJSONArrayObject.size(); i ++){
            JSONObject  negativeAdjectiveTagLoadJSONObject                                  = negativeAdjectiveTagLoadJSONArrayObject           .getJSONObject  (i);
            String      tempTagNameAltString                                                = negativeAdjectiveTagLoadJSONObject                .getString      ("tagNameAltString"                         );
            String      tempTagNameFullString                                               = negativeAdjectiveTagLoadJSONObject                .getString      ("tagNameFullString"                        );
            String      tempTagNegativeAdjectiveString                                      = negativeAdjectiveTagLoadJSONObject                .getString      ("tagNegativeAdjectiveString"               );
            String      tempTagTypeString                                                   = negativeAdjectiveTagLoadJSONObject                .getString      ("tagTypeString"                            );
            Tag         tempTagObject                                                       = new Tag(new Name(tempTagNameAltString, tempTagNameFullString), tempTagTypeString, tempTagNegativeAdjectiveString);
                        negativeAdjectiveTagObjectList                                      .add(tempTagObject);
        }
        JSONArray       adverbTagLoadJSONArrayObject                                        = loadJSONArray("data/adverbTag.json");
        for(int i = 0; i < adverbTagLoadJSONArrayObject.size(); i ++){
            JSONObject  adverbTagLoadJSONObject                                             = adverbTagLoadJSONArrayObject                      .getJSONObject  (i);
            String      tempTagNameAltString                                                = adverbTagLoadJSONObject                           .getString      ("tagNameAltString"                         );
            String      tempTagNameFullString                                               = adverbTagLoadJSONObject                           .getString      ("tagNameFullString"                        );
            String      tempTagAdverbString                                                 = adverbTagLoadJSONObject                           .getString      ("tagAdverbString"                          );
            String      tempTagTypeString                                                   = adverbTagLoadJSONObject                           .getString      ("tagTypeString"                            );
            Tag         tempTagObject                                                       = new Tag(new Name(tempTagNameAltString, tempTagNameFullString), tempTagTypeString, tempTagAdverbString);
                        adverbTagObjectList                                                 .add(tempTagObject);
        }
        JSONArray       negativeAdverbTagLoadJSONArrayObject                                = loadJSONArray("data/negativeAdverbTag.json");
        for(int i = 0; i < negativeAdverbTagLoadJSONArrayObject.size(); i ++){
            JSONObject  negativeAdverbTagLoadJSONObject                                     = negativeAdverbTagLoadJSONArrayObject              .getJSONObject  (i);
            String      tempTagNameAltString                                                = negativeAdverbTagLoadJSONObject                   .getString      ("tagNameAltString"                         );
            String      tempTagNameFullString                                               = negativeAdverbTagLoadJSONObject                   .getString      ("tagNameFullString"                        );
            String      tempTagNegativeAdverbString                                         = negativeAdverbTagLoadJSONObject                   .getString      ("tagNegativeAdverbString"                  );
            String      tempTagTypeString                                                   = negativeAdverbTagLoadJSONObject                   .getString      ("tagTypeString"                            );
            Tag         tempTagObject                                                       = new Tag(new Name(tempTagNameAltString, tempTagNameFullString), tempTagTypeString, tempTagNegativeAdverbString);
                        negativeAdverbTagObjectList                                         .add(tempTagObject);
        }
        floorObjectList                                                                     = new ArrayList<ObjectMuseum>();
        JSONArray floorLoadJSONArrayObject                                                  = loadJSONArray("data/floor.json");
        for(int i = 0; i < floorLoadJSONArrayObject.size(); i ++){

            JSONObject      floorLoadJSONObject                                             = floorLoadJSONArrayObject.getJSONObject(i);

            String          tempNameAltString                                               = floorLoadJSONObject.getString("nameAltString"         );
            String          tempNameFullString                                              = floorLoadJSONObject.getString("nameFullString"        );
            String          tempParentNameAltString                                         = floorLoadJSONObject.getString("parentNameAltString"   );
            String          tempTypeString                                                  = floorLoadJSONObject.getString("typeString"            );
            int             indexCounterInt                                                 = 0;
            List<Tag>       tempTagObjectList                                               = new ArrayList<Tag>();
            while(floorLoadJSONObject                                                       .hasKey("tagMuseumNameAltStringList" + indexCounterInt)){
                String      tempTagNameAltString                                            = floorLoadJSONObject.getString("tagMuseumNameAltStringList" + indexCounterInt);
                Tag         tempTagObject                                                   = FindTagObject(tempTagNameAltString);
                            tempTagObjectList                                               .add(tempTagObject);
                            indexCounterInt                                                 ++;
            }
                            indexCounterInt                                                 = 0;
            String[]        tempExplanationStringArray                                      = new String[4];
            while(floorLoadJSONObject                                                       .hasKey("explanationStringArray" + indexCounterInt)){
                            tempExplanationStringArray[indexCounterInt]                     = floorLoadJSONObject.getString("explanationStringArray" + indexCounterInt);
                            indexCounterInt                                                 ++;
            }
                            indexCounterInt                                                 = 0;
            Tag[]           tempTagObjectArray                                              = new Tag[tempTagObjectList.size()];
                            tempTagObjectList                                               .toArray(tempTagObjectArray);
            ObjectMuseum    tempMuseumObject                                                = new ObjectMuseum(new Name(tempNameAltString, tempNameFullString), tempParentNameAltString, tempTypeString, tempExplanationStringArray, tempTagObjectArray);

            boolean         tempFullBoolean                                                 = floorLoadJSONObject.getBoolean    ("fullBoolean"          ); tempMuseumObject.fullBoolean         = tempFullBoolean           ;
            int             tempIndexGlobalInt                                              = floorLoadJSONObject.getInt        ("indexGlobalInt"       ); tempMuseumObject.indexGlobalInt      = tempIndexGlobalInt        ;
            int             tempIndexLocalInt                                               = floorLoadJSONObject.getInt        ("indexLocalInt"        ); tempMuseumObject.indexLocalInt       = tempIndexLocalInt         ;
            int             tempVisitorCurrentInt                                           = floorLoadJSONObject.getInt        ("visitorCurrentInt"    ); tempMuseumObject.visitorCurrentInt   = tempVisitorCurrentInt     ;
            int             tempVisitorTotalInt                                             = floorLoadJSONObject.getInt        ("visitorTotalInt"      ); tempMuseumObject.visitorTotalInt     = tempVisitorTotalInt       ;

            floorObjectList.add(tempMuseumObject);
        }
        roomObjectList                                                                      = new ArrayList<ObjectMuseum>();
        JSONArray roomLoadJSONArrayObject                                                   = loadJSONArray("data/room.json");
        for(int i = 0; i < roomLoadJSONArrayObject.size(); i ++){

            JSONObject      roomLoadJSONObject                                              = roomLoadJSONArrayObject.getJSONObject(i);

            String          tempNameAltString                                               = roomLoadJSONObject.getString("nameAltString"          );
            String          tempNameFullString                                              = roomLoadJSONObject.getString("nameFullString"         );
            String          tempParentNameAltString                                         = roomLoadJSONObject.getString("parentNameAltString"    );
            String          tempTypeString                                                  = roomLoadJSONObject.getString("typeString"             );
            int             indexCounterInt                                                 = 0;
            List<Tag> tempTagObjectList                                                     = new ArrayList<Tag>();
            while(roomLoadJSONObject.hasKey("tagMuseumNameAltStringList" + indexCounterInt)){
                String      tempTagNameAltString                                            = roomLoadJSONObject.getString("tagMuseumNameAltStringList" + indexCounterInt);
                Tag         tempTagObject                                                   = FindTagObject(tempTagNameAltString);
                            tempTagObjectList                                               .add(tempTagObject);
                            indexCounterInt                                                 ++;
            }
                            indexCounterInt                                                 = 0;
            String[]        tempExplanationStringArray                                      = new String[4];
            while(roomLoadJSONObject                                                        .hasKey("explanationStringArray" + indexCounterInt)){
                            tempExplanationStringArray[indexCounterInt]                     = roomLoadJSONObject.getString("explanationStringArray" + indexCounterInt);
                            indexCounterInt                                                 ++;
            }
                            indexCounterInt                                                 = 0;
            Tag[]           tempTagObjectArray                                              = new Tag[tempTagObjectList.size()];
                            tempTagObjectList                                               .toArray(tempTagObjectArray);
            ObjectMuseum    tempMuseumObject                                                = new ObjectMuseum(new Name(tempNameAltString, tempNameFullString), tempParentNameAltString, tempTypeString, tempExplanationStringArray, tempTagObjectArray);

            boolean         tempFullBoolean                                                 = roomLoadJSONObject.getBoolean ("fullBoolean"          ); tempMuseumObject.fullBoolean         = tempFullBoolean           ;
            int             tempIndexGlobalInt                                              = roomLoadJSONObject.getInt     ("indexGlobalInt"       ); tempMuseumObject.indexGlobalInt      = tempIndexGlobalInt        ;
            int             tempIndexLocalInt                                               = roomLoadJSONObject.getInt     ("indexLocalInt"        ); tempMuseumObject.indexLocalInt       = tempIndexLocalInt         ;
            int             tempVisitorCurrentInt                                           = roomLoadJSONObject.getInt     ("visitorCurrentInt"    ); tempMuseumObject.visitorCurrentInt   = tempVisitorCurrentInt     ;
            int             tempVisitorTotalInt                                             = roomLoadJSONObject.getInt     ("visitorTotalInt"      ); tempMuseumObject.visitorTotalInt     = tempVisitorTotalInt       ;

            roomObjectList                                                                  .add(tempMuseumObject);
        }
        exhibitionObjectList                                                                = new ArrayList<ObjectMuseum>();
        JSONArray exhibitionLoadJSONArrayObject                                             = loadJSONArray("data/exhibition.json");
        for(int i = 0; i < exhibitionLoadJSONArrayObject.size(); i ++){

            JSONObject      exhibitionLoadJSONObject                                        = exhibitionLoadJSONArrayObject.getJSONObject(i);

            String          tempNameAltString                                               = exhibitionLoadJSONObject.getString("nameAltString"        );
            String          tempNameFullString                                              = exhibitionLoadJSONObject.getString("nameFullString"       );
            String          tempParentNameAltString                                         = exhibitionLoadJSONObject.getString("parentNameAltString"  );
            String          tempTypeString                                                  = exhibitionLoadJSONObject.getString("typeString"           );
            int             indexCounterInt                                                 = 0;
            List<Tag>       tempTagObjectList                                               = new ArrayList<Tag>();
            while(exhibitionLoadJSONObject                                                  .hasKey("tagMuseumNameAltStringList" + indexCounterInt)){
                String      tempTagNameAltString                                            = exhibitionLoadJSONObject.getString("tagMuseumNameAltStringList" + indexCounterInt);
                Tag         tempTagObject                                                   = FindTagObject(tempTagNameAltString);
                            tempTagObjectList                                               .add(tempTagObject);
                            indexCounterInt                                                 ++;
            }
                            indexCounterInt                                                 = 0;
            String[]        tempExplanationStringArray                                      = new String[4];
            while(exhibitionLoadJSONObject                                                  .hasKey("explanationStringArray" + indexCounterInt)){
                            tempExplanationStringArray[indexCounterInt]                     = exhibitionLoadJSONObject.getString("explanationStringArray" + indexCounterInt);
                            indexCounterInt                                                 ++;
            }
                            indexCounterInt                                                 = 0;
            Tag[]           tempTagObjectArray                                              = new Tag[tempTagObjectList.size()];
                            tempTagObjectList                                               .toArray(tempTagObjectArray);
            ObjectMuseum    tempMuseumObject                                                = new ObjectMuseum(new Name(tempNameAltString, tempNameFullString), tempParentNameAltString, tempTypeString, tempExplanationStringArray, tempTagObjectArray);

            boolean         tempFullBoolean                                                 = exhibitionLoadJSONObject.getBoolean   ("fullBoolean"          ); tempMuseumObject.fullBoolean         = tempFullBoolean           ;
            int             tempIndexGlobalInt                                              = exhibitionLoadJSONObject.getInt       ("indexGlobalInt"       ); tempMuseumObject.indexGlobalInt      = tempIndexGlobalInt        ;
            int             tempIndexLocalInt                                               = exhibitionLoadJSONObject.getInt       ("indexLocalInt"        ); tempMuseumObject.indexLocalInt       = tempIndexLocalInt         ;
            int             tempVisitorCurrentInt                                           = exhibitionLoadJSONObject.getInt       ("visitorCurrentInt"    ); tempMuseumObject.visitorCurrentInt   = tempVisitorCurrentInt     ;
            int             tempVisitorTotalInt                                             = exhibitionLoadJSONObject.getInt       ("visitorTotalInt"      ); tempMuseumObject.visitorTotalInt     = tempVisitorTotalInt       ;

            exhibitionObjectList                                                            .add(tempMuseumObject);
        }
        JSONArray               playerLoadJSONArrayObject                                   = loadJSONArray("data/player.json");
        for(int i = 0; i < playerLoadJSONArrayObject.size(); i ++){
            JSONObject          playerLoadJSONObject                                        = playerLoadJSONArrayObject.getJSONObject(i);

            int                 tempPlayerIndexInt                                          = playerLoadJSONObject.getInt       ("playerIndexInt"                                                   );
            String              tempPlayerNameString                                        = playerLoadJSONObject.getString    ("playerNameString"                                                 );
            String              tempExhibitionStartString                                   = playerLoadJSONObject.getString    ("exhibitionCurrentString"                                          );
            ObjectPlayer        tempPlayerObject                                            = new ObjectPlayer                  (tempPlayerIndexInt, tempPlayerNameString, tempExhibitionStartString);

            int                 indexCounterInt                                             = 0;
            while(playerLoadJSONObject.hasKey("adjectiveCurrentPrevTagStringList" + indexCounterInt)){
                String          tempAdjectiveCurrentPrevTagString                           = playerLoadJSONObject.getString("adjectiveCurrentPrevTagStringList" + indexCounterInt);
                                tempPlayerObject                                            .adjectiveCurrentPrevTagStringList.add(tempAdjectiveCurrentPrevTagString);
                                indexCounterInt                                             ++;
            }
                                indexCounterInt                                             = 0;
            while(playerLoadJSONObject.hasKey("adverbCurrentPrevTagStringList" + indexCounterInt)){
                String          tempAdverbCurrentPrevTagString                              = playerLoadJSONObject.getString("adverbCurrentPrevTagStringList" + indexCounterInt);
                                tempPlayerObject                                            .adverbCurrentPrevTagStringList.add(tempAdverbCurrentPrevTagString);
                                indexCounterInt                                             ++;
            }
                                indexCounterInt                                             = 0;
            while(playerLoadJSONObject.hasKey("exhibitionTargetNameAltStringList" + indexCounterInt)){
                String          tempExhibitionTargetNameAltString                           = playerLoadJSONObject.getString("exhibitionTargetNameAltStringList" + indexCounterInt);
                                tempPlayerObject                                            .exhibitionTargetNameAltStringList.add(tempExhibitionTargetNameAltString);
                                indexCounterInt                                             ++;
            }
                                indexCounterInt                                             = 0;
            while(playerLoadJSONObject.hasKey("exhibitionVisitedNameAltStringList" + indexCounterInt)){
                String          tempExhibitionVisitedNameAltString                          = playerLoadJSONObject.getString("exhibitionVisitedNameAltStringList" + indexCounterInt);
                                tempPlayerObject                                            .exhibitionVisitedNameAltStringList.add(tempExhibitionVisitedNameAltString);
                                indexCounterInt                                             ++;
            }
                                indexCounterInt                                             = 0;
            while(playerLoadJSONObject.hasKey("exhibitionTagCounterListNamAltString" + indexCounterInt)){
                TagCounter      tempTagCounter                                              = new TagCounter();
                String          tempExhibitionTagCounterListNamAltString                    = playerLoadJSONObject.getString("exhibitionTagCounterListNamAltString" + indexCounterInt);
                String          tempExhibitionTagCounterListNameFullString                  = playerLoadJSONObject.getString("exhibitionTagCounterListNameFullString" + indexCounterInt);
                int             tempExhibitionTagCounterListTagCounterInt                   = playerLoadJSONObject.getInt("exhibitionTagCounterListTagCounterInt" + indexCounterInt);
                                tempTagCounter                                              .SetTagNameAltString    (tempExhibitionTagCounterListNamAltString       );
                                tempTagCounter                                              .SetTagNameFullString   (tempExhibitionTagCounterListNameFullString     );
                                tempTagCounter                                              .SetTagCounterIntVoid   (tempExhibitionTagCounterListTagCounterInt      );
                                tempPlayerObject                                            .exhibitionTagCounterList.add(tempTagCounter);
                                indexCounterInt                                             ++;
            }
                                indexCounterInt                                             = 0;
            while(playerLoadJSONObject.hasKey("explanationStringList" + indexCounterInt)){
                String          tempExplanationStringList                                   = playerLoadJSONObject.getString("explanationStringList" + indexCounterInt);
                                tempPlayerObject                                            .explanationStringList.add(tempExplanationStringList);
                                indexCounterInt                                             ++;
            }
                                indexCounterInt                                             = 0;
            while(playerLoadJSONObject.hasKey("subjectCurrentPrevTagStringList" + indexCounterInt)){
                String          tempSubjectCurrentPrevTagString                             = playerLoadJSONObject.getString("subjectCurrentPrevTagStringList" + indexCounterInt);
                                tempPlayerObject                                            .subjectCurrentPrevTagStringList.add(tempSubjectCurrentPrevTagString);
                                indexCounterInt                                             ++;
            }
                                indexCounterInt                                             = 0;
            while(playerLoadJSONObject.hasKey("intransitiveVerb1CurrentPrevTagStringList" + indexCounterInt)){
                String          tempIntransitiveVerb1CurrentPrevTagString                   = playerLoadJSONObject.getString("intransitiveVerb1CurrentPrevTagStringList" + indexCounterInt);
                                tempPlayerObject                                            .intransitiveVerb1CurrentPrevTagStringList.add(tempIntransitiveVerb1CurrentPrevTagString);
                                indexCounterInt                                             ++;
            }
                                indexCounterInt                                             = 0;
            while(playerLoadJSONObject.hasKey("intransitiveVerb2CurrentPrevTagStringList" + indexCounterInt)){
                String          tempIntransitiveVerb2CurrentPrevTagString                   = playerLoadJSONObject.getString("intransitiveVerb2CurrentPrevTagStringList" + indexCounterInt);
                                tempPlayerObject                                            .intransitiveVerb2CurrentPrevTagStringList.add(tempIntransitiveVerb2CurrentPrevTagString);
                                indexCounterInt                                             ++;
            }
                                indexCounterInt                                             = 0;
            while(playerLoadJSONObject.hasKey("intransitiveVerb3CurrentPrevTagStringList" + indexCounterInt)){
                String          tempIntransitiveVerb3CurrentPrevTagString                   = playerLoadJSONObject.getString("intransitiveVerb3CurrentPrevTagStringList" + indexCounterInt);
                                tempPlayerObject                                            .intransitiveVerb3CurrentPrevTagStringList.add(tempIntransitiveVerb3CurrentPrevTagString);
                                indexCounterInt                                             ++;
            }
                                indexCounterInt                                             = 0;
            while(playerLoadJSONObject.hasKey("intransitiveVerbIngCurrentPrevTagStringList" + indexCounterInt)){
                String          tempIntransitiveVerbIngCurrentPrevTagStringList             = playerLoadJSONObject.getString("intransitiveVerbIngCurrentPrevTagStringList" + indexCounterInt);
                                tempPlayerObject                                            .intransitiveVerbIngCurrentPrevTagStringList.add(tempIntransitiveVerbIngCurrentPrevTagStringList);
                                indexCounterInt                                             ++;
            }
                                indexCounterInt                                             = 0;
            while(playerLoadJSONObject.hasKey("intransitiveVerbSCurrentPrevTagStringList" + indexCounterInt)){
                String          tempIntransitiveVerbSCurrentPrevTagString                   = playerLoadJSONObject.getString("intransitiveVerbSCurrentPrevTagStringList" + indexCounterInt);
                                tempPlayerObject                                            .intransitiveVerbSCurrentPrevTagStringList.add(tempIntransitiveVerbSCurrentPrevTagString);
                                indexCounterInt                                             ++;
            }
                                indexCounterInt                                             ++;
            while(playerLoadJSONObject.hasKey("negativeAdjectiveCurrentPrevTagStringList" + indexCounterInt)){
                String          tempNegativeAdjectiveCurrentPrevTagString                   = playerLoadJSONObject.getString("negativeAdjectiveCurrentPrevTagStringList" + indexCounterInt);
                                tempPlayerObject                                            .negativeAdjectiveCurrentPrevTagStringList.add(tempNegativeAdjectiveCurrentPrevTagString);
                                indexCounterInt                                             ++;
            }
                                indexCounterInt                                             = 0;
            while(playerLoadJSONObject.hasKey("negativeAdverbCurrentPrevTagStringList" + indexCounterInt)){
                String          tempNegativeAdverbCurrentPrevTagString                      = playerLoadJSONObject.getString("negativeAdverbCurrentPrevTagStringList" + indexCounterInt);
                                tempPlayerObject                                            .negativeAdverbCurrentPrevTagStringList.add(tempNegativeAdverbCurrentPrevTagString);
                                indexCounterInt                                             ++;
            }
                                indexCounterInt                                             = 0;
            while(playerLoadJSONObject.hasKey("negativeIntransitiveVerb1CurrentPrevTagStringList" + indexCounterInt)){
                String          tempNegativeIntransitiveVerb1CurrentPrevTagString           = playerLoadJSONObject.getString("negativeIntransitiveVerb1CurrentPrevTagStringList" + indexCounterInt);
                                tempPlayerObject                                            .negativeIntransitiveVerb1CurrentPrevTagStringList.add(tempNegativeIntransitiveVerb1CurrentPrevTagString);
                                indexCounterInt                                             ++;
            }
                                indexCounterInt                                             = 0;
            while(playerLoadJSONObject.hasKey("negativeIntransitiveVerb2CurrentPrevTagStringList" + indexCounterInt)){
                String          tempNegativeIntransitiveVerb2CurrentPrevTagString           = playerLoadJSONObject.getString("negativeIntransitiveVerb2CurrentPrevTagStringList" + indexCounterInt);
                                tempPlayerObject                                            .negativeIntransitiveVerb2CurrentPrevTagStringList.add(tempNegativeIntransitiveVerb2CurrentPrevTagString);
                                indexCounterInt                                             ++;
            }
                                indexCounterInt                                             = 0;
            while(playerLoadJSONObject.hasKey("negativeIntransitiveVerb3CurrentPrevTagStringList" + indexCounterInt)){
                String          tempNegativeIntransitiveVerb3CurrentPrevTagString               = playerLoadJSONObject.getString("negativeIntransitiveVerb3CurrentPrevTagStringList" + indexCounterInt);
                                tempPlayerObject                                            .negativeIntransitiveVerb3CurrentPrevTagStringList.add(tempNegativeIntransitiveVerb3CurrentPrevTagString);
                                indexCounterInt                                             ++;
            }
                                indexCounterInt                                             = 0;
            while(playerLoadJSONObject.hasKey("negativeIntransitiveVerbIngCurrentPrevTagStringList" + indexCounterInt)){
                String          tempNegativeIntransitiveVerbIngCurrentPrevTagStringList     = playerLoadJSONObject.getString("negativeIntransitiveVerbIngCurrentPrevTagStringList" + indexCounterInt);
                                tempPlayerObject                                            .negativeIntransitiveVerbIngCurrentPrevTagStringList.add(tempNegativeIntransitiveVerbIngCurrentPrevTagStringList);
                                indexCounterInt                                             ++;
            }
                                indexCounterInt                                             = 0;
            while(playerLoadJSONObject.hasKey("negativeIntransitiveVerbSCurrentPrevTagStringList" + indexCounterInt)){
                String          tempNegativeIntransitiveVerbSCurrentPrevTagString           = playerLoadJSONObject.getString("negativeIntransitiveVerbSCurrentPrevTagStringList" + indexCounterInt);
                                tempPlayerObject                                            .negativeIntransitiveVerbSCurrentPrevTagStringList.add(tempNegativeIntransitiveVerbSCurrentPrevTagString);
                                indexCounterInt                                             ++;
            }
                                indexCounterInt                                             = 0;
            while(playerLoadJSONObject.hasKey("negativeTransitiveVerb1CurrentPrevTagStringList" + indexCounterInt)){
                String          tempNegativeTransitiveVerb1CurrentPrevTagString             = playerLoadJSONObject.getString("negativeTransitiveVerb1CurrentPrevTagStringList" + indexCounterInt);
                                tempPlayerObject                                            .negativeTransitiveVerb1CurrentPrevTagStringList.add(tempNegativeTransitiveVerb1CurrentPrevTagString);
                                indexCounterInt                                             ++;
            }
                                indexCounterInt                                             = 0;
            while(playerLoadJSONObject.hasKey("negativeTransitiveVerb2CurrentPrevTagStringList" + indexCounterInt)){
                String          tempNegativeTransitiveVerb2CurrentPrevTagString             = playerLoadJSONObject.getString("negativeTransitiveVerb2CurrentPrevTagStringList" + indexCounterInt);
                                tempPlayerObject                                            .negativeTransitiveVerb2CurrentPrevTagStringList.add(tempNegativeTransitiveVerb2CurrentPrevTagString);
                                indexCounterInt                                             ++;
            }
                                indexCounterInt                                             = 0;
            while(playerLoadJSONObject.hasKey("negativeTransitiveVerb3CurrentPrevTagStringList" + indexCounterInt)){
                String          tempNegativeTransitiveVerb3CurrentPrevTagString             = playerLoadJSONObject.getString("negativeTransitiveVerb3CurrentPrevTagStringList" + indexCounterInt);
                                tempPlayerObject                                            .negativeTransitiveVerb3CurrentPrevTagStringList.add(tempNegativeTransitiveVerb3CurrentPrevTagString);
                                indexCounterInt                                             ++;
            }
                                indexCounterInt                                             = 0;
            while(playerLoadJSONObject.hasKey("negativeTransitiveVerbIngCurrentPrevTagStringList" + indexCounterInt)){
                String          tempNegativeTransitiveVerbIngCurrentPrevTagStringList       = playerLoadJSONObject.getString("negativeTransitiveVerbIngCurrentPrevTagStringList" + indexCounterInt);
                                tempPlayerObject                                            .negativeTransitiveVerbIngCurrentPrevTagStringList.add(tempNegativeTransitiveVerbIngCurrentPrevTagStringList);
                                indexCounterInt                                             ++;
            }
                                indexCounterInt                                             = 0;
            while(playerLoadJSONObject.hasKey("negativeTransitiveVerbSCurrentPrevTagStringList" + indexCounterInt)){
                String          tempNegativeTransitiveVerbSCurrentPrevTagString             = playerLoadJSONObject.getString("negativeTransitiveVerbSCurrentPrevTagStringList" + indexCounterInt);
                                tempPlayerObject                                            .negativeTransitiveVerbSCurrentPrevTagStringList.add(tempNegativeTransitiveVerbSCurrentPrevTagString);
                                indexCounterInt                                             ++;
            }
                                indexCounterInt                                             = 0;
            while(playerLoadJSONObject.hasKey("nounAbstractCurrentPrevTagStringList" + indexCounterInt)){
                String          tempNounAbstractCurrentPrevTagString                        = playerLoadJSONObject.getString("nounAbstractCurrentPrevTagStringList" + indexCounterInt);
                                tempPlayerObject                                            .nounAbstractCurrentPrevTagStringList.add(tempNounAbstractCurrentPrevTagString);
                                indexCounterInt                                             ++;
            }
                                indexCounterInt                                             = 0;
            while(playerLoadJSONObject.hasKey("nounAbstractSCurrentPrevTagStringList" + indexCounterInt)){
                String          tempNounAbstractSCurrentPrevTagString                       = playerLoadJSONObject.getString("nounAbstractSCurrentPrevTagStringList" + indexCounterInt);
                                tempPlayerObject                                            .nounAbstractSCurrentPrevTagStringList.add(tempNounAbstractSCurrentPrevTagString);
                                indexCounterInt                                             ++;
            }
                                indexCounterInt                                             = 0;
            while(playerLoadJSONObject.hasKey("nounCurrentPrevTagStringList" + indexCounterInt)){
                String          tempNounCurrentPrevTagString                                = playerLoadJSONObject.getString("nounCurrentPrevTagStringList" + indexCounterInt);
                                tempPlayerObject                                            .nounCurrentPrevTagStringList.add(tempNounCurrentPrevTagString);
                                indexCounterInt                                             ++;
            }
                                indexCounterInt                                             = 0;
            while(playerLoadJSONObject.hasKey("nounSCurrentPrevTagStringList" + indexCounterInt)){
                String          tempNounSCurrentPrevTagString                               = playerLoadJSONObject.getString("nounSCurrentPrevTagStringList" + indexCounterInt);
                                tempPlayerObject                                            .nounSCurrentPrevTagStringList.add(tempNounSCurrentPrevTagString);
                                indexCounterInt                                             ++;
            }
                                indexCounterInt                                             = 0;
            while(playerLoadJSONObject.hasKey("playerSiblingObjectList" + indexCounterInt)){
                int             tempPlayerSiblingObjectInt                                  = playerLoadJSONObject.getInt("playerSiblingObjectList" + indexCounterInt);
                ObjectPlayer    tempObjectPlayer                                            = FindPlayerObject(tempPlayerSiblingObjectInt);
                                tempPlayerObject                                            .playerSiblingObjectList.add(tempObjectPlayer);
                                indexCounterInt                                             ++;
            }
                                indexCounterInt                                             = 0;
            while(playerLoadJSONObject.hasKey("sentenceStringList" + indexCounterInt)){
                String          tempSentenceString                                          = playerLoadJSONObject.getString("sentenceStringList" + indexCounterInt);
                                tempPlayerObject                                            .sentenceStringList.add(tempSentenceString);
                                indexCounterInt                                             ++;
            }
                                indexCounterInt                                             = 0;
            while(playerLoadJSONObject.hasKey("transitiveVerb1CurrentPrevTagStringList" + indexCounterInt)){
                String          tempTransitiveVerb1CurrentPrevTagString                     = playerLoadJSONObject.getString("transitiveVerb1CurrentPrevTagStringList" + indexCounterInt);
                                tempPlayerObject                                            .transitiveVerb1CurrentPrevTagStringList.add(tempTransitiveVerb1CurrentPrevTagString);
                                indexCounterInt                                             ++;
            }
                                indexCounterInt                                             = 0;
            while(playerLoadJSONObject.hasKey("transitiveVerb2CurrentPrevTagStringList" + indexCounterInt)){
                String          tempTransitiveVerb2CurrentPrevTagString                     = playerLoadJSONObject.getString("transitiveVerb2CurrentPrevTagStringList" + indexCounterInt);
                                tempPlayerObject                                            .transitiveVerb2CurrentPrevTagStringList.add(tempTransitiveVerb2CurrentPrevTagString);
                                indexCounterInt                                             ++;
            }
                                indexCounterInt                                             = 0;
            while(playerLoadJSONObject.hasKey("transitiveVerb3CurrentPrevTagStringList" + indexCounterInt)){
                String          tempTransitiveVerb3CurrentPrevTagString                     = playerLoadJSONObject.getString("transitiveVerb3CurrentPrevTagStringList" + indexCounterInt);
                                tempPlayerObject                                            .transitiveVerb3CurrentPrevTagStringList.add(tempTransitiveVerb3CurrentPrevTagString);
                                indexCounterInt                                             ++;
            }
                                indexCounterInt                                             = 0;
            while(playerLoadJSONObject.hasKey("transitiveVerbIngCurrentPrevTagStringList" + indexCounterInt)){
                String          tempTransitiveVerbIngCurrentPrevTagStringList               = playerLoadJSONObject.getString("transitiveVerbIngCurrentPrevTagStringList" + indexCounterInt);
                                tempPlayerObject                                            .transitiveVerbIngCurrentPrevTagStringList.add(tempTransitiveVerbIngCurrentPrevTagStringList);
                                indexCounterInt                                             ++;
            }
                                indexCounterInt                                             = 0;
            while(playerLoadJSONObject.hasKey("transitiveVerbSCurrentPrevTagStringList" + indexCounterInt)){
                String          tempTransitiveVerbSCurrentPrevTagString                     = playerLoadJSONObject.getString("transitiveVerbSCurrentPrevTagStringList" + indexCounterInt);
                                tempPlayerObject                                            .transitiveVerbSCurrentPrevTagStringList.add(tempTransitiveVerbSCurrentPrevTagString);
                                indexCounterInt                                             ++;
            }
                                indexCounterInt                                             = 0;

            boolean             tempPlayerFinishedBoolean                                   = playerLoadJSONObject.getBoolean   ("playerFinishedBoolean"                ); tempPlayerObject.playerFinishedBoolean                   = tempPlayerFinishedBoolean                 ;
            boolean             tempPlayerVisitCorrectExhibitionBoolean                     = playerLoadJSONObject.getBoolean   ("playerVisitCorrectExhibitionBoolean"  ); tempPlayerObject.playerVisitCorrectExhibitionBoolean     = tempPlayerVisitCorrectExhibitionBoolean   ;
            int                 tempPlayerMovementModeInt                                   = playerLoadJSONObject.getInt       ("playerMovementModeInt"                ); tempPlayerObject.playerMovementModeInt                   = tempPlayerMovementModeInt                 ;
            int                 tempPlayerScoreInt                                          = playerLoadJSONObject.getInt       ("playerScoreInt"                       ); tempPlayerObject.playerScoreInt                          = tempPlayerScoreInt                        ;
            int                 tempPlayerSiblingIndexInt                                   = playerLoadJSONObject.getInt       ("playerSiblingIndexInt"                ); tempPlayerObject.playerSiblingIndexInt                   = tempPlayerSiblingIndexInt                 ;
        }
    }

}

void SaveVoid(){

    adjectiveTagSaveJSONArrayObject                     = new JSONArray();
    adverbTagSaveJSONArrayObject                        = new JSONArray();
    exhibitionSaveJSONArrayObject                       = new JSONArray();
    floorSaveJSONArrayObject                            = new JSONArray();
    intransitiveVerbTagSaveJSONArrayObject              = new JSONArray();
    negativeAdjectiveTagSaveJSONArrayObject             = new JSONArray();
    negativeAdverbTagSaveJSONArrayObject                = new JSONArray();
    negativeIntransitiveVerbTagSaveJSONArrayObject      = new JSONArray();
    negativeTransitiveVerbTagSaveJSONArrayObject        = new JSONArray();
    nounTagSaveJSONArrayObject                          = new JSONArray();
    playerSaveJSONArrayObject                           = new JSONArray();
    roomSaveJSONArrayObject                             = new JSONArray();
    subjectTagSaveJSONArrayObject                       = new JSONArray();
    transitiveVerbTagSaveJSONArrayObject                = new JSONArray();
    for(int i = 0; i < subjectTagObjectList.size(); i ++){
        subjectTagSaveJSONObject                        = new JSONObject();
        subjectTagSaveJSONObject                        .setString      ("tagNameAltString"                         , subjectTagObjectList                      .get(i).tagNameAltString                        );
        subjectTagSaveJSONObject                        .setString      ("tagNameFullString"                        , subjectTagObjectList                      .get(i).tagNameFullString                       );
        subjectTagSaveJSONObject                        .setString      ("tagTypeString"                            , subjectTagObjectList                      .get(i).tagTypeString                           );
        subjectTagSaveJSONObject                        .setString      ("tagSubjectString"                         , subjectTagObjectList                      .get(i).tagSubjectString                        );
        subjectTagSaveJSONObject                        .setString      ("tagSubjectPossesionString"                , subjectTagObjectList                      .get(i).tagSubjectPossesionString               );
        subjectTagSaveJSONArrayObject                   .setJSONObject  (i, subjectTagSaveJSONObject);
    }
    for(int i = 0; i < intransitiveVerbTagObjectList.size(); i ++){
        intransitiveVerbTagSaveJSONObject               = new JSONObject();
        intransitiveVerbTagSaveJSONObject               .setString      ("tagNameAltString"                         , intransitiveVerbTagObjectList             .get(i).tagNameAltString                        );
        intransitiveVerbTagSaveJSONObject               .setString      ("tagNameFullString"                        , intransitiveVerbTagObjectList             .get(i).tagNameFullString                       );
        intransitiveVerbTagSaveJSONObject               .setString      ("tagTypeString"                            , intransitiveVerbTagObjectList             .get(i).tagTypeString                           );
        intransitiveVerbTagSaveJSONObject               .setString      ("tagIntransitiveVerb1String"               , intransitiveVerbTagObjectList             .get(i).tagIntransitiveVerb1String              );
        intransitiveVerbTagSaveJSONObject               .setString      ("tagIntransitiveVerb2String"               , intransitiveVerbTagObjectList             .get(i).tagIntransitiveVerb2String              );
        intransitiveVerbTagSaveJSONObject               .setString      ("tagIntransitiveVerb3String"               , intransitiveVerbTagObjectList             .get(i).tagIntransitiveVerb3String              );
        intransitiveVerbTagSaveJSONObject               .setString      ("tagIntransitiveVerbSString"               , intransitiveVerbTagObjectList             .get(i).tagIntransitiveVerbSString              );
        intransitiveVerbTagSaveJSONObject               .setString      ("tagIntransitiveVerbIngString"             , intransitiveVerbTagObjectList             .get(i).tagIntransitiveVerbIngString            );
        intransitiveVerbTagSaveJSONArrayObject          .setJSONObject  (i, intransitiveVerbTagSaveJSONObject);
    }
    for(int i = 0; i < negativeIntransitiveVerbTagObjectList.size(); i ++){
        negativeIntransitiveVerbTagSaveJSONObject       = new JSONObject();
        negativeIntransitiveVerbTagSaveJSONObject       .setString      ("tagNameAltString"                         , negativeIntransitiveVerbTagObjectList     .get(i).tagNameAltString                        );
        negativeIntransitiveVerbTagSaveJSONObject       .setString      ("tagNameFullString"                        , negativeIntransitiveVerbTagObjectList     .get(i).tagNameFullString                       );
        negativeIntransitiveVerbTagSaveJSONObject       .setString      ("tagTypeString"                            , negativeIntransitiveVerbTagObjectList     .get(i).tagTypeString                           );
        negativeIntransitiveVerbTagSaveJSONObject       .setString      ("tagNegativeIntransitiveVerb1String"       , negativeIntransitiveVerbTagObjectList     .get(i).tagNegativeIntransitiveVerb1String      );
        negativeIntransitiveVerbTagSaveJSONObject       .setString      ("tagNegativeIntransitiveVerb2String"       , negativeIntransitiveVerbTagObjectList     .get(i).tagNegativeIntransitiveVerb2String      );
        negativeIntransitiveVerbTagSaveJSONObject       .setString      ("tagNegativeIntransitiveVerb3String"       , negativeIntransitiveVerbTagObjectList     .get(i).tagNegativeIntransitiveVerb3String      );
        negativeIntransitiveVerbTagSaveJSONObject       .setString      ("tagNegativeIntransitiveVerbSString"       , negativeIntransitiveVerbTagObjectList     .get(i).tagNegativeIntransitiveVerbSString      );
        negativeIntransitiveVerbTagSaveJSONObject       .setString      ("tagNegativeIntransitiveVerbIngString"     , negativeIntransitiveVerbTagObjectList     .get(i).tagNegativeIntransitiveVerbIngString    );
        negativeIntransitiveVerbTagSaveJSONArrayObject  .setJSONObject  (i, negativeIntransitiveVerbTagSaveJSONObject);
    }
    for(int i = 0; i < transitiveVerbTagObjectList.size(); i ++){
        transitiveVerbTagSaveJSONObject                 = new JSONObject();
        transitiveVerbTagSaveJSONObject                 .setString      ("tagNameAltString"                         , transitiveVerbTagObjectList               .get(i).tagNameAltString                        );
        transitiveVerbTagSaveJSONObject                 .setString      ("tagNameFullString"                        , transitiveVerbTagObjectList               .get(i).tagNameFullString                       );
        transitiveVerbTagSaveJSONObject                 .setString      ("tagTypeString"                            , transitiveVerbTagObjectList               .get(i).tagTypeString                           );
        transitiveVerbTagSaveJSONObject                 .setString      ("tagTransitiveVerb1String"                 , transitiveVerbTagObjectList               .get(i).tagTransitiveVerb1String                );
        transitiveVerbTagSaveJSONObject                 .setString      ("tagTransitiveVerb2String"                 , transitiveVerbTagObjectList               .get(i).tagTransitiveVerb2String                );
        transitiveVerbTagSaveJSONObject                 .setString      ("tagTransitiveVerb3String"                 , transitiveVerbTagObjectList               .get(i).tagTransitiveVerb3String                );
        transitiveVerbTagSaveJSONObject                 .setString      ("tagTransitiveVerbSString"                 , transitiveVerbTagObjectList               .get(i).tagTransitiveVerbSString                );
        transitiveVerbTagSaveJSONObject                 .setString      ("tagTransitiveVerbIngString"               , transitiveVerbTagObjectList               .get(i).tagTransitiveVerbIngString              );
        transitiveVerbTagSaveJSONArrayObject            .setJSONObject  (i, transitiveVerbTagSaveJSONObject);
    }
    for(int i = 0; i < negativeTransitiveVerbTagObjectList.size(); i ++){
        negativeTransitiveVerbTagSaveJSONObject         = new JSONObject();
        negativeTransitiveVerbTagSaveJSONObject         .setString      ("tagNameAltString"                         , negativeTransitiveVerbTagObjectList       .get(i).tagNameAltString                        );
        negativeTransitiveVerbTagSaveJSONObject         .setString      ("tagNameFullString"                        , negativeTransitiveVerbTagObjectList       .get(i).tagNameFullString                       );
        negativeTransitiveVerbTagSaveJSONObject         .setString      ("tagTypeString"                            , negativeTransitiveVerbTagObjectList       .get(i).tagTypeString                           );
        negativeTransitiveVerbTagSaveJSONObject         .setString      ("tagNegativeTransitiveVerb1String"         , negativeTransitiveVerbTagObjectList       .get(i).tagNegativeTransitiveVerb1String        );
        negativeTransitiveVerbTagSaveJSONObject         .setString      ("tagNegativeTransitiveVerb2String"         , negativeTransitiveVerbTagObjectList       .get(i).tagNegativeTransitiveVerb2String        );
        negativeTransitiveVerbTagSaveJSONObject         .setString      ("tagNegativeTransitiveVerb3String"         , negativeTransitiveVerbTagObjectList       .get(i).tagNegativeTransitiveVerb3String        );
        negativeTransitiveVerbTagSaveJSONObject         .setString      ("tagNegativeTransitiveVerbSString"         , negativeTransitiveVerbTagObjectList       .get(i).tagNegativeTransitiveVerbSString        );
        negativeTransitiveVerbTagSaveJSONObject         .setString      ("tagNegativeTransitiveVerbIngString"       , negativeTransitiveVerbTagObjectList       .get(i).tagNegativeTransitiveVerbIngString      );
        negativeTransitiveVerbTagSaveJSONArrayObject    .setJSONObject  (i, negativeTransitiveVerbTagSaveJSONObject);
    }
    for(int i = 0; i < nounAbstractTagObjectList.size(); i ++){
        nounAbstractTagSaveJSONObject                   = new JSONObject();
        nounAbstractTagSaveJSONObject                   .setString      ("tagNameAltString"                         , nounAbstractTagObjectList                 .get(i).tagNameAltString                        );
        nounAbstractTagSaveJSONObject                   .setString      ("tagNameFullString"                        , nounAbstractTagObjectList                 .get(i).tagNameFullString                       );
        nounAbstractTagSaveJSONObject                   .setString      ("tagTypeString"                            , nounAbstractTagObjectList                 .get(i).tagTypeString                           );
        nounAbstractTagSaveJSONObject                   .setString      ("tagNounAbstractString"                    , nounAbstractTagObjectList                 .get(i).tagNounAbstractString                   );
        nounAbstractTagSaveJSONObject                   .setString      ("tagNounAbstractSString"                   , nounAbstractTagObjectList                 .get(i).tagNounAbstractSString                  );
        nounAbstractTagSaveJSONArrayObject              .setJSONObject  (i, nounAbstractTagSaveJSONObject);
    }
    for(int i = 0; i < nounTagObjectList.size(); i ++){
        nounTagSaveJSONObject                               = new JSONObject();
        nounTagSaveJSONObject                           .setString      ("tagNameAltString"                         , nounTagObjectList                         .get(i).tagNameAltString                        );
        nounTagSaveJSONObject                           .setString      ("tagNameFullString"                        , nounTagObjectList                         .get(i).tagNameFullString                       );
        nounTagSaveJSONObject                           .setString      ("tagTypeString"                            , nounTagObjectList                         .get(i).tagTypeString                           );
        nounTagSaveJSONObject                           .setString      ("tagNounString"                            , nounTagObjectList                         .get(i).tagNounString                           );
        nounTagSaveJSONObject                           .setString      ("tagNounSString"                           , nounTagObjectList                         .get(i).tagNounSString                          );
        nounTagSaveJSONArrayObject                      .setJSONObject  (i, nounTagSaveJSONObject);
    }
    for(int i = 0; i < adjectiveTagObjectList.size(); i ++){
        adjectiveTagSaveJSONObject                      = new JSONObject();
        adjectiveTagSaveJSONObject                      .setString      ("tagNameAltString"                         , adjectiveTagObjectList                    .get(i).tagNameAltString                        );
        adjectiveTagSaveJSONObject                      .setString      ("tagNameFullString"                        , adjectiveTagObjectList                    .get(i).tagNameFullString                       );
        adjectiveTagSaveJSONObject                      .setString      ("tagTypeString"                            , adjectiveTagObjectList                    .get(i).tagTypeString                           );
        adjectiveTagSaveJSONObject                      .setString      ("tagAdjectiveString"                       , adjectiveTagObjectList                    .get(i).tagAdjectiveString                      );
        adjectiveTagSaveJSONArrayObject                 .setJSONObject  (i, adjectiveTagSaveJSONObject);
    }
    for(int i = 0; i < negativeAdjectiveTagObjectList.size(); i ++){
        negativeAdjectiveTagSaveJSONObject              = new JSONObject();
        negativeAdjectiveTagSaveJSONObject              .setString      ("tagNameAltString"                         , negativeAdjectiveTagObjectList            .get(i).tagNameAltString                        );
        negativeAdjectiveTagSaveJSONObject              .setString      ("tagNameFullString"                        , negativeAdjectiveTagObjectList            .get(i).tagNameFullString                       );
        negativeAdjectiveTagSaveJSONObject              .setString      ("tagTypeString"                            , negativeAdjectiveTagObjectList            .get(i).tagTypeString                           );
        negativeAdjectiveTagSaveJSONObject              .setString      ("tagNegativeAdjectiveString"               , negativeAdjectiveTagObjectList            .get(i).tagNegativeAdjectiveString              );
        negativeAdjectiveTagSaveJSONArrayObject         .setJSONObject  (i, negativeAdjectiveTagSaveJSONObject);
    }
    for(int i = 0; i < adverbTagObjectList.size(); i ++){
        adverbTagSaveJSONObject                         = new JSONObject();
        adverbTagSaveJSONObject                         .setString      ("tagNameAltString"                         , adverbTagObjectList                       .get(i).tagNameAltString                        );
        adverbTagSaveJSONObject                         .setString      ("tagNameFullString"                        , adverbTagObjectList                       .get(i).tagNameFullString                       );
        adverbTagSaveJSONObject                         .setString      ("tagTypeString"                            , adverbTagObjectList                       .get(i).tagTypeString                           );
        adverbTagSaveJSONObject                         .setString      ("tagAdverbString"                          , adverbTagObjectList                       .get(i).tagAdverbString                         );
        adverbTagSaveJSONArrayObject                    .setJSONObject  (i, adverbTagSaveJSONObject);
    }
    for(int i = 0; i < negativeAdverbTagObjectList.size(); i ++){
        negativeAdverbTagSaveJSONObject                 = new JSONObject();
        negativeAdverbTagSaveJSONObject                 .setString      ("tagNameAltString"                         , negativeAdverbTagObjectList               .get(i).tagNameAltString                        );
        negativeAdverbTagSaveJSONObject                 .setString      ("tagNameFullString"                        , negativeAdverbTagObjectList               .get(i).tagNameFullString                       );
        negativeAdverbTagSaveJSONObject                 .setString      ("tagTypeString"                            , negativeAdverbTagObjectList               .get(i).tagTypeString                           );
        negativeAdverbTagSaveJSONObject                 .setString      ("tagNegativeAdverbString"                  , negativeAdverbTagObjectList               .get(i).tagNegativeAdverbString                 );
        negativeAdverbTagSaveJSONArrayObject            .setJSONObject  (i, negativeAdverbTagSaveJSONObject);
    }
    for(int i = 0; i < floorObjectList.size(); i ++){
        floorSaveJSONObject                             = new JSONObject();
        floorSaveJSONObject                             .setBoolean     ("fullBoolean"                              , floorObjectList                           .get(i).fullBoolean                             );
        floorSaveJSONObject                             .setInt         ("indexGlobalInt"                           , floorObjectList                           .get(i).indexGlobalInt                          );
        floorSaveJSONObject                             .setInt         ("indexLocalInt"                            , floorObjectList                           .get(i).indexLocalInt                           );
        floorSaveJSONObject                             .setInt         ("visitorCurrentInt"                        , floorObjectList                           .get(i).visitorCurrentInt                       );
        floorSaveJSONObject                             .setInt         ("visitorTotalInt"                          , floorObjectList                           .get(i).visitorTotalInt                         );
        floorSaveJSONObject                             .setString      ("nameAltString"                            , floorObjectList                           .get(i).nameAltString                           );
        floorSaveJSONObject                             .setString      ("nameFullString"                           , floorObjectList                           .get(i).nameFullString                          );
        floorSaveJSONObject                             .setString      ("parentNameAltString"                      , floorObjectList                           .get(i).parentNameAltString                     );
        floorSaveJSONObject                             .setString      ("typeString"                               , floorObjectList                           .get(i).typeString                              );
        for(int j = 0; j < floorObjectList              .get(i).explanationStringArray                              .length; j ++){ floorSaveJSONObject         .setString("explanationStringArray"             + j, floorObjectList.get(i).explanationStringArray[j]);                 }
        for(int j = 0; j < floorObjectList              .get(i).tagMuseumNameAltStringList                          .size(); j ++){ floorSaveJSONObject         .setString("tagMuseumNameAltStringList"         + j, floorObjectList.get(i).tagMuseumNameAltStringList.get(j));         }
        floorSaveJSONArrayObject                        .setJSONObject  (i, floorSaveJSONObject);
    }
    for(int i = 0; i < roomObjectList.size(); i ++){
        roomSaveJSONObject = new JSONObject();
        for(int j = 0; j < roomObjectList               .get(i).explanationStringArray                              .length; j ++){ roomSaveJSONObject          .setString("explanationStringArray"             + j, roomObjectList.get(i).explanationStringArray[j]);                  }
        for(int j = 0; j < roomObjectList               .get(i).tagMuseumNameAltStringList                          .size(); j ++){ roomSaveJSONObject          .setString("tagMuseumNameAltStringList"         + j, roomObjectList.get(i).tagMuseumNameAltStringList.get(j));          }
        roomSaveJSONObject                              .setBoolean     ("fullBoolean"                              , roomObjectList                            .get(i).fullBoolean                             );
        roomSaveJSONObject                              .setInt         ("indexGlobalInt"                           , roomObjectList                            .get(i).indexGlobalInt                          );
        roomSaveJSONObject                              .setInt         ("indexLocalInt"                            , roomObjectList                            .get(i).indexLocalInt                           );
        roomSaveJSONObject                              .setInt         ("visitorCurrentInt"                        , roomObjectList                            .get(i).visitorCurrentInt                       );
        roomSaveJSONObject                              .setInt         ("visitorTotalInt"                          , roomObjectList                            .get(i).visitorTotalInt                         );
        roomSaveJSONObject                              .setString      ("nameAltString"                            , roomObjectList                            .get(i).nameAltString                           );
        roomSaveJSONObject                              .setString      ("nameFullString"                           , roomObjectList                            .get(i).nameFullString                          );
        roomSaveJSONObject                              .setString      ("parentNameAltString"                      , roomObjectList                            .get(i).parentNameAltString                     );
        roomSaveJSONObject                              .setString      ("typeString"                               , roomObjectList                            .get(i).typeString                              );
        roomSaveJSONArrayObject                         .setJSONObject  (i, roomSaveJSONObject);
    }
    for(int i = 0; i < exhibitionObjectList.size(); i ++){
        exhibitionSaveJSONObject                        = new JSONObject();
        exhibitionSaveJSONObject                        .setBoolean     ("fullBoolean"                              , exhibitionObjectList                      .get(i).fullBoolean                             );
        exhibitionSaveJSONObject                        .setInt         ("indexGlobalInt"                           , exhibitionObjectList                      .get(i).indexGlobalInt                          );
        exhibitionSaveJSONObject                        .setInt         ("indexLocalInt"                            , exhibitionObjectList                      .get(i).indexLocalInt                           );
        exhibitionSaveJSONObject                        .setInt         ("visitorCurrentInt"                        , exhibitionObjectList                      .get(i).visitorCurrentInt                       );
        exhibitionSaveJSONObject                        .setInt         ("visitorTotalInt"                          , exhibitionObjectList                      .get(i).visitorTotalInt                         );
        exhibitionSaveJSONObject                        .setString      ("nameAltString"                            , exhibitionObjectList                      .get(i).nameAltString                           );
        exhibitionSaveJSONObject                        .setString      ("nameFullString"                           , exhibitionObjectList                      .get(i).nameFullString                          );
        exhibitionSaveJSONObject                        .setString      ("parentNameAltString"                      , exhibitionObjectList                      .get(i).parentNameAltString                     );
        exhibitionSaveJSONObject                        .setString      ("typeString"                               , exhibitionObjectList                      .get(i).typeString                              );
        for(int j = 0; j < exhibitionObjectList         .get(i).explanationStringArray                              .length; j ++){ exhibitionSaveJSONObject    .setString("explanationStringArray"             + j, exhibitionObjectList.get(i).explanationStringArray[j]);            }
        for(int j = 0; j < exhibitionObjectList         .get(i).tagMuseumNameAltStringList                          .size(); j ++){ exhibitionSaveJSONObject    .setString("tagMuseumNameAltStringList"         + j, exhibitionObjectList.get(i).tagMuseumNameAltStringList.get(j));    }
        exhibitionSaveJSONArrayObject                   .setJSONObject  (i, exhibitionSaveJSONObject);
    }
    for(int i = 0; i < playerObjectList.size(); i ++){
        playerSaveJSONObject = new JSONObject();
        for(int j = 0; j < playerObjectList.get(i).adjectiveCurrentPrevTagStringList                    .size(); j ++){ playerSaveJSONObject.setString  ("adjectiveCurrentPrevTagStringList"                    + j, playerObjectList.get(i).adjectiveCurrentPrevTagStringList                  .get(j)); }
        for(int j = 0; j < playerObjectList.get(i).adverbCurrentPrevTagStringList                       .size(); j ++){ playerSaveJSONObject.setString  ("adverbCurrentPrevTagStringList"                       + j, playerObjectList.get(i).adverbCurrentPrevTagStringList                     .get(j)); }
        for(int j = 0; j < playerObjectList.get(i).exhibitionTagCounterList                             .size(); j ++){ playerSaveJSONObject.setInt     ("exhibitionTagCounterListTagCounterInt"                + j, playerObjectList.get(i).exhibitionTagCounterList                           .get(j).tagCounterInt);     }
        for(int j = 0; j < playerObjectList.get(i).exhibitionTagCounterList                             .size(); j ++){ playerSaveJSONObject.setString  ("exhibitionTagCounterListNamAltString"                 + j, playerObjectList.get(i).exhibitionTagCounterList                           .get(j).tagNameAltString);  }
        for(int j = 0; j < playerObjectList.get(i).exhibitionTagCounterList                             .size(); j ++){ playerSaveJSONObject.setString  ("exhibitionTagCounterListNameFullString"               + j, playerObjectList.get(i).exhibitionTagCounterList                           .get(j).tagNameFullString); }
        for(int j = 0; j < playerObjectList.get(i).exhibitionTargetNameAltStringList                    .size(); j ++){ playerSaveJSONObject.setString  ("exhibitionTargetNameAltStringList"                    + j, playerObjectList.get(i).exhibitionTargetNameAltStringList                  .get(j)); }
        for(int j = 0; j < playerObjectList.get(i).exhibitionVisitedNameAltStringList                   .size(); j ++){ playerSaveJSONObject.setString  ("exhibitionVisitedNameAltStringList"                   + j, playerObjectList.get(i).exhibitionVisitedNameAltStringList                 .get(j)); }
        for(int j = 0; j < playerObjectList.get(i).explanationStringList                                .size(); j ++){ playerSaveJSONObject.setString  ("explanationStringList"                                + j, playerObjectList.get(i).explanationStringList                              .get(j)); }
        for(int j = 0; j < playerObjectList.get(i).intransitiveVerb1CurrentPrevTagStringList            .size(); j ++){ playerSaveJSONObject.setString  ("intransitiveVerb1CurrentPrevTagStringList"            + j, playerObjectList.get(i).intransitiveVerb1CurrentPrevTagStringList          .get(j)); }
        for(int j = 0; j < playerObjectList.get(i).intransitiveVerb1CurrentPrevTagStringList            .size(); j ++){ playerSaveJSONObject.setString  ("intransitiveVerb1CurrentPrevTagStringList"            + j, playerObjectList.get(i).intransitiveVerb1CurrentPrevTagStringList          .get(j)); }
        for(int j = 0; j < playerObjectList.get(i).intransitiveVerb2CurrentPrevTagStringList            .size(); j ++){ playerSaveJSONObject.setString  ("intransitiveVerb2CurrentPrevTagStringList"            + j, playerObjectList.get(i).intransitiveVerb2CurrentPrevTagStringList          .get(j)); }
        for(int j = 0; j < playerObjectList.get(i).intransitiveVerb2CurrentPrevTagStringList            .size(); j ++){ playerSaveJSONObject.setString  ("intransitiveVerb2CurrentPrevTagStringList"            + j, playerObjectList.get(i).intransitiveVerb2CurrentPrevTagStringList          .get(j)); }
        for(int j = 0; j < playerObjectList.get(i).intransitiveVerb3CurrentPrevTagStringList            .size(); j ++){ playerSaveJSONObject.setString  ("intransitiveVerb3CurrentPrevTagStringList"            + j, playerObjectList.get(i).intransitiveVerb3CurrentPrevTagStringList          .get(j)); }
        for(int j = 0; j < playerObjectList.get(i).intransitiveVerb3CurrentPrevTagStringList            .size(); j ++){ playerSaveJSONObject.setString  ("intransitiveVerb3CurrentPrevTagStringList"            + j, playerObjectList.get(i).intransitiveVerb3CurrentPrevTagStringList          .get(j)); }
        for(int j = 0; j < playerObjectList.get(i).intransitiveVerbIngCurrentPrevTagStringList          .size(); j ++){ playerSaveJSONObject.setString  ("intransitiveVerbIngCurrentPrevTagStringList"          + j, playerObjectList.get(i).intransitiveVerbIngCurrentPrevTagStringList        .get(j)); }
        for(int j = 0; j < playerObjectList.get(i).intransitiveVerbIngCurrentPrevTagStringList          .size(); j ++){ playerSaveJSONObject.setString  ("intransitiveVerbIngCurrentPrevTagStringList"          + j, playerObjectList.get(i).intransitiveVerbIngCurrentPrevTagStringList        .get(j)); }
        for(int j = 0; j < playerObjectList.get(i).intransitiveVerbSCurrentPrevTagStringList            .size(); j ++){ playerSaveJSONObject.setString  ("intransitiveVerbSCurrentPrevTagStringList"            + j, playerObjectList.get(i).intransitiveVerbSCurrentPrevTagStringList          .get(j)); }
        for(int j = 0; j < playerObjectList.get(i).intransitiveVerbSCurrentPrevTagStringList            .size(); j ++){ playerSaveJSONObject.setString  ("intransitiveVerbSCurrentPrevTagStringList"            + j, playerObjectList.get(i).intransitiveVerbSCurrentPrevTagStringList          .get(j)); }
        for(int j = 0; j < playerObjectList.get(i).negativeAdjectiveCurrentPrevTagStringList            .size(); j ++){ playerSaveJSONObject.setString  ("negativeAdjectiveCurrentPrevTagStringList"            + j, playerObjectList.get(i).negativeAdjectiveCurrentPrevTagStringList          .get(j)); }
        for(int j = 0; j < playerObjectList.get(i).negativeAdverbCurrentPrevTagStringList               .size(); j ++){ playerSaveJSONObject.setString  ("negativeAdverbCurrentPrevTagStringList"               + j, playerObjectList.get(i).negativeAdverbCurrentPrevTagStringList             .get(j)); }
        for(int j = 0; j < playerObjectList.get(i).negativeTransitiveVerb1CurrentPrevTagStringList      .size(); j ++){ playerSaveJSONObject.setString  ("negativeTransitiveVerb1CurrentPrevTagStringList"      + j, playerObjectList.get(i).negativeTransitiveVerb1CurrentPrevTagStringList    .get(j)); }
        for(int j = 0; j < playerObjectList.get(i).negativeTransitiveVerb1CurrentPrevTagStringList      .size(); j ++){ playerSaveJSONObject.setString  ("negativeTransitiveVerb1CurrentPrevTagStringList"      + j, playerObjectList.get(i).negativeTransitiveVerb1CurrentPrevTagStringList    .get(j)); }
        for(int j = 0; j < playerObjectList.get(i).negativeTransitiveVerb2CurrentPrevTagStringList      .size(); j ++){ playerSaveJSONObject.setString  ("negativeTransitiveVerb2CurrentPrevTagStringList"      + j, playerObjectList.get(i).negativeTransitiveVerb2CurrentPrevTagStringList    .get(j)); }
        for(int j = 0; j < playerObjectList.get(i).negativeTransitiveVerb2CurrentPrevTagStringList      .size(); j ++){ playerSaveJSONObject.setString  ("negativeTransitiveVerb2CurrentPrevTagStringList"      + j, playerObjectList.get(i).negativeTransitiveVerb2CurrentPrevTagStringList    .get(j)); }
        for(int j = 0; j < playerObjectList.get(i).negativeTransitiveVerb3CurrentPrevTagStringList      .size(); j ++){ playerSaveJSONObject.setString  ("negativeTransitiveVerb3CurrentPrevTagStringList"      + j, playerObjectList.get(i).negativeTransitiveVerb3CurrentPrevTagStringList    .get(j)); }
        for(int j = 0; j < playerObjectList.get(i).negativeTransitiveVerb3CurrentPrevTagStringList      .size(); j ++){ playerSaveJSONObject.setString  ("negativeTransitiveVerb3CurrentPrevTagStringList"      + j, playerObjectList.get(i).negativeTransitiveVerb3CurrentPrevTagStringList    .get(j)); }
        for(int j = 0; j < playerObjectList.get(i).negativeTransitiveVerbIngCurrentPrevTagStringList    .size(); j ++){ playerSaveJSONObject.setString  ("negativeTransitiveVerbIngCurrentPrevTagStringList"    + j, playerObjectList.get(i).negativeTransitiveVerbIngCurrentPrevTagStringList  .get(j)); }
        for(int j = 0; j < playerObjectList.get(i).negativeTransitiveVerbIngCurrentPrevTagStringList    .size(); j ++){ playerSaveJSONObject.setString  ("negativeTransitiveVerbIngCurrentPrevTagStringList"    + j, playerObjectList.get(i).negativeTransitiveVerbIngCurrentPrevTagStringList  .get(j)); }
        for(int j = 0; j < playerObjectList.get(i).negativeTransitiveVerbSCurrentPrevTagStringList      .size(); j ++){ playerSaveJSONObject.setString  ("negativeTransitiveVerbSCurrentPrevTagStringList"      + j, playerObjectList.get(i).negativeTransitiveVerbSCurrentPrevTagStringList    .get(j)); }
        for(int j = 0; j < playerObjectList.get(i).negativeTransitiveVerbSCurrentPrevTagStringList      .size(); j ++){ playerSaveJSONObject.setString  ("negativeTransitiveVerbSCurrentPrevTagStringList"      + j, playerObjectList.get(i).negativeTransitiveVerbSCurrentPrevTagStringList    .get(j)); }
        for(int j = 0; j < playerObjectList.get(i).nounAbstractCurrentPrevTagStringList                 .size(); j ++){ playerSaveJSONObject.setString  ("nounAbstractCurrentPrevTagStringList"                 + j, playerObjectList.get(i).nounAbstractCurrentPrevTagStringList               .get(j)); }
        for(int j = 0; j < playerObjectList.get(i).nounAbstractSCurrentPrevTagStringList                .size(); j ++){ playerSaveJSONObject.setString  ("nounAbstractSCurrentPrevTagStringList"                + j, playerObjectList.get(i).nounAbstractSCurrentPrevTagStringList              .get(j)); }
        for(int j = 0; j < playerObjectList.get(i).nounCurrentPrevTagStringList                         .size(); j ++){ playerSaveJSONObject.setString  ("nounCurrentPrevTagStringList"                         + j, playerObjectList.get(i).nounCurrentPrevTagStringList                       .get(j)); }
        for(int j = 0; j < playerObjectList.get(i).nounSCurrentPrevTagStringList                        .size(); j ++){ playerSaveJSONObject.setString  ("nounSCurrentPrevTagStringList"                        + j, playerObjectList.get(i).nounSCurrentPrevTagStringList                      .get(j)); }
        for(int j = 0; j < playerObjectList.get(i).playerSiblingObjectList                              .size(); j ++){ playerSaveJSONObject.setInt     ("playerSiblingObjectList"                              + j, playerObjectList.get(i).playerSiblingObjectList                            .get(j).playerIndexInt);    }
        for(int j = 0; j < playerObjectList.get(i).sentenceStringList                                   .size(); j ++){ playerSaveJSONObject.setString  ("sentenceStringList"                                   + j, playerObjectList.get(i).sentenceStringList                                 .get(j)); }
        for(int j = 0; j < playerObjectList.get(i).subjectCurrentPrevTagStringList                      .size(); j ++){ playerSaveJSONObject.setString  ("subjectCurrentPrevTagStringList"                      + j, playerObjectList.get(i).subjectCurrentPrevTagStringList                    .get(j)); }
        for(int j = 0; j < playerObjectList.get(i).transitiveVerb1CurrentPrevTagStringList              .size(); j ++){ playerSaveJSONObject.setString  ("transitiveVerb1CurrentPrevTagStringList"              + j, playerObjectList.get(i).transitiveVerb1CurrentPrevTagStringList            .get(j)); }
        for(int j = 0; j < playerObjectList.get(i).transitiveVerb2CurrentPrevTagStringList              .size(); j ++){ playerSaveJSONObject.setString  ("transitiveVerb2CurrentPrevTagStringList"              + j, playerObjectList.get(i).transitiveVerb2CurrentPrevTagStringList            .get(j)); }
        for(int j = 0; j < playerObjectList.get(i).transitiveVerb3CurrentPrevTagStringList              .size(); j ++){ playerSaveJSONObject.setString  ("transitiveVerb3CurrentPrevTagStringList"              + j, playerObjectList.get(i).transitiveVerb3CurrentPrevTagStringList            .get(j)); }
        for(int j = 0; j < playerObjectList.get(i).transitiveVerbIngCurrentPrevTagStringList            .size(); j ++){ playerSaveJSONObject.setString  ("transitiveVerbIngCurrentPrevTagStringList"            + j, playerObjectList.get(i).transitiveVerbIngCurrentPrevTagStringList          .get(j)); }
        for(int j = 0; j < playerObjectList.get(i).transitiveVerbSCurrentPrevTagStringList              .size(); j ++){ playerSaveJSONObject.setString  ("transitiveVerbSCurrentPrevTagStringList"              + j, playerObjectList.get(i).transitiveVerbSCurrentPrevTagStringList            .get(j)); }
        playerSaveJSONObject        .setBoolean                     ("playerFinishedBoolean"                , playerObjectList.get(i).playerFinishedBoolean                 );
        playerSaveJSONObject        .setBoolean                     ("playerVisitCorrectExhibitionBoolean"  , playerObjectList.get(i).playerVisitCorrectExhibitionBoolean   );
        playerSaveJSONObject        .setInt                         ("playerIndexInt"                       , playerObjectList.get(i).playerIndexInt                        );
        playerSaveJSONObject        .setInt                         ("playerMovementModeInt"                , playerObjectList.get(i).playerMovementModeInt                 );
        playerSaveJSONObject        .setInt                         ("playerScoreInt"                       , playerObjectList.get(i).playerScoreInt                        );
        playerSaveJSONObject        .setInt                         ("playerSiblingIndexInt"                , playerObjectList.get(i).playerSiblingIndexInt                 );
        playerSaveJSONObject        .setString                      ("exhibitionCurrentString"              , playerObjectList.get(i).exhibitionCurrentString               );
        playerSaveJSONObject        .setString                      ("playerNameString"                     , playerObjectList.get(i).playerNameString                      );
        playerSaveJSONArrayObject   .setJSONObject                  (i                                      , playerSaveJSONObject);
    }
    saveJSONArray(adjectiveTagSaveJSONArrayObject,                  "data/adjectiveTag.json"                    );
    saveJSONArray(adverbTagSaveJSONArrayObject,                     "data/adverbTag.json"                       );
    saveJSONArray(exhibitionSaveJSONArrayObject,                    "data/exhibition.json"                      );
    saveJSONArray(floorSaveJSONArrayObject,                         "data/floor.json"                           );
    saveJSONArray(intransitiveVerbTagSaveJSONArrayObject,           "data/intransitiveVerbTag.json"             );
    saveJSONArray(negativeAdjectiveTagSaveJSONArrayObject,          "data/negativeAdjectiveTag.json"            );
    saveJSONArray(negativeAdverbTagSaveJSONArrayObject,             "data/negativeAdverbTag.json"               );
    saveJSONArray(negativeIntransitiveVerbTagSaveJSONArrayObject,   "data/negativeIntransitiveVerbTag.json"     );
    saveJSONArray(negativeTransitiveVerbTagSaveJSONArrayObject,     "data/negativeTransitiveVerbTag.json"       );
    saveJSONArray(nounTagSaveJSONArrayObject,                       "data/nounTag.json"                         );
    saveJSONArray(nounAbstractTagSaveJSONArrayObject,               "data/nounAbstractTag.json"                 );
    saveJSONArray(playerSaveJSONArrayObject,                        "data/player.json"                          );
    saveJSONArray(roomSaveJSONArrayObject,                          "data/room.json"                            );
    saveJSONArray(subjectTagSaveJSONArrayObject,                    "data/subjectTag.json"                      );
    saveJSONArray(transitiveVerbTagSaveJSONArrayObject,             "data/transitiveVerbTag.json"               );

}

/*A function to set if there is at least one button in open state.*/
boolean SetButtonOpenCloseBoolean(){

    if(buttonOpenCloseMuseumObject.isButtonOpenBoolean == true || buttonOpenClosePlayerObject.isButtonOpenBoolean == true)  { buttonOpenCloseBoolean = true ; }
    else                                                                                                                    { buttonOpenCloseBoolean = false; }
    return buttonOpenCloseBoolean;

}

float ButtonOpenCloseAnimatingFloat(

    boolean         _buttonOpenCloseBoolean ,
    boolean         _isAnimatingBoolean     ,
    float           _alphaFloat             ,
    CColor          _defaultCColorObject    ,
    CColor          _floorCColorObject      ,
    CColor          _roomCColorObject       ,
    CColor          _exhibitionCColorObject ,
    ScrollableList  _scrollableList

){

    /*Invert the state of when button is open or close.
    I am not really sure why I need to invert the boolean while it is supposed
        to work even without inverting the value.
    So when the buttonOpenCloseObject.isButtonOpenBoolean is true the button is actually closed.
    And when the buttonOpenCloseObject.isButtonOpenBoolean is false the button is actually open.*/
    /*When the button is animating (fade in - fade out).*/
    if(_isAnimatingBoolean == true ){

        /*For closing animation.*/
        if(_buttonOpenCloseBoolean == true ){
            
            /*Set the color according to the caption title.*/
            ColorControlVoid(_floorCColorObject, _roomCColorObject, _exhibitionCColorObject, _scrollableList);
            /*Show the scrollable list.*/
            _scrollableList.setColor(_defaultCColorObject).show();
            /*Decrease the opacity value over time.*/
            _alphaFloat -= (255f/45f);

        }
        /*For opening animation.*/
        else if(_buttonOpenCloseBoolean == false){
            
            /*Set the color according to the caption title.*/
            ColorControlVoid(_floorCColorObject, _roomCColorObject, _exhibitionCColorObject, _scrollableList);
            /*Show the scrollable list.*/
            _scrollableList.setColor(_defaultCColorObject).show();
            /*Increase the opacity value over time.*/
            _alphaFloat += (255f/45f);

        }

    }
    /*When the button is not animating.*/
    else if(_isAnimatingBoolean == false){

        /*When the button is not animating and the button is close.*/
        if(_buttonOpenCloseBoolean == true ){

            /*Set the color according to the caption title.*/
            ColorControlVoid(_floorCColorObject, _roomCColorObject, _exhibitionCColorObject, _scrollableList);
            /*Show the scrollable list.*/
            _scrollableList     .show();
            /*Set the alpha value of this scrollable list to one tick before it goes full opacity.*/
            _alphaFloat         = (255f - (255f/45f));

        }
        /*When the button is not animating and the button is open.*/
        else if(_buttonOpenCloseBoolean == false){

            /*Hide the scrollable list.*/
            _scrollableList     .hide();
            /*Set the alpha value of this scrollable list to one tick before it goes invisible.*/
            _alphaFloat         = (255f/45f);

        }

    }

    return _alphaFloat;

}

float ScrollableDrawFloat(

    float           _alphaFloat             ,
    int             _xInt                   ,
    int             _yInt                   ,
    ButtonOpenClose _buttonOpenCloseObject  ,
    ScrollableList  _scrollableList

){


    /*Determine color for each possible buttons.*/
    CColor  defaultCColorObject             = new CColor();                     /*Color for default ubuttons scrollable list.*/
    CColor  floorCColorObject               = new CColor();                     /*Color for floor buttons scrollable list.*/
    CColor  roomCColorObject                = new CColor();                     /*Color for room buttons scrollable list.*/
    CColor  exhibitionCColorObject          = new CColor();                     /*Color for exhibition buttons scrollable list.*/
            defaultCColorObject
                .setActive                  (color(0    , 116   , 217   , _alphaFloat))
                .setBackground              (color(0    , 45    , 90    , _alphaFloat))
                .setCaptionLabel            (color(255  , 255   , 255   , _alphaFloat))
                .setForeground              (color(0    , 116   , 217   , _alphaFloat))
                .setValueLabel              (color(255  , 255   , 255   , _alphaFloat));
            floorCColorObject
                .setActive                  (color(0    , 45    , 90    , _alphaFloat))
                .setBackground              (color(0    , 45    , 90    , _alphaFloat))
                .setForeground              (color(0    , 116   , 217   , _alphaFloat));
            roomCColorObject
                .setActive                  (color(0    , 95    , 140   , _alphaFloat))
                .setBackground              (color(0    , 95    , 140   , _alphaFloat))
                .setForeground              (color(0    , 126   , 227   , _alphaFloat));
            exhibitionCColorObject
                .setActive                  (color(0    , 145   , 190   , _alphaFloat))
                .setBackground              (color(0    , 145   , 190   , _alphaFloat))
                .setForeground              (color(0    , 136   , 237   , _alphaFloat));
/*Update the open and close button.
    The two parameters is the position of the open and close button.*/
    _buttonOpenCloseObject          .DrawVoid(_xInt, _yInt);
    /*If statements to control animation event of the open close buttons.
    Like here, for example I want to hide() and show the dropdown menu based on
        the corresponding open close button.
    The thing to mention here is that the animation need to finished first before another event executed.
    If statment while the animation is still going.*/
    if(_buttonOpenCloseObject.isAnimatingBoolean == true ){

        _alphaFloat = ButtonOpenCloseAnimatingFloat(

            _buttonOpenCloseObject.isButtonOpenBoolean  ,
            _buttonOpenCloseObject.isAnimatingBoolean   ,
            _alphaFloat                                 ,
            defaultCColorObject                         ,
            floorCColorObject                           ,
            roomCColorObject                            ,
            exhibitionCColorObject                      ,
            _scrollableList

        );

    }
    /*If statement when the animation is stopped playing.*/
    else if(_buttonOpenCloseObject.isAnimatingBoolean == false){

        _alphaFloat = ButtonOpenCloseAnimatingFloat(

            _buttonOpenCloseObject.isButtonOpenBoolean  ,
            _buttonOpenCloseObject.isAnimatingBoolean   ,
            _alphaFloat                                 ,
            defaultCColorObject                         ,
            floorCColorObject                           ,
            roomCColorObject                            ,
            exhibitionCColorObject                      ,
            _scrollableList

        );

    }

    return _alphaFloat;

}

/*Neat function to calculate text height.
PENDING: This function has no use anymore.*/
int CalculateTextHeightInt(

    String  _contentString      ,
    int     _specificWidthInt   ,
    int     _lineSpacingInt

){

    float       textHeightFloat         ;
    int         numLineInt          = 0 ;
    String[]    wordStringArray         ;
    String      tempString          = ""; 

    wordStringArray                 = split(_contentString, " ");

    for(int i = 0; i < wordStringArray.length; i ++){

        if  (textWidth(tempString + wordStringArray[i]) < _specificWidthInt)    { tempString += wordStringArray    + " "; }
        else                                                                    { tempString  = wordStringArray[i] + " "; numLineInt ++;}

    }

    numLineInt        ++;
   
    textHeightFloat   = numLineInt * (textDescent() + textAscent() + _lineSpacingInt);
    return            (round(textHeightFloat));

}

/*Simple function to return an index number of museum object within their own list.*/
int FindObjectMuseumIndexInt(

    String              _targetString                    ,
    List<ObjectMuseum>  _targetObjectList

){

    for(int i = 0; i < _targetObjectList.size(); i ++){

        if(_targetObjectList.get(i).nameAltString .equals(_targetString)){ return i; }
        if(_targetObjectList.get(i).nameFullString.equals(_targetString)){ return i; }

    }
    return -1;

}

int GetBiggestPlayerIndexInt(){

    int tempBiggestIndexInt = 0;
    for(int i = 0; i < playerObjectList.size(); i ++){

        if(playerObjectList.get(i).playerIndexInt > tempBiggestIndexInt){ tempBiggestIndexInt = playerObjectList.get(i).playerIndexInt; }

    }
    return tempBiggestIndexInt;

}

/*Create a function to add museum object.*/
ObjectMuseum AddMuseumObject(

    String      _nameAltString              ,
    String      _nameFullString             ,
    String      _parentNameAltString        ,
    String      _typeString                 ,
    String[]    _explanationStringArray     ,
    Tag[]       _tagObjectArray

){

    /*Create temporary list for object that we want to make, its list, and its parent list.*/
    List<ObjectMuseum>  museumObjectList            = new ArrayList<ObjectMuseum>();
    List<ObjectMuseum>  parentMuseumObjectList      = new ArrayList<ObjectMuseum>();
    ObjectMuseum        museumObject                = new ObjectMuseum(new Name(_nameAltString, _nameFullString), _parentNameAltString, _typeString, _explanationStringArray, _tagObjectArray);

    /*If statement to determine which List we should put in.*/
    if      (_typeString.equals("FLR")){

        museumObjectList                = floorObjectList;
        floorNameAltStringList          .add(museumObject.nameAltString );
        floorNameFullStringList         .add(museumObject.nameFullString);

    }
    else if (_typeString.equals("ROM")){

        museumObjectList                = roomObjectList;
        parentMuseumObjectList          = floorObjectList;
        roomNameAltStringList           .add(museumObject.nameAltString );
        roomNameFullStringList          .add(museumObject.nameFullString);

    }
    else if (_typeString.equals("EXH")){

        museumObjectList                = exhibitionObjectList;
        parentMuseumObjectList          = roomObjectList;
        exhibitionNameAltStringList     .add(museumObject.nameAltString );
        exhibitionNameFullStringList    .add(museumObject.nameFullString);

    }

    /*Assign the object into the object List and the String List.*/
    museumObjectList                    .add(museumObject);

    /*If other than floor object we also need to determine the parent object.*/
    if(!_typeString.equals("FLR")){

        parentMuseumObjectList  .get(FindObjectMuseumIndexInt(_parentNameAltString, parentMuseumObjectList)).SetChildObjectList(museumObjectList);
        museumObject            .SetInitialParentObject(parentMuseumObjectList);

    }

    /*Re - adjust all the index of this object that we just created.*/
    museumObject                .SetIndexInsideVoid();
    /*Reset the display of the exhibition scrollable list.*/
    museumNameAltStringList     = new ArrayList<String>(floorNameAltStringList );
    museumNameFullStringList    = new ArrayList<String>(floorNameFullStringList);

    addPlayerGroupGUIObject.addPlayerGroupPickExhibitionStartScrollableListObject   .setItems(museumNameFullStringList);
    selectMuseumObjectScrollableListObject                                          .setItems(museumNameFullStringList);

    return                      museumObject;

}

ObjectMuseum FindMuseumObject(String _objectNameString){

    ObjectMuseum tempMuseumObject = null;
    for(int i = 0; i < floorObjectList          .size(); i ++){
        if(floorObjectList                      .get(i).nameAltString   .equals(_objectNameString)){ tempMuseumObject = floorObjectList         .get(i); }
        if(floorObjectList                      .get(i).nameFullString  .equals(_objectNameString)){ tempMuseumObject = floorObjectList         .get(i); }
    }
    for(int i = 0; i < roomObjectList           .size(); i ++){
        if(roomObjectList                       .get(i).nameAltString   .equals(_objectNameString)){ tempMuseumObject = roomObjectList          .get(i); }
        if(roomObjectList                       .get(i).nameFullString  .equals(_objectNameString)){ tempMuseumObject = roomObjectList          .get(i); }
    }
    for(int i = 0; i < exhibitionObjectList     .size(); i ++){
        if(exhibitionObjectList                 .get(i).nameAltString   .equals(_objectNameString)){ tempMuseumObject = exhibitionObjectList    .get(i); }
        if(exhibitionObjectList                 .get(i).nameFullString  .equals(_objectNameString)){ tempMuseumObject = exhibitionObjectList    .get(i); }
    }
    return tempMuseumObject;

}

ObjectPlayer FindPlayerObject(int _playerIndexInt){
    ObjectPlayer                                        tempPlayerObject = null;
    for(int i = 0; i < playerObjectList.size(); i ++)   { if(playerObjectList.get(i).playerIndexInt == _playerIndexInt){ tempPlayerObject = playerObjectList.get(i); } }
    return                                              tempPlayerObject;
}
    
Tag FindTagObject(String _tagNameString){

    Tag tempTagObject = null;
    for(int i = 0; i < subjectTagObjectList.size(); i ++){

        if(subjectTagObjectList                     .get(i).tagNameAltString   .equals(_tagNameString)){ tempTagObject = subjectTagObjectList                    .get(i); }
        if(subjectTagObjectList                     .get(i).tagNameFullString  .equals(_tagNameString)){ tempTagObject = subjectTagObjectList                    .get(i); }

    }
    for(int i = 0; i < intransitiveVerbTagObjectList.size(); i ++){

        if(intransitiveVerbTagObjectList            .get(i).tagNameAltString   .equals(_tagNameString)){ tempTagObject = intransitiveVerbTagObjectList           .get(i); }
        if(intransitiveVerbTagObjectList            .get(i).tagNameFullString  .equals(_tagNameString)){ tempTagObject = intransitiveVerbTagObjectList           .get(i); }

    }
    for(int i = 0; i < transitiveVerbTagObjectList.size(); i ++){

        if(transitiveVerbTagObjectList              .get(i).tagNameAltString   .equals(_tagNameString)){ tempTagObject = transitiveVerbTagObjectList             .get(i); }
        if(transitiveVerbTagObjectList              .get(i).tagNameFullString  .equals(_tagNameString)){ tempTagObject = transitiveVerbTagObjectList             .get(i); }

    }
    for(int i = 0; i < negativeIntransitiveVerbTagObjectList.size(); i ++){

        if(negativeIntransitiveVerbTagObjectList    .get(i).tagNameAltString   .equals(_tagNameString)){ tempTagObject = negativeIntransitiveVerbTagObjectList   .get(i); }
        if(negativeIntransitiveVerbTagObjectList    .get(i).tagNameFullString  .equals(_tagNameString)){ tempTagObject = negativeIntransitiveVerbTagObjectList   .get(i); }

    }
    for(int i = 0; i < negativeTransitiveVerbTagObjectList.size(); i ++){

        if(negativeTransitiveVerbTagObjectList      .get(i).tagNameAltString   .equals(_tagNameString)){ tempTagObject = negativeTransitiveVerbTagObjectList     .get(i); }
        if(negativeTransitiveVerbTagObjectList      .get(i).tagNameFullString  .equals(_tagNameString)){ tempTagObject = negativeTransitiveVerbTagObjectList     .get(i); }

    }
    for(int i = 0; i < nounAbstractTagObjectList.size(); i ++){

        if(nounAbstractTagObjectList                .get(i).tagNameAltString   .equals(_tagNameString)){ tempTagObject = nounAbstractTagObjectList              .get(i); }
        if(nounAbstractTagObjectList                .get(i).tagNameFullString  .equals(_tagNameString)){ tempTagObject = nounAbstractTagObjectList              .get(i); }

    }
    for(int i = 0; i < nounTagObjectList.size(); i ++){

        if(nounTagObjectList                        .get(i).tagNameAltString   .equals(_tagNameString)){ tempTagObject = nounTagObjectList                       .get(i); }
        if(nounTagObjectList                        .get(i).tagNameFullString  .equals(_tagNameString)){ tempTagObject = nounTagObjectList                       .get(i); }

    }
    for(int i = 0; i < adjectiveTagObjectList.size(); i ++){

        if(adjectiveTagObjectList                   .get(i).tagNameAltString   .equals(_tagNameString)){ tempTagObject = adjectiveTagObjectList                  .get(i); }
        if(adjectiveTagObjectList                   .get(i).tagNameFullString  .equals(_tagNameString)){ tempTagObject = adjectiveTagObjectList                  .get(i); }

    }
    for(int i = 0; i < negativeAdjectiveTagObjectList.size(); i ++){

        if(negativeAdjectiveTagObjectList           .get(i).tagNameAltString   .equals(_tagNameString)){ tempTagObject = negativeAdjectiveTagObjectList          .get(i); }
        if(negativeAdjectiveTagObjectList           .get(i).tagNameFullString  .equals(_tagNameString)){ tempTagObject = negativeAdjectiveTagObjectList          .get(i); }

    }
    for(int i = 0; i < adverbTagObjectList.size(); i ++){

        if(adverbTagObjectList                      .get(i).tagNameAltString   .equals(_tagNameString)){ tempTagObject = adverbTagObjectList                     .get(i); }
        if(adverbTagObjectList                      .get(i).tagNameFullString  .equals(_tagNameString)){ tempTagObject = adverbTagObjectList                     .get(i); }

    }
    for(int i = 0; i < negativeAdverbTagObjectList.size(); i ++){

        if(negativeAdverbTagObjectList              .get(i).tagNameAltString   .equals(_tagNameString)){ tempTagObject = negativeAdverbTagObjectList             .get(i); }
        if(negativeAdverbTagObjectList              .get(i).tagNameFullString  .equals(_tagNameString)){ tempTagObject = negativeAdverbTagObjectList             .get(i); }

    }
    return tempTagObject;

}

/*
<<A function to return an array of object tag to be put in the museum object, randomly.>>
Tag[] AssignRandomTagArray(List<Tag> _tagObjectList){

    <<Temporary tag object list to be returned later on this function.>>
    List<Tag> assignTagObjectList                   = new ArrayList<Tag>();
    
    <<This function need to be atleast gives three tags to a museum object.
    After three tags is inside the List then we can randomly add another tag with a chance.
    The thing is that every tag added the chance of another tag will be added/pushed
        is lower.>>
    float randomChanceFloat                         = 1f;
    while(

        (assignTagObjectList.size() <= 3) ||
        (Math.random() < randomChanceFloat)

    ){

        <<Need to make sure the inputted random tag is not something that is already in the museum object
        Create a temporary tag object to hold.>>
        int randomIndexInt  = (int)((Math.random()*_tagObjectList.size()) + 0);
        Tag tagObject       = _tagObjectList.get(randomIndexInt);
        
        <<Keep looping over and over until the random index is not a tag that is already in the list.>>
        for(int i = 0; i < assignTagObjectList.size(); i ++){

            <<If the random tag is already inside the museum object then we need to iterate again to get new random tag
                generated.>>
            while(assignTagObjectList.get(i) == tagObject){
                
                randomIndexInt  = (int)((Math.random()*_tagObjectList.size()) + 0);
                tagObject       = _tagObjectList.get(randomIndexInt);
                
            }

        }
        
        <<If the assignTagObjectList has three or more elements then we need to start reducing the changce.>>
        if(assignTagObjectList.size() > 3){ randomChanceFloat -= 0.2f; }
        
        <<Add/push a tag object into the temporary list.>>
        assignTagObjectList.add(tagObject);

    }
    
    <<Before returning the value, the object here is still in List, hence we need to convert it to array.
    Thus, it can be used in params.>>
    Tag[] assignTagObjectArray                      = new Tag[assignTagObjectList.size()];
    for(int i = 0; i < assignTagObjectArray.length; i ++){ assignTagObjectArray[i] = assignTagObjectList.get(i); }
    
    return assignTagObjectArray;

}*/
/*A function to return an array of object tag to be put in the museum object, randomly.*/
Tag[] AssignRandomTagArray(

    List<Tag> _adjectiveTagObjectList                   ,
    List<Tag> _adverbTagObjectList                      ,
    List<Tag> _intransitiveVerbTagObjectList            ,
    List<Tag> _negativeAdjectiveTagObjectList           ,
    List<Tag> _negativeAdverbTagObjectList              ,
    List<Tag> _negativeIntransitiveVerbTagObjectList    ,
    List<Tag> _negativeTransitiveVerbTagObjectList      ,
    List<Tag> _nounAbstractTagObjectList                ,
    List<Tag> _nounTagObjectList                        ,
    List<Tag> _subjectTagObjectList                     ,
    List<Tag> _transitiveVerbTagObjectList

){

    /*Temporary tag object list to be returned later on this function.*/
    List<Tag>               assignTagObjectList                         = new ArrayList<Tag>();
    AssignRandomTagLoopVoid (_adjectiveTagObjectList                    , assignTagObjectList);
    AssignRandomTagLoopVoid (_adverbTagObjectList                       , assignTagObjectList);
    AssignRandomTagLoopVoid (_intransitiveVerbTagObjectList             , assignTagObjectList);
    AssignRandomTagLoopVoid (_negativeAdjectiveTagObjectList            , assignTagObjectList);
    AssignRandomTagLoopVoid (_negativeAdverbTagObjectList               , assignTagObjectList);
    AssignRandomTagLoopVoid (_negativeIntransitiveVerbTagObjectList     , assignTagObjectList);
    AssignRandomTagLoopVoid (_negativeTransitiveVerbTagObjectList       , assignTagObjectList);
    AssignRandomTagLoopVoid (_nounAbstractTagObjectList                 , assignTagObjectList);
    AssignRandomTagLoopVoid (_nounTagObjectList                         , assignTagObjectList);
    AssignRandomTagLoopVoid (_subjectTagObjectList                      , assignTagObjectList);
    AssignRandomTagLoopVoid (_transitiveVerbTagObjectList               , assignTagObjectList);
    /*Before returning the value, the object here is still in List, hence we need to convert it to array.
    Thus, it can be used in params.*/
    Tag[]   assignTagObjectArray                                = new Tag[assignTagObjectList.size()];
    for     (int i = 0; i < assignTagObjectArray.length; i ++)  { assignTagObjectArray[i] = assignTagObjectList.get(i); }
    return  assignTagObjectArray;

}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//START//Controller's Related Functions.////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



void SetupGUIVoid(){

    cp5Object       = new ControlP5(this);
    buttonSizeInt   = ((width > height) ? ((width*15)/512) : ((height*15)/512)                  );
    menuWidthInt    = ((width/3)                                                                );
    menuHeightInt   = ( height  - (guiLayoutOffsetInt*2) - ((buttonSizeInt/2)*2)                      );
    leftMenuXInt    = (            guiLayoutOffsetInt    +  (buttonSizeInt/2)                         );
    rightMenuXInt   = ( width   -  guiLayoutOffsetInt    -  (buttonSizeInt/2)        - menuWidthInt   );
    menuYInt        = (            guiLayoutOffsetInt    +  (buttonSizeInt/2)                         );

    museumNameAltStringList                     = new ArrayList<String>(floorNameAltStringList );                                                           /*PENDING: This variable is actually has no use anymore, delete this and everything related when you have time.*/
    museumNameFullStringList                    = new ArrayList<String>(floorNameFullStringList);                                                           /*Set the initial items for scrollable list of museum object.                                                  */

    selectMuseumObjectScrollableListObject      =
        cp5Object   .addScrollableList          ("SelectMuseumObjectScrollableListObject")
                    .hide                       ()
                    .setLabel                   ("SELECT MUSEUM OBJECT:")
                    .setItems                   (museumNameFullStringList)
                    .setPosition                (rightMenuXInt, menuYInt)
                    .setSize                    (menuWidthInt, menuHeightInt)
                    .setItemHeight(20)
                    .setBarHeight(20)
                    .setType                    (ControlP5.LIST);

    selectPlayerScrollableListObject            = 
        cp5Object   .addScrollableList          ("SelectPlayerScrollableListObject")
                    .hide                       ()
                    .setLabel                   ("SELECT VISITOR:")
                    .setItems                   (playerStringList)
                    .setPosition                (leftMenuXInt, menuYInt)
                    .setSize                    (menuWidthInt, menuHeightInt)
                    .setItemHeight(20)
                    .setBarHeight(20)
                    .setType                    (ControlP5.LIST);

    addMuseumGroupGUIObject                     = new AddMuseumGroupGUIObject       (rightMenuXInt, menuYInt, menuWidthInt, addMuseumGroupHeightInt     , this);
    addPlayerGroupGUIObject                     = new AddPlayerGroupGUIObject       (leftMenuXInt , menuYInt, menuWidthInt, addPlayerGroupHeightInt     , this);
    addTagGroupGUIObject                        = new AddTagGroupGUIObject          (rightMenuXInt, menuYInt, menuWidthInt, addTagGroupHeightInt        , this);
    editMuseumGroupGUIObject                    = new EditMuseumGroupGUIObject      (rightMenuXInt, menuYInt, menuWidthInt, editMuseumGroupHeightInt    , this);
    editPlayerGroupGUIObject                    = new EditPlayerGroupGUIObject      (leftMenuXInt , menuYInt, menuWidthInt, editPlayerGroupHeightInt    , this);
    editTagGroupGUIObject                       = new EditTagGroupGUIObject         (rightMenuXInt, menuYInt, menuWidthInt, editTagGroupHeightInt       , this);
    removeMuseumGroupGUIObject                  = new RemoveMuseumGroupGUIObject    (rightMenuXInt, menuYInt, menuWidthInt, removeMuseumGroupHeightInt  , this);
    removePlayerGroupGUIObject                  = new RemovePlayerGroupGUIObject    (leftMenuXInt , menuYInt, menuWidthInt, removePlayerGroupHeightInt  , this);
    removeTagGroupGUIObject                     = new RemoveTagGroupGUIObject       (rightMenuXInt, menuYInt, menuWidthInt, removeTagGroupHeightInt     , this);
    
    rightMenuAccordionObject                    =
        cp5Object   .addAccordion               ("RightMenuAccordionObject")
                    .addItem                    (addMuseumGroupGUIObject.addMuseumGroupObject)
                    .addItem                    (addTagGroupGUIObject.addTagGroupObject)
                    .addItem                    (editMuseumGroupGUIObject.editMuseumGroupObject)
                    .addItem                    (editTagGroupGUIObject.editTagGroupObject)
                    .addItem                    (removeMuseumGroupGUIObject.removeMuseumGroupObject)
                    .addItem                    (removeTagGroupGUIObject.removeTagGroupObject)
                    .setCollapseMode            (Accordion.SINGLE)
                    .setPosition                (rightMenuXInt, menuYInt)
                    .setWidth                   (menuWidthInt);
    leftMenuAccordionObject                     =
        cp5Object   .addAccordion               ("LeftMenuAccordionObject")
                    .addItem                    (addPlayerGroupGUIObject.addPlayerGroupObject)
                    .addItem                    (editPlayerGroupGUIObject.editPlayerGroupObject)
                    .addItem                    (removePlayerGroupGUIObject.removePlayerGroupObject)
                    .setCollapseMode            (Accordion.SINGLE)
                    .setPosition                (leftMenuXInt, menuYInt)
                    .setWidth                   (menuWidthInt);

    buttonOpenCloseMuseumObject                 = new ButtonOpenClose(buttonSizeInt);                                                                       /*Initiates button open close with size depends on the screen size.                                            */
    buttonOpenClosePlayerObject                 = new ButtonOpenClose(buttonSizeInt);                                                                       /*Initiates button open close with size depends on the screen size.                                            */

}

void DrawGUIVoid(){

    dropdownMObjectAlphaFloat               = ScrollableDrawFloat(dropdownMObjectAlphaFloat , (width - guiLayoutOffsetInt), guiLayoutOffsetInt, buttonOpenCloseMuseumObject, selectMuseumObjectScrollableListObject );
    dropdownPlayerAlphaFloat                = ScrollableDrawFloat(dropdownPlayerAlphaFloat  , guiLayoutOffsetInt          , guiLayoutOffsetInt, buttonOpenClosePlayerObject, selectPlayerScrollableListObject       );
    addMuseumGroupGUIObject                 .DrawVoid(dropdownMObjectAlphaFloat);
    addPlayerGroupGUIObject                 .DrawVoid(dropdownPlayerAlphaFloat );
    addTagGroupGUIObject                    .DrawVoid(dropdownMObjectAlphaFloat);
    editMuseumGroupGUIObject                .DrawVoid(dropdownMObjectAlphaFloat);
    editPlayerGroupGUIObject                .DrawVoid(dropdownPlayerAlphaFloat );
    editTagGroupGUIObject                   .DrawVoid(dropdownMObjectAlphaFloat);
    removeMuseumGroupGUIObject              .DrawVoid(dropdownMObjectAlphaFloat);
    removePlayerGroupGUIObject              .DrawVoid(dropdownPlayerAlphaFloat );
    removeTagGroupGUIObject                 .DrawVoid(dropdownMObjectAlphaFloat);

    if      (addMuseumGroupGUIObject        .addMuseumGroupObject       .isOpen() == true)  { selectMuseumObjectScrollableListObject  .setPosition(rightMenuXInt, menuYInt + 1 + 509); selectMuseumObjectScrollableListObject   .setHeight(height - (buttonSizeInt*2) - 1 - 509); }
    else if (addTagGroupGUIObject           .addTagGroupObject          .isOpen() == true)  { selectMuseumObjectScrollableListObject  .setPosition(rightMenuXInt, menuYInt + 1 + 304); selectMuseumObjectScrollableListObject   .setHeight(height - (buttonSizeInt*2) - 1 - 304); }
    else if (editMuseumGroupGUIObject       .editMuseumGroupObject      .isOpen() == true)  { selectMuseumObjectScrollableListObject  .setPosition(rightMenuXInt, menuYInt + 1 + 159); selectMuseumObjectScrollableListObject   .setHeight(height - (buttonSizeInt*2) - 1 - 159); }
    else if (editTagGroupGUIObject          .editTagGroupObject         .isOpen() == true)  { selectMuseumObjectScrollableListObject  .setPosition(rightMenuXInt, menuYInt + 1 + 304); selectMuseumObjectScrollableListObject   .setHeight(height - (buttonSizeInt*2) - 1 - 304); }
    else if (removeMuseumGroupGUIObject     .removeMuseumGroupObject    .isOpen() == true)  { selectMuseumObjectScrollableListObject  .setPosition(rightMenuXInt, menuYInt + 1 + 159); selectMuseumObjectScrollableListObject   .setHeight(height - (buttonSizeInt*2) - 1 - 159); }
    else if (removeTagGroupGUIObject        .removeTagGroupObject       .isOpen() == true)  { selectMuseumObjectScrollableListObject  .setPosition(rightMenuXInt, menuYInt + 1 + 159); selectMuseumObjectScrollableListObject   .setHeight(height - (buttonSizeInt*2) - 1 - 159); }
    else                                                                                    { selectMuseumObjectScrollableListObject  .setPosition(rightMenuXInt, menuYInt + 1 + 59 ); selectMuseumObjectScrollableListObject   .setHeight(height - (buttonSizeInt*2) - 1 - 59 ); }

    if      (addPlayerGroupGUIObject        .addPlayerGroupObject       .isOpen() == true)  { selectPlayerScrollableListObject        .setPosition(leftMenuXInt , menuYInt + 1 + 173); selectPlayerScrollableListObject         .setHeight(height - (buttonSizeInt*2) - 1 - 173); }
    else if (editPlayerGroupGUIObject       .editPlayerGroupObject      .isOpen() == true)  { selectPlayerScrollableListObject        .setPosition(leftMenuXInt , menuYInt + 1 + 477); selectPlayerScrollableListObject         .setHeight(height - (buttonSizeInt*2) - 1 - 477); }
    else if (removePlayerGroupGUIObject     .removePlayerGroupObject    .isOpen() == true)  { selectPlayerScrollableListObject        .setPosition(leftMenuXInt , menuYInt + 1 + 133); selectPlayerScrollableListObject         .setHeight(height - (buttonSizeInt*2) - 1 - 133); }
    else                                                                                    { selectPlayerScrollableListObject        .setPosition(leftMenuXInt , menuYInt + 1 + 29 ); selectPlayerScrollableListObject         .setHeight(height - (buttonSizeInt*2) - 1 - 29 ); }
    
    

}



//////////////////////////////////////////////////////////////////////////////////////////////////// 
//START//SelectMuseumObject Controller's Functions./////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
/*This function is to control what will happen when mouse pointer clicked above the active element of scrollable button.*/
void SelectMuseumObjectScrollableListObject (int _indexInt){

    List<ObjectMuseum>                  tempSelectedMuseumObjectList        = new ArrayList<ObjectMuseum>();                                                                    /*This is a list to hold the selected object list. For example FLR_001 is selected, then this variable will be filled with floorObjectList.                         */
    List<String>                        museumStringList                    = new ArrayList<String>();
    ObjectMuseum                        tempSelectedMuseumObject            = null;                                                                                             /*This is the selected museum object. From here this application will try to modify the selected museum objects values.                                             */
    String                              itemScrollableString                = selectMuseumObjectScrollableListObject.getItem(_indexInt).get("text").toString();                       /*This String is for holding the name of the selected button.                                                                                                       */
    String                              tempTypeString                      = "";                                                                                               /*Take the first three characters so that this application can know which can of object is selected. Alternatively you can search over selected object type String. */
    if                                  (FindObjectMuseumIndexInt           (itemScrollableString, floorObjectList)        != -1){ tempTypeString = "FLR";    }
    else if                             (FindObjectMuseumIndexInt           (itemScrollableString, roomObjectList)         != -1){ tempTypeString = "ROM";    }
    else if                             (FindObjectMuseumIndexInt           (itemScrollableString, exhibitionObjectList)   != -1){ tempTypeString = "EXH";    }
    int                                 selectedMuseumIndexInt              = -1;                                                                                               /*The selected index of the selected object in its object list.*/

    museumStringList                    = museumNameFullStringList;

    /*We assign the selected museum object list according to the temporary type String.*/
    if     (tempTypeString.equals("FLR")){ tempSelectedMuseumObjectList         = floorObjectList;          }
    else if(tempTypeString.equals("ROM")){ tempSelectedMuseumObjectList         = roomObjectList;           }
    else if(tempTypeString.equals("EXH")){ tempSelectedMuseumObjectList         = exhibitionObjectList;     }

    /*The for loop below is for assigning which museum object is actually selected*/
    for(int i = 0; i < museumStringList.size(); i ++){

        /*Compare every possible String in the museum String list with the selected scrollable String.*/
        if(museumStringList.get(i)                                          == itemScrollableString){

            /*If the String match we will take the index of name of the object inside the museum String list.*/
            for(int j = 0; j < tempSelectedMuseumObjectList.size(); j ++)       {

                /*Iterate once more to to find the named object inside its object list.
                After this done, we get access to the object local and public variables and functions.*/
                if(tempSelectedMuseumObjectList.get(j).nameFullString           == museumStringList.get(i)){ tempSelectedMuseumObject = tempSelectedMuseumObjectList.get(j); }

            }

            /*Return the object index inside the museum String list.
            This variable is for determining the layout later on within the scrollable dropdown list.*/
            selectedMuseumIndexInt                                          = i + 1;

        }

    }
    /*After we get the "selected object" object.
    We will revert its active boolean variable.
    We will keep reverting this for everytime the selected object is clicked.*/
    tempSelectedMuseumObject.activeBoolean                                      = !tempSelectedMuseumObject.activeBoolean;

    /*If the selected museum object active boolean is true then add all of its children (if any) to the scrollable drop list.*/
    if     (tempSelectedMuseumObject.activeBoolean == true){

        /*Iterate all children objects and add all of it to the museum String list.
        We need to set (delete the previous ones and initiate the new ones) the children to the museum String list according to the index
            position of the parent in the museum String list.*/
        for(

           int i    = tempSelectedMuseumObject.childObjectList.size() - 1;
           i        >= 0;
           i        --

        ){

            museumNameAltStringList .add(selectedMuseumIndexInt, tempSelectedMuseumObject.childObjectList.get(i).nameAltString );
            museumNameFullStringList.add(selectedMuseumIndexInt, tempSelectedMuseumObject.childObjectList.get(i).nameFullString);

        }
        /*Set the items into the scrollable list.*/
        selectMuseumObjectScrollableListObject.setItems(museumStringList);

    }
    /*If the selected museum object active boolean is false then remove all of its children from the museum String List and the scrollable list.*/
    else if(tempSelectedMuseumObject.activeBoolean == false){

        /*If close the floor we must carefully close the inner most button, in this case it is the exhibition buttons.
        We need to close the room buttons and then loop again to close the exhibition buttons.*/
        if(tempTypeString.equals("FLR")){

            for(int i = 0; i < tempSelectedMuseumObject.childObjectList.size(); i ++){

                for(int j = 0; j < tempSelectedMuseumObject.childObjectList.get(i).childObjectList.size(); j ++){

                    for(int k = 0; k < museumStringList.size(); k ++){

                        boolean tempBoolean = true;
                                tempBoolean = museumStringList.get(k).equals(tempSelectedMuseumObject.childObjectList.get(i).childObjectList.get(j).nameFullString);
                        if(tempBoolean){

                            tempSelectedMuseumObject.childObjectList.get(i).childObjectList.get(j).activeBoolean = false;
                            selectMuseumObjectScrollableListObject.removeItem(tempSelectedMuseumObject.childObjectList.get(i).childObjectList.get(j).nameFullString);
                            museumNameAltStringList .remove(k);
                            museumNameFullStringList.remove(k);
                            k --;

                        }

                    }

                }

                for(int j = 0; j < museumStringList.size(); j ++){

                    boolean tempBoolean = true;  
                            tempBoolean = museumStringList.get(j).equals(tempSelectedMuseumObject.childObjectList.get(i).nameFullString);
                    if(tempBoolean){

                        tempSelectedMuseumObject.childObjectList.get(i).activeBoolean = false;
                        selectMuseumObjectScrollableListObject.removeItem(tempSelectedMuseumObject.childObjectList.get(i).nameFullString);
                        museumNameAltStringList .remove(j);
                        museumNameFullStringList.remove(j);
                        j --;

                    }

                }

            }

        }
        /*If the button is not a floor button then we do not need to iterate deeper.*/
        else{

            for(int i = 0; i < tempSelectedMuseumObject.childObjectList.size(); i ++){

                for(int j = 0; j < museumStringList.size(); j ++){

                    boolean tempBoolean = true;  
                            tempBoolean = museumStringList.get(j).equals(tempSelectedMuseumObject.childObjectList.get(i).nameFullString);
                    if(tempBoolean){

                        tempSelectedMuseumObject.childObjectList.get(i).activeBoolean = false;
                        selectMuseumObjectScrollableListObject.removeItem(tempSelectedMuseumObject.childObjectList.get(i).nameFullString);
                        museumNameAltStringList .remove(j);
                        museumNameFullStringList.remove(j);
                        j --;

                    }

                }

            }

        /*God bless these curly braces.*/

        }

    }

}
////////////////////////////////////////////////////////////////////////////////////////////////////
//END//SelectMuseumObject Controller's Functions.///////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////




//////////////////////////////////////////////////////////////////////////////////////////////////// 
//START//SelectPlayerScrollableList Controller's Functions./////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
/*This function is to control player scrollable list.*/
void SelectPlayerScrollableListObject       (int _indexInt){

    editPlayerGroupGUIObject.tempSelectedPlayerObject                           = playerObjectList.get(_indexInt);                                                          /*Assign the selected player.                               */
    editPlayerGroupGUIObject.editPlayerGroupPlayerNameTextfieldObject           .setText ((editPlayerGroupGUIObject.tempSelectedPlayerObject.playerNameString));
    editPlayerGroupGUIObject.editPlayerGroupPlayerModeValueRadioButtonObject    .activate((editPlayerGroupGUIObject.tempSelectedPlayerObject.playerMovementModeInt - 1));   /*Assign the mode of selected player into the radio button. */

}
//////////////////////////////////////////////////////////////////////////////////////////////////// 
//END//SelectPlayerScrollableList Controller's Functions.///////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////



//////////////////////////////////////////////////////////////////////////////////////////////////// 
//START//AddMuseumGroupGUIObject.pde Controller's Functions.////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
/*Set what kind of museum object the user will make.*/
void AddMuseumGroupSelectTypeMuseumObjectScrollableListObject                   (int _indexInt) {

    /*Take the full name type of object museum that the user will make.*/
    addMuseumGroupGUIObject.tempSelectedTypeObjectMuseumNameFullString                      = addMuseumGroupGUIObject.addMuseumGroupSelectTypeMuseumObjectScrollableListObject.getItem(_indexInt).get("text").toString();
    /*Convert the object museum type name full into object museum type name alternate name.*/
    if      (addMuseumGroupGUIObject.tempSelectedTypeObjectMuseumNameFullString             .equals("Floor"         ))  {
        addMuseumGroupGUIObject.tempSelectedTypeObjectMuseumNameAltString                   = "FLR";
        addMuseumGroupGUIObject.addMuseumGroupSelectParentMuseumObjectScrollableListObject  .setItems(defaultStringList);
    }
    else if (addMuseumGroupGUIObject.tempSelectedTypeObjectMuseumNameFullString             .equals("Room"          ))  {
        addMuseumGroupGUIObject.tempSelectedTypeObjectMuseumNameAltString                   = "ROM";
        addMuseumGroupGUIObject.addMuseumGroupSelectParentMuseumObjectScrollableListObject  .setItems(floorNameFullStringList);
    }
    else if (addMuseumGroupGUIObject.tempSelectedTypeObjectMuseumNameFullString             .equals("Exhibition"    ))  {
        addMuseumGroupGUIObject.tempSelectedTypeObjectMuseumNameAltString                   = "EXH";
        addMuseumGroupGUIObject.addMuseumGroupSelectParentMuseumObjectScrollableListObject  .setItems(roomNameFullStringList);
    }

}
/*These functions is for assigning tags into museum object that the user will add.*/
void AddMuseumGroupSelectAdjectiveTagMuseumObjectScrollableListObject                   (int _indexInt) { addMuseumGroupGUIObject.CovertScrollableListIntoCheckListVoid(_indexInt, addMuseumGroupGUIObject.addMuseumGroupSelectAdjectiveTagMuseumObjectScrollableListObject                 ); addMuseumGroupGUIObject.tempSelectedTagNameFullStringList    = addMuseumGroupGUIObject.SetSelectedCheckListStringList(adjectiveTagNameFullStringList                 , addMuseumGroupGUIObject.tempSelectedTagNameFullStringList  , addMuseumGroupGUIObject.addMuseumGroupSelectAdjectiveTagMuseumObjectScrollableListObject                 ); }
void AddMuseumGroupSelectAdverbTagMuseumObjectScrollableListObject                      (int _indexInt) { addMuseumGroupGUIObject.CovertScrollableListIntoCheckListVoid(_indexInt, addMuseumGroupGUIObject.addMuseumGroupSelectAdverbTagMuseumObjectScrollableListObject                    ); addMuseumGroupGUIObject.tempSelectedTagNameFullStringList    = addMuseumGroupGUIObject.SetSelectedCheckListStringList(adverbTagNameFullStringList                    , addMuseumGroupGUIObject.tempSelectedTagNameFullStringList  , addMuseumGroupGUIObject.addMuseumGroupSelectAdverbTagMuseumObjectScrollableListObject                    ); }
void AddMuseumGroupSelectIntransitiveVerbTagMuseumObjectScrollableListObject            (int _indexInt) { addMuseumGroupGUIObject.CovertScrollableListIntoCheckListVoid(_indexInt, addMuseumGroupGUIObject.addMuseumGroupSelectIntransitiveVerbTagMuseumObjectScrollableListObject          ); addMuseumGroupGUIObject.tempSelectedTagNameFullStringList    = addMuseumGroupGUIObject.SetSelectedCheckListStringList(intransitiveVerbTagNameFullStringList          , addMuseumGroupGUIObject.tempSelectedTagNameFullStringList  , addMuseumGroupGUIObject.addMuseumGroupSelectIntransitiveVerbTagMuseumObjectScrollableListObject          ); }
void AddMuseumGroupSelectNegativeAdjectiveTagMuseumObjectScrollableListObject           (int _indexInt) { addMuseumGroupGUIObject.CovertScrollableListIntoCheckListVoid(_indexInt, addMuseumGroupGUIObject.addMuseumGroupSelectNegativeAdjectiveTagMuseumObjectScrollableListObject         ); addMuseumGroupGUIObject.tempSelectedTagNameFullStringList    = addMuseumGroupGUIObject.SetSelectedCheckListStringList(negativeAdjectiveTagNameFullStringList         , addMuseumGroupGUIObject.tempSelectedTagNameFullStringList  , addMuseumGroupGUIObject.addMuseumGroupSelectNegativeAdjectiveTagMuseumObjectScrollableListObject         ); }
void AddMuseumGroupSelectNegativeAdverbTagMuseumObjectScrollableListObject              (int _indexInt) { addMuseumGroupGUIObject.CovertScrollableListIntoCheckListVoid(_indexInt, addMuseumGroupGUIObject.addMuseumGroupSelectNegativeAdverbTagMuseumObjectScrollableListObject            ); addMuseumGroupGUIObject.tempSelectedTagNameFullStringList    = addMuseumGroupGUIObject.SetSelectedCheckListStringList(negativeAdverbTagNameFullStringList            , addMuseumGroupGUIObject.tempSelectedTagNameFullStringList  , addMuseumGroupGUIObject.addMuseumGroupSelectNegativeAdverbTagMuseumObjectScrollableListObject            ); }
void AddMuseumGroupSelectNegativeIntransitiveVerbTagMuseumObjectScrollableListObject    (int _indexInt) { addMuseumGroupGUIObject.CovertScrollableListIntoCheckListVoid(_indexInt, addMuseumGroupGUIObject.addMuseumGroupSelectNegativeIntransitiveVerbTagMuseumObjectScrollableListObject  ); addMuseumGroupGUIObject.tempSelectedTagNameFullStringList    = addMuseumGroupGUIObject.SetSelectedCheckListStringList(negativeIntransitiveVerbTagNameFullStringList  , addMuseumGroupGUIObject.tempSelectedTagNameFullStringList  , addMuseumGroupGUIObject.addMuseumGroupSelectNegativeIntransitiveVerbTagMuseumObjectScrollableListObject  ); }
void AddMuseumGroupSelectNegativeTransitiveVerbTagMuseumObjectScrollableListObject      (int _indexInt) { addMuseumGroupGUIObject.CovertScrollableListIntoCheckListVoid(_indexInt, addMuseumGroupGUIObject.addMuseumGroupSelectNegativeTransitiveVerbTagMuseumObjectScrollableListObject    ); addMuseumGroupGUIObject.tempSelectedTagNameFullStringList    = addMuseumGroupGUIObject.SetSelectedCheckListStringList(negativeTransitiveVerbTagNameFullStringList    , addMuseumGroupGUIObject.tempSelectedTagNameFullStringList  , addMuseumGroupGUIObject.addMuseumGroupSelectNegativeTransitiveVerbTagMuseumObjectScrollableListObject    ); }
void AddMuseumGroupSelectNounTagMuseumObjectScrollableListObject                        (int _indexInt) { addMuseumGroupGUIObject.CovertScrollableListIntoCheckListVoid(_indexInt, addMuseumGroupGUIObject.addMuseumGroupSelectNounTagMuseumObjectScrollableListObject                      ); addMuseumGroupGUIObject.tempSelectedTagNameFullStringList    = addMuseumGroupGUIObject.SetSelectedCheckListStringList(nounTagNameFullStringList                      , addMuseumGroupGUIObject.tempSelectedTagNameFullStringList  , addMuseumGroupGUIObject.addMuseumGroupSelectNounTagMuseumObjectScrollableListObject                      ); }
void AddMuseumGroupSelectNounAbstractTagMuseumObjectScrollableListObject                (int _indexInt) { addMuseumGroupGUIObject.CovertScrollableListIntoCheckListVoid(_indexInt, addMuseumGroupGUIObject.addMuseumGroupSelectNounAbstractTagMuseumObjectScrollableListObject              ); addMuseumGroupGUIObject.tempSelectedTagNameFullStringList    = addMuseumGroupGUIObject.SetSelectedCheckListStringList(nounAbstractTagNameFullStringList              , addMuseumGroupGUIObject.tempSelectedTagNameFullStringList  , addMuseumGroupGUIObject.addMuseumGroupSelectNounAbstractTagMuseumObjectScrollableListObject              ); }
void AddMuseumGroupSelectSubjectTagMuseumObjectScrollableListObject                     (int _indexInt) { addMuseumGroupGUIObject.CovertScrollableListIntoCheckListVoid(_indexInt, addMuseumGroupGUIObject.addMuseumGroupSelectSubjectTagMuseumObjectScrollableListObject                   ); addMuseumGroupGUIObject.tempSelectedTagNameFullStringList    = addMuseumGroupGUIObject.SetSelectedCheckListStringList(subjectTagNameFullStringList                   , addMuseumGroupGUIObject.tempSelectedTagNameFullStringList  , addMuseumGroupGUIObject.addMuseumGroupSelectSubjectTagMuseumObjectScrollableListObject                   ); }
void AddMuseumGroupSelectTransitiveVerbTagMuseumObjectScrollableListObject              (int _indexInt) { addMuseumGroupGUIObject.CovertScrollableListIntoCheckListVoid(_indexInt, addMuseumGroupGUIObject.addMuseumGroupSelectTransitiveVerbTagMuseumObjectScrollableListObject            ); addMuseumGroupGUIObject.tempSelectedTagNameFullStringList    = addMuseumGroupGUIObject.SetSelectedCheckListStringList(transitiveVerbTagNameFullStringList            , addMuseumGroupGUIObject.tempSelectedTagNameFullStringList  , addMuseumGroupGUIObject.addMuseumGroupSelectTransitiveVerbTagMuseumObjectScrollableListObject            ); }
/*A function to set the full name of parent object.*/
void AddMuseumGroupSelectParentMuseumObjectScrollableListObject                         (int _indexInt) {

    addMuseumGroupGUIObject.tempSelectedParentNameFullString        = addMuseumGroupGUIObject.addMuseumGroupSelectParentMuseumObjectScrollableListObject.getItem(_indexInt).get("text").toString();
    addMuseumGroupGUIObject.tempSelectedParentNameAltString         = FindMuseumObject(addMuseumGroupGUIObject.tempSelectedParentNameFullString).nameAltString;

}
/*Add new museum object with all collected property values.*/
void AddMuseumGroupAddMuseumObjectButtonObject                                          (int _indexInt) {

    String          tempNameAltString                   = addMuseumGroupGUIObject.addMuseumGroupNameAltMuseumObjectTextfieldObject  .getText();                         /*Get the   alternate  name for the new museum object that the user will add.     */
    String          tempNameFullString                  = addMuseumGroupGUIObject.addMuseumGroupNameFullMuseumObjectTextfieldObject .getText();                         /*Get the   full       name for the new museum object that the user will add.     */
    String          tempParentNameAltString             = addMuseumGroupGUIObject.tempSelectedParentNameAltString;                                                      /*Parent    alt        name for the new museum object that the user will add.     */
    String          tempTypeObjectMuseumNameAltString   = addMuseumGroupGUIObject.tempSelectedTypeObjectMuseumNameAltString;                                            /*Type      alternate  name for the new museum object that the user will add.     */
    String          tempExplanation1String              = addMuseumGroupGUIObject.addMuseumGroupExplanation1TextfieldObject         .getText();
    String          tempExplanation2String              = addMuseumGroupGUIObject.addMuseumGroupExplanation2TextfieldObject         .getText();
    String          tempExplanation3String              = addMuseumGroupGUIObject.addMuseumGroupExplanation3TextfieldObject         .getText();
    String          tempExplanation4String              = addMuseumGroupGUIObject.addMuseumGroupExplanation4TextfieldObject         .getText();
    String[]        tempExplanationStringArray          = {

        tempExplanation1String,
        tempExplanation2String,
        tempExplanation3String,
        tempExplanation4String
        
    };
    List<String>    tempSelectedTagNameFullStringList   = addMuseumGroupGUIObject.tempSelectedTagNameFullStringList;                                                    /*Tags      full       name for the new museum object that the user will add.     */
    Tag[]           tempSelectedTagObjectArray          = new Tag[tempSelectedTagNameFullStringList.size()];                                                            /*Converted full name String List of Tag full name into an array of Tag object.   */
    
    /*Need to make sure that everything that is inputted into the new museum object is correct.*/
    if(

        (tempNameAltString                          != null || tempNameAltString                    != "") ||
        (tempNameFullString                         != null || tempNameFullString                   != "") ||
        (tempParentNameAltString                    != null || tempParentNameAltString              != "") ||
        (tempTypeObjectMuseumNameAltString          != null || tempTypeObjectMuseumNameAltString    != "") ||
        (tempExplanation1String                     != null || tempExplanation1String               != "") ||
        (tempExplanation2String                     != null || tempExplanation2String               != "") ||
        (tempExplanation3String                     != null || tempExplanation3String               != "") ||
        (tempExplanation4String                     != null || tempExplanation4String               != "") ||
        (tempSelectedTagNameFullStringList.size()   >  0)

    ){

        for(int i = 0; i < tempSelectedTagNameFullStringList.size(); i ++)  { tempSelectedTagObjectArray[i] = FindTagObject(tempSelectedTagNameFullStringList.get(i)); }            /*Convert   full name String List of Tag full name into an array of Tag object. */
        if (tempTypeObjectMuseumNameAltString.equals("FLR"))                { tempParentNameAltString = "XXX_XXX";                                                     }            /*If the object that will be added is a floor object, then set the  alternate parent name into XXX_XXX.*/

        /*
        println(tempNameAltString                   );
        println(tempNameFullString                  );
        println(tempParentNameAltString             );
        println(tempTypeObjectMuseumNameAltString   );
        println(tempExplanationStringArray          );
        println(tempSelectedTagObjectArray          );
        */

        AddMuseumObject(tempNameAltString, tempNameFullString, tempParentNameAltString, tempTypeObjectMuseumNameAltString, tempExplanationStringArray, tempSelectedTagObjectArray);

    }
    
    /*After getting all processing done and the museum object is added, reset all value.
    PENDING: The display were not actually set back off.
    addMuseumGroupGUIObject.tempSelectedParentNameAltString             = "";
    addMuseumGroupGUIObject.tempSelectedParentNameFullString            = "";
    addMuseumGroupGUIObject.tempSelectedTypeObjectMuseumNameAltString   = "";
    addMuseumGroupGUIObject.tempSelectedTypeObjectMuseumNameFullString  = "";
    addMuseumGroupGUIObject.tempSelectedTagNameFullStringList.clear();
    */

}
////////////////////////////////////////////////////////////////////////////////////////////////////
//END//AddMuseumGroupGUIObject.pde Controller's Functions.//////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////



////////////////////////////////////////////////////////////////////////////////////////////////////
//START//AddTagGroupGUIObject.pde Controller's Functions.///////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
void AddTagGroupTagTypeNameFullScrollableListObject (int _indexInt){

    addTagGroupGUIObject.tempSelectedTagTypeNameFullString = addTagGroupGUIObject.addTagGroupTagTypeNameFullScrollableListObject.getItem(_indexInt).get("text").toString();

}
void AddTagGroupTagAddButtonObject                  (int _indexInt){

    String          tempTagNameAltString                = addTagGroupGUIObject.addTagGroupTagNameAltTextfieldObject                         .getText();
    String          tempTagNameFullString               = addTagGroupGUIObject.addTagGroupTagNameFullTextfieldObject                        .getText();
    String          tempTagTypeString                   = "";
    Tag             tempTagObject                       = null;
    List<Tag>       tempTagObjectList                   = null;
    List<String>    tempTagNameAltStringList            = null;
    List<String>    tempTagNameFullStringList           = null;


    if      (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("SUBJECT"))                      {

        tempTagTypeString                               = "SUB";
        tempTagObjectList                               = subjectTagObjectList;
        tempTagNameAltStringList                        = subjectTagNameAltStringList;
        tempTagNameFullStringList                       = subjectTagNameFullStringList;

        String tempSubjectString                        = addTagGroupGUIObject.addTagGroupTagSubjectTextfieldObject                         .getText();
        String tempSubjectPossesionString               = addTagGroupGUIObject.addTagGroupTagSubjectPossesionTextfieldObject                .getText();
        tempTagObject                                   = new Tag(new Name(tempTagNameAltString, tempTagNameFullString), tempTagTypeString, tempSubjectString, tempSubjectPossesionString);

    }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("INTRANSITIVE VERB"))            {

        tempTagTypeString                               = "IVR";
        tempTagObjectList                               = intransitiveVerbTagObjectList;
        tempTagNameAltStringList                        = intransitiveVerbTagNameAltStringList;
        tempTagNameFullStringList                       = intransitiveVerbTagNameFullStringList;

        String tempIntransitiveVerb1String              = addTagGroupGUIObject.addTagGroupTagIntransitiveVerb1TextfieldObject               .getText();
        String tempIntransitiveVerb2String              = addTagGroupGUIObject.addTagGroupTagIntransitiveVerb2TextfieldObject               .getText();
        String tempIntransitiveVerb3bString             = addTagGroupGUIObject.addTagGroupTagIntransitiveVerb3TextfieldObject               .getText();
        String tempIntransitiveVerbIngbString           = addTagGroupGUIObject.addTagGroupTagIntransitiveVerbIngTextfieldObject             .getText();
        String tempIntransitiveVerbSString              = addTagGroupGUIObject.addTagGroupTagIntransitiveVerbSTextfieldObject               .getText();
        tempTagObject                                   = new Tag(new Name(tempTagNameAltString, tempTagNameFullString), tempTagTypeString, tempIntransitiveVerb1String, tempIntransitiveVerb2String, tempIntransitiveVerb3bString, tempIntransitiveVerbIngbString, tempIntransitiveVerbSString);

    }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("NEGATIVE INTRANSITIVE VERB"))   {

        tempTagTypeString                               = "NIV";
        tempTagObjectList                               = negativeIntransitiveVerbTagObjectList;
        tempTagNameAltStringList                        = negativeIntransitiveVerbTagNameAltStringList;
        tempTagNameFullStringList                       = negativeIntransitiveVerbTagNameFullStringList;

        String tempNegativeIntransitiveVerb1String      = addTagGroupGUIObject.addTagGroupTagNegativeIntransitiveVerb1TextfieldObject       .getText();
        String tempNegativeIntransitiveVerb2String      = addTagGroupGUIObject.addTagGroupTagNegativeIntransitiveVerb2TextfieldObject       .getText();
        String tempNegativeIntransitiveVerb3bString     = addTagGroupGUIObject.addTagGroupTagNegativeIntransitiveVerb3TextfieldObject       .getText();
        String tempNegativeIntransitiveVerbIngbString   = addTagGroupGUIObject.addTagGroupTagNegativeIntransitiveVerbIngTextfieldObject     .getText();
        String tempNegativeIntransitiveVerbSString      = addTagGroupGUIObject.addTagGroupTagNegativeIntransitiveVerbSTextfieldObject       .getText();
        tempTagObject                                   = new Tag(new Name(tempTagNameAltString, tempTagNameFullString), tempTagTypeString, tempNegativeIntransitiveVerb1String, tempNegativeIntransitiveVerb2String, tempVer3bString, tempVerIngbString, tempNegativeIntransitiveVerbSString);

    }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("TRANSITIVE VERB"))              {

        tempTagTypeString                               = "TVR";
        tempTagObjectList                               = transitiveVerbTagObjectList;
        tempTagNameAltStringList                        = transitiveVerbTagNameAltStringList;
        tempTagNameFullStringList                       = transitiveVerbTagNameFullStringList;

        String tempTransitiveVerb1String                = addTagGroupGUIObject.addTagGroupTagTransitiveVerb1TextfieldObject                 .getText();
        String tempTransitiveVerb2String                = addTagGroupGUIObject.addTagGroupTagTransitiveVerb2TextfieldObject                 .getText();
        String tempTransitiveVerb3bString               = addTagGroupGUIObject.addTagGroupTagTransitiveVerb3TextfieldObject                 .getText();
        String tempTransitiveVerbIngbString             = addTagGroupGUIObject.addTagGroupTagTransitiveVerbIngTextfieldObject               .getText();
        String tempTransitiveVerbSString                = addTagGroupGUIObject.addTagGroupTagTransitiveVerbSTextfieldObject                 .getText();
        tempTagObject                                   = new Tag(new Name(tempTagNameAltString, tempTagNameFullString), tempTagTypeString, tempTransitiveVerb1String, tempTransitiveVerb2String, tempVer3bString, tempVerIngbString, tempTransitiveVerbSString);

    }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("NEGATIVE TRANSITIVE VERB"))     {

        tempTagTypeString                               = "NTV";
        tempTagObjectList                               = negativeTransitiveVerbTagObjectList;
        tempTagNameAltStringList                        = negativeTransitiveVerbTagNameAltStringList;
        tempTagNameFullStringList                       = negativeTransitiveVerbTagNameFullStringList;

        String tempNegativeTransitiveVerb1String        = addTagGroupGUIObject.addTagGroupTagNegativeTransitiveVerb1TextfieldObject         .getText();
        String tempNegativeTransitiveVerb2String        = addTagGroupGUIObject.addTagGroupTagNegativeTransitiveVerb2TextfieldObject         .getText();
        String tempNegativeTransitiveVerb3bString       = addTagGroupGUIObject.addTagGroupTagNegativeTransitiveVerb3TextfieldObject         .getText();
        String tempNegativeTransitiveVerbIngbString     = addTagGroupGUIObject.addTagGroupTagNegativeTransitiveVerbIngTextfieldObject       .getText();
        String tempNegativeTransitiveVerbSString        = addTagGroupGUIObject.addTagGroupTagNegativeTransitiveVerbSTextfieldObject         .getText();
        tempTagObject                                   = new Tag(new Name(tempTagNameAltString, tempTagNameFullString), tempTagTypeString, tempNegativeTransitiveVerb1String, tempNegativeTransitiveVerb2String, tempVer3bString, tempVerIngbString, tempNegativeTransitiveVerbSString);

    }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("NOUN ABSTRACT"))                {

        tempTagTypeString                               = "NOA";
        tempTagObjectList                               = nounAbstractTagObjectList;
        tempTagNameAltStringList                        = nounAbstractTagNameAltStringList;
        tempTagNameFullStringList                       = nounAbstractTagNameFullStringList;

        String tempNounAbstractString                   = addTagGroupGUIObject.addTagGroupTagNounAbstractTextfieldObject                    .getText();
        String tempNounAbstractSString                  = addTagGroupGUIObject.addTagGroupTagNounAbstractSTextfieldObject                   .getText();
        tempTagObject                                   = new Tag(new Name(tempTagNameAltString, tempTagNameFullString), tempTagTypeString, tempNounAbstractString, tempNounAbstractSString);


    }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("NOUN"))                         {

        tempTagTypeString                               = "NOU";
        tempTagObjectList                               = nounTagObjectList;
        tempTagNameAltStringList                        = nounTagNameAltStringList;
        tempTagNameFullStringList                       = nounTagNameFullStringList;

        String tempNounString                           = addTagGroupGUIObject.addTagGroupTagNounTextfieldObject                            .getText();
        String tempNounSString                          = addTagGroupGUIObject.addTagGroupTagNounSTextfieldObject                           .getText();
        tempTagObject                                   = new Tag(new Name(tempTagNameAltString, tempTagNameFullString), tempTagTypeString, tempNounString, tempNounSString);


    }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("ADJECTIVE"))                    {

        tempTagTypeString                               = "ADJ";
        tempTagObjectList                               = adjectiveTagObjectList;
        tempTagNameAltStringList                        = adjectiveTagNameAltStringList;
        tempTagNameFullStringList                       = adjectiveTagNameFullStringList;

        String tempAdjectiveString                      = addTagGroupGUIObject.addTagGroupTagAdjectiveTextfieldObject                       .getText();
        tempTagObject                                   = new Tag(new Name(tempTagNameAltString, tempTagNameFullString), tempTagTypeString, tempAdjectiveString);


    }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("NEGATIVE ADJECTIVE"))           {

        tempTagTypeString                               = "NDJ";
        tempTagObjectList                               = negativeAdjectiveTagObjectList;
        tempTagNameAltStringList                        = negativeAdjectiveTagNameAltStringList;
        tempTagNameFullStringList                       = negativeAdjectiveTagNameFullStringList;

        String tempNegativeAdjectiveString              = addTagGroupGUIObject.addTagGroupTagNegativeAdjectiveTextfieldObject               .getText();
        tempTagObject                                   = new Tag(new Name(tempTagNameAltString, tempTagNameFullString), tempTagTypeString, tempNegativeAdjectiveString);


    }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("ADVERB"))                       {

        tempTagTypeString                               = "ADV";
        tempTagObjectList                               = adverbTagObjectList;
        tempTagNameAltStringList                        = adverbTagNameAltStringList;
        tempTagNameFullStringList                       = adverbTagNameFullStringList;

        String tempAdverbString                         = addTagGroupGUIObject.addTagGroupTagAdverbTextfieldObject                          .getText();
        tempTagObject                                   = new Tag(new Name(tempTagNameAltString, tempTagNameFullString), tempTagTypeString, tempAdverbString);


    }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("NEGATIVE ADVERB"))              {

        tempTagTypeString                               = "NDV";
        tempTagObjectList                               = negativeAdverbTagObjectList;
        tempTagNameAltStringList                        = negativeAdverbTagNameAltStringList;
        tempTagNameFullStringList                       = negativeAdverbTagNameFullStringList;

        String tempNegativeAdverbString                 = addTagGroupGUIObject.addTagGroupTagNegativeAdverbTextfieldObject                  .getText();
        tempTagObject                                   = new Tag(new Name(tempTagNameAltString, tempTagNameFullString), tempTagTypeString, tempNegativeAdverbString);

    }

    tempTagObjectList                           .add(tempTagObject);
    tempTagNameAltStringList                    .add(tempTagObject.nameAltString );
    tempTagNameFullStringList                   .add(tempTagObject.nameFullString);

    if      (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("SUBJECT"                        )){ addMuseumGroupGUIObject.addMuseumGroupSelectSubjectTagMuseumObjectScrollableListObject            .setItems(tempTagNameFullStringList); }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("INTRANSITIVE VERB"              )){ addMuseumGroupGUIObject.addMuseumGroupSelectVerbTagMuseumObjectScrollableListObject               .setItems(tempTagNameFullStringList); }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("NEGATIVE INTRANSITIVE VERB"     )){ addMuseumGroupGUIObject.addMuseumGroupSelectVerbTagMuseumObjectScrollableListObject               .setItems(tempTagNameFullStringList); }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("TRANSITIVE VERB"                )){ addMuseumGroupGUIObject.addMuseumGroupSelectVerbTagMuseumObjectScrollableListObject               .setItems(tempTagNameFullStringList); }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("NEGATIVE TRANSITIVE VERB"       )){ addMuseumGroupGUIObject.addMuseumGroupSelectVerbTagMuseumObjectScrollableListObject               .setItems(tempTagNameFullStringList); }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("NEGATIVE VERB"                  )){ addMuseumGroupGUIObject.addMuseumGroupSelectNegativeVerbTagMuseumObjectScrollableListObject       .setItems(tempTagNameFullStringList); }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("NOUN"                           )){ addMuseumGroupGUIObject.addMuseumGroupSelectNounTagMuseumObjectScrollableListObject               .setItems(tempTagNameFullStringList); }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("NOUN ABSTRACT"                  )){ addMuseumGroupGUIObject.addMuseumGroupSelectNounAbstractTagMuseumObjectScrollableListObject               .setItems(tempTagNameFullStringList); }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("ADJECTIVE"                      )){ addMuseumGroupGUIObject.addMuseumGroupSelectAdjectiveTagMuseumObjectScrollableListObject          .setItems(tempTagNameFullStringList); }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("NEGATIVE ADJECTIVE"             )){ addMuseumGroupGUIObject.addMuseumGroupSelectNegativeAdjectiveTagMuseumObjectScrollableListObject  .setItems(tempTagNameFullStringList); }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("ADVERB"                         )){ addMuseumGroupGUIObject.addMuseumGroupSelectAdverbTagMuseumObjectScrollableListObject             .setItems(tempTagNameFullStringList); }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("NEGATIVE ADVERB"                )){ addMuseumGroupGUIObject.addMuseumGroupSelectNegativeAdverbTagMuseumObjectScrollableListObject     .setItems(tempTagNameFullStringList); }
    
    editTagGroupGUIObject.tempTagNameFullStringList.clear();
    editTagGroupGUIObject.GenerateAllTagNameFullVoid();
    editTagGroupGUIObject.editTagGroupSelectTagScrollableListObject.setItems(editTagGroupGUIObject.tempTagNameFullStringList);

}
////////////////////////////////////////////////////////////////////////////////////////////////////
//END//AddTagGroupGUIObject.pde Controller's Functions./////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////



////////////////////////////////////////////////////////////////////////////////////////////////////
//START//EditTagGroupGUIObject.pde Controller's Functions.//////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
void EditMuseumGroupResetAllMuseumButtonObject      (int _indexInt){

    for(int i = 0; i < floorObjectList      .size(); i ++){ floorObjectList         .get(i).ResetVoid(); }
    for(int i = 0; i < roomObjectList       .size(); i ++){ roomObjectList          .get(i).ResetVoid(); }
    for(int i = 0; i < exhibitionObjectList .size(); i ++){ exhibitionObjectList    .get(i).ResetVoid(); }

}
////////////////////////////////////////////////////////////////////////////////////////////////////
//END//EditTagGroupGUIObject.pde Controller's Functions.////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////



////////////////////////////////////////////////////////////////////////////////////////////////////
//START//EditTagGroupGUIObject.pde Controller's Functions.//////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
void EditTagGroupSelectTagScrollableListObject(int _indexInt){

    String  tempSelectedTagNameFullString                       = editTagGroupGUIObject.editTagGroupSelectTagScrollableListObject.getItem(_indexInt).get("text").toString();
    Tag     tempSelectedTagObject                               = FindTagObject(tempSelectedTagNameFullString);
    editTagGroupGUIObject.tempSelectedTagObject                 = tempSelectedTagObject;
    String  tempSelectedTagTypeString                           = tempSelectedTagObject.tagTypeString;
    editTagGroupGUIObject.tempSelectedTagTypeString             = tempSelectedTagTypeString;

    if(tempSelectedTagObject != null){
        editTagGroupGUIObject                   .tempSelectedTagAdjectiveString                             = editTagGroupGUIObject.tempSelectedTagObject.tagAdjectiveString                    ;
        editTagGroupGUIObject                   .tempSelectedTagAdverbString                                = editTagGroupGUIObject.tempSelectedTagObject.tagAdverbString                       ;
        editTagGroupGUIObject                   .tempSelectedTagIntransitiveVerb1String                     = editTagGroupGUIObject.tempSelectedTagObject.tagIntransitiveVerb1String            ;
        editTagGroupGUIObject                   .tempSelectedTagIntransitiveVerb2String                     = editTagGroupGUIObject.tempSelectedTagObject.tagIntransitiveVerb2String            ;
        editTagGroupGUIObject                   .tempSelectedTagIntransitiveVerb3String                     = editTagGroupGUIObject.tempSelectedTagObject.tagIntransitiveVerb3String            ;
        editTagGroupGUIObject                   .tempSelectedTagIntransitiveVerbIngString                   = editTagGroupGUIObject.tempSelectedTagObject.tagIntransitiveVerbIngString          ;
        editTagGroupGUIObject                   .tempSelectedTagIntransitiveVerbSString                     = editTagGroupGUIObject.tempSelectedTagObject.tagIntransitiveVerbSString            ;
        editTagGroupGUIObject                   .tempSelectedTagNameAltString                               = editTagGroupGUIObject.tempSelectedTagObject.tagNameAltString                      ;
        editTagGroupGUIObject                   .tempSelectedTagNameFullString                              = editTagGroupGUIObject.tempSelectedTagObject.tagNameFullString                     ;
        editTagGroupGUIObject                   .tempSelectedTagNegativeAdjectiveString                     = editTagGroupGUIObject.tempSelectedTagObject.tagNegativeAdjectiveString            ;
        editTagGroupGUIObject                   .tempSelectedTagNegativeAdverbString                        = editTagGroupGUIObject.tempSelectedTagObject.tagNegativeAdverbString               ;
        editTagGroupGUIObject                   .tempSelectedTagNegativeIntransitiveVerb1String             = editTagGroupGUIObject.tempSelectedTagObject.tagNegativeIntransitiveVerb1String    ;
        editTagGroupGUIObject                   .tempSelectedTagNegativeIntransitiveVerb2String             = editTagGroupGUIObject.tempSelectedTagObject.tagNegativeIntransitiveVerb2String    ;
        editTagGroupGUIObject                   .tempSelectedTagNegativeIntransitiveVerb3String             = editTagGroupGUIObject.tempSelectedTagObject.tagNegativeIntransitiveVerb3String    ;
        editTagGroupGUIObject                   .tempSelectedTagNegativeIntransitiveVerbIngString           = editTagGroupGUIObject.tempSelectedTagObject.tagNegativeIntransitiveVerbIngString  ;
        editTagGroupGUIObject                   .tempSelectedTagNegativeIntransitiveVerbSString             = editTagGroupGUIObject.tempSelectedTagObject.tagNegativeIntransitiveVerbSString    ;
        editTagGroupGUIObject                   .tempSelectedTagNegativeTransitiveVerb1String               = editTagGroupGUIObject.tempSelectedTagObject.tagNegativeTransitiveVerb1String      ;
        editTagGroupGUIObject                   .tempSelectedTagNegativeTransitiveVerb2String               = editTagGroupGUIObject.tempSelectedTagObject.tagNegativeTransitiveVerb2String      ;
        editTagGroupGUIObject                   .tempSelectedTagNegativeTransitiveVerb3String               = editTagGroupGUIObject.tempSelectedTagObject.tagNegativeTransitiveVerb3String      ;
        editTagGroupGUIObject                   .tempSelectedTagNegativeTransitiveVerbIngString             = editTagGroupGUIObject.tempSelectedTagObject.tagNegativeTransitiveVerbIngString    ;
        editTagGroupGUIObject                   .tempSelectedTagNegativeTransitiveVerbSString               = editTagGroupGUIObject.tempSelectedTagObject.tagNegativeTransitiveVerbSString      ;
        editTagGroupGUIObject                   .tempSelectedTagNounAbstractSString                         = editTagGroupGUIObject.tempSelectedTagObject.tagNounAbstractSString                ;
        editTagGroupGUIObject                   .tempSelectedTagNounAbstractString                          = editTagGroupGUIObject.tempSelectedTagObject.tagNounAbstractString                 ;
        editTagGroupGUIObject                   .tempSelectedTagNounSString                                 = editTagGroupGUIObject.tempSelectedTagObject.tagNounSString                        ;
        editTagGroupGUIObject                   .tempSelectedTagNounString                                  = editTagGroupGUIObject.tempSelectedTagObject.tagNounString                         ;
        editTagGroupGUIObject                   .tempSelectedTagSubjectPossesionString                      = editTagGroupGUIObject.tempSelectedTagObject.tagSubjectPossesionString             ;
        editTagGroupGUIObject                   .tempSelectedTagSubjectString                               = editTagGroupGUIObject.tempSelectedTagObject.tagSubjectString                      ;
        editTagGroupGUIObject                   .tempSelectedTagTransitiveVerb1String                       = editTagGroupGUIObject.tempSelectedTagObject.tagTransitiveVerb1String              ;
        editTagGroupGUIObject                   .tempSelectedTagTransitiveVerb2String                       = editTagGroupGUIObject.tempSelectedTagObject.tagTransitiveVerb2String              ;
        editTagGroupGUIObject                   .tempSelectedTagTransitiveVerb3String                       = editTagGroupGUIObject.tempSelectedTagObject.tagTransitiveVerb3String              ;
        editTagGroupGUIObject                   .tempSelectedTagTransitiveVerbIngString                     = editTagGroupGUIObject.tempSelectedTagObject.tagTransitiveVerbIngString            ;
        editTagGroupGUIObject                   .tempSelectedTagTransitiveVerbSString                       = editTagGroupGUIObject.tempSelectedTagObject.tagTransitiveVerbSString              ;
        editTagGroupGUIObject                   .editTagGroupTagAdjectiveTextfieldObject                    .setText(editTagGroupGUIObject.tempSelectedTagAdjectiveString                       );
        editTagGroupGUIObject                   .editTagGroupTagAdverbTextfieldObject                       .setText(editTagGroupGUIObject.tempSelectedTagAdverbString                          );
        editTagGroupGUIObject                   .editTagGroupTagIntransitiveVerb1TextfieldObject            .setText(editTagGroupGUIObject.tempSelectedTagIntransitiveVerb1String               );
        editTagGroupGUIObject                   .editTagGroupTagIntransitiveVerb2TextfieldObject            .setText(editTagGroupGUIObject.tempSelectedTagIntransitiveVerb2String               );
        editTagGroupGUIObject                   .editTagGroupTagIntransitiveVerb3TextfieldObject            .setText(editTagGroupGUIObject.tempSelectedTagIntransitiveVerb3String               );
        editTagGroupGUIObject                   .editTagGroupTagIntransitiveVerbIngTextfieldObject          .setText(editTagGroupGUIObject.tempSelectedTagIntransitiveVerbIngString             );
        editTagGroupGUIObject                   .editTagGroupTagIntransitiveVerbSTextfieldObject            .setText(editTagGroupGUIObject.tempSelectedTagIntransitiveVerbSString               );
        editTagGroupGUIObject                   .editTagGroupTagNameAltTextfieldObject                      .setText(editTagGroupGUIObject.tempSelectedTagNameAltString                         );
        editTagGroupGUIObject                   .editTagGroupTagNameFullTextfieldObject                     .setText(editTagGroupGUIObject.tempSelectedTagNameFullString                        );
        editTagGroupGUIObject                   .editTagGroupTagNegativeAdjectiveTextfieldObject            .setText(editTagGroupGUIObject.tempSelectedTagNegativeAdjectiveString               );
        editTagGroupGUIObject                   .editTagGroupTagNegativeAdverbTextfieldObject               .setText(editTagGroupGUIObject.tempSelectedTagNegativeAdverbString                  );
        editTagGroupGUIObject                   .editTagGroupTagnegativeIntransitiveVerb1TextfieldObject    .setText(editTagGroupGUIObject.tempSelectedTagnegativeIntransitiveVerb1String       );
        editTagGroupGUIObject                   .editTagGroupTagnegativeIntransitiveVerb2TextfieldObject    .setText(editTagGroupGUIObject.tempSelectedTagnegativeIntransitiveVerb2String       );
        editTagGroupGUIObject                   .editTagGroupTagnegativeIntransitiveVerb3TextfieldObject    .setText(editTagGroupGUIObject.tempSelectedTagnegativeIntransitiveVerb3String       );
        editTagGroupGUIObject                   .editTagGroupTagnegativeIntransitiveVerbIngTextfieldObject  .setText(editTagGroupGUIObject.tempSelectedTagnegativeIntransitiveVerbIngString     );
        editTagGroupGUIObject                   .editTagGroupTagnegativeIntransitiveVerbSTextfieldObject    .setText(editTagGroupGUIObject.tempSelectedTagnegativeIntransitiveVerbSString       );
        editTagGroupGUIObject                   .editTagGroupTagNegativeTransitiveVerb1TextfieldObject      .setText(editTagGroupGUIObject.tempSelectedTagNegativeTransitiveVerb1String         );
        editTagGroupGUIObject                   .editTagGroupTagNegativeTransitiveVerb2TextfieldObject      .setText(editTagGroupGUIObject.tempSelectedTagNegativeTransitiveVerb2String         );
        editTagGroupGUIObject                   .editTagGroupTagNegativeTransitiveVerb3TextfieldObject      .setText(editTagGroupGUIObject.tempSelectedTagNegativeTransitiveVerb3String         );
        editTagGroupGUIObject                   .editTagGroupTagNegativeTransitiveVerbIngTextfieldObject    .setText(editTagGroupGUIObject.tempSelectedTagNegativeTransitiveVerbIngString       );
        editTagGroupGUIObject                   .editTagGroupTagNegativeTransitiveVerbSTextfieldObject      .setText(editTagGroupGUIObject.tempSelectedTagNegativeTransitiveVerbSString         );
        editTagGroupGUIObject                   .editTagGroupTagNounAbstractSTextfieldObject                .setText(editTagGroupGUIObject.tempSelectedTagNounAbstractSString                   );
        editTagGroupGUIObject                   .editTagGroupTagNounAbstractTextfieldObject                 .setText(editTagGroupGUIObject.tempSelectedTagNounAbstractString                    );
        editTagGroupGUIObject                   .editTagGroupTagNounSTextfieldObject                        .setText(editTagGroupGUIObject.tempSelectedTagNounSString                           );
        editTagGroupGUIObject                   .editTagGroupTagNounTextfieldObject                         .setText(editTagGroupGUIObject.tempSelectedTagNounString                            );
        editTagGroupGUIObject                   .editTagGroupTagSubjectPossesionTextfieldObject             .setText(editTagGroupGUIObject.tempSelectedTagSubjectPossesionString                );
        editTagGroupGUIObject                   .editTagGroupTagSubjectTextfieldObject                      .setText(editTagGroupGUIObject.tempSelectedTagSubjectString                         );
        editTagGroupGUIObject                   .editTagGroupTagTransitiveVerb1TextfieldObject              .setText(editTagGroupGUIObject.tempSelectedTagTransitiveVerb1String                 );
        editTagGroupGUIObject                   .editTagGroupTagTransitiveVerb2TextfieldObject              .setText(editTagGroupGUIObject.tempSelectedTagTransitiveVerb2String                 );
        editTagGroupGUIObject                   .editTagGroupTagTransitiveVerb3TextfieldObject              .setText(editTagGroupGUIObject.tempSelectedTagTransitiveVerb3String                 );
        editTagGroupGUIObject                   .editTagGroupTagTransitiveVerbIngTextfieldObject            .setText(editTagGroupGUIObject.tempSelectedTagTransitiveVerbIngString               );
        editTagGroupGUIObject                   .editTagGroupTagTransitiveVerbSTextfieldObject              .setText(editTagGroupGUIObject.tempSelectedTagTransitiveVerbSString                 );
    }

}
void EditTagGroupTagEditButtonObject(int _indexInt){

    if      (editTagGroupGUIObject.tempSelectedTagTypeString.equals("SUB")){

        editTagGroupGUIObject.tempSelectedTagObject             .tagNameAltString                       = editTagGroupGUIObject.editTagGroupTagNameAltTextfieldObject                       .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNameFullString                      = editTagGroupGUIObject.editTagGroupTagNameFullTextfieldObject                      .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagSubjectPossesionString              = editTagGroupGUIObject.editTagGroupTagSubjectPossesionTextfieldObject              .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagSubjectString                       = editTagGroupGUIObject.editTagGroupTagSubjectTextfieldObject                       .getText();
        subjectTagNameAltStringList                             .clear();
        subjectTagNameFullStringList                            .clear();
        for(int i = 0; i < subjectTagObjectList                 .size(); i ++){ subjectTagNameAltStringList.add(subjectTagObjectList.get(i).tagNameAltString ); subjectTagNameFullStringList.add(subjectTagObjectList.get(i).tagNameFullString); }
    }
    else if (editTagGroupGUIObject.tempSelectedTagTypeString.equals("IVR")){
        editTagGroupGUIObject.tempSelectedTagObject             .tagIntransitiveVerb1String             = editTagGroupGUIObject.editTagGroupTagIntransitiveVerb1TextfieldObject             .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagIntransitiveVerb2String             = editTagGroupGUIObject.editTagGroupTagIntransitiveVerb2TextfieldObject             .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagIntransitiveVerb3String             = editTagGroupGUIObject.editTagGroupTagIntransitiveVerb3TextfieldObject             .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagIntransitiveVerbIngString           = editTagGroupGUIObject.editTagGroupTagIntransitiveVerbIngTextfieldObject           .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagIntransitiveVerbSString             = editTagGroupGUIObject.editTagGroupTagIntransitiveVerbSTextfieldObject             .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNameAltString                       = editTagGroupGUIObject.editTagGroupTagNameAltTextfieldObject                       .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNameFullString                      = editTagGroupGUIObject.editTagGroupTagNameFullTextfieldObject                      .getText();
        intransitiveVerbTagNameAltStringList                    .clear();
        intransitiveVerbTagNameFullStringList                   .clear();
        for(int i = 0; i < verbTagObjectList                    .size(); i ++){ intransitiveVerbTagNameAltStringList.add(verbTagObjectList.get(i).tagNameAltString ); intransitiveVerbTagNameFullStringList.add(verbTagObjectList.get(i).tagNameFullString); }
    }
    else if (editTagGroupGUIObject.tempSelectedTagTypeString.equals("NIV")){
        editTagGroupGUIObject.tempSelectedTagObject             .tagNameAltString                       = editTagGroupGUIObject.editTagGroupTagNameAltTextfieldObject                       .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNameFullString                      = editTagGroupGUIObject.editTagGroupTagNameFullTextfieldObject                      .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNegativeIntransitiveVerb1String     = editTagGroupGUIObject.editTagGroupTagNegativeIntransitiveVerb1TextfieldObject     .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNegativeIntransitiveVerb2String     = editTagGroupGUIObject.editTagGroupTagNegativeIntransitiveVerb2TextfieldObject     .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNegativeIntransitiveVerb3String     = editTagGroupGUIObject.editTagGroupTagNegativeIntransitiveVerb3TextfieldObject     .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNegativeIntransitiveVerbIngString   = editTagGroupGUIObject.editTagGroupTagNegativeIntransitiveVerbIngTextfieldObject   .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNegativeIntransitiveVerbSString     = editTagGroupGUIObject.editTagGroupTagNegativeIntransitiveVerbSTextfieldObject     .getText();
        negativeIntransitiveTagNameAltStringList                .clear();
        negativeIntransitiveTagNameFullStringList               .clear();
        for(int i = 0; i < negativeIntransitiveTagObjectList    .size(); i ++){ negativeIntransitiveTagNameAltStringList.add(negativeIntransitiveTagObjectList.get(i).tagNameAltString ); negativeIntransitiveTagNameFullStringList.add(negativeIntransitiveTagObjectList.get(i).tagNameFullString); }
    }
    else if (editTagGroupGUIObject.tempSelectedTagTypeString.equals("TVR")){
        editTagGroupGUIObject.tempSelectedTagObject             .tagNameAltString                       = editTagGroupGUIObject.editTagGroupTagNameAltTextfieldObject                       .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNameFullString                      = editTagGroupGUIObject.editTagGroupTagNameFullTextfieldObject                      .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagTransitiveVerb1String               = editTagGroupGUIObject.editTagGroupTagTransitiveVerb1TextfieldObject               .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagTransitiveVerb2String               = editTagGroupGUIObject.editTagGroupTagTransitiveVerb2TextfieldObject               .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagTransitiveVerb3String               = editTagGroupGUIObject.editTagGroupTagTransitiveVerb3TextfieldObject               .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagTransitiveVerbIngString             = editTagGroupGUIObject.editTagGroupTagTransitiveVerbIngTextfieldObject             .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagTransitiveVerbSString               = editTagGroupGUIObject.editTagGroupTagTransitiveVerbSTextfieldObject               .getText();
        transitiveVerbTagNameAltStringList                      .clear();
        transitiveVerbTagNameFullStringList                     .clear();
        for(int i = 0; i < transitiveVerbTagObjectList          .size(); i ++){ transitiveVerbTagNameAltStringList.add(transitiveVerbTagObjectList.get(i).tagNameAltString ); transitiveVerbTagNameFullStringList.add(transitiveVerbTagObjectList.get(i).tagNameFullString); }
    }
    else if (editTagGroupGUIObject.tempSelectedTagTypeString.equals("NTV")){
        editTagGroupGUIObject.tempSelectedTagObject             .tagNameAltString                       = editTagGroupGUIObject.editTagGroupTagNameAltTextfieldObject                       .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNameFullString                      = editTagGroupGUIObject.editTagGroupTagNameFullTextfieldObject                      .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNegativeTransitiveVerb1String       = editTagGroupGUIObject.editTagGroupTagNegativeTransitiveVerb1TextfieldObject       .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNegativeTransitiveVerb2String       = editTagGroupGUIObject.editTagGroupTagNegativeTransitiveVerb2TextfieldObject       .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNegativeTransitiveVerb3String       = editTagGroupGUIObject.editTagGroupTagNegativeTransitiveVerb3TextfieldObject       .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNegativeTransitiveVerbIngString     = editTagGroupGUIObject.editTagGroupTagNegativeTransitiveVerbIngTextfieldObject     .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNegativeTransitiveVerbSString       = editTagGroupGUIObject.editTagGroupTagNegativeTransitiveVerbSTextfieldObject       .getText();
        negativeTransitiveTagNameAltStringList                  .clear();
        negativeTransitiveTagNameFullStringList                 .clear();
        for(int i = 0; i < negativeTransitiveTagObjectList      .size(); i ++){ negativeTransitiveTagNameAltStringList.add(negativeTransitiveTagObjectList.get(i).tagNameAltString ); negativeTransitiveTagNameFullStringList.add(negativeTransitiveTagObjectList.get(i).tagNameFullString); }
    }
    else if (editTagGroupGUIObject.tempSelectedTagTypeString.equals("NOA")){
        editTagGroupGUIObject.tempSelectedTagObject             .tagNameAltString                       = editTagGroupGUIObject.editTagGroupTagNameAltTextfieldObject                       .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNameFullString                      = editTagGroupGUIObject.editTagGroupTagNameFullTextfieldObject                      .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNounAbstractSString                 = editTagGroupGUIObject.editTagGroupTagNounAbstractSTextfieldObject                 .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNounAbstractString                  = editTagGroupGUIObject.editTagGroupTagNounAbstractTextfieldObject                  .getText();
        nounAbstractTagNameAltStringList                        .clear();
        nounAbstractTagNameFullStringList                       .clear();
        for(int i = 0; i < nounAbstractTagObjectList            .size(); i ++){ nounAbstractTagNameAltStringList.add(nounAbstractTagObjectList.get(i).tagNameAltString ); nounAbstractTagNameFullStringList.add(nounAbstractTagObjectList.get(i).tagNameFullString); }
    }
    else if (editTagGroupGUIObject.tempSelectedTagTypeString.equals("NOU")){
        editTagGroupGUIObject.tempSelectedTagObject             .tagNameAltString                       = editTagGroupGUIObject.editTagGroupTagNameAltTextfieldObject                       .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNameFullString                      = editTagGroupGUIObject.editTagGroupTagNameFullTextfieldObject                      .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNounSString                         = editTagGroupGUIObject.editTagGroupTagNounSTextfieldObject                         .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNounString                          = editTagGroupGUIObject.editTagGroupTagNounTextfieldObject                          .getText();
        nounTagNameAltStringList                                .clear();
        nounTagNameFullStringList                               .clear();
        for(int i = 0; i < nounTagObjectList                    .size(); i ++){ nounTagNameAltStringList.add(nounTagObjectList.get(i).tagNameAltString ); nounTagNameFullStringList.add(nounTagObjectList.get(i).tagNameFullString); }
    }
    else if (editTagGroupGUIObject.tempSelectedTagTypeString.equals("ADJ")){
        editTagGroupGUIObject.tempSelectedTagObject             .tagAdjectiveString                     = editTagGroupGUIObject.editTagGroupTagAdjectiveTextfieldObject                     .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNameAltString                       = editTagGroupGUIObject.editTagGroupTagNameAltTextfieldObject                       .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNameFullString                      = editTagGroupGUIObject.editTagGroupTagNameFullTextfieldObject                      .getText();
        adjectiveTagNameAltStringList                           .clear();
        adjectiveTagNameFullStringList                          .clear();
        for(int i = 0; i < adjectiveTagObjectList               .size(); i ++){ adjectiveTagNameAltStringList.add(adjectiveTagObjectList.get(i).tagNameAltString ); adjectiveTagNameFullStringList.add(adjectiveTagObjectList.get(i).tagNameFullString); }
    }
    else if (editTagGroupGUIObject.tempSelectedTagTypeString.equals("NDJ")){
        editTagGroupGUIObject.tempSelectedTagObject             .tagNameAltString                       = editTagGroupGUIObject.editTagGroupTagNameAltTextfieldObject                       .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNameFullString                      = editTagGroupGUIObject.editTagGroupTagNameFullTextfieldObject                      .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNegativeAdjectiveString             = editTagGroupGUIObject.editTagGroupTagNegativeAdjectiveTextfieldObject             .getText();
        negativeAdjectiveTagNameAltStringList                   .clear();
        negativeAdjectiveTagNameFullStringList                  .clear();
        for(int i = 0; i < adjectiveTagObjectList               .size(); i ++){ negativeAdjectiveTagNameAltStringList.add(negativeAdjectiveTagObjectList.get(i).tagNameAltString ); negativeAdjectiveTagNameFullStringList.add(negativeAdjectiveTagObjectList.get(i).tagNameFullString); }
    }
    else if (editTagGroupGUIObject.tempSelectedTagTypeString.equals("ADV")){
        editTagGroupGUIObject.tempSelectedTagObject             .tagAdverbString                        = editTagGroupGUIObject.editTagGroupTagAdverbTextfieldObject                        .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNameAltString                       = editTagGroupGUIObject.editTagGroupTagNameAltTextfieldObject                       .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNameFullString                      = editTagGroupGUIObject.editTagGroupTagNameFullTextfieldObject                      .getText();
        adverbTagNameAltStringList                              .clear();
        adverbTagNameFullStringList                             .clear();
        for(int i = 0; i < adverbTagObjectList                  .size(); i ++){ adverbTagNameAltStringList.add(adverbTagObjectList.get(i).tagNameAltString ); adverbTagNameFullStringList.add(adverbTagObjectList.get(i).tagNameFullString); }
    }
    else if (editTagGroupGUIObject.tempSelectedTagTypeString.equals("NDV")){
        editTagGroupGUIObject.tempSelectedTagObject             .tagNameAltString                       = editTagGroupGUIObject.editTagGroupTagNameAltTextfieldObject                       .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNameFullString                      = editTagGroupGUIObject.editTagGroupTagNameFullTextfieldObject                      .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNegativeAdverbString                = editTagGroupGUIObject.editTagGroupTagNegativeAdverbTextfieldObject                .getText();
        negativeAdverbTagNameAltStringList                      .clear();
        negativeAdverbTagNameFullStringList                     .clear();
        for(int i = 0; i < adverbTagObjectList                  .size(); i ++){ negativeAdverbTagNameAltStringList.add(negativeAdverbTagObjectList.get(i).tagNameAltString ); negativeAdverbTagNameFullStringList.add(negativeAdverbTagObjectList.get(i).tagNameFullString); }
    }
    editTagGroupGUIObject.tempTagNameFullStringList.clear();
    editTagGroupGUIObject.GenerateAllTagNameFullVoid();
    editTagGroupGUIObject.editTagGroupSelectTagScrollableListObject.setItems(editTagGroupGUIObject.tempTagNameFullStringList);

}
////////////////////////////////////////////////////////////////////////////////////////////////////
//END//EditTagGroupGUIObject.pde Controller's Functions.////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////



////////////////////////////////////////////////////////////////////////////////////////////////////
//START//AddPlayerGroupGUIObject.pde Controller's Functions.////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
/*Find the starting exhibition alternate name String.*/
void AddPlayerGroupPickExhibitionStartScrollableListObject  (int _indexInt){

    String          tempStartingExhibitionNameAltString         = "";
    String          tempStartingExhibitionNameFullString        = addPlayerGroupGUIObject.addPlayerGroupPickExhibitionStartScrollableListObject.getItem(_indexInt).get("text").toString();
    ObjectMuseum    tempStartingExhibitionObject                = null;

    tempStartingExhibitionObject                                = FindMuseumObject(tempStartingExhibitionNameFullString);
    tempStartingExhibitionNameAltString                         = tempStartingExhibitionObject.nameAltString;
    addPlayerGroupGUIObject.tempExhibitionStartNameAltString    = tempStartingExhibitionNameAltString;

}
/*A function to control what happen when user click Add Player button.*/
void AddPlayerGroupPlayerAddButtonObject                    (int _indexInt){

    int             tempNextBiggestPlayerIndexInt       = nextBiggestPlayerIndexInt;                                                        /*Take the next biggest player index. This index will be the index number for the newly created player.*/
    String          tempPlayerNameString                = addPlayerGroupGUIObject.addPlayerGroupPlayerNameTextfieldObject.getText();        /*This will be the name of the newly player.                                                           */
    String          tempStartingExhibitionNameAltString = addPlayerGroupGUIObject.tempExhibitionStartNameAltString;                         /*This variable is for detrmining the starting exhibition of the newly created player.                 */

    /*If one or more field in this group form is not completed, then prevent the user from adding new player into the mian scene.*/
    if(

        (tempNextBiggestPlayerIndexInt          >  0                                                    ) ||                                /*Make sure the index is larger than zero.                                                             */
        (tempPlayerNameString                   != "" || tempPlayerNameString                   != null ) ||                                /*Make sure the player has a name.                                                                     */
        (tempStartingExhibitionNameAltString    != "" || tempStartingExhibitionNameAltString    != null )                                   /*Make sure the newly created player has a starting exhibition String from this group scrollable list. */

    ){

        ObjectPlayer tempPlayerObject                                                           = new ObjectPlayer(                         /*Create the new player.*/

            tempNextBiggestPlayerIndexInt       ,
            tempPlayerNameString                ,
            tempStartingExhibitionNameAltString

        );
        playerStringList                                                                        .add("" + tempPlayerObject.playerIndexInt); /*Add the player index number into the player String  list. PENDING: Add also the player name into the player String list. */
        selectPlayerScrollableListObject                                                        .setItems(playerStringList);                /*Set all the player objects back into the scrollable list of all available player objects including the newly created one.*/
        removePlayerGroupGUIObject.removePlayerGroupSelectPlayerToRemoveScrollableListObject    .setItems(playerStringList);                /*This one is to set the all available players into the scrollable list of player selection that the user wants to remove. */

    }

}
////////////////////////////////////////////////////////////////////////////////////////////////////
//END//AddPlayerGroupGUIObject.pde Controller's Functions.//////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////// 



////////////////////////////////////////////////////////////////////////////////////////////////////
//START//EditPlayerGroupGUIObject.pde Controller's Functions.///////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
void EditPlayerGroupPlayerNameChangeButtonObject                (int _indexInt)     {

    String tempPlayerNameString                                         = editPlayerGroupGUIObject.editPlayerGroupPlayerNameTextfieldObject.getText();
    editPlayerGroupGUIObject.tempSelectedPlayerObject.playerNameString  = tempPlayerNameString;
    editPlayerGroupGUIObject.editPlayerGroupPlayerNameTextfieldObject   .setText (editPlayerGroupGUIObject.tempSelectedPlayerObject.playerNameString);

}
/*Set the movement mode for both player object and the graphical user interface object.
This function is to make sure that both mode is always the same.*/
void EditPlayerGroupPlayerModeValueRadioButtonObject            (int _intIndex)     {

    editPlayerGroupGUIObject.tempSelectedPlayerMovementModeInt                  = _intIndex;
    editPlayerGroupGUIObject.tempSelectedPlayerObject.playerMovementModeInt     = _intIndex;

}
/*A function to move the selected player into new exhibition.
This function need to only happened when the appropriate movement mode is selected.*/
void EditPlayerGroupPlayerExhibitionNextScrollableListObject    (int _indexInt)     {

    if(editPlayerGroupGUIObject.tempSelectedPlayerMovementModeInt == 2){

        String  receivedMuseumNameFullString    = editPlayerGroupGUIObject.editPlayerGroupPlayerExhibitionNextScrollableListObject.getItem(_indexInt).get("text").toString();
        String  receivedMuseumNameAltString     = FindMuseumObject(receivedMuseumNameFullString).nameAltString;

        editPlayerGroupGUIObject.tempSelectedPlayerObject.ExhibitionMoveObject(receivedMuseumNameAltString);

    }

}
void EditPlayerGroupSetAllModeSoftwareAutoButtonObject          (int _indexInt)     {

    editPlayerGroupGUIObject.tempSelectedPlayerMovementModeInt                                          = 1;
    for(int i = 0; i < playerObjectList.size(); i ++){ playerObjectList.get(i).playerMovementModeInt    = 1; }

}
void EditPlayerGroupSetAllModeSoftwareManualButtonObject        (int _indexInt)     {

    editPlayerGroupGUIObject.tempSelectedPlayerMovementModeInt                                          = 2;
    for(int i = 0; i < playerObjectList.size(); i ++){ playerObjectList.get(i).playerMovementModeInt    = 2; }

}
void EditPlayerGroupPlayerResetButtonObject                     (int _indexInt)     { editPlayerGroupGUIObject.tempSelectedPlayerObject.ResetVoid(); }
void EditPlayerGroupPlayerResetAllButtonObject                  (int _indexInt)     { for(int i = 0; i < playerObjectList.size(); i ++){ playerObjectList.get(i).ResetVoid(); } }
////////////////////////////////////////////////////////////////////////////////////////////////////
//END//EditPlayerGroupGUIObject.pde Controller's Functions./////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////



////////////////////////////////////////////////////////////////////////////////////////////////////
//START//RemovePlayerGroupGUIObject.pde Controller's Functions./////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
/*This function below is for the user to pick which player they want to remove.*/
void RemovePlayerGroupSelectPlayerToRemoveScrollableListObject  (int _indexInt){

    String  tempIndexSelectedPlayerString                   = removePlayerGroupGUIObject.removePlayerGroupSelectPlayerToRemoveScrollableListObject.getItem(_indexInt).get("text").toString();
    int     tempIndexSelectedPlayerInt                      = Integer.parseInt(tempIndexSelectedPlayerString);
    removePlayerGroupGUIObject.tempPlayerToRemoveObject     = FindPlayerObject(tempIndexSelectedPlayerInt   );

}
void RemovePlayerGroupRemoveButtonObject                        (int _indexInt){

    if(removePlayerGroupGUIObject.tempPlayerToRemoveObject != null){
        
        /*Remove the player from both player object list and the player string object list.*/
        playerObjectList                .remove(     removePlayerGroupGUIObject.tempPlayerToRemoveObject                );
        playerStringList                .remove("" + removePlayerGroupGUIObject.tempPlayerToRemoveObject.playerIndexInt );

        selectPlayerScrollableListObject                                                        .setItems(playerStringList);
        removePlayerGroupGUIObject.removePlayerGroupSelectPlayerToRemoveScrollableListObject    .setItems(playerStringList);

        /*When the user remove the player do not forget to set every player sibling object list.*/
        for(int i = 0; i < playerObjectList.size(); i ++){ playerObjectList.get(i).SetSiblingObjectList(); }
        /*Reset the selected player value so that when user click the button again it will not returned a null pointer error.*/
        removePlayerGroupGUIObject.tempPlayerToRemoveObject = null;
        
    }

}
////////////////////////////////////////////////////////////////////////////////////////////////////
//END//RemovePlayerGroupGUIObject.pde Controller's Functions.///////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//END//Controller's Functions.//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////