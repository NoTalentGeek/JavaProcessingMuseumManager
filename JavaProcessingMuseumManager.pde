import controlP5.*;
import java.util.*;

/*Database of all important objects in this applications.*/
List<Tag>                   subjectTagObjectList                    = new ArrayList<Tag>            ();
List<Tag>                   verbTagObjectList                       = new ArrayList<Tag>            ();
List<Tag>                   negativeVerbTagObjectList               = new ArrayList<Tag>            ();
List<Tag>                   nounTagObjectList                       = new ArrayList<Tag>            ();
List<Tag>                   adjectiveTagObjectList                  = new ArrayList<Tag>            ();
List<Tag>                   negativeAdjectiveTagObjectList          = new ArrayList<Tag>            ();
List<Tag>                   adverbTagObjectList                     = new ArrayList<Tag>            ();
List<Tag>                   negativeAdverbTagObjectList             = new ArrayList<Tag>            ();
List<String>                subjectTagNameAltStringList             = new ArrayList<String>         ();
List<String>                verbTagNameAltStringList                = new ArrayList<String>         ();
List<String>                negativeVerbTagNameAltStringList        = new ArrayList<String>         ();
List<String>                nounTagNameAltStringList                = new ArrayList<String>         ();
List<String>                adjectiveTagNameAltStringList           = new ArrayList<String>         ();
List<String>                negativeAdjectiveTagNameAltStringList   = new ArrayList<String>         ();
List<String>                adverbTagNameAltStringList              = new ArrayList<String>         ();
List<String>                negativeAdverbTagNameAltStringList      = new ArrayList<String>         ();
List<String>                subjectTagNameFullStringList            = new ArrayList<String>         ();
List<String>                verbTagNameFullStringList               = new ArrayList<String>         ();
List<String>                negativeVerbTagNameFullStringList       = new ArrayList<String>         ();
List<String>                nounTagNameFullStringList               = new ArrayList<String>         ();
List<String>                adjectiveTagNameFullStringList          = new ArrayList<String>         ();
List<String>                negativeAdjectiveTagNameFullStringList  = new ArrayList<String>         ();
List<String>                adverbTagNameFullStringList             = new ArrayList<String>         ();
List<String>                negativeAdverbTagNameFullStringList     = new ArrayList<String>         ();
List<ObjectMuseum>          floorObjectList                         = new ArrayList<ObjectMuseum>   ();
List<ObjectMuseum>          roomObjectList                          = new ArrayList<ObjectMuseum>   ();
List<ObjectMuseum>          exhibitionObjectList                    = new ArrayList<ObjectMuseum>   ();
List<ObjectPlayer>          playerObjectList                        = new ArrayList<ObjectPlayer>   ();
List<String>                museumNameAltStringList                 = new ArrayList<String>         ();
List<String>                floorNameAltStringList                  = new ArrayList<String>         ();
List<String>                roomNameAltStringList                   = new ArrayList<String>         ();
List<String>                exhibitionNameAltStringList             = new ArrayList<String>         ();
List<String>                floorNameFullStringList                 = new ArrayList<String>         ();
List<String>                roomNameFullStringList                  = new ArrayList<String>         ();
List<String>                exhibitionNameFullStringList            = new ArrayList<String>         ();
List<String>                playerStringList                        = new ArrayList<String>         ();
List<String>                museumNameFullStringList                = new ArrayList<String>         ();
List<String>                defaultStringList                       ;
/*Panel card variables.*/
boolean                     panelCardChangeBoolean                  = true                          ;
color                       panelCardColor                          = color(63, 63, 116)            ;
int                         panelLineSpacingInt                     = 5                             ;
int                         rowInt                                  = 0                             ;
int                         textSizePanelInt                        = 16                            ;
int                         xPanelCardInt                           = -1                            ;
int                         yPanelCardInt                           = -1                            ;
int                         heightPanelCardInt                      = 280                           ;
int                         widthPanelCardInt                       = 200                           ;
ObjectMuseum                tempSelectedMuseumObject                = null                          ;
ObjectPlayer                tempSelectedPlayerObject                = null                          ;
PFont                       panelCardPFont                          ;
String                      panelFontString                         = "Monospaced.plain"            ;
String                      panelString                             = ""                            ;   
String                      tempFullString                          ;
String                      tempVisitorCurrentString                ;
String                      tempVisitorTotalString                  ;
/*Animation and universal GUI variables.*/
float                       animationStepFloat                      = (255f/45f)                    ;   /*Animation time step.*/
float                       dropdownMObjectAlphaFloat               = 0                             ;
float                       dropdownPlayerAlphaFloat                = 0                             ;
int                         guiLayoutOffsetInt                      = 20                            ;
int                         panelLayoutOffsetInt                    = 5                             ;
int                         panelLayoutOffsetSideInt                = 50                            ;
int                         panelLayoutTotalRowInt                  ;
/*Controller variables.*/
int                         buttonSizeInt                           ;
int                         menuWidthInt                            ;
int                         menuHeightInt                           ;
int                         leftMenuXInt                            ;
int                         rightMenuXInt                           ;
int                         menuYInt                                ;
int                         addTagGroupHeightInt                    = 244;
int                         addMuseumGroupHeightInt                 = 450;
int                         editPlayerGroupHeightInt                = 427;
int                         removePlayerGroupHeightInt              = 104;
int                         addPlayerGroupHeightInt                 = 144;
ControlP5                   cp5Object                               ;
Accordion                   leftMenuAccordionObject                 ;
Accordion                   rightMenuAccordionObject                ;
ScrollableList              selectMuseumObjectScrollableListObject  ;
ScrollableList              selectPlayerScrollableListObject        ;
ButtonOpenClose             buttonOpenCloseMuseumObject             ;
ButtonOpenClose             buttonOpenClosePlayerObject             ;
AddMuseumGroupGUIObject     addMuseumGroupGUIObject                 ;
AddTagGroupGUIObject        addTagGroupGUIObject                    ;
AddPlayerGroupGUIObject     addPlayerGroupGUIObject                 ;
RemovePlayerGroupGUIObject  removePlayerGroupGUIObject              ;
EditTagGroupGUIObject       editTagGroupGUIObject                   ;
EditPlayerGroupGUIObject    editPlayerGroupGUIObject                ;
/*Misc variables.*/
boolean                     buttonOpenCloseBoolean                  = false                         ;
int                         biggestPlayerIndexInt                   = 0                             ;
int                         nextBiggestPlayerIndexInt               = 0                             ;
int                         museumObjectFullThresholdInt            = 0                             ;
int                         playerAmountInt                         = 30                            ;

JSONArray                   adjectiveTagSaveJSONArrayObject         = new JSONArray();
JSONArray                   adverbTagSaveJSONArrayObject            = new JSONArray();
JSONArray                   exhibitionSaveJSONArrayObject           = new JSONArray();
JSONArray                   floorSaveJSONArrayObject                = new JSONArray();
JSONArray                   negativeAdjectiveTagSaveJSONArrayObject = new JSONArray();
JSONArray                   negativeAdverbTagSaveJSONArrayObject    = new JSONArray();
JSONArray                   negativeVerbTagSaveJSONArrayObject      = new JSONArray();
JSONArray                   nounTagSaveJSONArrayObject              = new JSONArray();
JSONArray                   playerSaveJSONArrayObject               = new JSONArray();
JSONArray                   roomSaveJSONArrayObject                 = new JSONArray();
JSONArray                   subjectTagSaveJSONArrayObject           = new JSONArray();
JSONArray                   verbTagSaveJSONArrayObject              = new JSONArray();
JSONObject                  adjectiveTagSaveJSONObject              = new JSONObject();
JSONObject                  adverbTagSaveJSONObject                 = new JSONObject();
JSONObject                  exhibitionSaveJSONObject                = new JSONObject();
JSONObject                  floorSaveJSONObject                     = new JSONObject();
JSONObject                  negativeAdjectiveTagSaveJSONObject      = new JSONObject();
JSONObject                  negativeAdverbTagSaveJSONObject         = new JSONObject();
JSONObject                  negativeVerbTagSaveJSONObject           = new JSONObject();
JSONObject                  nounTagSaveJSONObject                   = new JSONObject();
JSONObject                  playerSaveJSONObject                    = new JSONObject();
JSONObject                  roomSaveJSONObject                      = new JSONObject();
JSONObject                  subjectTagSaveJSONObject                = new JSONObject();
JSONObject                  verbTagSaveJSONObject                   = new JSONObject();

/*Name class to manage an object name.*/
class Name{

    String          nameAltString   = "";
    String          nameFullString  = "";
    Name(

        String _nameAltString   , 
        String _nameFullString

    ){

        nameAltString               = _nameAltString;
        nameFullString              = _nameFullString;

    }

};

/*A tag class to manage tag object.
This is not quite necessary because you can use the Name class instead.
I guess I will put it here for the time being :).*/
class Tag{

    Name            tagName                     = null;
    String          nameAltString               = "";
    String          nameFullString              = "";

    String          tagTypeString               = "";

    String          tagSubjectString            = "";
    String          tagVerb1String              = "";
    String          tagVerb2String              = "";
    String          tagVerb3String              = "";
    String          tagVerbSString              = "";
    String          tagVerbIngString            = "";
    String          tagNegativeVerb1String      = "";
    String          tagNegativeVerb2String      = "";
    String          tagNegativeVerb3String      = "";
    String          tagNegativeVerbSString      = "";
    String          tagNegativeVerbIngString    = "";
    String          tagNounString               = "";
    String          tagNounSString              = "";
    String          tagAdjectiveString          = "";
    String          tagNegativeAdjectiveString  = "";
    String          tagAdverbString             = "";
    String          tagNegativeAdverbString     = "";

    Tag(

        Name        _nameObject                 ,
        String      _tagTypeString              ,
        String...   _wordDerivativeStringArray

    ){

        tagName                         = _nameObject;
        nameAltString                   = tagName.nameAltString;
        nameFullString                  = tagName.nameFullString;
        tagTypeString                   = _tagTypeString;

        if      (tagTypeString.equals("SUB")){ tagSubjectString     = _wordDerivativeStringArray[0]; }
        else if (tagTypeString.equals("VER")){

            tagVerb1String              = _wordDerivativeStringArray[0];
            tagVerb2String              = _wordDerivativeStringArray[1];
            tagVerb3String              = _wordDerivativeStringArray[2];
            tagVerbSString              = _wordDerivativeStringArray[3];
            tagVerbIngString            = _wordDerivativeStringArray[4];

        }
        else if (tagTypeString.equals("NVE")){

            tagNegativeVerb1String      = _wordDerivativeStringArray[0];
            tagNegativeVerb2String      = _wordDerivativeStringArray[1];
            tagNegativeVerb3String      = _wordDerivativeStringArray[2];
            tagNegativeVerbSString      = _wordDerivativeStringArray[3];
            tagNegativeVerbIngString    = _wordDerivativeStringArray[4];

        }
        else if (tagTypeString.equals("NOU")){

            tagNounString               = _wordDerivativeStringArray[0];
            tagNounSString              = _wordDerivativeStringArray[1];

        }
        else if (tagTypeString.equals("ADJ")){ tagAdjectiveString           = _wordDerivativeStringArray[0]; }
        else if (tagTypeString.equals("NDJ")){ tagNegativeAdjectiveString   = _wordDerivativeStringArray[0]; }
        else if (tagTypeString.equals("ADV")){ tagAdverbString              = _wordDerivativeStringArray[0]; }
        else if (tagTypeString.equals("NDV")){ tagNegativeAdverbString      = _wordDerivativeStringArray[0]; }
        

    }

}

void setup(){

    size                            (1024, 576, P2D);
    noStroke                        ();

    OnExit                          ();
    LoadVoid                        ();

    subjectTagObjectList            = new ArrayList<Tag>            (subjectTagObjectList           );
    verbTagObjectList               = new ArrayList<Tag>            (verbTagObjectList              );
    negativeVerbTagObjectList       = new ArrayList<Tag>            (negativeVerbTagObjectList      );
    nounTagObjectList               = new ArrayList<Tag>            (nounTagObjectList              );
    adjectiveTagObjectList          = new ArrayList<Tag>            (adjectiveTagObjectList         );
    negativeAdjectiveTagObjectList  = new ArrayList<Tag>            (negativeAdjectiveTagObjectList );
    adverbTagObjectList             = new ArrayList<Tag>            (adverbTagObjectList            );
    negativeAdverbTagObjectList     = new ArrayList<Tag>            (negativeAdverbTagObjectList    );
    floorObjectList                 = new ArrayList<ObjectMuseum>   (floorObjectList                );
    roomObjectList                  = new ArrayList<ObjectMuseum>   (roomObjectList                 );
    exhibitionObjectList            = new ArrayList<ObjectMuseum>   (exhibitionObjectList           );
    playerObjectList                = new ArrayList<ObjectPlayer>   (playerObjectList               );

    /*Initiate object parents and children for all object museum.*/
    for(int i = 0; i < floorObjectList.size()           ; i ++) { floorObjectList       .get(i).SetChildObjectList      (roomObjectList ); }
    for(int i = 0; i < roomObjectList.size()            ; i ++) { roomObjectList        .get(i).SetInitialParentObject  (floorObjectList); roomObjectList.get(i).SetChildObjectList(exhibitionObjectList); }
    for(int i = 0; i < exhibitionObjectList.size()      ; i ++) { exhibitionObjectList  .get(i).SetInitialParentObject  (roomObjectList ); }
    /*Determine index for all museum object.*/
    for(int i = 0; i < floorObjectList.size()           ; i ++) { floorObjectList.get(i)        .SetIndexInsideVoid(); }
    for(int i = 0; i < roomObjectList.size()            ; i ++) { roomObjectList.get(i)         .SetIndexInsideVoid(); }
    for(int i = 0; i < exhibitionObjectList.size()      ; i ++) { exhibitionObjectList.get(i)   .SetIndexInsideVoid(); }
    /*Populate String list.*/
    for(int i = 0; i < floorObjectList          .size(); i ++){ floorNameAltStringList                  .add(     floorObjectList                   .get(i).nameAltString ); floorNameFullStringList                .add(floorObjectList                .get(i).nameFullString); }
    for(int i = 0; i < roomObjectList           .size(); i ++){ roomNameAltStringList                   .add(     roomObjectList                    .get(i).nameAltString ); roomNameFullStringList                 .add(roomObjectList                 .get(i).nameFullString); }
    for(int i = 0; i < exhibitionObjectList     .size(); i ++){ exhibitionNameAltStringList             .add(     exhibitionObjectList              .get(i).nameAltString ); exhibitionNameFullStringList           .add(exhibitionObjectList           .get(i).nameFullString); }
    for(int i = 0; i < playerObjectList         .size(); i ++){ playerStringList                        .add("" + playerObjectList                  .get(i).playerIndexInt); }
    for(int i = 0; i < subjectTagObjectList     .size(); i ++){ subjectTagNameAltStringList             .add(     subjectTagObjectList              .get(i).nameAltString ); subjectTagNameFullStringList           .add(subjectTagObjectList           .get(i).nameFullString); }
    for(int i = 0; i < verbTagObjectList        .size(); i ++){ verbTagNameAltStringList                .add(     verbTagObjectList                 .get(i).nameAltString ); verbTagNameFullStringList              .add(verbTagObjectList              .get(i).nameFullString); }
    for(int i = 0; i < verbTagObjectList        .size(); i ++){ negativeVerbTagNameAltStringList        .add(     negativeVerbTagObjectList         .get(i).nameAltString ); negativeVerbTagNameFullStringList      .add(negativeVerbTagObjectList      .get(i).nameFullString); }
    for(int i = 0; i < nounTagObjectList        .size(); i ++){ nounTagNameAltStringList                .add(     nounTagObjectList                 .get(i).nameAltString ); nounTagNameFullStringList              .add(nounTagObjectList              .get(i).nameFullString); }
    for(int i = 0; i < adjectiveTagObjectList   .size(); i ++){ adjectiveTagNameAltStringList           .add(     adjectiveTagObjectList            .get(i).nameAltString ); adjectiveTagNameFullStringList         .add(adjectiveTagObjectList         .get(i).nameFullString); }
    for(int i = 0; i < adjectiveTagObjectList   .size(); i ++){ negativeAdjectiveTagNameAltStringList   .add(     negativeAdjectiveTagObjectList    .get(i).nameAltString ); negativeAdjectiveTagNameFullStringList .add(negativeAdjectiveTagObjectList .get(i).nameFullString); }
    for(int i = 0; i < adverbTagObjectList      .size(); i ++){ adverbTagNameAltStringList              .add(     adverbTagObjectList               .get(i).nameAltString ); adverbTagNameFullStringList            .add(adverbTagObjectList            .get(i).nameFullString); }
    for(int i = 0; i < adverbTagObjectList      .size(); i ++){ negativeAdverbTagNameAltStringList      .add(     negativeAdverbTagObjectList       .get(i).nameAltString ); negativeAdverbTagNameFullStringList    .add(negativeAdverbTagObjectList    .get(i).nameFullString); }
    /*Create empty list to display if the object created has no parent (for example, floor object will have no parent).*/
    defaultStringList   = Arrays.asList();

    SetupGUIVoid        ();

}

void draw(){

    /*Set the background color for this application.*/
    background                      (34, 32, 52);
    /*Always update the full threshold and layout total row int.*/
    museumObjectFullThresholdInt    = 2 + (int)(Math.ceil(playerObjectList.size()/exhibitionObjectList.size()));
    panelLayoutTotalRowInt          = (int)(Math.ceil(playerObjectList.size()/exhibitionObjectList.size()) + 5)*2;

    /*Update function for all museum objects and player objects.
    Also within these four for loops we need to get which object is hovered.*/
    for(int i = 0; i < floorObjectList      .size(); i ++){ floorObjectList         .get(i).DrawVoid(); CheckMuseumObjectHoverVoid(i, floorObjectList       ); }
    for(int i = 0; i < roomObjectList       .size(); i ++){ roomObjectList          .get(i).DrawVoid(); CheckMuseumObjectHoverVoid(i, roomObjectList        ); }
    for(int i = 0; i < exhibitionObjectList .size(); i ++){ exhibitionObjectList    .get(i).DrawVoid(); CheckMuseumObjectHoverVoid(i, exhibitionObjectList  ); }
    for(int i = 0; i < playerObjectList     .size(); i ++){ playerObjectList        .get(i).DrawVoid(); CheckPlayerObjectHoverVoid(i                        ); }

    /*This one is to check wether we need to replace the current showed card with a new one.*/
    if      (tempSelectedMuseumObject != null){

        if(

            (mouseX > xPanelCardInt + (tempSelectedMuseumObject.panelObject.widthPanelInt /2)) ||
            (mouseX < xPanelCardInt - (tempSelectedMuseumObject.panelObject.widthPanelInt /2)) ||
            (mouseY > yPanelCardInt + (tempSelectedMuseumObject.panelObject.heightPanelInt/2)) ||
            (mouseY < yPanelCardInt - (tempSelectedMuseumObject.panelObject.heightPanelInt/2))

        ){ panelCardChangeBoolean = true; }

    }
    else if (tempSelectedPlayerObject != null){

        if(

            (mouseX > xPanelCardInt + (tempSelectedPlayerObject.panelObject.widthPanelInt /2)) ||
            (mouseX < xPanelCardInt - (tempSelectedPlayerObject.panelObject.widthPanelInt /2)) ||
            (mouseY > yPanelCardInt + (tempSelectedPlayerObject.panelObject.heightPanelInt/2)) ||
            (mouseY < yPanelCardInt - (tempSelectedPlayerObject.panelObject.heightPanelInt/2))

        ){ panelCardChangeBoolean = true; }

    }
    /*In case we need a new card then we reset all card properties.*/
    if(panelCardChangeBoolean   == true){

        xPanelCardInt               = -1    ;
        yPanelCardInt               = -1    ;
        rowInt                      = 0     ;
        tempSelectedMuseumObject    = null  ;
        tempSelectedPlayerObject    = null  ;

    }
    /*Create the card.*/
    if(buttonOpenCloseBoolean == false)     { CreatePanelCardVoid(); }

    SetButtonOpenCloseBoolean   (); /*Update buttonOpenCloseBoolean.*/

    /*Set the biggest player index so everytime new player added it will be the highest index.*/
    biggestPlayerIndexInt       = GetBiggestPlayerIndexInt();
    nextBiggestPlayerIndexInt   = biggestPlayerIndexInt + 1; 
    addPlayerGroupGUIObject     .addPlayerGroupPlayerIndexValueTextlabelObject.setText("" + nextBiggestPlayerIndexInt);

    DrawGUIVoid                 ();

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
    int     counterInt                              = 0;

    /*This function need to be atleast gives three tags to a museum object.
    After three tags is inside the List then we can randomly add another tag with a chance.
    The thing is that every tag added the chance of another tag will be added/pushed
        is lower.*/
    float   randomCounterFloat                      = 1f;
    while(

        (counterInt             <= (_sourceTagObjectList.size()/2)) ||
        (Math.random()          <  randomCounterFloat)

    ){

        /*Need to make sure the inputted random tag is not something that is already in the museum object
        Create a temporary tag object to hold.*/
        boolean insideBoolean   = false;
        int     randomIndexInt  = (int)((Math.random()*_sourceTagObjectList.size()) + 0);
        Tag     tagObject       = _sourceTagObjectList.get(randomIndexInt);
        
        /*Keep looping over and over until the random index is not a tag that is already in the list.*/
        for(int i = 0; i        < _targetTagObjectList.size(); i ++){

            while(_targetTagObjectList.get(i).nameAltString.equals(tagObject.nameAltString)){

                insideBoolean   = true;
                randomIndexInt  = (int)((Math.random()*_sourceTagObjectList.size()) + 0);
                tagObject       = _sourceTagObjectList.get(randomIndexInt);
                
            }

        }
        
        /*If the assignTagObjectList has three or more elements then we need to start reducing the chance.*/
        if(_targetTagObjectList .size() >= (_sourceTagObjectList.size()/2)) { randomCounterFloat -= 0.2f; }
        counterInt                                                          ++;
        /*Add/push a tag object into the temporary list.*/
        if(insideBoolean == false)                                          { _targetTagObjectList.add(tagObject); }

    }

}

/*A function to check whether an object of museum is hovered by mouse pointer.*/
void CheckMuseumObjectHoverVoid(

    int _indexInt                           , 
    List<ObjectMuseum> _targetObjectList

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

        subjectTagObjectList            = Arrays.asList(
            new Tag(new Name("SUB_NAP", "Subject Napoleon"      ), "SUB", "Napoleon"),
            new Tag(new Name("SUB_WAS", "Subject Washington"    ), "SUB", "Washington")
        );
        verbTagObjectList               = Arrays.asList(
            new Tag(new Name("VER_JUM", "Verb Jump"             ), "VER", "jump", "jumped", "jumped", "jumps", "jumping"),
            new Tag(new Name("VER_RUN", "Verb Run"              ), "VER", "run", "ran", "run", "runs", "running")
        );
        negativeVerbTagObjectList       = Arrays.asList(
            new Tag(new Name("NVE_DIE", "Verb Die"              ), "NVE", "die", "died", "died", "dies", "dying"),
            new Tag(new Name("NVE_KIL", "Verb Kill"             ), "NVE", "kill", "killed", "killed", "kills", "killing")
        );
        nounTagObjectList               = Arrays.asList(
            new Tag(new Name("NOU_BAL", "Noun Ball"             ), "NOU", "ball", "balls"),
            new Tag(new Name("NOU_GUN", "Noun Gun"              ), "NOU", "gun", "guns")
        );
        adjectiveTagObjectList          = Arrays.asList(
            new Tag(new Name("ADJ_BAD", "Adjective Excellent"   ), "ADJ", "excellent"),
            new Tag(new Name("ADJ_GOD", "Adjective Good"        ), "ADJ", "good")
        );
        negativeAdjectiveTagObjectList  = Arrays.asList(
            new Tag(new Name("NDJ_AWF", "Adjective Awful"       ), "NDJ", "awful"),
            new Tag(new Name("NDJ_BAD", "Adjective Bad"         ), "NDJ", "bad")
        );
        adverbTagObjectList             = Arrays.asList(
            new Tag(new Name("ADV_PER", "Adverb Perfectly"      ), "ADV", "perfectly"),
            new Tag(new Name("ADV_QUI", "Adverb Quickly"        ), "ADV", "quickly")
        );
        negativeAdverbTagObjectList     = Arrays.asList(
            new Tag(new Name("NDV_DES", "Adverb Desperately"    ), "NDV", "desperately"),
            new Tag(new Name("NDV_SLO", "Adverb Slowly"         ), "NDV", "slowly")
        );

        String[] exampleExplanationStringArray = {

            "Explanation 1",
            "Explanation 2",
            "Explanation 3",
            "Explanation 4"

        };

        floorObjectList         = Arrays.asList(
            new ObjectMuseum(new Name("FLR_001", "First Floor"                        ), "XXX_XXX", "FLR", exampleExplanationStringArray, AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
            new ObjectMuseum(new Name("FLR_002", "Second Floor"                       ), "XXX_XXX", "FLR", exampleExplanationStringArray, AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList))
        );
        roomObjectList          = Arrays.asList(
            new ObjectMuseum(new Name("ROM_AFK", "Room Afrika"                        ), "FLR_001", "ROM", exampleExplanationStringArray, AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
            new ObjectMuseum(new Name("ROM_AME", "Room America"                       ), "FLR_001", "ROM", exampleExplanationStringArray, AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
            new ObjectMuseum(new Name("ROM_ASI", "Room Asia"                          ), "FLR_002", "ROM", exampleExplanationStringArray, AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
            new ObjectMuseum(new Name("ROM_EUR", "Room Europe"                        ), "FLR_002", "ROM", exampleExplanationStringArray, AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList))
        );
        exhibitionObjectList    = Arrays.asList(
            new ObjectMuseum(new Name("EXH_CAO", "Exhibition Cameroon"                ), "ROM_AFK", "EXH", exampleExplanationStringArray, AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
            new ObjectMuseum(new Name("EXH_EGY", "Exhibition Egypt"                   ), "ROM_AFK", "EXH", exampleExplanationStringArray, AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
            new ObjectMuseum(new Name("EXH_ETH", "Exhibition Ethiopia"                ), "ROM_AFK", "EXH", exampleExplanationStringArray, AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
            new ObjectMuseum(new Name("EXH_NIG", "Exhibition Nigeria"                 ), "ROM_AFK", "EXH", exampleExplanationStringArray, AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
            new ObjectMuseum(new Name("EXH_BRA", "Exhibition Brazil"                  ), "ROM_AME", "EXH", exampleExplanationStringArray, AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
            new ObjectMuseum(new Name("EXH_CAN", "Exhibition Canada"                  ), "ROM_AME", "EXH", exampleExplanationStringArray, AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
            new ObjectMuseum(new Name("EXH_MEX", "Exhibition Mexico"                  ), "ROM_AME", "EXH", exampleExplanationStringArray, AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
            new ObjectMuseum(new Name("EXH_USA", "Exhibition United States Of America"), "ROM_AME", "EXH", exampleExplanationStringArray, AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
            new ObjectMuseum(new Name("EXH_CAM", "Exhibition Cambodia"                ), "ROM_ASI", "EXH", exampleExplanationStringArray, AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
            new ObjectMuseum(new Name("EXH_IND", "Exhibition India"                   ), "ROM_ASI", "EXH", exampleExplanationStringArray, AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
            new ObjectMuseum(new Name("EXH_JAP", "Exhibition Japan"                   ), "ROM_ASI", "EXH", exampleExplanationStringArray, AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
            new ObjectMuseum(new Name("EXH_SIN", "Exhibition Singapore"               ), "ROM_ASI", "EXH", exampleExplanationStringArray, AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
            new ObjectMuseum(new Name("EXH_BEL", "Exhibition Belgium"                 ), "ROM_EUR", "EXH", exampleExplanationStringArray, AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
            new ObjectMuseum(new Name("EXH_FRA", "Exhibition France"                  ), "ROM_EUR", "EXH", exampleExplanationStringArray, AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
            new ObjectMuseum(new Name("EXH_GER", "Exhibition Germany"                 ), "ROM_EUR", "EXH", exampleExplanationStringArray, AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
            new ObjectMuseum(new Name("EXH_NED", "Exhibition The Netherlands"         ), "ROM_EUR", "EXH", exampleExplanationStringArray, AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList))
        );
        for(int i = 0; i < playerAmountInt; i ++)                   {
            ObjectPlayer objectPlayer = new ObjectPlayer(
                (i + 1),
                "DUMMY NAME",
                exhibitionObjectList.get((int)(Math.floor((Math.random()*exhibitionObjectList.size()) + 0))).nameAltString      /*Generate random starting exhibition for the player.*/
            );
        }

    }
    else if (initBool   == false){
        JSONArray subjectTagLoadJSONArrayObject = loadJSONArray("data/subjectTag.json");
        for(int i = 0; i < subjectTagLoadJSONArrayObject.size(); i ++){

            JSONObject subjectTagLoadJSONObject = subjectTagLoadJSONArrayObject.getJSONObject(i);
            String tempNameAltString = subjectTagLoadJSONObject.getString("nameAltString");
            String tempNameFullString = subjectTagLoadJSONObject.getString("nameFullString");
            String tempTagSubjectString = subjectTagLoadJSONObject.getString("tagSubjectString");
            String tempTagTypeString = subjectTagLoadJSONObject.getString("tagTypeString");
            Tag tempTagObject = new Tag(new Name(tempNameAltString, tempNameFullString), tempTagTypeString, tempTagSubjectString);
            subjectTagObjectList.add(tempTagObject);

        }
        JSONArray verbTagLoadJSONArrayObject = loadJSONArray("data/verbTag.json");
        for(int i = 0; i < verbTagLoadJSONArrayObject.size(); i ++){

            JSONObject verbTagLoadJSONObject = verbTagLoadJSONArrayObject.getJSONObject(i);
            String tempNameAltString = verbTagLoadJSONObject.getString("nameAltString");
            String tempNameFullString = verbTagLoadJSONObject.getString("nameFullString");
            String tempTagTypeString = verbTagLoadJSONObject.getString("tagTypeString");
            String tempTagVerb1String = verbTagLoadJSONObject.getString("tagVerb1String");
            String tempTagVerb2String = verbTagLoadJSONObject.getString("tagVerb2String");
            String tempTagVerb3String = verbTagLoadJSONObject.getString("tagVerb3String");
            String tempTagVerbIngString = verbTagLoadJSONObject.getString("tagVerbIngString");
            String tempTagVerbSString = verbTagLoadJSONObject.getString("tagVerbSString");
            Tag tempTagObject = new Tag(new Name(tempNameAltString, tempNameFullString), tempTagTypeString, tempTagVerb1String, tempTagVerb2String, tempTagVerb3String, tempTagVerbIngString, tempTagVerbSString);
            verbTagObjectList.add(tempTagObject);

        }
        JSONArray negativeVerbTagLoadJSONArrayObject = loadJSONArray("data/negativeVerbTag.json");
        for(int i = 0; i < negativeVerbTagLoadJSONArrayObject.size(); i ++){

            JSONObject negativeVerbTagLoadJSONObject = negativeVerbTagLoadJSONArrayObject.getJSONObject(i);
            String tempNameAltString = negativeVerbTagLoadJSONObject.getString("nameAltString");
            String tempNameFullString = negativeVerbTagLoadJSONObject.getString("nameFullString");
            String tempTagNegativeVerb1String = negativeVerbTagLoadJSONObject.getString("tagNegativeVerb1String");
            String tempTagNegativeVerb2String = negativeVerbTagLoadJSONObject.getString("tagNegativeVerb2String");
            String tempTagNegativeVerb3String = negativeVerbTagLoadJSONObject.getString("tagNegativeVerb3String");
            String tempTagNegativeVerbIngString = negativeVerbTagLoadJSONObject.getString("tagNegativeVerbIngString");
            String tempTagNegativeVerbSString = negativeVerbTagLoadJSONObject.getString("tagNegativeVerbSString");
            String tempTagTypeString = negativeVerbTagLoadJSONObject.getString("tagTypeString");
            Tag tempTagObject = new Tag(new Name(tempNameAltString, tempNameFullString), tempTagTypeString, tempTagNegativeVerb1String, tempTagNegativeVerb2String, tempTagNegativeVerb3String, tempTagNegativeVerbIngString, tempTagNegativeVerbSString);
            negativeVerbTagObjectList.add(tempTagObject);

        }
        JSONArray nounTagLoadJSONArrayObject = loadJSONArray("data/nounTag.json");
        for(int i = 0; i < nounTagLoadJSONArrayObject.size(); i ++){

            JSONObject nounTagLoadJSONObject = nounTagLoadJSONArrayObject.getJSONObject(i);
            String tempNameAltString = nounTagLoadJSONObject.getString("nameAltString");
            String tempNameFullString = nounTagLoadJSONObject.getString("nameFullString");
            String tempTagNounSString = nounTagLoadJSONObject.getString("tagNounSString");
            String tempTagNounString = nounTagLoadJSONObject.getString("tagNounString");
            String tempTagTypeString = nounTagLoadJSONObject.getString("tagTypeString");
            Tag tempTagObject = new Tag(new Name(tempNameAltString, tempNameFullString), tempTagTypeString, tempTagNounString, tempTagNounSString);
            nounTagObjectList.add(tempTagObject);

        }
        JSONArray adjectiveTagLoadJSONArrayObject = loadJSONArray("data/adjectiveTag.json");
        for(int i = 0; i < adjectiveTagLoadJSONArrayObject.size(); i ++){

            JSONObject adjectiveTagLoadJSONObject = adjectiveTagLoadJSONArrayObject.getJSONObject(i);
            String tempNameAltString = adjectiveTagLoadJSONObject.getString("nameAltString");
            String tempNameFullString = adjectiveTagLoadJSONObject.getString("nameFullString");
            String tempTagAdjectiveString = adjectiveTagLoadJSONObject.getString("tagAdjectiveString");
            String tempTagTypeString = adjectiveTagLoadJSONObject.getString("tagTypeString");
            Tag tempTagObject = new Tag(new Name(tempNameAltString, tempNameFullString), tempTagTypeString, tempTagAdjectiveString);
            adjectiveTagObjectList.add(tempTagObject);

        }
        JSONArray negativeAdjectiveTagLoadJSONArrayObject = loadJSONArray("data/negativeAdjectiveTag.json");
        for(int i = 0; i < negativeAdjectiveTagLoadJSONArrayObject.size(); i ++){

            JSONObject negativeAdjectiveTagLoadJSONObject = negativeAdjectiveTagLoadJSONArrayObject.getJSONObject(i);
            String tempNameAltString = negativeAdjectiveTagLoadJSONObject.getString("nameAltString");
            String tempNameFullString = negativeAdjectiveTagLoadJSONObject.getString("nameFullString");
            String tempTagNegativeAdjectiveString = negativeAdjectiveTagLoadJSONObject.getString("tagNegativeAdjectiveString");
            String tempTagTypeString = negativeAdjectiveTagLoadJSONObject.getString("tagTypeString");
            Tag tempTagObject = new Tag(new Name(tempNameAltString, tempNameFullString), tempTagTypeString, tempTagNegativeAdjectiveString);
            negativeAdjectiveTagObjectList.add(tempTagObject);

        }
        JSONArray adverbTagLoadJSONArrayObject = loadJSONArray("data/adverbTag.json");
        for(int i = 0; i < adverbTagLoadJSONArrayObject.size(); i ++){

            JSONObject adverbTagLoadJSONObject = adverbTagLoadJSONArrayObject.getJSONObject(i);
            String tempNameAltString = adverbTagLoadJSONObject.getString("nameAltString");
            String tempNameFullString = adverbTagLoadJSONObject.getString("nameFullString");
            String tempTagAdverbString = adverbTagLoadJSONObject.getString("tagAdverbString");
            String tempTagTypeString = adverbTagLoadJSONObject.getString("tagTypeString");
            Tag tempTagObject = new Tag(new Name(tempNameAltString, tempNameFullString), tempTagTypeString, tempTagAdverbString);
            adverbTagObjectList.add(tempTagObject);

        }
        JSONArray negativeAdverbTagLoadJSONArrayObject = loadJSONArray("data/negativeAdverbTag.json");
        for(int i = 0; i < negativeAdverbTagLoadJSONArrayObject.size(); i ++){

            JSONObject negativeAdverbTagLoadJSONObject = negativeAdverbTagLoadJSONArrayObject.getJSONObject(i);
            String tempNameAltString = negativeAdverbTagLoadJSONObject.getString("nameAltString");
            String tempNameFullString = negativeAdverbTagLoadJSONObject.getString("nameFullString");
            String tempTagNegativeAdverbString = negativeAdverbTagLoadJSONObject.getString("tagNegativeAdverbString");
            String tempTagTypeString = negativeAdverbTagLoadJSONObject.getString("tagTypeString");
            Tag tempTagObject = new Tag(new Name(tempNameAltString, tempNameFullString), tempTagTypeString, tempTagNegativeAdverbString);
            negativeAdverbTagObjectList.add(tempTagObject);

        }
        floorObjectList = new ArrayList<ObjectMuseum>();
        JSONArray floorLoadJSONArrayObject = loadJSONArray("data/floor.json");
        for(int i = 0; i < floorLoadJSONArrayObject.size(); i ++){

            JSONObject floorLoadJSONObject = floorLoadJSONArrayObject.getJSONObject(i);

            String tempNameAltString = floorLoadJSONObject.getString("nameAltString");
            String tempNameFullString = floorLoadJSONObject.getString("nameFullString");
            String tempParentNameAltString = floorLoadJSONObject.getString("parentNameAltString");
            String tempTypeString = floorLoadJSONObject.getString("typeString");
            int indexCounterInt = 0;
            List<Tag> tempTagObjectList = new ArrayList<Tag>();
            while(floorLoadJSONObject.hasKey("tagMuseumNameAltStringList" + indexCounterInt)){

                String tempTagNameAltString = floorLoadJSONObject.getString("tagMuseumNameAltStringList" + indexCounterInt);
                Tag tempTagObject = FindTagObject(tempTagNameAltString);
                tempTagObjectList.add(tempTagObject);
                indexCounterInt ++;

            }
            indexCounterInt = 0;
            String[] tempExplanationStringArray = new String[4];
            while(floorLoadJSONObject.hasKey("explanationStringArray" + indexCounterInt)){

                tempExplanationStringArray[indexCounterInt] = floorLoadJSONObject.getString("explanationStringArray" + indexCounterInt);
                indexCounterInt ++;

            }
            indexCounterInt = 0;
            Tag[] tempTagObjectArray = new Tag[tempTagObjectList.size()];
            tempTagObjectList.toArray(tempTagObjectArray);
            ObjectMuseum tempMuseumObject = new ObjectMuseum(new Name(tempNameAltString, tempNameFullString), tempParentNameAltString, tempTypeString, tempExplanationStringArray, tempTagObjectArray);

            boolean tempFullBoolean = floorLoadJSONObject.getBoolean("fullBoolean"); tempMuseumObject.fullBoolean = tempFullBoolean;
            int tempIndexGlobalInt = floorLoadJSONObject.getInt("indexGlobalInt"); tempMuseumObject.indexGlobalInt = tempIndexGlobalInt;
            int tempIndexLocalInt = floorLoadJSONObject.getInt("indexLocalInt"); tempMuseumObject.indexLocalInt = tempIndexLocalInt;
            int tempVisitorCurrentInt = floorLoadJSONObject.getInt("visitorCurrentInt"); tempMuseumObject.visitorCurrentInt = tempVisitorCurrentInt;
            int tempVisitorTotalInt = floorLoadJSONObject.getInt("visitorTotalInt"); tempMuseumObject.visitorTotalInt = tempVisitorTotalInt;

            floorObjectList.add(tempMuseumObject);
        }
        roomObjectList = new ArrayList<ObjectMuseum>();
        JSONArray roomLoadJSONArrayObject = loadJSONArray("data/room.json");
        for(int i = 0; i < roomLoadJSONArrayObject.size(); i ++){

            JSONObject roomLoadJSONObject = roomLoadJSONArrayObject.getJSONObject(i);

            String tempNameAltString = roomLoadJSONObject.getString("nameAltString");
            String tempNameFullString = roomLoadJSONObject.getString("nameFullString");
            String tempParentNameAltString = roomLoadJSONObject.getString("parentNameAltString");
            String tempTypeString = roomLoadJSONObject.getString("typeString");
            int indexCounterInt = 0;
            List<Tag> tempTagObjectList = new ArrayList<Tag>();
            while(roomLoadJSONObject.hasKey("tagMuseumNameAltStringList" + indexCounterInt)){

                String tempTagNameAltString = roomLoadJSONObject.getString("tagMuseumNameAltStringList" + indexCounterInt);
                Tag tempTagObject = FindTagObject(tempTagNameAltString);
                tempTagObjectList.add(tempTagObject);
                indexCounterInt ++;

            }
            indexCounterInt = 0;
            String[] tempExplanationStringArray = new String[4];
            while(roomLoadJSONObject.hasKey("explanationStringArray" + indexCounterInt)){

                tempExplanationStringArray[indexCounterInt] = roomLoadJSONObject.getString("explanationStringArray" + indexCounterInt);
                indexCounterInt ++;

            }
            indexCounterInt = 0;
            Tag[] tempTagObjectArray = new Tag[tempTagObjectList.size()];
            tempTagObjectList.toArray(tempTagObjectArray);
            ObjectMuseum tempMuseumObject = new ObjectMuseum(new Name(tempNameAltString, tempNameFullString), tempParentNameAltString, tempTypeString, tempExplanationStringArray, tempTagObjectArray);

            boolean tempFullBoolean = roomLoadJSONObject.getBoolean("fullBoolean"); tempMuseumObject.fullBoolean = tempFullBoolean;
            int tempIndexGlobalInt = roomLoadJSONObject.getInt("indexGlobalInt"); tempMuseumObject.indexGlobalInt = tempIndexGlobalInt;
            int tempIndexLocalInt = roomLoadJSONObject.getInt("indexLocalInt"); tempMuseumObject.indexLocalInt = tempIndexLocalInt;
            int tempVisitorCurrentInt = roomLoadJSONObject.getInt("visitorCurrentInt"); tempMuseumObject.visitorCurrentInt = tempVisitorCurrentInt;
            int tempVisitorTotalInt = roomLoadJSONObject.getInt("visitorTotalInt"); tempMuseumObject.visitorTotalInt = tempVisitorTotalInt;

            roomObjectList.add(tempMuseumObject);
        }
        exhibitionObjectList = new ArrayList<ObjectMuseum>();
        JSONArray exhibitionLoadJSONArrayObject = loadJSONArray("data/exhibition.json");
        for(int i = 0; i < exhibitionLoadJSONArrayObject.size(); i ++){

            JSONObject exhibitionLoadJSONObject = exhibitionLoadJSONArrayObject.getJSONObject(i);

            String tempNameAltString = exhibitionLoadJSONObject.getString("nameAltString");
            String tempNameFullString = exhibitionLoadJSONObject.getString("nameFullString");
            String tempParentNameAltString = exhibitionLoadJSONObject.getString("parentNameAltString");
            String tempTypeString = exhibitionLoadJSONObject.getString("typeString");
            int indexCounterInt = 0;
            List<Tag> tempTagObjectList = new ArrayList<Tag>();
            while(exhibitionLoadJSONObject.hasKey("tagMuseumNameAltStringList" + indexCounterInt)){

                String tempTagNameAltString = exhibitionLoadJSONObject.getString("tagMuseumNameAltStringList" + indexCounterInt);
                Tag tempTagObject = FindTagObject(tempTagNameAltString);
                tempTagObjectList.add(tempTagObject);
                indexCounterInt ++;

            }
            indexCounterInt = 0;
            String[] tempExplanationStringArray = new String[4];
            while(exhibitionLoadJSONObject.hasKey("explanationStringArray" + indexCounterInt)){

                tempExplanationStringArray[indexCounterInt] = exhibitionLoadJSONObject.getString("explanationStringArray" + indexCounterInt);
                indexCounterInt ++;

            }
            indexCounterInt = 0;
            Tag[] tempTagObjectArray = new Tag[tempTagObjectList.size()];
            tempTagObjectList.toArray(tempTagObjectArray);
            ObjectMuseum tempMuseumObject = new ObjectMuseum(new Name(tempNameAltString, tempNameFullString), tempParentNameAltString, tempTypeString, tempExplanationStringArray, tempTagObjectArray);

            boolean tempFullBoolean = exhibitionLoadJSONObject.getBoolean("fullBoolean"); tempMuseumObject.fullBoolean = tempFullBoolean;
            int tempIndexGlobalInt = exhibitionLoadJSONObject.getInt("indexGlobalInt"); tempMuseumObject.indexGlobalInt = tempIndexGlobalInt;
            int tempIndexLocalInt = exhibitionLoadJSONObject.getInt("indexLocalInt"); tempMuseumObject.indexLocalInt = tempIndexLocalInt;
            int tempVisitorCurrentInt = exhibitionLoadJSONObject.getInt("visitorCurrentInt"); tempMuseumObject.visitorCurrentInt = tempVisitorCurrentInt;
            int tempVisitorTotalInt = exhibitionLoadJSONObject.getInt("visitorTotalInt"); tempMuseumObject.visitorTotalInt = tempVisitorTotalInt;

            exhibitionObjectList.add(tempMuseumObject);
        }
        JSONArray playerLoadJSONArrayObject = loadJSONArray("data/player.json");
        for(int i = 0; i < playerLoadJSONArrayObject.size(); i ++){
            JSONObject playerLoadJSONObject = playerLoadJSONArrayObject.getJSONObject(i);

            int tempPlayerIndexInt = playerLoadJSONObject.getInt("playerIndexInt");
            String tempPlayerNameString = playerLoadJSONObject.getString("playerNameString");
            String tempExhibitionStartString = playerLoadJSONObject.getString("exhibitionCurrentString");
            ObjectPlayer tempPlayerObject = new ObjectPlayer(tempPlayerIndexInt, tempPlayerNameString, tempExhibitionStartString);

            int indexCounterInt = 0;
            while(playerLoadJSONObject.hasKey("adjectiveCurrentPrevTagStringList" + indexCounterInt)){
                String tempAdjectiveCurrentPrevTagString = playerLoadJSONObject.getString("adjectiveCurrentPrevTagStringList" + indexCounterInt);
                tempPlayerObject.adjectiveCurrentPrevTagStringList.add(tempAdjectiveCurrentPrevTagString);
                indexCounterInt ++;
            }
            indexCounterInt = 0;
            while(playerLoadJSONObject.hasKey("adverbCurrentPrevTagStringList" + indexCounterInt)){
                String tempAdverbCurrentPrevTagString = playerLoadJSONObject.getString("adverbCurrentPrevTagStringList" + indexCounterInt);
                tempPlayerObject.adverbCurrentPrevTagStringList.add(tempAdverbCurrentPrevTagString);
                indexCounterInt ++;
            }
            indexCounterInt = 0;
            while(playerLoadJSONObject.hasKey("exhibitionTargetNameAltStringList" + indexCounterInt)){
                String tempExhibitionTargetNameAltString = playerLoadJSONObject.getString("exhibitionTargetNameAltStringList" + indexCounterInt);
                tempPlayerObject.exhibitionTargetNameAltStringList.add(tempExhibitionTargetNameAltString);
                indexCounterInt ++;
            }
            indexCounterInt = 0;
            while(playerLoadJSONObject.hasKey("exhibitionVisitedNameAltStringList" + indexCounterInt)){
                String tempExhibitionVisitedNameAltString = playerLoadJSONObject.getString("exhibitionVisitedNameAltStringList" + indexCounterInt);
                tempPlayerObject.exhibitionVisitedNameAltStringList.add(tempExhibitionVisitedNameAltString);
                indexCounterInt ++;
            }
            indexCounterInt = 0;
            while(playerLoadJSONObject.hasKey("exhibitionTagCounterListNamAltString" + indexCounterInt)){
                TagCounter tempTagCounter = new TagCounter();
                String tempExhibitionTagCounterListNamAltString = playerLoadJSONObject.getString("exhibitionTagCounterListNamAltString" + indexCounterInt);
                String tempExhibitionTagCounterListNameFullString = playerLoadJSONObject.getString("exhibitionTagCounterListNameFullString" + indexCounterInt);
                int tempExhibitionTagCounterListTagCounterInt = playerLoadJSONObject.getInt("exhibitionTagCounterListTagCounterInt" + indexCounterInt);
                tempTagCounter.SetTagNameAltString(tempExhibitionTagCounterListNamAltString);
                tempTagCounter.SetTagNameFullString(tempExhibitionTagCounterListNameFullString);
                tempTagCounter.SetTagCounterIntVoid(tempExhibitionTagCounterListTagCounterInt);
                tempPlayerObject.exhibitionTagCounterList.add(tempTagCounter);
                indexCounterInt ++;
            }
            indexCounterInt = 0;
            while(playerLoadJSONObject.hasKey("explanationStringList" + indexCounterInt)){
                String tempExplanationStringList = playerLoadJSONObject.getString("explanationStringList" + indexCounterInt);
                tempPlayerObject.explanationStringList.add(tempExplanationStringList);
                indexCounterInt ++;
            }
            indexCounterInt = 0;
            while(playerLoadJSONObject.hasKey("negativeAdjectiveCurrentPrevTagStringList" + indexCounterInt)){
                String tempNegativeAdjectiveCurrentPrevTagString = playerLoadJSONObject.getString("negativeAdjectiveCurrentPrevTagStringList" + indexCounterInt);
                tempPlayerObject.negativeAdjectiveCurrentPrevTagStringList.add(tempNegativeAdjectiveCurrentPrevTagString);
                indexCounterInt ++;
            }
            indexCounterInt = 0;
            while(playerLoadJSONObject.hasKey("negativeAdverbCurrentPrevTagStringList" + indexCounterInt)){
                String tempNegativeAdverbCurrentPrevTagString = playerLoadJSONObject.getString("negativeAdverbCurrentPrevTagStringList" + indexCounterInt);
                tempPlayerObject.negativeAdverbCurrentPrevTagStringList.add(tempNegativeAdverbCurrentPrevTagString);
                indexCounterInt ++;
            }
            indexCounterInt = 0;
            while(playerLoadJSONObject.hasKey("negativeVerb1CurrentPrevTagStringList" + indexCounterInt)){
                String tempNegativeVerb1CurrentPrevTagString = playerLoadJSONObject.getString("negativeVerb1CurrentPrevTagStringList" + indexCounterInt);
                tempPlayerObject.negativeVerb1CurrentPrevTagStringList.add(tempNegativeVerb1CurrentPrevTagString);
                indexCounterInt ++;
            }
            indexCounterInt = 0;
            while(playerLoadJSONObject.hasKey("negativeVerb2CurrentPrevTagStringList" + indexCounterInt)){
                String tempNegativeVerb2CurrentPrevTagString = playerLoadJSONObject.getString("negativeVerb2CurrentPrevTagStringList" + indexCounterInt);
                tempPlayerObject.negativeVerb2CurrentPrevTagStringList.add(tempNegativeVerb2CurrentPrevTagString);
                indexCounterInt ++;
            }
            indexCounterInt = 0;
            while(playerLoadJSONObject.hasKey("negativeVerb3CurrentPrevTagStringList" + indexCounterInt)){
                String tempNegativeVerb3CurrentPrevTagString = playerLoadJSONObject.getString("negativeVerb3CurrentPrevTagStringList" + indexCounterInt);
                tempPlayerObject.negativeVerb3CurrentPrevTagStringList.add(tempNegativeVerb3CurrentPrevTagString);
                indexCounterInt ++;
            }
            indexCounterInt = 0;
            while(playerLoadJSONObject.hasKey("negativeVerbIngCurrentPrevTagStringList" + indexCounterInt)){
                String tempNegativeVerbIngCurrentPrevTagString = playerLoadJSONObject.getString("negativeVerbIngCurrentPrevTagStringList" + indexCounterInt);
                tempPlayerObject.negativeVerbIngCurrentPrevTagStringList.add(tempNegativeVerbIngCurrentPrevTagString);
                indexCounterInt ++;
            }
            indexCounterInt = 0;
            while(playerLoadJSONObject.hasKey("negativeVerbSCurrentPrevTagStringList" + indexCounterInt)){
                String tempNegativeVerbSCurrentPrevTagString = playerLoadJSONObject.getString("negativeVerbSCurrentPrevTagStringList" + indexCounterInt);
                tempPlayerObject.negativeVerbSCurrentPrevTagStringList.add(tempNegativeVerbSCurrentPrevTagString);
                indexCounterInt ++;
            }
            indexCounterInt = 0;
            while(playerLoadJSONObject.hasKey("nounCurrentPrevTagStringList" + indexCounterInt)){
                String tempNounCurrentPrevTagString = playerLoadJSONObject.getString("nounCurrentPrevTagStringList" + indexCounterInt);
                tempPlayerObject.nounCurrentPrevTagStringList.add(tempNounCurrentPrevTagString);
                indexCounterInt ++;
            }
            indexCounterInt = 0;
            while(playerLoadJSONObject.hasKey("nounSCurrentPrevTagStringList" + indexCounterInt)){
                String tempNounSCurrentPrevTagString = playerLoadJSONObject.getString("nounSCurrentPrevTagStringList" + indexCounterInt);
                tempPlayerObject.nounSCurrentPrevTagStringList.add(tempNounSCurrentPrevTagString);
                indexCounterInt ++;
            }
            indexCounterInt = 0;
            while(playerLoadJSONObject.hasKey("playerSiblingObjectList" + indexCounterInt)){
                int tempPlayerSiblingObjectInt = playerLoadJSONObject.getInt("playerSiblingObjectList" + indexCounterInt);
                ObjectPlayer tempObjectPlayer = FindPlayerObject(tempPlayerSiblingObjectInt);
                tempPlayerObject.playerSiblingObjectList.add(tempObjectPlayer);
                indexCounterInt ++;
            }
            indexCounterInt = 0;
            while(playerLoadJSONObject.hasKey("sentenceStringList" + indexCounterInt)){
                String tempSentenceString = playerLoadJSONObject.getString("sentenceStringList" + indexCounterInt);
                tempPlayerObject.sentenceStringList.add(tempSentenceString);
                indexCounterInt ++;
            }
            indexCounterInt = 0;
            while(playerLoadJSONObject.hasKey("subjectCurrentPrevTagStringList" + indexCounterInt)){
                String tempSubjectCurrentPrevTagString = playerLoadJSONObject.getString("subjectCurrentPrevTagStringList" + indexCounterInt);
                tempPlayerObject.subjectCurrentPrevTagStringList.add(tempSubjectCurrentPrevTagString);
                indexCounterInt ++;
            }
            indexCounterInt = 0;
            while(playerLoadJSONObject.hasKey("verb1CurrentPrevTagStringList" + indexCounterInt)){
                String tempVerb1CurrentPrevTagString = playerLoadJSONObject.getString("verb1CurrentPrevTagStringList" + indexCounterInt);
                tempPlayerObject.verb1CurrentPrevTagStringList.add(tempVerb1CurrentPrevTagString);
                indexCounterInt ++;
            }
            indexCounterInt = 0;
            while(playerLoadJSONObject.hasKey("verb2CurrentPrevTagStringList" + indexCounterInt)){
                String tempVerb2CurrentPrevTagString = playerLoadJSONObject.getString("verb2CurrentPrevTagStringList" + indexCounterInt);
                tempPlayerObject.verb2CurrentPrevTagStringList.add(tempVerb2CurrentPrevTagString);
                indexCounterInt ++;
            }
            indexCounterInt = 0;
            while(playerLoadJSONObject.hasKey("verb3CurrentPrevTagStringList" + indexCounterInt)){
                String tempVerb3CurrentPrevTagString = playerLoadJSONObject.getString("verb3CurrentPrevTagStringList" + indexCounterInt);
                tempPlayerObject.verb3CurrentPrevTagStringList.add(tempVerb3CurrentPrevTagString);
                indexCounterInt ++;
            }
            indexCounterInt = 0;
            while(playerLoadJSONObject.hasKey("verbIngCurrentPrevTagStringList" + indexCounterInt)){
                String tempVerbSCurrentPrevTagStringList = playerLoadJSONObject.getString("verbIngCurrentPrevTagStringList" + indexCounterInt);
                tempPlayerObject.verbIngCurrentPrevTagStringList.add(tempVerbSCurrentPrevTagStringList);
                indexCounterInt ++;
            }
            indexCounterInt = 0;
            while(playerLoadJSONObject.hasKey("verbSCurrentPrevTagStringList" + indexCounterInt)){
                String tempVerbSCurrentPrevTagString = playerLoadJSONObject.getString("verbSCurrentPrevTagStringList" + indexCounterInt);
                tempPlayerObject.verbSCurrentPrevTagStringList.add(tempVerbSCurrentPrevTagString);
                indexCounterInt ++;
            }
            indexCounterInt = 0;

            boolean tempPlayerFinishedBoolean = playerLoadJSONObject.getBoolean("playerFinishedBoolean"); tempPlayerObject.playerFinishedBoolean = tempPlayerFinishedBoolean;
            boolean tempPlayerVisitCorrectExhibitionBoolean = playerLoadJSONObject.getBoolean("playerVisitCorrectExhibitionBoolean"); tempPlayerObject.playerVisitCorrectExhibitionBoolean = tempPlayerVisitCorrectExhibitionBoolean;
            int tempPlayerMovementModeInt = playerLoadJSONObject.getInt("playerMovementModeInt"); tempPlayerObject.playerMovementModeInt = tempPlayerMovementModeInt;
            int tempPlayerScoreInt = playerLoadJSONObject.getInt("playerScoreInt"); tempPlayerObject.playerScoreInt = tempPlayerScoreInt;
            int tempPlayerSiblingIndexInt = playerLoadJSONObject.getInt("playerSiblingIndexInt"); tempPlayerObject.playerSiblingIndexInt = tempPlayerSiblingIndexInt;
        }
    }

}

void SaveVoid(){

    adjectiveTagSaveJSONArrayObject         = new JSONArray();
    adverbTagSaveJSONArrayObject            = new JSONArray();
    exhibitionSaveJSONArrayObject           = new JSONArray();
    floorSaveJSONArrayObject                = new JSONArray();
    negativeAdjectiveTagSaveJSONArrayObject = new JSONArray();
    negativeAdverbTagSaveJSONArrayObject    = new JSONArray();
    negativeVerbTagSaveJSONArrayObject      = new JSONArray();
    nounTagSaveJSONArrayObject              = new JSONArray();
    playerSaveJSONArrayObject               = new JSONArray();
    roomSaveJSONArrayObject                 = new JSONArray();
    subjectTagSaveJSONArrayObject           = new JSONArray();
    verbTagSaveJSONArrayObject              = new JSONArray();
    for(int i = 0; i < subjectTagObjectList.size(); i ++){
        subjectTagSaveJSONObject = new JSONObject();
        subjectTagSaveJSONObject.setString("nameAltString", subjectTagObjectList.get(i).nameAltString);
        subjectTagSaveJSONObject.setString("nameFullString", subjectTagObjectList.get(i).nameFullString);
        subjectTagSaveJSONObject.setString("tagTypeString", subjectTagObjectList.get(i).tagTypeString);
        subjectTagSaveJSONObject.setString("tagSubjectString", subjectTagObjectList.get(i).tagSubjectString);
        subjectTagSaveJSONArrayObject.setJSONObject(i, subjectTagSaveJSONObject);
    }
    for(int i = 0; i < verbTagObjectList.size(); i ++){
        verbTagSaveJSONObject = new JSONObject();
        verbTagSaveJSONObject.setString("nameAltString", verbTagObjectList.get(i).nameAltString);
        verbTagSaveJSONObject.setString("nameFullString", verbTagObjectList.get(i).nameFullString);
        verbTagSaveJSONObject.setString("tagTypeString", verbTagObjectList.get(i).tagTypeString);
        verbTagSaveJSONObject.setString("tagVerb1String", verbTagObjectList.get(i).tagVerb1String);
        verbTagSaveJSONObject.setString("tagVerb2String", verbTagObjectList.get(i).tagVerb2String);
        verbTagSaveJSONObject.setString("tagVerb3String", verbTagObjectList.get(i).tagVerb3String);
        verbTagSaveJSONObject.setString("tagVerbSString", verbTagObjectList.get(i).tagVerbSString);
        verbTagSaveJSONObject.setString("tagVerbIngString", verbTagObjectList.get(i).tagVerbIngString);
        verbTagSaveJSONArrayObject.setJSONObject(i, verbTagSaveJSONObject);
    }
    for(int i = 0; i < negativeVerbTagObjectList.size(); i ++){
        negativeVerbTagSaveJSONObject = new JSONObject();
        negativeVerbTagSaveJSONObject.setString("nameAltString", negativeVerbTagObjectList.get(i).nameAltString);
        negativeVerbTagSaveJSONObject.setString("nameFullString", negativeVerbTagObjectList.get(i).nameFullString);
        negativeVerbTagSaveJSONObject.setString("tagTypeString", negativeVerbTagObjectList.get(i).tagTypeString);
        negativeVerbTagSaveJSONObject.setString("tagNegativeVerb1String", negativeVerbTagObjectList.get(i).tagNegativeVerb1String);
        negativeVerbTagSaveJSONObject.setString("tagNegativeVerb2String", negativeVerbTagObjectList.get(i).tagNegativeVerb2String);
        negativeVerbTagSaveJSONObject.setString("tagNegativeVerb3String", negativeVerbTagObjectList.get(i).tagNegativeVerb3String);
        negativeVerbTagSaveJSONObject.setString("tagNegativeVerbSString", negativeVerbTagObjectList.get(i).tagNegativeVerbSString);
        negativeVerbTagSaveJSONObject.setString("tagNegativeVerbIngString", negativeVerbTagObjectList.get(i).tagNegativeVerbIngString);
        negativeVerbTagSaveJSONArrayObject.setJSONObject(i, negativeVerbTagSaveJSONObject);
    }
    for(int i = 0; i < nounTagObjectList.size(); i ++){
        nounTagSaveJSONObject = new JSONObject();
        nounTagSaveJSONObject.setString("nameAltString", nounTagObjectList.get(i).nameAltString);
        nounTagSaveJSONObject.setString("nameFullString", nounTagObjectList.get(i).nameFullString);
        nounTagSaveJSONObject.setString("tagTypeString", nounTagObjectList.get(i).tagTypeString);
        nounTagSaveJSONObject.setString("tagNounString", nounTagObjectList.get(i).tagNounString);
        nounTagSaveJSONObject.setString("tagNounSString", nounTagObjectList.get(i).tagNounSString);
        nounTagSaveJSONArrayObject.setJSONObject(i, nounTagSaveJSONObject);
    }
    for(int i = 0; i < adjectiveTagObjectList.size(); i ++){
        adjectiveTagSaveJSONObject = new JSONObject();
        adjectiveTagSaveJSONObject.setString("nameAltString", adjectiveTagObjectList.get(i).nameAltString);
        adjectiveTagSaveJSONObject.setString("nameFullString", adjectiveTagObjectList.get(i).nameFullString);
        adjectiveTagSaveJSONObject.setString("tagTypeString", adjectiveTagObjectList.get(i).tagTypeString);
        adjectiveTagSaveJSONObject.setString("tagAdjectiveString", adjectiveTagObjectList.get(i).tagAdjectiveString);
        adjectiveTagSaveJSONArrayObject.setJSONObject(i, adjectiveTagSaveJSONObject);
    }
    for(int i = 0; i < negativeAdjectiveTagObjectList.size(); i ++){
        negativeAdjectiveTagSaveJSONObject = new JSONObject();
        negativeAdjectiveTagSaveJSONObject.setString("nameAltString", negativeAdjectiveTagObjectList.get(i).nameAltString);
        negativeAdjectiveTagSaveJSONObject.setString("nameFullString", negativeAdjectiveTagObjectList.get(i).nameFullString);
        negativeAdjectiveTagSaveJSONObject.setString("tagTypeString", negativeAdjectiveTagObjectList.get(i).tagTypeString);
        negativeAdjectiveTagSaveJSONObject.setString("tagNegativeAdjectiveString", negativeAdjectiveTagObjectList.get(i).tagNegativeAdjectiveString);
        negativeAdjectiveTagSaveJSONArrayObject.setJSONObject(i, negativeAdjectiveTagSaveJSONObject);
    }
    for(int i = 0; i < adverbTagObjectList.size(); i ++){
        adverbTagSaveJSONObject = new JSONObject();
        adverbTagSaveJSONObject.setString("nameAltString", adverbTagObjectList.get(i).nameAltString);
        adverbTagSaveJSONObject.setString("nameFullString", adverbTagObjectList.get(i).nameFullString);
        adverbTagSaveJSONObject.setString("tagTypeString", adverbTagObjectList.get(i).tagTypeString);
        adverbTagSaveJSONObject.setString("tagAdverbString", adverbTagObjectList.get(i).tagAdverbString);
        adverbTagSaveJSONArrayObject.setJSONObject(i, adverbTagSaveJSONObject);
    }
    for(int i = 0; i < negativeAdverbTagObjectList.size(); i ++){
        negativeAdverbTagSaveJSONObject = new JSONObject();
        negativeAdverbTagSaveJSONObject.setString("nameAltString", negativeAdverbTagObjectList.get(i).nameAltString);
        negativeAdverbTagSaveJSONObject.setString("nameFullString", negativeAdverbTagObjectList.get(i).nameFullString);
        negativeAdverbTagSaveJSONObject.setString("tagTypeString", negativeAdverbTagObjectList.get(i).tagTypeString);
        negativeAdverbTagSaveJSONObject.setString("tagNegativeAdverbString", negativeAdverbTagObjectList.get(i).tagNegativeAdverbString);
        negativeAdverbTagSaveJSONArrayObject.setJSONObject(i, negativeAdverbTagSaveJSONObject);
    }
    for(int i = 0; i < floorObjectList.size(); i ++){
        floorSaveJSONObject = new JSONObject();
        floorSaveJSONObject.setBoolean("fullBoolean", floorObjectList.get(i).fullBoolean);
        floorSaveJSONObject.setInt("indexGlobalInt", floorObjectList.get(i).indexGlobalInt);
        floorSaveJSONObject.setInt("indexLocalInt", floorObjectList.get(i).indexLocalInt);
        floorSaveJSONObject.setInt("visitorCurrentInt", floorObjectList.get(i).visitorCurrentInt);
        floorSaveJSONObject.setInt("visitorTotalInt", floorObjectList.get(i).visitorTotalInt);
        floorSaveJSONObject.setString("nameAltString", floorObjectList.get(i).nameAltString);
        floorSaveJSONObject.setString("nameFullString", floorObjectList.get(i).nameFullString);
        floorSaveJSONObject.setString("parentNameAltString", floorObjectList.get(i).parentNameAltString);
        floorSaveJSONObject.setString("typeString", floorObjectList.get(i).typeString);
        for(int j = 0; j < floorObjectList.get(i).explanationStringArray.length; j ++){ playerSaveJSONObject.setString("explanationStringArray" + j, floorObjectList.get(i).explanationStringArray[j]); }
        for(int j = 0; j < floorObjectList.get(i).tagMuseumNameAltStringList.size(); j ++){ floorSaveJSONObject.setString("tagMuseumNameAltStringList" + j, floorObjectList.get(i).tagMuseumNameAltStringList.get(j)); }
        floorSaveJSONArrayObject.setJSONObject(i, floorSaveJSONObject);
    }
    for(int i = 0; i < roomObjectList.size(); i ++){
        roomSaveJSONObject = new JSONObject();
        for(int j = 0; j < roomObjectList.get(i).explanationStringArray.length; j ++){ playerSaveJSONObject.setString("explanationStringArray" + j, roomObjectList.get(i).explanationStringArray[j]); }
        for(int j = 0; j < roomObjectList.get(i).tagMuseumNameAltStringList.size(); j ++){ roomSaveJSONObject.setString("tagMuseumNameAltStringList" + j, roomObjectList.get(i).tagMuseumNameAltStringList.get(j)); }
        roomSaveJSONObject.setBoolean("fullBoolean", roomObjectList.get(i).fullBoolean);
        roomSaveJSONObject.setInt("indexGlobalInt", roomObjectList.get(i).indexGlobalInt);
        roomSaveJSONObject.setInt("indexLocalInt", roomObjectList.get(i).indexLocalInt);
        roomSaveJSONObject.setInt("visitorCurrentInt", roomObjectList.get(i).visitorCurrentInt);
        roomSaveJSONObject.setInt("visitorTotalInt", roomObjectList.get(i).visitorTotalInt);
        roomSaveJSONObject.setString("nameAltString", roomObjectList.get(i).nameAltString);
        roomSaveJSONObject.setString("nameFullString", roomObjectList.get(i).nameFullString);
        roomSaveJSONObject.setString("parentNameAltString", roomObjectList.get(i).parentNameAltString);
        roomSaveJSONObject.setString("typeString", roomObjectList.get(i).typeString);
        roomSaveJSONArrayObject.setJSONObject(i, roomSaveJSONObject);
    }
    for(int i = 0; i < exhibitionObjectList.size(); i ++){
        exhibitionSaveJSONObject = new JSONObject();
        exhibitionSaveJSONObject.setBoolean("fullBoolean", exhibitionObjectList.get(i).fullBoolean);
        exhibitionSaveJSONObject.setInt("indexGlobalInt", exhibitionObjectList.get(i).indexGlobalInt);
        exhibitionSaveJSONObject.setInt("indexLocalInt", exhibitionObjectList.get(i).indexLocalInt);
        exhibitionSaveJSONObject.setInt("visitorCurrentInt", exhibitionObjectList.get(i).visitorCurrentInt);
        exhibitionSaveJSONObject.setInt("visitorTotalInt", exhibitionObjectList.get(i).visitorTotalInt);
        exhibitionSaveJSONObject.setString("nameAltString", exhibitionObjectList.get(i).nameAltString);
        exhibitionSaveJSONObject.setString("nameFullString", exhibitionObjectList.get(i).nameFullString);
        exhibitionSaveJSONObject.setString("parentNameAltString", exhibitionObjectList.get(i).parentNameAltString);
        exhibitionSaveJSONObject.setString("typeString", exhibitionObjectList.get(i).typeString);
        for(int j = 0; j < exhibitionObjectList.get(i).explanationStringArray.length; j ++){ playerSaveJSONObject.setString("explanationStringArray" + j, exhibitionObjectList.get(i).explanationStringArray[j]); }
        for(int j = 0; j < exhibitionObjectList.get(i).tagMuseumNameAltStringList.size(); j ++){ exhibitionSaveJSONObject.setString("tagMuseumNameAltStringList" + j, exhibitionObjectList.get(i).tagMuseumNameAltStringList.get(j)); }
        exhibitionSaveJSONArrayObject.setJSONObject(i, exhibitionSaveJSONObject);
    }
    for(int i = 0; i < playerObjectList.size(); i ++){
        playerSaveJSONObject = new JSONObject();
        for(int j = 0; j < playerObjectList.get(i).adjectiveCurrentPrevTagStringList.size(); j ++){ playerSaveJSONObject.setString("adjectiveCurrentPrevTagStringList" + j, playerObjectList.get(i).adjectiveCurrentPrevTagStringList.get(j)); }
        for(int j = 0; j < playerObjectList.get(i).adverbCurrentPrevTagStringList.size(); j ++){ playerSaveJSONObject.setString("adverbCurrentPrevTagStringList" + j, playerObjectList.get(i).adverbCurrentPrevTagStringList.get(j)); }
        for(int j = 0; j < playerObjectList.get(i).exhibitionTargetNameAltStringList.size(); j ++){ playerSaveJSONObject.setString("exhibitionTargetNameAltStringList" + j, playerObjectList.get(i).exhibitionTargetNameAltStringList.get(j)); }
        for(int j = 0; j < playerObjectList.get(i).exhibitionVisitedNameAltStringList.size(); j ++){ playerSaveJSONObject.setString("exhibitionVisitedNameAltStringList" + j, playerObjectList.get(i).exhibitionVisitedNameAltStringList.get(j)); }
        for(int j = 0; j < playerObjectList.get(i).explanationStringList.size(); j ++){ playerSaveJSONObject.setString("explanationStringList" + j, playerObjectList.get(i).explanationStringList.get(j)); }
        for(int j = 0; j < playerObjectList.get(i).negativeAdjectiveCurrentPrevTagStringList.size(); j ++){ playerSaveJSONObject.setString("negativeAdjectiveCurrentPrevTagStringList" + j, playerObjectList.get(i).negativeAdjectiveCurrentPrevTagStringList.get(j)); }
        for(int j = 0; j < playerObjectList.get(i).negativeAdverbCurrentPrevTagStringList.size(); j ++){ playerSaveJSONObject.setString("negativeAdverbCurrentPrevTagStringList" + j, playerObjectList.get(i).negativeAdverbCurrentPrevTagStringList.get(j)); }
        for(int j = 0; j < playerObjectList.get(i).negativeVerb1CurrentPrevTagStringList.size(); j ++){ playerSaveJSONObject.setString("negativeVerb1CurrentPrevTagStringList" + j, playerObjectList.get(i).negativeVerb1CurrentPrevTagStringList.get(j)); }
        for(int j = 0; j < playerObjectList.get(i).negativeVerb2CurrentPrevTagStringList.size(); j ++){ playerSaveJSONObject.setString("negativeVerb2CurrentPrevTagStringList" + j, playerObjectList.get(i).negativeVerb2CurrentPrevTagStringList.get(j)); }
        for(int j = 0; j < playerObjectList.get(i).negativeVerb3CurrentPrevTagStringList.size(); j ++){ playerSaveJSONObject.setString("negativeVerb3CurrentPrevTagStringList" + j, playerObjectList.get(i).negativeVerb3CurrentPrevTagStringList.get(j)); }
        for(int j = 0; j < playerObjectList.get(i).negativeVerbIngCurrentPrevTagStringList.size(); j ++){ playerSaveJSONObject.setString("negativeVerbIngCurrentPrevTagStringList" + j, playerObjectList.get(i).negativeVerbIngCurrentPrevTagStringList.get(j)); }
        for(int j = 0; j < playerObjectList.get(i).negativeVerbSCurrentPrevTagStringList.size(); j ++){ playerSaveJSONObject.setString("negativeVerbSCurrentPrevTagStringList" + j, playerObjectList.get(i).negativeVerbSCurrentPrevTagStringList.get(j)); }
        for(int j = 0; j < playerObjectList.get(i).nounCurrentPrevTagStringList.size(); j ++){ playerSaveJSONObject.setString("nounCurrentPrevTagStringList" + j, playerObjectList.get(i).nounCurrentPrevTagStringList.get(j)); }
        for(int j = 0; j < playerObjectList.get(i).nounSCurrentPrevTagStringList.size(); j ++){ playerSaveJSONObject.setString("nounSCurrentPrevTagStringList" + j, playerObjectList.get(i).nounSCurrentPrevTagStringList.get(j)); }
        for(int j = 0; j < playerObjectList.get(i).playerSiblingObjectList.size(); j ++){ playerSaveJSONObject.setInt("playerSiblingObjectList" + j, playerObjectList.get(i).playerSiblingObjectList.get(j).playerIndexInt); }
        for(int j = 0; j < playerObjectList.get(i).sentenceStringList.size(); j ++){ playerSaveJSONObject.setString("sentenceStringList" + j, playerObjectList.get(i).sentenceStringList.get(j)); }
        for(int j = 0; j < playerObjectList.get(i).subjectCurrentPrevTagStringList.size(); j ++){ playerSaveJSONObject.setString("subjectCurrentPrevTagStringList" + j, playerObjectList.get(i).subjectCurrentPrevTagStringList.get(j)); }
        for(int j = 0; j < playerObjectList.get(i).exhibitionTagCounterList.size(); j ++){ playerSaveJSONObject.setString("exhibitionTagCounterListNamAltString" + j, playerObjectList.get(i).exhibitionTagCounterList.get(j).tagNameAltString); }
        for(int j = 0; j < playerObjectList.get(i).exhibitionTagCounterList.size(); j ++){ playerSaveJSONObject.setString("exhibitionTagCounterListNameFullString" + j, playerObjectList.get(i).exhibitionTagCounterList.get(j).tagNameFullString); }
        for(int j = 0; j < playerObjectList.get(i).exhibitionTagCounterList.size(); j ++){ playerSaveJSONObject.setInt("exhibitionTagCounterListTagCounterInt" + j, playerObjectList.get(i).exhibitionTagCounterList.get(j).tagCounterInt); }
        for(int j = 0; j < playerObjectList.get(i).verb1CurrentPrevTagStringList.size(); j ++){ playerSaveJSONObject.setString("verb1CurrentPrevTagStringList" + j, playerObjectList.get(i).verb1CurrentPrevTagStringList.get(j)); }
        for(int j = 0; j < playerObjectList.get(i).verb2CurrentPrevTagStringList.size(); j ++){ playerSaveJSONObject.setString("verb2CurrentPrevTagStringList" + j, playerObjectList.get(i).verb2CurrentPrevTagStringList.get(j)); }
        for(int j = 0; j < playerObjectList.get(i).verb3CurrentPrevTagStringList.size(); j ++){ playerSaveJSONObject.setString("verb3CurrentPrevTagStringList" + j, playerObjectList.get(i).verb3CurrentPrevTagStringList.get(j)); }
        for(int j = 0; j < playerObjectList.get(i).verbIngCurrentPrevTagStringList.size(); j ++){ playerSaveJSONObject.setString("verbIngCurrentPrevTagStringList" + j, playerObjectList.get(i).verbIngCurrentPrevTagStringList.get(j)); }
        for(int j = 0; j < playerObjectList.get(i).verbSCurrentPrevTagStringList.size(); j ++){ playerSaveJSONObject.setString("verbSCurrentPrevTagStringList" + j, playerObjectList.get(i).verbSCurrentPrevTagStringList.get(j)); }
        playerSaveJSONObject.setBoolean("playerFinishedBoolean", playerObjectList.get(i).playerFinishedBoolean);
        playerSaveJSONObject.setBoolean("playerVisitCorrectExhibitionBoolean", playerObjectList.get(i).playerVisitCorrectExhibitionBoolean);
        playerSaveJSONObject.setInt("playerIndexInt", playerObjectList.get(i).playerIndexInt);
        playerSaveJSONObject.setInt("playerMovementModeInt", playerObjectList.get(i).playerMovementModeInt);
        playerSaveJSONObject.setInt("playerScoreInt", playerObjectList.get(i).playerScoreInt);
        playerSaveJSONObject.setInt("playerSiblingIndexInt", playerObjectList.get(i).playerSiblingIndexInt);
        playerSaveJSONObject.setString("exhibitionCurrentString", playerObjectList.get(i).exhibitionCurrentString);
        playerSaveJSONObject.setString("playerNameString", playerObjectList.get(i).playerNameString);
        playerSaveJSONArrayObject.setJSONObject(i, playerSaveJSONObject);
    }
    saveJSONArray(adjectiveTagSaveJSONArrayObject, "data/adjectiveTag.json");
    saveJSONArray(adverbTagSaveJSONArrayObject, "data/adverbTag.json");
    saveJSONArray(exhibitionSaveJSONArrayObject, "data/exhibition.json");
    saveJSONArray(floorSaveJSONArrayObject, "data/floor.json");
    saveJSONArray(negativeAdjectiveTagSaveJSONArrayObject, "data/negativeAdjectiveTag.json");
    saveJSONArray(negativeAdverbTagSaveJSONArrayObject, "data/negativeAdverbTag.json");
    saveJSONArray(negativeVerbTagSaveJSONArrayObject, "data/negativeVerbTag.json");
    saveJSONArray(nounTagSaveJSONArrayObject, "data/nounTag.json");
    saveJSONArray(playerSaveJSONArrayObject, "data/player.json");
    saveJSONArray(roomSaveJSONArrayObject, "data/room.json");
    saveJSONArray(subjectTagSaveJSONArrayObject, "data/subjectTag.json");
    saveJSONArray(verbTagSaveJSONArrayObject, "data/verbTag.json");

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
    if      (!_typeString.equals("FLR")){

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

    for(int i = 0; i < floorObjectList.size(); i ++){

        if(floorObjectList.get(i).nameAltString     .equals(_objectNameString)){ tempMuseumObject = floorObjectList.get(i); }
        if(floorObjectList.get(i).nameFullString    .equals(_objectNameString)){ tempMuseumObject = floorObjectList.get(i); }

    }
    for(int i = 0; i < roomObjectList.size(); i ++){

        if(roomObjectList.get(i).nameAltString     .equals(_objectNameString)){ tempMuseumObject = roomObjectList.get(i); }
        if(roomObjectList.get(i).nameFullString    .equals(_objectNameString)){ tempMuseumObject = roomObjectList.get(i); }

    }
    for(int i = 0; i < exhibitionObjectList.size(); i ++){

        if(exhibitionObjectList.get(i).nameAltString     .equals(_objectNameString)){ tempMuseumObject = exhibitionObjectList.get(i); }
        if(exhibitionObjectList.get(i).nameFullString    .equals(_objectNameString)){ tempMuseumObject = exhibitionObjectList.get(i); }

    }

    return tempMuseumObject;

}

ObjectPlayer FindPlayerObject(int _playerIndexInt){

    ObjectPlayer tempPlayerObject = null;
    for(int i = 0; i < playerObjectList.size(); i ++){

        if(playerObjectList.get(i).playerIndexInt == _playerIndexInt){ tempPlayerObject = playerObjectList.get(i); }

    }

    return tempPlayerObject;

}
    
Tag FindTagObject(String _tagName){

    Tag tempTagObject = null;
    for(int i = 0; i < subjectTagObjectList.size(); i ++){

        if(subjectTagObjectList.get(i).nameAltString     .equals(_tagName)){ tempTagObject = subjectTagObjectList.get(i); }
        if(subjectTagObjectList.get(i).nameFullString    .equals(_tagName)){ tempTagObject = subjectTagObjectList.get(i); }

    }
    for(int i = 0; i < verbTagObjectList.size(); i ++){

        if(verbTagObjectList.get(i).nameAltString     .equals(_tagName)){ tempTagObject = verbTagObjectList.get(i); }
        if(verbTagObjectList.get(i).nameFullString    .equals(_tagName)){ tempTagObject = verbTagObjectList.get(i); }

    }
    for(int i = 0; i < negativeVerbTagObjectList.size(); i ++){

        if(negativeVerbTagObjectList.get(i).nameAltString     .equals(_tagName)){ tempTagObject = negativeVerbTagObjectList.get(i); }
        if(negativeVerbTagObjectList.get(i).nameFullString    .equals(_tagName)){ tempTagObject = negativeVerbTagObjectList.get(i); }

    }
    for(int i = 0; i < nounTagObjectList.size(); i ++){

        if(nounTagObjectList.get(i).nameAltString     .equals(_tagName)){ tempTagObject = nounTagObjectList.get(i); }
        if(nounTagObjectList.get(i).nameFullString    .equals(_tagName)){ tempTagObject = nounTagObjectList.get(i); }

    }
    for(int i = 0; i < adjectiveTagObjectList.size(); i ++){

        if(adjectiveTagObjectList.get(i).nameAltString     .equals(_tagName)){ tempTagObject = adjectiveTagObjectList.get(i); }
        if(adjectiveTagObjectList.get(i).nameFullString    .equals(_tagName)){ tempTagObject = adjectiveTagObjectList.get(i); }

    }
    for(int i = 0; i < negativeAdjectiveTagObjectList.size(); i ++){

        if(negativeAdjectiveTagObjectList.get(i).nameAltString     .equals(_tagName)){ tempTagObject = negativeAdjectiveTagObjectList.get(i); }
        if(negativeAdjectiveTagObjectList.get(i).nameFullString    .equals(_tagName)){ tempTagObject = negativeAdjectiveTagObjectList.get(i); }

    }
    for(int i = 0; i < adverbTagObjectList.size(); i ++){

        if(adverbTagObjectList.get(i).nameAltString     .equals(_tagName)){ tempTagObject = adverbTagObjectList.get(i); }
        if(adverbTagObjectList.get(i).nameFullString    .equals(_tagName)){ tempTagObject = adverbTagObjectList.get(i); }

    }
    for(int i = 0; i < negativeAdverbTagObjectList.size(); i ++){

        if(negativeAdverbTagObjectList.get(i).nameAltString     .equals(_tagName)){ tempTagObject = negativeAdverbTagObjectList.get(i); }
        if(negativeAdverbTagObjectList.get(i).nameFullString    .equals(_tagName)){ tempTagObject = negativeAdverbTagObjectList.get(i); }

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

    List<Tag> _subjectTagObjectList             ,
    List<Tag> _verbTagObjectList                ,
    List<Tag> _negativeVerbTagObjectList        ,
    List<Tag> _nounTagObjectList                ,
    List<Tag> _adjectiveTagObjectList           ,
    List<Tag> _negativeAdjectiveTagObjectList   ,
    List<Tag> _adverbTagObjectList              ,
    List<Tag> _negativeAdverbTagObjectList

){

    /*Temporary tag object list to be returned later on this function.*/
    List<Tag> assignTagObjectList                           = new ArrayList<Tag>();
    
    AssignRandomTagLoopVoid(_subjectTagObjectList           , assignTagObjectList);
    AssignRandomTagLoopVoid(_verbTagObjectList              , assignTagObjectList);
    AssignRandomTagLoopVoid(_negativeVerbTagObjectList      , assignTagObjectList);
    AssignRandomTagLoopVoid(_nounTagObjectList              , assignTagObjectList);
    AssignRandomTagLoopVoid(_adjectiveTagObjectList         , assignTagObjectList);
    AssignRandomTagLoopVoid(_negativeAdjectiveTagObjectList , assignTagObjectList);
    AssignRandomTagLoopVoid(_adverbTagObjectList            , assignTagObjectList);
    AssignRandomTagLoopVoid(_negativeAdverbTagObjectList    , assignTagObjectList);

    /*Before returning the value, the object here is still in List, hence we need to convert it to array.
    Thus, it can be used in params.*/
    Tag[] assignTagObjectArray                              = new Tag[assignTagObjectList.size()];
    for(int i = 0; i < assignTagObjectArray.length; i ++)   { assignTagObjectArray[i] = assignTagObjectList.get(i); }
    
    return assignTagObjectArray;

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
                    .setType                    (ControlP5.LIST);

    selectPlayerScrollableListObject            = 
        cp5Object   .addScrollableList          ("SelectPlayerScrollableListObject")
                    .hide                       ()
                    .setLabel                   ("SELECT VISITOR:")
                    .setItems                   (playerStringList)
                    .setPosition                (leftMenuXInt, menuYInt)
                    .setSize                    (menuWidthInt, menuHeightInt)
                    .setType                    (ControlP5.LIST);

    addTagGroupGUIObject                        = new AddTagGroupGUIObject          (rightMenuXInt, menuYInt, menuWidthInt, addTagGroupHeightInt        , selectMuseumObjectScrollableListObject                , this);
    addMuseumGroupGUIObject                     = new AddMuseumGroupGUIObject       (rightMenuXInt, menuYInt, menuWidthInt, addMuseumGroupHeightInt     , addTagGroupGUIObject       .addTagGroupObject         , this);
    editTagGroupGUIObject                       = new EditTagGroupGUIObject         (((width/2) - (menuWidthInt/2)), ((height/2) - 250), menuWidthInt, 500, selectMuseumObjectScrollableListObject              , this);
    editPlayerGroupGUIObject                    = new EditPlayerGroupGUIObject      (leftMenuXInt , menuYInt, menuWidthInt, editPlayerGroupHeightInt    , selectPlayerScrollableListObject                      , this);
    removePlayerGroupGUIObject                  = new RemovePlayerGroupGUIObject    (leftMenuXInt , menuYInt, menuWidthInt, removePlayerGroupHeightInt  , editPlayerGroupGUIObject   .editPlayerGroupObject     , this);
    addPlayerGroupGUIObject                     = new AddPlayerGroupGUIObject       (leftMenuXInt , menuYInt, menuWidthInt, addPlayerGroupHeightInt     , removePlayerGroupGUIObject .removePlayerGroupObject   , this);
    
    rightMenuAccordionObject                    =
        cp5Object   .addAccordion               ("RightMenuAccordionObject")
                    .addItem                    (addMuseumGroupGUIObject.addMuseumGroupObject)
                    .addItem                    (addTagGroupGUIObject.addTagGroupObject)
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
    addTagGroupGUIObject                    .DrawVoid(dropdownMObjectAlphaFloat);
    editTagGroupGUIObject                   .DrawVoid(dropdownMObjectAlphaFloat);
    addPlayerGroupGUIObject                 .DrawVoid(dropdownPlayerAlphaFloat) ;
    removePlayerGroupGUIObject              .DrawVoid(dropdownPlayerAlphaFloat) ;
    editPlayerGroupGUIObject                .DrawVoid(dropdownPlayerAlphaFloat) ;

    if      (addMuseumGroupGUIObject        .addMuseumGroupObject   .isOpen() == true)  { selectMuseumObjectScrollableListObject  .setPosition(rightMenuXInt, menuYInt + 1 + 469); selectMuseumObjectScrollableListObject   .setHeight(height - (buttonSizeInt*2) - 1 - 469); }
    else if (addTagGroupGUIObject           .addTagGroupObject      .isOpen() == true)  { selectMuseumObjectScrollableListObject  .setPosition(rightMenuXInt, menuYInt + 1 + 263); selectMuseumObjectScrollableListObject   .setHeight(height - (buttonSizeInt*2) - 1 - 263); }
    else                                                                                { selectMuseumObjectScrollableListObject  .setPosition(rightMenuXInt, menuYInt + 1 + 19 ); selectMuseumObjectScrollableListObject   .setHeight(height - (buttonSizeInt*2) - 1 - 19 ); }

    if      (addPlayerGroupGUIObject        .addPlayerGroupObject   .isOpen() == true)  { selectPlayerScrollableListObject        .setPosition(leftMenuXInt , menuYInt + 1 + 173); selectPlayerScrollableListObject         .setHeight(height - (buttonSizeInt*2) - 1 - 173); }
    else if (editPlayerGroupGUIObject       .editPlayerGroupObject  .isOpen() == true)  { selectPlayerScrollableListObject        .setPosition(leftMenuXInt , menuYInt + 1 + 456); selectPlayerScrollableListObject         .setHeight(height - (buttonSizeInt*2) - 1 - 456); }
    else if (removePlayerGroupGUIObject     .removePlayerGroupObject.isOpen() == true)  { selectPlayerScrollableListObject        .setPosition(leftMenuXInt , menuYInt + 1 + 133); selectPlayerScrollableListObject         .setHeight(height - (buttonSizeInt*2) - 1 - 133); }
    else                                                                                { selectPlayerScrollableListObject        .setPosition(leftMenuXInt , menuYInt + 1 + 29 ); selectPlayerScrollableListObject         .setHeight(height - (buttonSizeInt*2) - 1 - 29 ); }
    
    

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

    addMuseumGroupGUIObject.tempSelectedTypeObjectMuseumNameFullString                                  = addMuseumGroupGUIObject.addMuseumGroupSelectTypeMuseumObjectScrollableListObject.getItem(_indexInt).get("text").toString();   /*Take the full name type of object museum that the user will make.*/
    /*Convert the object museum type name full into object museum type name alternate name.*/
    if      (addMuseumGroupGUIObject.tempSelectedTypeObjectMuseumNameFullString.equals("Floor"      ))  {
        addMuseumGroupGUIObject.tempSelectedTypeObjectMuseumNameAltString                   = "FLR";
        addMuseumGroupGUIObject.addMuseumGroupSelectParentMuseumObjectScrollableListObject  .setItems(defaultStringList);
    }
    else if (addMuseumGroupGUIObject.tempSelectedTypeObjectMuseumNameFullString.equals("Room"       ))  {
        addMuseumGroupGUIObject.tempSelectedTypeObjectMuseumNameAltString                   = "ROM";
        addMuseumGroupGUIObject.addMuseumGroupSelectParentMuseumObjectScrollableListObject  .setItems(floorNameFullStringList);
    }
    else if (addMuseumGroupGUIObject.tempSelectedTypeObjectMuseumNameFullString.equals("Exhibition" ))  {
        addMuseumGroupGUIObject.tempSelectedTypeObjectMuseumNameAltString                   = "EXH";
        addMuseumGroupGUIObject.addMuseumGroupSelectParentMuseumObjectScrollableListObject  .setItems(roomNameFullStringList);
    }

}
/*These functions is for assigning tags into museum object that the user will add.*/
void AddMuseumGroupSelectSubjectTagMuseumObjectScrollableListObject             (int _indexInt) { addMuseumGroupGUIObject.CovertScrollableListIntoCheckListVoid(_indexInt, addMuseumGroupGUIObject.addMuseumGroupSelectSubjectTagMuseumObjectScrollableListObject           ); addMuseumGroupGUIObject.tempSelectedTagNameFullStringList    = addMuseumGroupGUIObject.SetSelectedCheckListStringList(subjectTagNameFullStringList               , addMuseumGroupGUIObject.tempSelectedTagNameFullStringList  , addMuseumGroupGUIObject.addMuseumGroupSelectSubjectTagMuseumObjectScrollableListObject            ); }
void AddMuseumGroupSelectVerbTagMuseumObjectScrollableListObject                (int _indexInt) { addMuseumGroupGUIObject.CovertScrollableListIntoCheckListVoid(_indexInt, addMuseumGroupGUIObject.addMuseumGroupSelectVerbTagMuseumObjectScrollableListObject              ); addMuseumGroupGUIObject.tempSelectedTagNameFullStringList    = addMuseumGroupGUIObject.SetSelectedCheckListStringList(verbTagNameFullStringList                  , addMuseumGroupGUIObject.tempSelectedTagNameFullStringList  , addMuseumGroupGUIObject.addMuseumGroupSelectVerbTagMuseumObjectScrollableListObject               ); }
void AddMuseumGroupSelectNegativeVerbTagMuseumObjectScrollableListObject        (int _indexInt) { addMuseumGroupGUIObject.CovertScrollableListIntoCheckListVoid(_indexInt, addMuseumGroupGUIObject.addMuseumGroupSelectNegativeVerbTagMuseumObjectScrollableListObject      ); addMuseumGroupGUIObject.tempSelectedTagNameFullStringList    = addMuseumGroupGUIObject.SetSelectedCheckListStringList(negativeVerbTagNameFullStringList          , addMuseumGroupGUIObject.tempSelectedTagNameFullStringList  , addMuseumGroupGUIObject.addMuseumGroupSelectNegativeVerbTagMuseumObjectScrollableListObject       ); }
void AddMuseumGroupSelectNounTagMuseumObjectScrollableListObject                (int _indexInt) { addMuseumGroupGUIObject.CovertScrollableListIntoCheckListVoid(_indexInt, addMuseumGroupGUIObject.addMuseumGroupSelectNounTagMuseumObjectScrollableListObject              ); addMuseumGroupGUIObject.tempSelectedTagNameFullStringList    = addMuseumGroupGUIObject.SetSelectedCheckListStringList(nounTagNameFullStringList                  , addMuseumGroupGUIObject.tempSelectedTagNameFullStringList  , addMuseumGroupGUIObject.addMuseumGroupSelectNounTagMuseumObjectScrollableListObject               ); }
void AddMuseumGroupSelectAdjectiveTagMuseumObjectScrollableListObject           (int _indexInt) { addMuseumGroupGUIObject.CovertScrollableListIntoCheckListVoid(_indexInt, addMuseumGroupGUIObject.addMuseumGroupSelectAdjectiveTagMuseumObjectScrollableListObject         ); addMuseumGroupGUIObject.tempSelectedTagNameFullStringList    = addMuseumGroupGUIObject.SetSelectedCheckListStringList(adjectiveTagNameFullStringList             , addMuseumGroupGUIObject.tempSelectedTagNameFullStringList  , addMuseumGroupGUIObject.addMuseumGroupSelectAdjectiveTagMuseumObjectScrollableListObject          ); }
void AddMuseumGroupSelectNegativeAdjectiveTagMuseumObjectScrollableListObject   (int _indexInt) { addMuseumGroupGUIObject.CovertScrollableListIntoCheckListVoid(_indexInt, addMuseumGroupGUIObject.addMuseumGroupSelectNegativeAdjectiveTagMuseumObjectScrollableListObject ); addMuseumGroupGUIObject.tempSelectedTagNameFullStringList    = addMuseumGroupGUIObject.SetSelectedCheckListStringList(negativeAdjectiveTagNameFullStringList     , addMuseumGroupGUIObject.tempSelectedTagNameFullStringList  , addMuseumGroupGUIObject.addMuseumGroupSelectNegativeAdjectiveTagMuseumObjectScrollableListObject  ); }
void AddMuseumGroupSelectAdverbTagMuseumObjectScrollableListObject              (int _indexInt) { addMuseumGroupGUIObject.CovertScrollableListIntoCheckListVoid(_indexInt, addMuseumGroupGUIObject.addMuseumGroupSelectAdverbTagMuseumObjectScrollableListObject            ); addMuseumGroupGUIObject.tempSelectedTagNameFullStringList    = addMuseumGroupGUIObject.SetSelectedCheckListStringList(adverbTagNameFullStringList                , addMuseumGroupGUIObject.tempSelectedTagNameFullStringList  , addMuseumGroupGUIObject.addMuseumGroupSelectAdverbTagMuseumObjectScrollableListObject             ); }
void AddMuseumGroupSelectNegativeAdverbTagMuseumObjectScrollableListObject      (int _indexInt) { addMuseumGroupGUIObject.CovertScrollableListIntoCheckListVoid(_indexInt, addMuseumGroupGUIObject.addMuseumGroupSelectNegativeAdverbTagMuseumObjectScrollableListObject    ); addMuseumGroupGUIObject.tempSelectedTagNameFullStringList     = addMuseumGroupGUIObject.SetSelectedCheckListStringList(negativeAdverbTagNameFullStringList        , addMuseumGroupGUIObject.tempSelectedTagNameFullStringList  , addMuseumGroupGUIObject.addMuseumGroupSelectNegativeAdverbTagMuseumObjectScrollableListObject     ); }
/*A function to set the full name of parent object.*/
void AddMuseumGroupSelectParentMuseumObjectScrollableListObject                 (int _indexInt) {

    addMuseumGroupGUIObject.tempSelectedParentNameFullString        = addMuseumGroupGUIObject.addMuseumGroupSelectParentMuseumObjectScrollableListObject.getItem(_indexInt).get("text").toString();
    addMuseumGroupGUIObject.tempSelectedParentNameAltString         = FindMuseumObject(addMuseumGroupGUIObject.tempSelectedParentNameFullString).nameAltString;

}
/*Add new museum object with all collected property values.*/
void AddMuseumGroupAddMuseumObjectButtonObject                                  (int _indexInt) {

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

    String          tempTagNameAltString        = addTagGroupGUIObject.addTagGroupTagNameAltTextfieldObject     .getText();
    String          tempTagNameFullString       = addTagGroupGUIObject.addTagGroupTagNameFullTextfieldObject    .getText();
    String          tempTagTypeString           = "";
    Tag             tempTagObject               = null;
    List<Tag>       tempTagObjectList           = null;
    List<String>    tempTagNameAltStringList    = null;
    List<String>    tempTagNameFullStringList   = null;


    if      (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("SUBJECT"))           {

        tempTagTypeString                       = "SUB";
        tempTagObjectList                       = subjectTagObjectList;
        tempTagNameAltStringList                = subjectTagNameAltStringList;
        tempTagNameFullStringList               = subjectTagNameFullStringList;

        String tempSubjectString                = addTagGroupGUIObject.addTagGroupTagSubjectTextfieldObject.getText();
        tempTagObject                           = new Tag(new Name(tempTagNameAltString, tempTagNameFullString), tempTagTypeString, tempSubjectString);

    }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("VERB"))              {

        tempTagTypeString                       = "VER";
        tempTagObjectList                       = verbTagObjectList;
        tempTagNameAltStringList                = verbTagNameAltStringList;
        tempTagNameFullStringList               = verbTagNameFullStringList;

        String tempVerb1String                  = addTagGroupGUIObject.addTagGroupTagVerb1TextfieldObject   .getText();
        String tempVerb2String                  = addTagGroupGUIObject.addTagGroupTagVerb2TextfieldObject   .getText();
        String tempVer3bString                  = addTagGroupGUIObject.addTagGroupTagVerb3TextfieldObject   .getText();
        String tempVerIngbString                = addTagGroupGUIObject.addTagGroupTagVerbIngTextfieldObject .getText();
        String tempVerbSString                  = addTagGroupGUIObject.addTagGroupTagVerbSTextfieldObject   .getText();
        tempTagObject                           = new Tag(new Name(tempTagNameAltString, tempTagNameFullString), tempTagTypeString, tempVerb1String, tempVerb2String, tempVer3bString, tempVerIngbString, tempVerbSString);

    }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("NEGATIVE VERB"))     {

        tempTagTypeString                       = "NVE";
        tempTagObjectList                       = negativeVerbTagObjectList;
        tempTagNameAltStringList                = negativeVerbTagNameAltStringList;
        tempTagNameFullStringList               = negativeVerbTagNameFullStringList;

        String tempNegativeVerb1String          = addTagGroupGUIObject.addTagGroupTagNegativeVerb1TextfieldObject   .getText();
        String tempNegativeVerb2String          = addTagGroupGUIObject.addTagGroupTagNegativeVerb2TextfieldObject   .getText();
        String tempNegativeVer3bString          = addTagGroupGUIObject.addTagGroupTagNegativeVerb3TextfieldObject   .getText();
        String tempNegativeVerIngbString        = addTagGroupGUIObject.addTagGroupTagNegativeVerbIngTextfieldObject .getText();
        String tempNegativeVerbSString          = addTagGroupGUIObject.addTagGroupTagNegativeVerbSTextfieldObject   .getText();
        tempTagObject                           = new Tag(new Name(tempTagNameAltString, tempTagNameFullString), tempTagTypeString, tempNegativeVerb1String, tempNegativeVerb2String, tempNegativeVer3bString, tempNegativeVerIngbString, tempNegativeVerbSString);

    }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("NOUN"))              {

        tempTagTypeString                       = "NOU";
        tempTagObjectList                       = nounTagObjectList;
        tempTagNameAltStringList                = nounTagNameAltStringList;
        tempTagNameFullStringList               = nounTagNameFullStringList;

        String tempNounString                   = addTagGroupGUIObject.addTagGroupTagNounTextfieldObject    .getText();
        String tempNounSString                  = addTagGroupGUIObject.addTagGroupTagNounSTextfieldObject   .getText();
        tempTagObject                           = new Tag(new Name(tempTagNameAltString, tempTagNameFullString), tempTagTypeString, tempNounString, tempNounSString);


    }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("ADJECTIVE"))         {

        tempTagTypeString                       = "ADJ";
        tempTagObjectList                       = adjectiveTagObjectList;
        tempTagNameAltStringList                = adjectiveTagNameAltStringList;
        tempTagNameFullStringList               = adjectiveTagNameFullStringList;

        String tempAdjectiveString              = addTagGroupGUIObject.addTagGroupTagAdjectiveTextfieldObject.getText();
        tempTagObject                           = new Tag(new Name(tempTagNameAltString, tempTagNameFullString), tempTagTypeString, tempAdjectiveString);


    }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("NEGATIVE ADJECTIVE")){

        tempTagTypeString                       = "NDJ";
        tempTagObjectList                       = negativeAdjectiveTagObjectList;
        tempTagNameAltStringList                = negativeAdjectiveTagNameAltStringList;
        tempTagNameFullStringList               = negativeAdjectiveTagNameFullStringList;

        String tempNegativeAdjectiveString      = addTagGroupGUIObject.addTagGroupTagNegativeAdjectiveTextfieldObject.getText();
        tempTagObject                           = new Tag(new Name(tempTagNameAltString, tempTagNameFullString), tempTagTypeString, tempNegativeAdjectiveString);


    }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("ADVERB"))            {

        tempTagTypeString                       = "ADV";
        tempTagObjectList                       = adverbTagObjectList;
        tempTagNameAltStringList                = adverbTagNameAltStringList;
        tempTagNameFullStringList               = adverbTagNameFullStringList;

        String tempAdverbString                 = addTagGroupGUIObject.addTagGroupTagAdverbTextfieldObject.getText();
        tempTagObject                           = new Tag(new Name(tempTagNameAltString, tempTagNameFullString), tempTagTypeString, tempAdverbString);


    }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("NEGATIVE ADVERB"))   {

        tempTagTypeString                       = "NDV";
        tempTagObjectList                       = negativeAdverbTagObjectList;
        tempTagNameAltStringList                = negativeAdverbTagNameAltStringList;
        tempTagNameFullStringList               = negativeAdverbTagNameFullStringList;

        String tempNegativeAdverbString         = addTagGroupGUIObject.addTagGroupTagNegativeAdverbTextfieldObject.getText();
        tempTagObject                           = new Tag(new Name(tempTagNameAltString, tempTagNameFullString), tempTagTypeString, tempNegativeAdverbString);

    }

    tempTagObjectList                           .add(tempTagObject);
    tempTagNameAltStringList                    .add(tempTagObject.nameAltString );
    tempTagNameFullStringList                   .add(tempTagObject.nameFullString);

    if      (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("SUBJECT"))              { addMuseumGroupGUIObject.addMuseumGroupSelectSubjectTagMuseumObjectScrollableListObject            .setItems(tempTagNameFullStringList); }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("VERB"))                 { addMuseumGroupGUIObject.addMuseumGroupSelectVerbTagMuseumObjectScrollableListObject               .setItems(tempTagNameFullStringList); }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("NEGATIVE VERB"))        { addMuseumGroupGUIObject.addMuseumGroupSelectNegativeVerbTagMuseumObjectScrollableListObject       .setItems(tempTagNameFullStringList); }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("NOUN"))                 { addMuseumGroupGUIObject.addMuseumGroupSelectNounTagMuseumObjectScrollableListObject               .setItems(tempTagNameFullStringList); }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("ADJECTIVE"))            { addMuseumGroupGUIObject.addMuseumGroupSelectAdjectiveTagMuseumObjectScrollableListObject          .setItems(tempTagNameFullStringList); }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("NEGATIVE ADJECTIVE"))   { addMuseumGroupGUIObject.addMuseumGroupSelectNegativeAdjectiveTagMuseumObjectScrollableListObject  .setItems(tempTagNameFullStringList); }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("ADVERB"))               { addMuseumGroupGUIObject.addMuseumGroupSelectAdverbTagMuseumObjectScrollableListObject             .setItems(tempTagNameFullStringList); }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("NEGATIVE ADVERB"))      { addMuseumGroupGUIObject.addMuseumGroupSelectNegativeAdverbTagMuseumObjectScrollableListObject     .setItems(tempTagNameFullStringList); }

}
////////////////////////////////////////////////////////////////////////////////////////////////////
//END//AddTagGroupGUIObject.pde Controller's Functions./////////////////////////////////////////////
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
        editTagGroupGUIObject                   .tempSelectedTagNameAltString                       = editTagGroupGUIObject.tempSelectedTagObject.nameAltString                 ;
        editTagGroupGUIObject                   .tempSelectedTagNameFullString                      = editTagGroupGUIObject.tempSelectedTagObject.nameFullString                ;
        editTagGroupGUIObject                   .tempSelectedTagSubjectString                       = editTagGroupGUIObject.tempSelectedTagObject.tagSubjectString              ;
        editTagGroupGUIObject                   .tempSelectedTagVerb1String                         = editTagGroupGUIObject.tempSelectedTagObject.tagVerb1String                ;
        editTagGroupGUIObject                   .tempSelectedTagVerb2String                         = editTagGroupGUIObject.tempSelectedTagObject.tagVerb2String                ;
        editTagGroupGUIObject                   .tempSelectedTagVerb3String                         = editTagGroupGUIObject.tempSelectedTagObject.tagVerb3String                ;
        editTagGroupGUIObject                   .tempSelectedTagVerbIngString                       = editTagGroupGUIObject.tempSelectedTagObject.tagVerbIngString              ;
        editTagGroupGUIObject                   .tempSelectedTagVerbSString                         = editTagGroupGUIObject.tempSelectedTagObject.tagVerbSString                ;
        editTagGroupGUIObject                   .tempSelectedTagNegativeVerb1String                 = editTagGroupGUIObject.tempSelectedTagObject.tagNegativeVerb1String        ;
        editTagGroupGUIObject                   .tempSelectedTagNegativeVerb2String                 = editTagGroupGUIObject.tempSelectedTagObject.tagNegativeVerb2String        ;
        editTagGroupGUIObject                   .tempSelectedTagNegativeVerb3String                 = editTagGroupGUIObject.tempSelectedTagObject.tagNegativeVerb3String        ;
        editTagGroupGUIObject                   .tempSelectedTagNegativeVerbIngString               = editTagGroupGUIObject.tempSelectedTagObject.tagNegativeVerbIngString      ;
        editTagGroupGUIObject                   .tempSelectedTagNegativeVerbSString                 = editTagGroupGUIObject.tempSelectedTagObject.tagNegativeVerbSString        ;
        editTagGroupGUIObject                   .tempSelectedTagNounString                          = editTagGroupGUIObject.tempSelectedTagObject.tagNounString                 ;
        editTagGroupGUIObject                   .tempSelectedTagNounSString                         = editTagGroupGUIObject.tempSelectedTagObject.tagNounSString                ;
        editTagGroupGUIObject                   .tempSelectedTagAdjectiveString                     = editTagGroupGUIObject.tempSelectedTagObject.tagAdjectiveString            ;
        editTagGroupGUIObject                   .tempSelectedTagNegativeAdjectiveString             = editTagGroupGUIObject.tempSelectedTagObject.tagNegativeAdjectiveString    ;
        editTagGroupGUIObject                   .tempSelectedTagAdverbString                        = editTagGroupGUIObject.tempSelectedTagObject.tagAdverbString               ;
        editTagGroupGUIObject                   .tempSelectedTagNegativeAdverbString                = editTagGroupGUIObject.tempSelectedTagObject.tagNegativeAdverbString       ;
        editTagGroupGUIObject                   .editTagGroupTagNameAltTextfieldObject              .setText(editTagGroupGUIObject.tempSelectedTagNameAltString                 );
        editTagGroupGUIObject                   .editTagGroupTagNameFullTextfieldObject             .setText(editTagGroupGUIObject.tempSelectedTagNameFullString                );
        editTagGroupGUIObject                   .editTagGroupTagSubjectTextfieldObject              .setText(editTagGroupGUIObject.tempSelectedTagSubjectString                 );
        editTagGroupGUIObject                   .editTagGroupTagVerb1TextfieldObject                .setText(editTagGroupGUIObject.tempSelectedTagVerb1String                   );
        editTagGroupGUIObject                   .editTagGroupTagVerb2TextfieldObject                .setText(editTagGroupGUIObject.tempSelectedTagVerb2String                   );
        editTagGroupGUIObject                   .editTagGroupTagVerb3TextfieldObject                .setText(editTagGroupGUIObject.tempSelectedTagVerb3String                   );
        editTagGroupGUIObject                   .editTagGroupTagVerbIngTextfieldObject              .setText(editTagGroupGUIObject.tempSelectedTagVerbIngString                 );
        editTagGroupGUIObject                   .editTagGroupTagVerbSTextfieldObject                .setText(editTagGroupGUIObject.tempSelectedTagVerbSString                   );
        editTagGroupGUIObject                   .editTagGroupTagNegativeVerb1TextfieldObject        .setText(editTagGroupGUIObject.tempSelectedTagNegativeVerb1String           );
        editTagGroupGUIObject                   .editTagGroupTagNegativeVerb2TextfieldObject        .setText(editTagGroupGUIObject.tempSelectedTagNegativeVerb2String           );
        editTagGroupGUIObject                   .editTagGroupTagNegativeVerb3TextfieldObject        .setText(editTagGroupGUIObject.tempSelectedTagNegativeVerb3String           );
        editTagGroupGUIObject                   .editTagGroupTagNegativeVerbIngTextfieldObject      .setText(editTagGroupGUIObject.tempSelectedTagNegativeVerbIngString         );
        editTagGroupGUIObject                   .editTagGroupTagNegativeVerbSTextfieldObject        .setText(editTagGroupGUIObject.tempSelectedTagNegativeVerbSString           );
        editTagGroupGUIObject                   .editTagGroupTagNounTextfieldObject                 .setText(editTagGroupGUIObject.tempSelectedTagNounString                    );
        editTagGroupGUIObject                   .editTagGroupTagNounSTextfieldObject                .setText(editTagGroupGUIObject.tempSelectedTagNounSString                   );
        editTagGroupGUIObject                   .editTagGroupTagAdjectiveTextfieldObject            .setText(editTagGroupGUIObject.tempSelectedTagAdjectiveString               );
        editTagGroupGUIObject                   .editTagGroupTagNegativeAdjectiveTextfieldObject    .setText(editTagGroupGUIObject.tempSelectedTagNegativeAdjectiveString       );
        editTagGroupGUIObject                   .editTagGroupTagAdverbTextfieldObject               .setText(editTagGroupGUIObject.tempSelectedTagAdverbString                  );
        editTagGroupGUIObject                   .editTagGroupTagNegativeAdverbTextfieldObject       .setText(editTagGroupGUIObject.tempSelectedTagNegativeAdverbString          );
    }

}
void EditTagGroupTagEditButtonObject(int _indexInt){

    if      (editTagGroupGUIObject.tempSelectedTagTypeString.equals("SUB")){
        println(subjectTagObjectList.size());
        editTagGroupGUIObject.tempSelectedTagObject.nameAltString                 = editTagGroupGUIObject.editTagGroupTagNameAltTextfieldObject.getText();
        editTagGroupGUIObject.tempSelectedTagObject.nameFullString                = editTagGroupGUIObject.editTagGroupTagNameFullTextfieldObject.getText();
        editTagGroupGUIObject.tempSelectedTagObject.tagSubjectString              = editTagGroupGUIObject.editTagGroupTagSubjectTextfieldObject.getText();
        subjectTagNameAltStringList                 .clear();
        subjectTagNameFullStringList                .clear();
        for(int i = 0; i < subjectTagObjectList     .size(); i ++){ subjectTagNameAltStringList.add(subjectTagObjectList.get(i).nameAltString ); subjectTagNameFullStringList.add(subjectTagObjectList.get(i).nameFullString); }
    }
    else if (editTagGroupGUIObject.tempSelectedTagTypeString.equals("VER")){
        editTagGroupGUIObject.tempSelectedTagObject.nameAltString                 = editTagGroupGUIObject.editTagGroupTagNameAltTextfieldObject.getText();
        editTagGroupGUIObject.tempSelectedTagObject.nameFullString                = editTagGroupGUIObject.editTagGroupTagNameFullTextfieldObject.getText();
        editTagGroupGUIObject.tempSelectedTagObject.tagVerb1String                = editTagGroupGUIObject.editTagGroupTagVerb1TextfieldObject.getText();
        editTagGroupGUIObject.tempSelectedTagObject.tagVerb2String                = editTagGroupGUIObject.editTagGroupTagVerb2TextfieldObject.getText();
        editTagGroupGUIObject.tempSelectedTagObject.tagVerb3String                = editTagGroupGUIObject.editTagGroupTagVerb3TextfieldObject.getText();
        editTagGroupGUIObject.tempSelectedTagObject.tagVerbIngString              = editTagGroupGUIObject.editTagGroupTagVerbIngTextfieldObject.getText();
        editTagGroupGUIObject.tempSelectedTagObject.tagVerbSString                = editTagGroupGUIObject.editTagGroupTagVerbSTextfieldObject.getText();
        verbTagNameAltStringList                    .clear();
        verbTagNameFullStringList                   .clear();
        for(int i = 0; i < verbTagObjectList        .size(); i ++){ verbTagNameAltStringList.add(verbTagObjectList.get(i).nameAltString ); verbTagNameFullStringList.add(verbTagObjectList.get(i).nameFullString); }

    }
    else if (editTagGroupGUIObject.tempSelectedTagTypeString.equals("NVE")){
        editTagGroupGUIObject.tempSelectedTagObject.nameAltString                 = editTagGroupGUIObject.editTagGroupTagNameAltTextfieldObject.getText();
        editTagGroupGUIObject.tempSelectedTagObject.nameFullString                = editTagGroupGUIObject.editTagGroupTagNameFullTextfieldObject.getText();
        editTagGroupGUIObject.tempSelectedTagObject.tagNegativeVerb1String        = editTagGroupGUIObject.editTagGroupTagNegativeVerb1TextfieldObject.getText();
        editTagGroupGUIObject.tempSelectedTagObject.tagNegativeVerb2String        = editTagGroupGUIObject.editTagGroupTagNegativeVerb2TextfieldObject.getText();
        editTagGroupGUIObject.tempSelectedTagObject.tagNegativeVerb3String        = editTagGroupGUIObject.editTagGroupTagNegativeVerb3TextfieldObject.getText();
        editTagGroupGUIObject.tempSelectedTagObject.tagNegativeVerbIngString      = editTagGroupGUIObject.editTagGroupTagNegativeVerbIngTextfieldObject.getText();
        editTagGroupGUIObject.tempSelectedTagObject.tagNegativeVerbSString        = editTagGroupGUIObject.editTagGroupTagNegativeVerbSTextfieldObject.getText();
        negativeVerbTagNameAltStringList            .clear();
        negativeVerbTagNameFullStringList           .clear();
        for(int i = 0; i < verbTagObjectList        .size(); i ++){ negativeVerbTagNameAltStringList.add(negativeVerbTagObjectList.get(i).nameAltString ); negativeVerbTagNameFullStringList.add(negativeVerbTagObjectList.get(i).nameFullString); }
    }
    else if (editTagGroupGUIObject.tempSelectedTagTypeString.equals("NOU")){
        editTagGroupGUIObject.tempSelectedTagObject.nameAltString                 = editTagGroupGUIObject.editTagGroupTagNameAltTextfieldObject.getText();
        editTagGroupGUIObject.tempSelectedTagObject.nameFullString                = editTagGroupGUIObject.editTagGroupTagNameFullTextfieldObject.getText();
        editTagGroupGUIObject.tempSelectedTagObject.tagNounString                 = editTagGroupGUIObject.editTagGroupTagNounTextfieldObject.getText();
        editTagGroupGUIObject.tempSelectedTagObject.tagNounSString                = editTagGroupGUIObject.editTagGroupTagNounSTextfieldObject.getText();
        nounTagNameAltStringList                    .clear();
        nounTagNameFullStringList                   .clear();
        for(int i = 0; i < nounTagObjectList        .size(); i ++){ nounTagNameAltStringList.add(nounTagObjectList.get(i).nameAltString ); nounTagNameFullStringList.add(nounTagObjectList.get(i).nameFullString); }
    }
    else if (editTagGroupGUIObject.tempSelectedTagTypeString.equals("ADJ")){
        editTagGroupGUIObject.tempSelectedTagObject.nameAltString                 = editTagGroupGUIObject.editTagGroupTagNameAltTextfieldObject.getText();
        editTagGroupGUIObject.tempSelectedTagObject.nameFullString                = editTagGroupGUIObject.editTagGroupTagNameFullTextfieldObject.getText();
        editTagGroupGUIObject.tempSelectedTagObject.tagAdjectiveString            = editTagGroupGUIObject.editTagGroupTagAdjectiveTextfieldObject.getText();
        adjectiveTagNameAltStringList               .clear();
        adjectiveTagNameFullStringList              .clear();
        for(int i = 0; i < adjectiveTagObjectList   .size(); i ++){ adjectiveTagNameAltStringList.add(adjectiveTagObjectList.get(i).nameAltString ); adjectiveTagNameFullStringList.add(adjectiveTagObjectList.get(i).nameFullString); }
    }
    else if (editTagGroupGUIObject.tempSelectedTagTypeString.equals("NDJ")){
        editTagGroupGUIObject.tempSelectedTagObject.nameAltString                 = editTagGroupGUIObject.editTagGroupTagNameAltTextfieldObject.getText();
        editTagGroupGUIObject.tempSelectedTagObject.nameFullString                = editTagGroupGUIObject.editTagGroupTagNameFullTextfieldObject.getText();
        editTagGroupGUIObject.tempSelectedTagObject.tagNegativeAdjectiveString    = editTagGroupGUIObject.editTagGroupTagNegativeAdjectiveTextfieldObject.getText();
        negativeAdjectiveTagNameAltStringList       .clear();
        negativeAdjectiveTagNameFullStringList      .clear();
        for(int i = 0; i < adjectiveTagObjectList   .size(); i ++){ negativeAdjectiveTagNameAltStringList.add(negativeAdjectiveTagObjectList.get(i).nameAltString ); negativeAdjectiveTagNameFullStringList.add(negativeAdjectiveTagObjectList.get(i).nameFullString); }
    }
    else if (editTagGroupGUIObject.tempSelectedTagTypeString.equals("ADV")){
        editTagGroupGUIObject.tempSelectedTagObject.nameAltString                 = editTagGroupGUIObject.editTagGroupTagNameAltTextfieldObject.getText();
        editTagGroupGUIObject.tempSelectedTagObject.nameFullString                = editTagGroupGUIObject.editTagGroupTagNameFullTextfieldObject.getText();
        editTagGroupGUIObject.tempSelectedTagObject.tagAdverbString               = editTagGroupGUIObject.editTagGroupTagAdverbTextfieldObject.getText();
        adverbTagNameAltStringList                  .clear();
        adverbTagNameFullStringList                 .clear();
        for(int i = 0; i < adverbTagObjectList      .size(); i ++){ adverbTagNameAltStringList.add(adverbTagObjectList.get(i).nameAltString ); adverbTagNameFullStringList.add(adverbTagObjectList.get(i).nameFullString); }
    }
    else if (editTagGroupGUIObject.tempSelectedTagTypeString.equals("NDV")){
        editTagGroupGUIObject.tempSelectedTagObject.nameAltString                 = editTagGroupGUIObject.editTagGroupTagNameAltTextfieldObject.getText();
        editTagGroupGUIObject.tempSelectedTagObject.nameFullString                = editTagGroupGUIObject.editTagGroupTagNameFullTextfieldObject.getText();
        editTagGroupGUIObject.tempSelectedTagObject.tagNegativeAdverbString       = editTagGroupGUIObject.editTagGroupTagNegativeAdverbTextfieldObject.getText();
        negativeAdverbTagNameAltStringList          .clear();
        negativeAdverbTagNameFullStringList         .clear();
        for(int i = 0; i < adverbTagObjectList      .size(); i ++){ negativeAdverbTagNameAltStringList.add(negativeAdverbTagObjectList.get(i).nameAltString ); negativeAdverbTagNameFullStringList.add(negativeAdverbTagObjectList.get(i).nameFullString); }
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



////////////////////////////////////////////////////////////////////////////////////////////////////
//START//EditPlayerGroupGUIObject.pde Controller's Functions.///////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
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
////////////////////////////////////////////////////////////////////////////////////////////////////
//END//EditPlayerGroupGUIObject.pde Controller's Functions./////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//END//Controller's Functions.//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////