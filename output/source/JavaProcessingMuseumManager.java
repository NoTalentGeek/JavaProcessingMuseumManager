import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import controlP5.*; 
import java.util.*; 
import java.util.*; 
import controlP5.*; 
import java.util.*; 
import controlP5.*; 
import java.util.*; 
import controlP5.*; 
import java.util.*; 
import controlP5.*; 
import java.util.*; 
import controlP5.*; 
import java.util.*; 
import controlP5.*; 
import java.util.*; 
import controlP5.*; 
import java.util.*; 
import java.util.*; 
import java.util.*; 
import controlP5.*; 
import java.util.*; 
import controlP5.*; 
import java.util.*; 
import controlP5.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class JavaProcessingMuseumManager extends PApplet {




/*Panel card variables.*/
boolean                     panelCardChangeBoolean                          = true                          ;
int                       panelCardColor                                  = color(63, 63, 116)            ;
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
int                         addMuseumGroupHeightInt                         = 462;
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
int                         playerAmountInt                                 = 30                            ;

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
        tagNameAltString    = tagNameObject.nameAltString;
        tagNameFullString   = tagNameObject.nameFullString;
        tagTypeString       = _tagTypeString;

                if(tagTypeString.equals("ADJ")){ /*Adjective.                    */
            tagAdjectiveString                      = _wordDerivativeStringArray[0];
        }
        else    if(tagTypeString.equals("ADV")){ /*Adverb.                       */
            tagAdverbString                         = _wordDerivativeStringArray[0];
        }
        else    if(tagTypeString.equals("IVR")){ /*Intransitive Verb.            */
            tagIntransitiveVerb1String              = _wordDerivativeStringArray[0];
            tagIntransitiveVerb2String              = _wordDerivativeStringArray[1];
            tagIntransitiveVerb3String              = _wordDerivativeStringArray[2];
            tagIntransitiveVerbIngString            = _wordDerivativeStringArray[3];
            tagIntransitiveVerbSString              = _wordDerivativeStringArray[4];
        }
        else    if(tagTypeString.equals("NDV")){ /*Negative Adverb.              */
            tagNegativeAdverbString                 = _wordDerivativeStringArray[0];
        }
        else    if(tagTypeString.equals("NDJ")){ /*Negative Adjective.           */
            tagNegativeAdjectiveString              = _wordDerivativeStringArray[0];
        }
        else    if(tagTypeString.equals("NIV")){ /*Negative Intransitive Verb.   */
            tagNegativeIntransitiveVerb1String      = _wordDerivativeStringArray[0];
            tagNegativeIntransitiveVerb2String      = _wordDerivativeStringArray[1];
            tagNegativeIntransitiveVerb3String      = _wordDerivativeStringArray[2];
            tagNegativeIntransitiveVerbIngString    = _wordDerivativeStringArray[3];
            tagNegativeIntransitiveVerbSString      = _wordDerivativeStringArray[4];
        }
        else    if(tagTypeString.equals("NOA")){ /*Noun.                         */
            tagNounAbstractSString                  = _wordDerivativeStringArray[0];
            tagNounAbstractString                   = _wordDerivativeStringArray[1];
        }
        else    if(tagTypeString.equals("NOU")){ /*Noun.                         */
            tagNounSString                          = _wordDerivativeStringArray[0];
            tagNounString                           = _wordDerivativeStringArray[1];
        }
        else    if(tagTypeString.equals("NTV")){ /*Negative Transitive Verb.     */
            tagNegativeTransitiveVerb1String        = _wordDerivativeStringArray[0];
            tagNegativeTransitiveVerb2String        = _wordDerivativeStringArray[1];
            tagNegativeTransitiveVerb3String        = _wordDerivativeStringArray[2];
            tagNegativeTransitiveVerbIngString      = _wordDerivativeStringArray[3];
            tagNegativeTransitiveVerbSString        = _wordDerivativeStringArray[4];
        }
        else    if(tagTypeString.equals("SUB")){ /*Subject.                      */
            tagSubjectString                        = _wordDerivativeStringArray[0];
            tagSubjectPossesionString               = _wordDerivativeStringArray[1];
        }
        else    if(tagTypeString.equals("TVR")){ /*Transitive Verb.              */
            tagTransitiveVerb1String                = _wordDerivativeStringArray[0];
            tagTransitiveVerb2String                = _wordDerivativeStringArray[1];
            tagTransitiveVerb3String                = _wordDerivativeStringArray[2];
            tagTransitiveVerbIngString              = _wordDerivativeStringArray[3];
            tagTransitiveVerbSString                = _wordDerivativeStringArray[4];
        }        

    }

}

public void setup(){

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
    for(int i = 0; i < exhibitionObjectList                     .size(); i ++){ exhibitionNameAltStringList                     .add(     exhibitionObjectList                  .get(i).nameAltString    ); exhibitionNameFullStringList                    .add(exhibitionObjectList                   .get(i).nameFullString   ); }
    for(int i = 0; i < floorObjectList                          .size(); i ++){ floorNameAltStringList                          .add(     floorObjectList                       .get(i).nameAltString    ); floorNameFullStringList                         .add(floorObjectList                        .get(i).nameFullString   ); }
    for(int i = 0; i < roomObjectList                           .size(); i ++){ roomNameAltStringList                           .add(     roomObjectList                        .get(i).nameAltString    ); roomNameFullStringList                          .add(roomObjectList                         .get(i).nameFullString   ); }
    for(int i = 0; i < playerObjectList                         .size(); i ++){ playerStringList                                .add("" + playerObjectList                      .get(i).playerIndexInt   ); }
    for(int i = 0; i < adjectiveTagObjectList                   .size(); i ++){ adjectiveTagNameAltStringList                   .add(     adjectiveTagObjectList                .get(i).tagNameAltString ); adjectiveTagNameFullStringList                  .add(adjectiveTagObjectList                 .get(i).tagNameFullString); }
    for(int i = 0; i < adverbTagObjectList                      .size(); i ++){ adverbTagNameAltStringList                      .add(     adverbTagObjectList                   .get(i).tagNameAltString ); adverbTagNameFullStringList                     .add(adverbTagObjectList                    .get(i).tagNameFullString); }
    for(int i = 0; i < intransitiveVerbTagObjectList            .size(); i ++){ intransitiveVerbTagNameAltStringList            .add(     intransitiveVerbTagObjectList         .get(i).tagNameAltString ); intransitiveVerbTagNameFullStringList           .add(intransitiveVerbTagObjectList          .get(i).tagNameFullString); }
    for(int i = 0; i < negativeAdjectiveTagObjectList           .size(); i ++){ negativeAdjectiveTagNameAltStringList           .add(     negativeAdjectiveTagObjectList        .get(i).tagNameAltString ); negativeAdjectiveTagNameFullStringList          .add(negativeAdjectiveTagObjectList         .get(i).tagNameFullString); }
    for(int i = 0; i < negativeAdverbTagObjectList              .size(); i ++){ negativeAdverbTagNameAltStringList              .add(     negativeAdverbTagObjectList           .get(i).tagNameAltString ); negativeAdverbTagNameFullStringList             .add(negativeAdverbTagObjectList            .get(i).tagNameFullString); }
    for(int i = 0; i < negativeIntransitiveVerbTagObjectList    .size(); i ++){ negativeIntransitiveVerbTagNameAltStringList    .add(     negativeIntransitiveVerbTagObjectList .get(i).tagNameAltString ); negativeIntransitiveVerbTagNameFullStringList   .add(negativeIntransitiveVerbTagObjectList  .get(i).tagNameFullString); }
    for(int i = 0; i < negativeTransitiveVerbTagObjectList      .size(); i ++){ negativeTransitiveVerbTagNameAltStringList      .add(     negativeTransitiveVerbTagObjectList   .get(i).tagNameAltString ); negativeTransitiveVerbTagNameFullStringList     .add(negativeTransitiveVerbTagObjectList    .get(i).tagNameFullString); }
    for(int i = 0; i < nounAbstractTagObjectList                .size(); i ++){ nounAbstractTagNameAltStringList                .add(     nounAbstractTagObjectList             .get(i).tagNameAltString ); nounAbstractTagNameFullStringList               .add(nounAbstractTagObjectList              .get(i).tagNameFullString); }
    for(int i = 0; i < nounTagObjectList                        .size(); i ++){ nounTagNameAltStringList                        .add(     nounTagObjectList                     .get(i).tagNameAltString ); nounTagNameFullStringList                       .add(nounTagObjectList                      .get(i).tagNameFullString); }
    for(int i = 0; i < subjectTagObjectList                     .size(); i ++){ subjectTagNameAltStringList                     .add(     subjectTagObjectList                  .get(i).tagNameAltString ); subjectTagNameFullStringList                    .add(subjectTagObjectList                   .get(i).tagNameFullString); }
    for(int i = 0; i < transitiveVerbTagObjectList              .size(); i ++){ transitiveVerbTagNameAltStringList              .add(     transitiveVerbTagObjectList           .get(i).tagNameAltString ); transitiveVerbTagNameFullStringList             .add(transitiveVerbTagObjectList            .get(i).tagNameFullString); }
    /*Create empty list to display if the object created has no parent (for example, floor object will have no parent).*/
    defaultStringList                                           = Arrays.asList();
    SetupGUIVoid                                                ();

}

public void draw(){

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
public void mousePressed(){

    if(buttonOpenClosePlayerObject.MouseOverBoolean() == true){ buttonOpenClosePlayerObject.isAnimatingBoolean = true; }
    if(buttonOpenCloseMuseumObject.MouseOverBoolean() == true){ buttonOpenCloseMuseumObject.isAnimatingBoolean = true; }

}

/*Function to assign specific tag into the whole tag of object player.*/
public void AssignRandomTagLoopVoid(

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

            while(_targetTagObjectList.get(i).tagNameAltString.equals(tagObject.tagNameAltString)){

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
public void CheckMuseumObjectHoverVoid(

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
public void CheckPlayerObjectHoverVoid(int _indexInt){

    /*This is to check which museum/player object is hovered, then create panel based on that object position.*/
    if(playerObjectList.get(_indexInt).SetHoverBoolean() == true && panelCardChangeBoolean == true && buttonOpenCloseBoolean == false){

        xPanelCardInt           = playerObjectList.get(_indexInt).panelObject.xPanelInt + (playerObjectList.get(_indexInt).panelObject.widthPanelInt/2 );
        yPanelCardInt           = playerObjectList.get(_indexInt).panelObject.yPanelInt + (playerObjectList.get(_indexInt).panelObject.heightPanelInt/2);
        tempSelectedPlayerObject    = playerObjectList.get(_indexInt);

        panelCardChangeBoolean  = false;

    }

}

/*A function to control color for each possible type of museum object buttons.*/
public void ColorControlVoid(

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
public void CreatePanelCardVoid(){

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

public void OnExit(){ Runtime.getRuntime().addShutdownHook(new Thread(new Runnable(){ public void run(){ SaveVoid(); } })); }

public void LoadVoid(){

    boolean initBool    =  true;

    if      (initBool   == true ){

        String[] exampleExplanationStringArray = {

            "Explanation 1",
            "Explanation 2",
            "Explanation 3",
            "Explanation 4"

        };

        subjectTagObjectList                            = Arrays.asList(
            new Tag(new Name("SUB_NAP", "Subject Napoleon"                      ), "SUB", "Napoleon"           , "Napoleon's"               ),
            new Tag(new Name("SUB_WAS", "Subject Washington"                    ), "SUB", "Washington"         , "Washington's"             ),
            new Tag(new Name("SUB_ASS", "Subject Assasin"                       ), "SUB", "assasin"            , "assasin's"                ),
            new Tag(new Name("SUB_BOD", "Subject Bodhisattva"                   ), "SUB", "Bodhisattva"        , "Bodhisattva's"            ),
            new Tag(new Name("SUB_BUD", "Subject Buddha"                        ), "SUB", "Buddha"             , "Buddha's"                 ),
            new Tag(new Name("SUB_DIM", "Subject Dimitri"                       ), "SUB", "Dimitri"            , "Dimitri's"                ),
            new Tag(new Name("SUB_DMI", "Subject DimitriMitropoulos"            ), "SUB", "Dimitri Mitropoulos", "Dimitri Mitropoulos'"     ),
            new Tag(new Name("SUB_DRA", "Subject Dragon"                        ), "SUB", "dragon"             , "dragon's"                 ),
            new Tag(new Name("SUB_FIR", "Subject TheFirst"                      ), "SUB", "the first"          , "the first's"              ),
            new Tag(new Name("SUB_IRQ", "Subject Iraqi"                         ), "SUB", "iraqi"              , "iraqi's"                  ),
            new Tag(new Name("SUB_ITA", "Subject Italian"                       ), "SUB", "italian"            , "italian's"                ),
            new Tag(new Name("SUB_JUC", "Subject JuliusCaesar"                  ), "SUB", "Julius Caesar"      , "Julius Caesar's"          ),
            new Tag(new Name("SUB_JUL", "Subject Julius"                        ), "SUB", "Julius"             , "Julius'"                  ),
            new Tag(new Name("SUB_KIL", "Subject Killer"                        ), "SUB", "killer"             , "killer's"                 ),
            new Tag(new Name("SUB_KOS", "Subject Koshchey"                      ), "SUB", "Koshchey"           , "Koshchey's"               ),
            new Tag(new Name("SUB_MAR", "Subject Maria"                         ), "SUB", "Maria"              , "Maria's"                  ),
            new Tag(new Name("SUB_MED", "Subject Medusa"                        ), "SUB", "Medusa"             , "Medusa's"                 ),
            new Tag(new Name("SUB_MMO", "Subject MariaMorevna"                  ), "SUB", "Maria Morevna"      , "Maria Morevna's"          ),
            new Tag(new Name("SUB_PAI", "Subject Painter"                       ), "SUB", "painter"            , "painter's"                ),
            new Tag(new Name("SUB_ROM", "Subject Romanian"                      ), "SUB", "romanian"           , "romanian's"               ),
            new Tag(new Name("SUB_RUS", "Subject Russian"                       ), "SUB", "russian"            , "russian's"                ),
            new Tag(new Name("SUB_SPH", "Subject Sphinx"                        ), "SUB", "Sphinx"             , "Sphinx's"                 )
        );
        intransitiveVerbTagObjectList                   = Arrays.asList(
            new Tag(new Name("IVR_CAL", "IntransitiveVerb Call"                 ), "IVR", "call"    , "called"  , "called"  , "calling"     , "calls"   ),
            new Tag(new Name("IVR_DRI", "IntransitiveVerb Drink"                ), "IVR", "drink"   , "drunk"   , "drank"   , "drinking"    , "drinks"  ),
            new Tag(new Name("IVR_EAT", "IntransitiveVerb Eat"                  ), "IVR", "eat"     , "ate"     , "eaten"   , "eating"      , "eats"    ),
            new Tag(new Name("IVR_JUM", "IntransitiveVerb Jump"                 ), "IVR", "jump"    , "jumped"  , "jumped"  , "jumping"     , "jumps"   ),
            new Tag(new Name("IVR_PAI", "IntransitiveVerb Paint"                ), "IVR", "paint"   , "painted" , "painted" , "painting"    , "paints"  ),
            new Tag(new Name("IVR_RUN", "IntransitiveVerb Run"                  ), "IVR", "run"     , "ran"     , "run"     , "running"     , "runs"    ),
            new Tag(new Name("IVR_SIN", "IntransitiveVerb Sing"                 ), "IVR", "sing"    , "sang"    , "sung"    , "singing"     , "sings"   ),
            new Tag(new Name("IVR_SIT", "IntransitiveVerb Sit"                  ), "IVR", "sit"     , "sat"     , "sat"     , "sitting"     , "sits"    ),
            new Tag(new Name("IVR_SLE", "IntransitiveVerb Sleep"                ), "IVR", "sleep"   , "slept"   , "slept"   , "sleeping"    , "sleeps"  ),
            new Tag(new Name("IVR_TAL", "IntransitiveVerb Talk"                 ), "IVR", "talk"    , "told"    , "told"    , "talking"     , "talks"   )
        );
        negativeIntransitiveVerbTagObjectList           = Arrays.asList(
            new Tag(new Name("NIV_ASS", "NegativeIntransitiveVerb Assasinate"   ), "NIV", "assasinate"  , "assasinated" , "assasinated" , "assasinating"    , "assasinates" ),
            new Tag(new Name("NIV_DIE", "NegativeIntransitiveVerb Die"          ), "NIV", "die"         , "died"        , "died"        , "dies"            , "dying"       ),
            new Tag(new Name("NIV_KIL", "NegativeIntransitiveVerb Kill"         ), "NIV", "kill"        , "killed"      , "killed"      , "killing"         , "kills"       )
        );
        transitiveVerbTagObjectList                     = Arrays.asList(
            new Tag(new Name("TVR_CAL", "TransitiveVerb Call"                   ), "TVR", "call"    , "called"  , "called"  , "calling"     , "calls"   ),
            new Tag(new Name("TVR_DRI", "TransitiveVerb Drink"                  ), "TVR", "drink"   , "drunk"   , "drank"   , "drinking"    , "drinks"  ),
            new Tag(new Name("TVR_EAT", "TransitiveVerb Eat"                    ), "TVR", "eat"     , "ate"     , "eaten"   , "eating"      , "eats"    ),
            new Tag(new Name("TVR_JUM", "TransitiveVerb Jump"                   ), "TVR", "jump"    , "jumped"  , "jumped"  , "jumping"     , "jumps"   ),
            new Tag(new Name("TVR_PAI", "TransitiveVerb Paint"                  ), "TVR", "paint"   , "painted" , "painted" , "painting"    , "paints"  ),
            new Tag(new Name("TVR_RUN", "TransitiveVerb Run"                    ), "TVR", "run"     , "ran"     , "run"     , "running"     , "runs"    ),
            new Tag(new Name("TVR_SIN", "TransitiveVerb Sing"                   ), "TVR", "sing"    , "sang"    , "sung"    , "singing"     , "sings"   ),
            new Tag(new Name("TVR_SIT", "TransitiveVerb Sit"                    ), "TVR", "sit"     , "sat"     , "sat"     , "sitting"     , "sits"    ),
            new Tag(new Name("TVR_SLE", "TransitiveVerb Sleep"                  ), "TVR", "sleep"   , "slept"   , "slept"   , "sleeping"    , "sleeps"  ),
            new Tag(new Name("TVR_TAL", "TransitiveVerb Talk"                   ), "TVR", "talk"    , "told"    , "told"    , "talking"     , "talks"   )
        );
        negativeTransitiveVerbTagObjectList             = Arrays.asList(
            new Tag(new Name("NTV_ASS", "NegativeTransitiveVerb Assasinate"     ), "NTV", "assasinate"  , "assasinated" , "assasinated" , "assasinating"    , "assasinates" ),
            new Tag(new Name("NTV_DIE", "NegativeTransitiveVerb Die"            ), "NTV", "die"         , "died"        , "died"        , "dies"            , "dying"       ),
            new Tag(new Name("NTV_KIL", "NegativeTransitiveVerb Kill"           ), "NTV", "kill"        , "killed"      , "killed"      , "killing"         , "kills"       )
        );
        nounAbstractTagObjectList                       = Arrays.asList(
            new Tag(new Name("NOA_ANK", "NounAbs Anklet"                        ), "NOA", "anklet"          , "anklets"         ),
            new Tag(new Name("NOA_BAL", "NounAbs Ball"                          ), "NOA", "ball"            , "balls"           ),
            new Tag(new Name("NOA_CRO", "NounAbs Crown"                         ), "NOA", "crown"           , "crowns"          ),
            new Tag(new Name("NOA_DCR", "NounAbs DoubleCrown"                   ), "NOA", "double crown"    , "double crown"    ),
            new Tag(new Name("NOA_FIG", "NounAbs Figure"                        ), "NOA", "figure"          , "figures"         ),
            new Tag(new Name("NOA_GUN", "NounAbs Gun"                           ), "NOA", "gun"             , "guns"            ),
            new Tag(new Name("NOA_HIE", "NounAbs Hierogliph"                    ), "NOA", "hierogliph"      , "hierogliphs"     ),
            new Tag(new Name("NOA_IRQ", "NounAbs Iraq"                          ), "NOA", "Iraq"            , "Iraq"            ),
            new Tag(new Name("NOA_ITA", "NounAbs Italy"                         ), "NOA", "Italy"           , "Italy"           ),
            new Tag(new Name("NOA_PAP", "NounAbs Paper"                         ), "NOA", "paper"           , "papers"          ),
            new Tag(new Name("NOA_PLA", "NounAbs Plaque"                        ), "NOA", "plaque"          , "plaques"         ),
            new Tag(new Name("NOA_ROM", "NounAbs Rome"                          ), "NOA", "Rome"            , "Rome"            ),
            new Tag(new Name("NOA_RUS", "NounAbs Russia"                        ), "NOA", "Russia"          , "Russia"          ),
            new Tag(new Name("NOA_STA", "NounAbs Statue"                        ), "NOA", "statue"          , "statues"         ),
            new Tag(new Name("NOA_STO", "NounAbs Stone"                         ), "NOA", "stone"           , "stones"          ),
            new Tag(new Name("NOA_WAT", "NounAbs Water"                         ), "NOA", "water"           , "water"           )
        );
        nounTagObjectList                               = Arrays.asList(
            new Tag(new Name("NOU_ANK", "Noun Anklet"                           ), "NOU", "anklet"          , "anklets"         ),
            new Tag(new Name("NOU_BAL", "Noun Ball"                             ), "NOU", "ball"            , "balls"           ),
            new Tag(new Name("NOU_CRO", "Noun Crown"                            ), "NOU", "crown"           , "crowns"          ),
            new Tag(new Name("NOU_DCR", "Noun DoubleCrown"                      ), "NOU", "double crown"    , "double crown"    ),
            new Tag(new Name("NOU_FIG", "Noun Figure"                           ), "NOU", "figure"          , "figures"         ),
            new Tag(new Name("NOU_GUN", "Noun Gun"                              ), "NOU", "gun"             , "guns"            ),
            new Tag(new Name("NOU_HIE", "Noun Hierogliph"                       ), "NOU", "hierogliph"      , "hierogliphs"     ),
            new Tag(new Name("NOU_IRQ", "Noun Iraq"                             ), "NOU", "Iraq"            , "Iraq"            ),
            new Tag(new Name("NOU_ITA", "Noun Italy"                            ), "NOU", "Italy"           , "Italy"           ),
            new Tag(new Name("NOU_PAP", "Noun Paper"                            ), "NOU", "paper"           , "papers"          ),
            new Tag(new Name("NOU_PLA", "Noun Plaque"                           ), "NOU", "plaque"          , "plaques"         ),
            new Tag(new Name("NOU_ROM", "Noun Rome"                             ), "NOU", "Rome"            , "Rome"            ),
            new Tag(new Name("NOU_RUS", "Noun Russia"                           ), "NOU", "Russia"          , "Russia"          ),
            new Tag(new Name("NOU_STA", "Noun Statue"                           ), "NOU", "statue"          , "statues"         ),
            new Tag(new Name("NOU_STO", "Noun Stone"                            ), "NOU", "stone"           , "stones"          ),
            new Tag(new Name("NOU_WAT", "Noun Water"                            ), "NOU", "water"           , "water"           )
        );
        adjectiveTagObjectList                          = Arrays.asList(
            new Tag(new Name("ADJ_BAD", "Adjective Excellent"                   ), "ADJ", "excellent"       ),
            new Tag(new Name("ADJ_CRO", "Adjective Crossed"                     ), "ADJ", "crossed"         ),
            new Tag(new Name("ADJ_GOD", "Adjective Good"                        ), "ADJ", "good"            ),
            new Tag(new Name("ADJ_HAR", "Adjective Hard"                        ), "ADJ", "hard"            ),
            new Tag(new Name("ADJ_SOF", "Adjective Soft"                        ), "ADJ", "soft"            )
        );
        negativeAdjectiveTagObjectList                  = Arrays.asList(
            new Tag(new Name("NDJ_AWF", "NegativeAdjective Awful"               ), "NDJ", "awful"           ),
            new Tag(new Name("NDJ_BAD", "NegativeAdjective Bad"                 ), "NDJ", "bad"             )
        );
        adverbTagObjectList                             = Arrays.asList(
            new Tag(new Name("ADV_PER", "Adverb Perfectly"                      ), "ADV", "perfectly"       ),
            new Tag(new Name("ADV_QUI", "Adverb Quickly"                        ), "ADV", "quickly"         )
        );
        negativeAdverbTagObjectList                     = Arrays.asList(
            new Tag(new Name("NDV_DES", "NegativeAdverb Desperately"            ), "NDV", "desperately"     ),
            new Tag(new Name("NDV_SLO", "NegativeAdverb Slowly"                 ), "NDV", "slowly"          )
        );
        floorObjectList                                 = Arrays.asList(
            new ObjectMuseum(new Name("FLR_001", "First Floor"                                                  ), "XXX_XXX", "FLR", exampleExplanationStringArray, AssignRandomTagArray(adjectiveTagObjectList, adverbTagObjectList, intransitiveVerbTagObjectList, negativeAdjectiveTagObjectList, negativeAdverbTagObjectList, negativeIntransitiveVerbTagObjectList, negativeTransitiveVerbTagObjectList, nounAbstractTagObjectList, nounTagObjectList, subjectTagObjectList, transitiveVerbTagObjectList)),
            new ObjectMuseum(new Name("FLR_002", "Second Floor"                                                 ), "XXX_XXX", "FLR", exampleExplanationStringArray, AssignRandomTagArray(adjectiveTagObjectList, adverbTagObjectList, intransitiveVerbTagObjectList, negativeAdjectiveTagObjectList, negativeAdverbTagObjectList, negativeIntransitiveVerbTagObjectList, negativeTransitiveVerbTagObjectList, nounAbstractTagObjectList, nounTagObjectList, subjectTagObjectList, transitiveVerbTagObjectList))
        );
        roomObjectList                                  = Arrays.asList(
            new ObjectMuseum(new Name("ROM_CHN", "Room China"                                                   ), "FLR_001", "ROM", exampleExplanationStringArray, AssignRandomTagArray(adjectiveTagObjectList, adverbTagObjectList, intransitiveVerbTagObjectList, negativeAdjectiveTagObjectList, negativeAdverbTagObjectList, negativeIntransitiveVerbTagObjectList, negativeTransitiveVerbTagObjectList, nounAbstractTagObjectList, nounTagObjectList, subjectTagObjectList, transitiveVerbTagObjectList)),
            new ObjectMuseum(new Name("ROM_IRQ", "Room Iraq"                                                    ), "FLR_001", "ROM", exampleExplanationStringArray, AssignRandomTagArray(adjectiveTagObjectList, adverbTagObjectList, intransitiveVerbTagObjectList, negativeAdjectiveTagObjectList, negativeAdverbTagObjectList, negativeIntransitiveVerbTagObjectList, negativeTransitiveVerbTagObjectList, nounAbstractTagObjectList, nounTagObjectList, subjectTagObjectList, transitiveVerbTagObjectList)),
            new ObjectMuseum(new Name("ROM_ROM", "Room Rome"                                                    ), "FLR_002", "ROM", exampleExplanationStringArray, AssignRandomTagArray(adjectiveTagObjectList, adverbTagObjectList, intransitiveVerbTagObjectList, negativeAdjectiveTagObjectList, negativeAdverbTagObjectList, negativeIntransitiveVerbTagObjectList, negativeTransitiveVerbTagObjectList, nounAbstractTagObjectList, nounTagObjectList, subjectTagObjectList, transitiveVerbTagObjectList)),
            new ObjectMuseum(new Name("ROM_RUS", "Room Russia"                                                  ), "FLR_002", "ROM", exampleExplanationStringArray, AssignRandomTagArray(adjectiveTagObjectList, adverbTagObjectList, intransitiveVerbTagObjectList, negativeAdjectiveTagObjectList, negativeAdverbTagObjectList, negativeIntransitiveVerbTagObjectList, negativeTransitiveVerbTagObjectList, nounAbstractTagObjectList, nounTagObjectList, subjectTagObjectList, transitiveVerbTagObjectList))
        );
        exhibitionObjectList                            = Arrays.asList(
            new ObjectMuseum(new Name("EXH_ZOD", "Exhibition Zodiac Figure Dragon"                              ), "ROM_CHN", "EXH", exampleExplanationStringArray, AssignRandomTagArray(adjectiveTagObjectList, adverbTagObjectList, intransitiveVerbTagObjectList, negativeAdjectiveTagObjectList, negativeAdverbTagObjectList, negativeIntransitiveVerbTagObjectList, negativeTransitiveVerbTagObjectList, nounAbstractTagObjectList, nounTagObjectList, subjectTagObjectList, transitiveVerbTagObjectList)),
            new ObjectMuseum(new Name("EXH_BOD", "Exhibition Bodhisattva Crossed Ankle"                         ), "ROM_CHN", "EXH", exampleExplanationStringArray, AssignRandomTagArray(adjectiveTagObjectList, adverbTagObjectList, intransitiveVerbTagObjectList, negativeAdjectiveTagObjectList, negativeAdverbTagObjectList, negativeIntransitiveVerbTagObjectList, negativeTransitiveVerbTagObjectList, nounAbstractTagObjectList, nounTagObjectList, subjectTagObjectList, transitiveVerbTagObjectList)),
            new ObjectMuseum(new Name("EXH_SPH", "Exhibition Plaque With A Sphinx"                              ), "ROM_IRQ", "EXH", exampleExplanationStringArray, AssignRandomTagArray(adjectiveTagObjectList, adverbTagObjectList, intransitiveVerbTagObjectList, negativeAdjectiveTagObjectList, negativeAdverbTagObjectList, negativeIntransitiveVerbTagObjectList, negativeTransitiveVerbTagObjectList, nounAbstractTagObjectList, nounTagObjectList, subjectTagObjectList, transitiveVerbTagObjectList)),
            new ObjectMuseum(new Name("EXH_USH", "Exhibition Stele Of Ushumgal"                                 ), "ROM_IRQ", "EXH", exampleExplanationStringArray, AssignRandomTagArray(adjectiveTagObjectList, adverbTagObjectList, intransitiveVerbTagObjectList, negativeAdjectiveTagObjectList, negativeAdverbTagObjectList, negativeIntransitiveVerbTagObjectList, negativeTransitiveVerbTagObjectList, nounAbstractTagObjectList, nounTagObjectList, subjectTagObjectList, transitiveVerbTagObjectList)),
            new ObjectMuseum(new Name("EXH_ASS", "Exhibition The Assasination"                                  ), "ROM_ROM", "EXH", exampleExplanationStringArray, AssignRandomTagArray(adjectiveTagObjectList, adverbTagObjectList, intransitiveVerbTagObjectList, negativeAdjectiveTagObjectList, negativeAdverbTagObjectList, negativeIntransitiveVerbTagObjectList, negativeTransitiveVerbTagObjectList, nounAbstractTagObjectList, nounTagObjectList, subjectTagObjectList, transitiveVerbTagObjectList)),
            new ObjectMuseum(new Name("EXH_MED", "Exhibition Head Of Medusa"                                    ), "ROM_ROM", "EXH", exampleExplanationStringArray, AssignRandomTagArray(adjectiveTagObjectList, adverbTagObjectList, intransitiveVerbTagObjectList, negativeAdjectiveTagObjectList, negativeAdverbTagObjectList, negativeIntransitiveVerbTagObjectList, negativeTransitiveVerbTagObjectList, nounAbstractTagObjectList, nounTagObjectList, subjectTagObjectList, transitiveVerbTagObjectList)),
            new ObjectMuseum(new Name("EXH_KOS", "Exhibition Koshchey"                                          ), "ROM_RUS", "EXH", exampleExplanationStringArray, AssignRandomTagArray(adjectiveTagObjectList, adverbTagObjectList, intransitiveVerbTagObjectList, negativeAdjectiveTagObjectList, negativeAdverbTagObjectList, negativeIntransitiveVerbTagObjectList, negativeTransitiveVerbTagObjectList, nounAbstractTagObjectList, nounTagObjectList, subjectTagObjectList, transitiveVerbTagObjectList)),
            new ObjectMuseum(new Name("EXH_DIM", "Exhibition Dimitri Mitropoulos"                               ), "ROM_RUS", "EXH", exampleExplanationStringArray, AssignRandomTagArray(adjectiveTagObjectList, adverbTagObjectList, intransitiveVerbTagObjectList, negativeAdjectiveTagObjectList, negativeAdverbTagObjectList, negativeIntransitiveVerbTagObjectList, negativeTransitiveVerbTagObjectList, nounAbstractTagObjectList, nounTagObjectList, subjectTagObjectList, transitiveVerbTagObjectList))
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

public void SaveVoid(){

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
public boolean SetButtonOpenCloseBoolean(){

    if(buttonOpenCloseMuseumObject.isButtonOpenBoolean == true || buttonOpenClosePlayerObject.isButtonOpenBoolean == true)  { buttonOpenCloseBoolean = true ; }
    else                                                                                                                    { buttonOpenCloseBoolean = false; }
    return buttonOpenCloseBoolean;

}

public float ButtonOpenCloseAnimatingFloat(

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

public float ScrollableDrawFloat(

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
public int CalculateTextHeightInt(

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
public int FindObjectMuseumIndexInt(

    String              _targetString                    ,
    List<ObjectMuseum>  _targetObjectList

){

    for(int i = 0; i < _targetObjectList.size(); i ++){

        if(_targetObjectList.get(i).nameAltString .equals(_targetString)){ return i; }
        if(_targetObjectList.get(i).nameFullString.equals(_targetString)){ return i; }

    }
    return -1;

}

public int GetBiggestPlayerIndexInt(){

    int tempBiggestIndexInt = 0;
    for(int i = 0; i < playerObjectList.size(); i ++){

        if(playerObjectList.get(i).playerIndexInt > tempBiggestIndexInt){ tempBiggestIndexInt = playerObjectList.get(i).playerIndexInt; }

    }
    return tempBiggestIndexInt;

}

/*Create a function to add museum object.*/
public ObjectMuseum AddMuseumObject(

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

public ObjectMuseum FindMuseumObject(String _objectNameString){

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

public ObjectPlayer FindPlayerObject(int _playerIndexInt){
    ObjectPlayer                                        tempPlayerObject = null;
    for(int i = 0; i < playerObjectList.size(); i ++)   { if(playerObjectList.get(i).playerIndexInt == _playerIndexInt){ tempPlayerObject = playerObjectList.get(i); } }
    return                                              tempPlayerObject;
}
    
public Tag FindTagObject(String _tagNameString){

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
public Tag[] AssignRandomTagArray(

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



public void SetupGUIVoid(){

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

public void DrawGUIVoid(){

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
public void SelectMuseumObjectScrollableListObject (int _indexInt){

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
public void SelectPlayerScrollableListObject       (int _indexInt){

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
public void AddMuseumGroupSelectTypeMuseumObjectScrollableListObject                   (int _indexInt) {

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
public void AddMuseumGroupSelectAdjectiveTagMuseumObjectScrollableListObject                   (int _indexInt) { addMuseumGroupGUIObject.CovertScrollableListIntoCheckListVoid(_indexInt, addMuseumGroupGUIObject.addMuseumGroupSelectAdjectiveTagMuseumObjectScrollableListObject                 ); addMuseumGroupGUIObject.tempSelectedTagNameFullStringList    = addMuseumGroupGUIObject.SetSelectedCheckListStringList(adjectiveTagNameFullStringList                 , addMuseumGroupGUIObject.tempSelectedTagNameFullStringList  , addMuseumGroupGUIObject.addMuseumGroupSelectAdjectiveTagMuseumObjectScrollableListObject                 ); }
public void AddMuseumGroupSelectAdverbTagMuseumObjectScrollableListObject                      (int _indexInt) { addMuseumGroupGUIObject.CovertScrollableListIntoCheckListVoid(_indexInt, addMuseumGroupGUIObject.addMuseumGroupSelectAdverbTagMuseumObjectScrollableListObject                    ); addMuseumGroupGUIObject.tempSelectedTagNameFullStringList    = addMuseumGroupGUIObject.SetSelectedCheckListStringList(adverbTagNameFullStringList                    , addMuseumGroupGUIObject.tempSelectedTagNameFullStringList  , addMuseumGroupGUIObject.addMuseumGroupSelectAdverbTagMuseumObjectScrollableListObject                    ); }
public void AddMuseumGroupSelectIntransitiveVerbTagMuseumObjectScrollableListObject            (int _indexInt) { addMuseumGroupGUIObject.CovertScrollableListIntoCheckListVoid(_indexInt, addMuseumGroupGUIObject.addMuseumGroupSelectIntransitiveVerbTagMuseumObjectScrollableListObject          ); addMuseumGroupGUIObject.tempSelectedTagNameFullStringList    = addMuseumGroupGUIObject.SetSelectedCheckListStringList(intransitiveVerbTagNameFullStringList          , addMuseumGroupGUIObject.tempSelectedTagNameFullStringList  , addMuseumGroupGUIObject.addMuseumGroupSelectIntransitiveVerbTagMuseumObjectScrollableListObject          ); }
public void AddMuseumGroupSelectNegativeAdjectiveTagMuseumObjectScrollableListObject           (int _indexInt) { addMuseumGroupGUIObject.CovertScrollableListIntoCheckListVoid(_indexInt, addMuseumGroupGUIObject.addMuseumGroupSelectNegativeAdjectiveTagMuseumObjectScrollableListObject         ); addMuseumGroupGUIObject.tempSelectedTagNameFullStringList    = addMuseumGroupGUIObject.SetSelectedCheckListStringList(negativeAdjectiveTagNameFullStringList         , addMuseumGroupGUIObject.tempSelectedTagNameFullStringList  , addMuseumGroupGUIObject.addMuseumGroupSelectNegativeAdjectiveTagMuseumObjectScrollableListObject         ); }
public void AddMuseumGroupSelectNegativeAdverbTagMuseumObjectScrollableListObject              (int _indexInt) { addMuseumGroupGUIObject.CovertScrollableListIntoCheckListVoid(_indexInt, addMuseumGroupGUIObject.addMuseumGroupSelectNegativeAdverbTagMuseumObjectScrollableListObject            ); addMuseumGroupGUIObject.tempSelectedTagNameFullStringList    = addMuseumGroupGUIObject.SetSelectedCheckListStringList(negativeAdverbTagNameFullStringList            , addMuseumGroupGUIObject.tempSelectedTagNameFullStringList  , addMuseumGroupGUIObject.addMuseumGroupSelectNegativeAdverbTagMuseumObjectScrollableListObject            ); }
public void AddMuseumGroupSelectNegativeIntransitiveVerbTagMuseumObjectScrollableListObject    (int _indexInt) { addMuseumGroupGUIObject.CovertScrollableListIntoCheckListVoid(_indexInt, addMuseumGroupGUIObject.addMuseumGroupSelectNegativeIntransitiveVerbTagMuseumObjectScrollableListObject  ); addMuseumGroupGUIObject.tempSelectedTagNameFullStringList    = addMuseumGroupGUIObject.SetSelectedCheckListStringList(negativeIntransitiveVerbTagNameFullStringList  , addMuseumGroupGUIObject.tempSelectedTagNameFullStringList  , addMuseumGroupGUIObject.addMuseumGroupSelectNegativeIntransitiveVerbTagMuseumObjectScrollableListObject  ); }
public void AddMuseumGroupSelectNegativeTransitiveVerbTagMuseumObjectScrollableListObject      (int _indexInt) { addMuseumGroupGUIObject.CovertScrollableListIntoCheckListVoid(_indexInt, addMuseumGroupGUIObject.addMuseumGroupSelectNegativeTransitiveVerbTagMuseumObjectScrollableListObject    ); addMuseumGroupGUIObject.tempSelectedTagNameFullStringList    = addMuseumGroupGUIObject.SetSelectedCheckListStringList(negativeTransitiveVerbTagNameFullStringList    , addMuseumGroupGUIObject.tempSelectedTagNameFullStringList  , addMuseumGroupGUIObject.addMuseumGroupSelectNegativeTransitiveVerbTagMuseumObjectScrollableListObject    ); }
public void AddMuseumGroupSelectNounTagMuseumObjectScrollableListObject                        (int _indexInt) { addMuseumGroupGUIObject.CovertScrollableListIntoCheckListVoid(_indexInt, addMuseumGroupGUIObject.addMuseumGroupSelectNounTagMuseumObjectScrollableListObject                      ); addMuseumGroupGUIObject.tempSelectedTagNameFullStringList    = addMuseumGroupGUIObject.SetSelectedCheckListStringList(nounTagNameFullStringList                      , addMuseumGroupGUIObject.tempSelectedTagNameFullStringList  , addMuseumGroupGUIObject.addMuseumGroupSelectNounTagMuseumObjectScrollableListObject                      ); }
public void AddMuseumGroupSelectNounAbstractTagMuseumObjectScrollableListObject                (int _indexInt) { addMuseumGroupGUIObject.CovertScrollableListIntoCheckListVoid(_indexInt, addMuseumGroupGUIObject.addMuseumGroupSelectNounAbstractTagMuseumObjectScrollableListObject              ); addMuseumGroupGUIObject.tempSelectedTagNameFullStringList    = addMuseumGroupGUIObject.SetSelectedCheckListStringList(nounAbstractTagNameFullStringList              , addMuseumGroupGUIObject.tempSelectedTagNameFullStringList  , addMuseumGroupGUIObject.addMuseumGroupSelectNounAbstractTagMuseumObjectScrollableListObject              ); }
public void AddMuseumGroupSelectSubjectTagMuseumObjectScrollableListObject                     (int _indexInt) { addMuseumGroupGUIObject.CovertScrollableListIntoCheckListVoid(_indexInt, addMuseumGroupGUIObject.addMuseumGroupSelectSubjectTagMuseumObjectScrollableListObject                   ); addMuseumGroupGUIObject.tempSelectedTagNameFullStringList    = addMuseumGroupGUIObject.SetSelectedCheckListStringList(subjectTagNameFullStringList                   , addMuseumGroupGUIObject.tempSelectedTagNameFullStringList  , addMuseumGroupGUIObject.addMuseumGroupSelectSubjectTagMuseumObjectScrollableListObject                   ); }
public void AddMuseumGroupSelectTransitiveVerbTagMuseumObjectScrollableListObject              (int _indexInt) { addMuseumGroupGUIObject.CovertScrollableListIntoCheckListVoid(_indexInt, addMuseumGroupGUIObject.addMuseumGroupSelectTransitiveVerbTagMuseumObjectScrollableListObject            ); addMuseumGroupGUIObject.tempSelectedTagNameFullStringList    = addMuseumGroupGUIObject.SetSelectedCheckListStringList(transitiveVerbTagNameFullStringList            , addMuseumGroupGUIObject.tempSelectedTagNameFullStringList  , addMuseumGroupGUIObject.addMuseumGroupSelectTransitiveVerbTagMuseumObjectScrollableListObject            ); }
/*A function to set the full name of parent object.*/
public void AddMuseumGroupSelectParentMuseumObjectScrollableListObject                         (int _indexInt) {

    addMuseumGroupGUIObject.tempSelectedParentNameFullString        = addMuseumGroupGUIObject.addMuseumGroupSelectParentMuseumObjectScrollableListObject.getItem(_indexInt).get("text").toString();
    addMuseumGroupGUIObject.tempSelectedParentNameAltString         = FindMuseumObject(addMuseumGroupGUIObject.tempSelectedParentNameFullString).nameAltString;

}
/*Add new museum object with all collected property values.*/
public void AddMuseumGroupAddMuseumObjectButtonObject                                          (int _indexInt) {

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
public void AddTagGroupTagTypeNameFullScrollableListObject (int _indexInt){

    addTagGroupGUIObject.tempSelectedTagTypeNameFullString = addTagGroupGUIObject.addTagGroupTagTypeNameFullScrollableListObject.getItem(_indexInt).get("text").toString();

}
public void AddTagGroupTagAddButtonObject                  (int _indexInt){

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
        tempTagObject                                   = new Tag(new Name(tempTagNameAltString, tempTagNameFullString), tempTagTypeString, tempNegativeIntransitiveVerb1String, tempNegativeIntransitiveVerb2String, tempNegativeIntransitiveVerb3bString, tempNegativeIntransitiveVerbIngbString, tempNegativeIntransitiveVerbSString);

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
        tempTagObject                                   = new Tag(new Name(tempTagNameAltString, tempTagNameFullString), tempTagTypeString, tempTransitiveVerb1String, tempTransitiveVerb2String, tempTransitiveVerb3bString, tempTransitiveVerbIngbString, tempTransitiveVerbSString);

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
        tempTagObject                                   = new Tag(new Name(tempTagNameAltString, tempTagNameFullString), tempTagTypeString, tempNegativeTransitiveVerb1String, tempNegativeTransitiveVerb2String, tempNegativeTransitiveVerb3bString, tempNegativeTransitiveVerbIngbString, tempNegativeTransitiveVerbSString);

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
    tempTagNameAltStringList                    .add(tempTagObject.tagNameAltString );
    tempTagNameFullStringList                   .add(tempTagObject.tagNameFullString);

    if      (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("SUBJECT"                        )){ addMuseumGroupGUIObject.addMuseumGroupSelectSubjectTagMuseumObjectScrollableListObject                      .setItems(tempTagNameFullStringList); }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("INTRANSITIVE VERB"              )){ addMuseumGroupGUIObject.addMuseumGroupSelectIntransitiveVerbTagMuseumObjectScrollableListObject             .setItems(tempTagNameFullStringList); }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("NEGATIVE INTRANSITIVE VERB"     )){ addMuseumGroupGUIObject.addMuseumGroupSelectNegativeIntransitiveVerbTagMuseumObjectScrollableListObject     .setItems(tempTagNameFullStringList); }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("TRANSITIVE VERB"                )){ addMuseumGroupGUIObject.addMuseumGroupSelectTransitiveVerbTagMuseumObjectScrollableListObject               .setItems(tempTagNameFullStringList); }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("NEGATIVE TRANSITIVE VERB"       )){ addMuseumGroupGUIObject.addMuseumGroupSelectNegativeTransitiveVerbTagMuseumObjectScrollableListObject       .setItems(tempTagNameFullStringList); }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("NOUN"                           )){ addMuseumGroupGUIObject.addMuseumGroupSelectNounTagMuseumObjectScrollableListObject                         .setItems(tempTagNameFullStringList); }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("NOUN ABSTRACT"                  )){ addMuseumGroupGUIObject.addMuseumGroupSelectNounAbstractTagMuseumObjectScrollableListObject                 .setItems(tempTagNameFullStringList); }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("ADJECTIVE"                      )){ addMuseumGroupGUIObject.addMuseumGroupSelectAdjectiveTagMuseumObjectScrollableListObject                    .setItems(tempTagNameFullStringList); }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("NEGATIVE ADJECTIVE"             )){ addMuseumGroupGUIObject.addMuseumGroupSelectNegativeAdjectiveTagMuseumObjectScrollableListObject            .setItems(tempTagNameFullStringList); }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("ADVERB"                         )){ addMuseumGroupGUIObject.addMuseumGroupSelectAdverbTagMuseumObjectScrollableListObject                       .setItems(tempTagNameFullStringList); }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("NEGATIVE ADVERB"                )){ addMuseumGroupGUIObject.addMuseumGroupSelectNegativeAdverbTagMuseumObjectScrollableListObject               .setItems(tempTagNameFullStringList); }
    
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
public void EditMuseumGroupResetAllMuseumButtonObject      (int _indexInt){

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
public void EditTagGroupSelectTagScrollableListObject(int _indexInt){

    String  tempSelectedTagNameFullString                       = editTagGroupGUIObject.editTagGroupSelectTagScrollableListObject.getItem(_indexInt).get("text").toString();
    Tag     tempSelectedTagObject                               = FindTagObject(tempSelectedTagNameFullString);
    editTagGroupGUIObject.tempSelectedTagObject                 = tempSelectedTagObject;
    String  tempSelectedTagTypeNameAltString                    = tempSelectedTagObject.tagTypeString;
    editTagGroupGUIObject.tempSelectedTagTypeNameAltString      = tempSelectedTagTypeNameAltString;

    if(tempSelectedTagObject != null){
        editTagGroupGUIObject                                   .tempSelectedTagAdjectiveString                             = editTagGroupGUIObject.tempSelectedTagObject.tagAdjectiveString                    ;
        editTagGroupGUIObject                                   .tempSelectedTagAdverbString                                = editTagGroupGUIObject.tempSelectedTagObject.tagAdverbString                       ;
        editTagGroupGUIObject                                   .tempSelectedTagIntransitiveVerb1String                     = editTagGroupGUIObject.tempSelectedTagObject.tagIntransitiveVerb1String            ;
        editTagGroupGUIObject                                   .tempSelectedTagIntransitiveVerb2String                     = editTagGroupGUIObject.tempSelectedTagObject.tagIntransitiveVerb2String            ;
        editTagGroupGUIObject                                   .tempSelectedTagIntransitiveVerb3String                     = editTagGroupGUIObject.tempSelectedTagObject.tagIntransitiveVerb3String            ;
        editTagGroupGUIObject                                   .tempSelectedTagIntransitiveVerbIngString                   = editTagGroupGUIObject.tempSelectedTagObject.tagIntransitiveVerbIngString          ;
        editTagGroupGUIObject                                   .tempSelectedTagIntransitiveVerbSString                     = editTagGroupGUIObject.tempSelectedTagObject.tagIntransitiveVerbSString            ;
        editTagGroupGUIObject                                   .tempSelectedTagNameAltString                               = editTagGroupGUIObject.tempSelectedTagObject.tagNameAltString                      ;
        editTagGroupGUIObject                                   .tempSelectedTagNameFullString                              = editTagGroupGUIObject.tempSelectedTagObject.tagNameFullString                     ;
        editTagGroupGUIObject                                   .tempSelectedTagNegativeAdjectiveString                     = editTagGroupGUIObject.tempSelectedTagObject.tagNegativeAdjectiveString            ;
        editTagGroupGUIObject                                   .tempSelectedTagNegativeAdverbString                        = editTagGroupGUIObject.tempSelectedTagObject.tagNegativeAdverbString               ;
        editTagGroupGUIObject                                   .tempSelectedTagNegativeIntransitiveVerb1String             = editTagGroupGUIObject.tempSelectedTagObject.tagNegativeIntransitiveVerb1String    ;
        editTagGroupGUIObject                                   .tempSelectedTagNegativeIntransitiveVerb2String             = editTagGroupGUIObject.tempSelectedTagObject.tagNegativeIntransitiveVerb2String    ;
        editTagGroupGUIObject                                   .tempSelectedTagNegativeIntransitiveVerb3String             = editTagGroupGUIObject.tempSelectedTagObject.tagNegativeIntransitiveVerb3String    ;
        editTagGroupGUIObject                                   .tempSelectedTagNegativeIntransitiveVerbIngString           = editTagGroupGUIObject.tempSelectedTagObject.tagNegativeIntransitiveVerbIngString  ;
        editTagGroupGUIObject                                   .tempSelectedTagNegativeIntransitiveVerbSString             = editTagGroupGUIObject.tempSelectedTagObject.tagNegativeIntransitiveVerbSString    ;
        editTagGroupGUIObject                                   .tempSelectedTagNegativeTransitiveVerb1String               = editTagGroupGUIObject.tempSelectedTagObject.tagNegativeTransitiveVerb1String      ;
        editTagGroupGUIObject                                   .tempSelectedTagNegativeTransitiveVerb2String               = editTagGroupGUIObject.tempSelectedTagObject.tagNegativeTransitiveVerb2String      ;
        editTagGroupGUIObject                                   .tempSelectedTagNegativeTransitiveVerb3String               = editTagGroupGUIObject.tempSelectedTagObject.tagNegativeTransitiveVerb3String      ;
        editTagGroupGUIObject                                   .tempSelectedTagNegativeTransitiveVerbIngString             = editTagGroupGUIObject.tempSelectedTagObject.tagNegativeTransitiveVerbIngString    ;
        editTagGroupGUIObject                                   .tempSelectedTagNegativeTransitiveVerbSString               = editTagGroupGUIObject.tempSelectedTagObject.tagNegativeTransitiveVerbSString      ;
        editTagGroupGUIObject                                   .tempSelectedTagNounAbstractSString                         = editTagGroupGUIObject.tempSelectedTagObject.tagNounAbstractSString                ;
        editTagGroupGUIObject                                   .tempSelectedTagNounAbstractString                          = editTagGroupGUIObject.tempSelectedTagObject.tagNounAbstractString                 ;
        editTagGroupGUIObject                                   .tempSelectedTagNounSString                                 = editTagGroupGUIObject.tempSelectedTagObject.tagNounSString                        ;
        editTagGroupGUIObject                                   .tempSelectedTagNounString                                  = editTagGroupGUIObject.tempSelectedTagObject.tagNounString                         ;
        editTagGroupGUIObject                                   .tempSelectedTagSubjectPossesionString                      = editTagGroupGUIObject.tempSelectedTagObject.tagSubjectPossesionString             ;
        editTagGroupGUIObject                                   .tempSelectedTagSubjectString                               = editTagGroupGUIObject.tempSelectedTagObject.tagSubjectString                      ;
        editTagGroupGUIObject                                   .tempSelectedTagTransitiveVerb1String                       = editTagGroupGUIObject.tempSelectedTagObject.tagTransitiveVerb1String              ;
        editTagGroupGUIObject                                   .tempSelectedTagTransitiveVerb2String                       = editTagGroupGUIObject.tempSelectedTagObject.tagTransitiveVerb2String              ;
        editTagGroupGUIObject                                   .tempSelectedTagTransitiveVerb3String                       = editTagGroupGUIObject.tempSelectedTagObject.tagTransitiveVerb3String              ;
        editTagGroupGUIObject                                   .tempSelectedTagTransitiveVerbIngString                     = editTagGroupGUIObject.tempSelectedTagObject.tagTransitiveVerbIngString            ;
        editTagGroupGUIObject                                   .tempSelectedTagTransitiveVerbSString                       = editTagGroupGUIObject.tempSelectedTagObject.tagTransitiveVerbSString              ;
        editTagGroupGUIObject                                   .editTagGroupTagAdjectiveTextfieldObject                    .setText(editTagGroupGUIObject.tempSelectedTagAdjectiveString                       );
        editTagGroupGUIObject                                   .editTagGroupTagAdverbTextfieldObject                       .setText(editTagGroupGUIObject.tempSelectedTagAdverbString                          );
        editTagGroupGUIObject                                   .editTagGroupTagIntransitiveVerb1TextfieldObject            .setText(editTagGroupGUIObject.tempSelectedTagIntransitiveVerb1String               );
        editTagGroupGUIObject                                   .editTagGroupTagIntransitiveVerb2TextfieldObject            .setText(editTagGroupGUIObject.tempSelectedTagIntransitiveVerb2String               );
        editTagGroupGUIObject                                   .editTagGroupTagIntransitiveVerb3TextfieldObject            .setText(editTagGroupGUIObject.tempSelectedTagIntransitiveVerb3String               );
        editTagGroupGUIObject                                   .editTagGroupTagIntransitiveVerbIngTextfieldObject          .setText(editTagGroupGUIObject.tempSelectedTagIntransitiveVerbIngString             );
        editTagGroupGUIObject                                   .editTagGroupTagIntransitiveVerbSTextfieldObject            .setText(editTagGroupGUIObject.tempSelectedTagIntransitiveVerbSString               );
        editTagGroupGUIObject                                   .editTagGroupTagNameAltTextfieldObject                      .setText(editTagGroupGUIObject.tempSelectedTagNameAltString                         );
        editTagGroupGUIObject                                   .editTagGroupTagNameFullTextfieldObject                     .setText(editTagGroupGUIObject.tempSelectedTagNameFullString                        );
        editTagGroupGUIObject                                   .editTagGroupTagNegativeAdjectiveTextfieldObject            .setText(editTagGroupGUIObject.tempSelectedTagNegativeAdjectiveString               );
        editTagGroupGUIObject                                   .editTagGroupTagNegativeAdverbTextfieldObject               .setText(editTagGroupGUIObject.tempSelectedTagNegativeAdverbString                  );
        editTagGroupGUIObject                                   .editTagGroupTagNegativeIntransitiveVerb1TextfieldObject    .setText(editTagGroupGUIObject.tempSelectedTagNegativeIntransitiveVerb1String       );
        editTagGroupGUIObject                                   .editTagGroupTagNegativeIntransitiveVerb2TextfieldObject    .setText(editTagGroupGUIObject.tempSelectedTagNegativeIntransitiveVerb2String       );
        editTagGroupGUIObject                                   .editTagGroupTagNegativeIntransitiveVerb3TextfieldObject    .setText(editTagGroupGUIObject.tempSelectedTagNegativeIntransitiveVerb3String       );
        editTagGroupGUIObject                                   .editTagGroupTagNegativeIntransitiveVerbIngTextfieldObject  .setText(editTagGroupGUIObject.tempSelectedTagNegativeIntransitiveVerbIngString     );
        editTagGroupGUIObject                                   .editTagGroupTagNegativeIntransitiveVerbSTextfieldObject    .setText(editTagGroupGUIObject.tempSelectedTagNegativeIntransitiveVerbSString       );
        editTagGroupGUIObject                                   .editTagGroupTagNegativeTransitiveVerb1TextfieldObject      .setText(editTagGroupGUIObject.tempSelectedTagNegativeTransitiveVerb1String         );
        editTagGroupGUIObject                                   .editTagGroupTagNegativeTransitiveVerb2TextfieldObject      .setText(editTagGroupGUIObject.tempSelectedTagNegativeTransitiveVerb2String         );
        editTagGroupGUIObject                                   .editTagGroupTagNegativeTransitiveVerb3TextfieldObject      .setText(editTagGroupGUIObject.tempSelectedTagNegativeTransitiveVerb3String         );
        editTagGroupGUIObject                                   .editTagGroupTagNegativeTransitiveVerbIngTextfieldObject    .setText(editTagGroupGUIObject.tempSelectedTagNegativeTransitiveVerbIngString       );
        editTagGroupGUIObject                                   .editTagGroupTagNegativeTransitiveVerbSTextfieldObject      .setText(editTagGroupGUIObject.tempSelectedTagNegativeTransitiveVerbSString         );
        editTagGroupGUIObject                                   .editTagGroupTagNounAbstractSTextfieldObject                .setText(editTagGroupGUIObject.tempSelectedTagNounAbstractSString                   );
        editTagGroupGUIObject                                   .editTagGroupTagNounAbstractTextfieldObject                 .setText(editTagGroupGUIObject.tempSelectedTagNounAbstractString                    );
        editTagGroupGUIObject                                   .editTagGroupTagNounSTextfieldObject                        .setText(editTagGroupGUIObject.tempSelectedTagNounSString                           );
        editTagGroupGUIObject                                   .editTagGroupTagNounTextfieldObject                         .setText(editTagGroupGUIObject.tempSelectedTagNounString                            );
        editTagGroupGUIObject                                   .editTagGroupTagSubjectPossesionTextfieldObject             .setText(editTagGroupGUIObject.tempSelectedTagSubjectPossesionString                );
        editTagGroupGUIObject                                   .editTagGroupTagSubjectTextfieldObject                      .setText(editTagGroupGUIObject.tempSelectedTagSubjectString                         );
        editTagGroupGUIObject                                   .editTagGroupTagTransitiveVerb1TextfieldObject              .setText(editTagGroupGUIObject.tempSelectedTagTransitiveVerb1String                 );
        editTagGroupGUIObject                                   .editTagGroupTagTransitiveVerb2TextfieldObject              .setText(editTagGroupGUIObject.tempSelectedTagTransitiveVerb2String                 );
        editTagGroupGUIObject                                   .editTagGroupTagTransitiveVerb3TextfieldObject              .setText(editTagGroupGUIObject.tempSelectedTagTransitiveVerb3String                 );
        editTagGroupGUIObject                                   .editTagGroupTagTransitiveVerbIngTextfieldObject            .setText(editTagGroupGUIObject.tempSelectedTagTransitiveVerbIngString               );
        editTagGroupGUIObject                                   .editTagGroupTagTransitiveVerbSTextfieldObject              .setText(editTagGroupGUIObject.tempSelectedTagTransitiveVerbSString                 );
    }

}
public void EditTagGroupTagEditButtonObject(int _indexInt){

    if      (editTagGroupGUIObject.tempSelectedTagTypeNameAltString.equals("SUB")){

        editTagGroupGUIObject.tempSelectedTagObject             .tagNameAltString                       = editTagGroupGUIObject.editTagGroupTagNameAltTextfieldObject                       .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNameFullString                      = editTagGroupGUIObject.editTagGroupTagNameFullTextfieldObject                      .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagSubjectPossesionString              = editTagGroupGUIObject.editTagGroupTagSubjectPossesionTextfieldObject              .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagSubjectString                       = editTagGroupGUIObject.editTagGroupTagSubjectTextfieldObject                       .getText();
        subjectTagNameAltStringList                             .clear();
        subjectTagNameFullStringList                            .clear();
        for(int i = 0; i < subjectTagObjectList                 .size(); i ++){ subjectTagNameAltStringList.add(subjectTagObjectList.get(i).tagNameAltString ); subjectTagNameFullStringList.add(subjectTagObjectList.get(i).tagNameFullString); }
    }
    else if (editTagGroupGUIObject.tempSelectedTagTypeNameAltString.equals("IVR")){
        editTagGroupGUIObject.tempSelectedTagObject             .tagIntransitiveVerb1String             = editTagGroupGUIObject.editTagGroupTagIntransitiveVerb1TextfieldObject             .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagIntransitiveVerb2String             = editTagGroupGUIObject.editTagGroupTagIntransitiveVerb2TextfieldObject             .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagIntransitiveVerb3String             = editTagGroupGUIObject.editTagGroupTagIntransitiveVerb3TextfieldObject             .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagIntransitiveVerbIngString           = editTagGroupGUIObject.editTagGroupTagIntransitiveVerbIngTextfieldObject           .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagIntransitiveVerbSString             = editTagGroupGUIObject.editTagGroupTagIntransitiveVerbSTextfieldObject             .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNameAltString                       = editTagGroupGUIObject.editTagGroupTagNameAltTextfieldObject                       .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNameFullString                      = editTagGroupGUIObject.editTagGroupTagNameFullTextfieldObject                      .getText();
        intransitiveVerbTagNameAltStringList                    .clear();
        intransitiveVerbTagNameFullStringList                   .clear();
        for(int i = 0; i < intransitiveVerbTagObjectList        .size(); i ++){ intransitiveVerbTagNameAltStringList.add(intransitiveVerbTagObjectList.get(i).tagNameAltString ); intransitiveVerbTagNameFullStringList.add(intransitiveVerbTagObjectList.get(i).tagNameFullString); }
    }
    else if (editTagGroupGUIObject.tempSelectedTagTypeNameAltString.equals("NIV")){
        editTagGroupGUIObject.tempSelectedTagObject             .tagNameAltString                       = editTagGroupGUIObject.editTagGroupTagNameAltTextfieldObject                       .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNameFullString                      = editTagGroupGUIObject.editTagGroupTagNameFullTextfieldObject                      .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNegativeIntransitiveVerb1String     = editTagGroupGUIObject.editTagGroupTagNegativeIntransitiveVerb1TextfieldObject     .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNegativeIntransitiveVerb2String     = editTagGroupGUIObject.editTagGroupTagNegativeIntransitiveVerb2TextfieldObject     .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNegativeIntransitiveVerb3String     = editTagGroupGUIObject.editTagGroupTagNegativeIntransitiveVerb3TextfieldObject     .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNegativeIntransitiveVerbIngString   = editTagGroupGUIObject.editTagGroupTagNegativeIntransitiveVerbIngTextfieldObject   .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNegativeIntransitiveVerbSString     = editTagGroupGUIObject.editTagGroupTagNegativeIntransitiveVerbSTextfieldObject     .getText();
        negativeIntransitiveVerbTagNameAltStringList            .clear();
        negativeIntransitiveVerbTagNameFullStringList           .clear();
        for(int i = 0; i < negativeIntransitiveVerbTagObjectList.size(); i ++){ negativeIntransitiveVerbTagNameAltStringList.add(negativeIntransitiveVerbTagObjectList.get(i).tagNameAltString ); negativeIntransitiveVerbTagNameFullStringList.add(negativeIntransitiveVerbTagObjectList.get(i).tagNameFullString); }
    }
    else if (editTagGroupGUIObject.tempSelectedTagTypeNameAltString.equals("TVR")){
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
    else if (editTagGroupGUIObject.tempSelectedTagTypeNameAltString.equals("NTV")){
        editTagGroupGUIObject.tempSelectedTagObject             .tagNameAltString                       = editTagGroupGUIObject.editTagGroupTagNameAltTextfieldObject                       .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNameFullString                      = editTagGroupGUIObject.editTagGroupTagNameFullTextfieldObject                      .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNegativeTransitiveVerb1String       = editTagGroupGUIObject.editTagGroupTagNegativeTransitiveVerb1TextfieldObject       .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNegativeTransitiveVerb2String       = editTagGroupGUIObject.editTagGroupTagNegativeTransitiveVerb2TextfieldObject       .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNegativeTransitiveVerb3String       = editTagGroupGUIObject.editTagGroupTagNegativeTransitiveVerb3TextfieldObject       .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNegativeTransitiveVerbIngString     = editTagGroupGUIObject.editTagGroupTagNegativeTransitiveVerbIngTextfieldObject     .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNegativeTransitiveVerbSString       = editTagGroupGUIObject.editTagGroupTagNegativeTransitiveVerbSTextfieldObject       .getText();
        negativeTransitiveVerbTagNameAltStringList              .clear();
        negativeTransitiveVerbTagNameFullStringList             .clear();
        for(int i = 0; i < negativeTransitiveVerbTagObjectList  .size(); i ++){ negativeTransitiveVerbTagNameAltStringList.add(negativeTransitiveVerbTagObjectList.get(i).tagNameAltString ); negativeTransitiveVerbTagNameFullStringList.add(negativeTransitiveVerbTagObjectList.get(i).tagNameFullString); }
    }
    else if (editTagGroupGUIObject.tempSelectedTagTypeNameAltString.equals("NOA")){
        editTagGroupGUIObject.tempSelectedTagObject             .tagNameAltString                       = editTagGroupGUIObject.editTagGroupTagNameAltTextfieldObject                       .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNameFullString                      = editTagGroupGUIObject.editTagGroupTagNameFullTextfieldObject                      .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNounAbstractSString                 = editTagGroupGUIObject.editTagGroupTagNounAbstractSTextfieldObject                 .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNounAbstractString                  = editTagGroupGUIObject.editTagGroupTagNounAbstractTextfieldObject                  .getText();
        nounAbstractTagNameAltStringList                        .clear();
        nounAbstractTagNameFullStringList                       .clear();
        for(int i = 0; i < nounAbstractTagObjectList            .size(); i ++){ nounAbstractTagNameAltStringList.add(nounAbstractTagObjectList.get(i).tagNameAltString ); nounAbstractTagNameFullStringList.add(nounAbstractTagObjectList.get(i).tagNameFullString); }
    }
    else if (editTagGroupGUIObject.tempSelectedTagTypeNameAltString.equals("NOU")){
        editTagGroupGUIObject.tempSelectedTagObject             .tagNameAltString                       = editTagGroupGUIObject.editTagGroupTagNameAltTextfieldObject                       .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNameFullString                      = editTagGroupGUIObject.editTagGroupTagNameFullTextfieldObject                      .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNounSString                         = editTagGroupGUIObject.editTagGroupTagNounSTextfieldObject                         .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNounString                          = editTagGroupGUIObject.editTagGroupTagNounTextfieldObject                          .getText();
        nounTagNameAltStringList                                .clear();
        nounTagNameFullStringList                               .clear();
        for(int i = 0; i < nounTagObjectList                    .size(); i ++){ nounTagNameAltStringList.add(nounTagObjectList.get(i).tagNameAltString ); nounTagNameFullStringList.add(nounTagObjectList.get(i).tagNameFullString); }
    }
    else if (editTagGroupGUIObject.tempSelectedTagTypeNameAltString.equals("ADJ")){
        editTagGroupGUIObject.tempSelectedTagObject             .tagAdjectiveString                     = editTagGroupGUIObject.editTagGroupTagAdjectiveTextfieldObject                     .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNameAltString                       = editTagGroupGUIObject.editTagGroupTagNameAltTextfieldObject                       .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNameFullString                      = editTagGroupGUIObject.editTagGroupTagNameFullTextfieldObject                      .getText();
        adjectiveTagNameAltStringList                           .clear();
        adjectiveTagNameFullStringList                          .clear();
        for(int i = 0; i < adjectiveTagObjectList               .size(); i ++){ adjectiveTagNameAltStringList.add(adjectiveTagObjectList.get(i).tagNameAltString ); adjectiveTagNameFullStringList.add(adjectiveTagObjectList.get(i).tagNameFullString); }
    }
    else if (editTagGroupGUIObject.tempSelectedTagTypeNameAltString.equals("NDJ")){
        editTagGroupGUIObject.tempSelectedTagObject             .tagNameAltString                       = editTagGroupGUIObject.editTagGroupTagNameAltTextfieldObject                       .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNameFullString                      = editTagGroupGUIObject.editTagGroupTagNameFullTextfieldObject                      .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNegativeAdjectiveString             = editTagGroupGUIObject.editTagGroupTagNegativeAdjectiveTextfieldObject             .getText();
        negativeAdjectiveTagNameAltStringList                   .clear();
        negativeAdjectiveTagNameFullStringList                  .clear();
        for(int i = 0; i < adjectiveTagObjectList               .size(); i ++){ negativeAdjectiveTagNameAltStringList.add(negativeAdjectiveTagObjectList.get(i).tagNameAltString ); negativeAdjectiveTagNameFullStringList.add(negativeAdjectiveTagObjectList.get(i).tagNameFullString); }
    }
    else if (editTagGroupGUIObject.tempSelectedTagTypeNameAltString.equals("ADV")){
        editTagGroupGUIObject.tempSelectedTagObject             .tagAdverbString                        = editTagGroupGUIObject.editTagGroupTagAdverbTextfieldObject                        .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNameAltString                       = editTagGroupGUIObject.editTagGroupTagNameAltTextfieldObject                       .getText();
        editTagGroupGUIObject.tempSelectedTagObject             .tagNameFullString                      = editTagGroupGUIObject.editTagGroupTagNameFullTextfieldObject                      .getText();
        adverbTagNameAltStringList                              .clear();
        adverbTagNameFullStringList                             .clear();
        for(int i = 0; i < adverbTagObjectList                  .size(); i ++){ adverbTagNameAltStringList.add(adverbTagObjectList.get(i).tagNameAltString ); adverbTagNameFullStringList.add(adverbTagObjectList.get(i).tagNameFullString); }
    }
    else if (editTagGroupGUIObject.tempSelectedTagTypeNameAltString.equals("NDV")){
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
public void AddPlayerGroupPickExhibitionStartScrollableListObject  (int _indexInt){

    String          tempStartingExhibitionNameAltString         = "";
    String          tempStartingExhibitionNameFullString        = addPlayerGroupGUIObject.addPlayerGroupPickExhibitionStartScrollableListObject.getItem(_indexInt).get("text").toString();
    ObjectMuseum    tempStartingExhibitionObject                = null;

    tempStartingExhibitionObject                                = FindMuseumObject(tempStartingExhibitionNameFullString);
    tempStartingExhibitionNameAltString                         = tempStartingExhibitionObject.nameAltString;
    addPlayerGroupGUIObject.tempExhibitionStartNameAltString    = tempStartingExhibitionNameAltString;

}
/*A function to control what happen when user click Add Player button.*/
public void AddPlayerGroupPlayerAddButtonObject                    (int _indexInt){

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
public void EditPlayerGroupPlayerNameChangeButtonObject                (int _indexInt)     {

    String tempPlayerNameString                                         = editPlayerGroupGUIObject.editPlayerGroupPlayerNameTextfieldObject.getText();
    editPlayerGroupGUIObject.tempSelectedPlayerObject.playerNameString  = tempPlayerNameString;
    editPlayerGroupGUIObject.editPlayerGroupPlayerNameTextfieldObject   .setText (editPlayerGroupGUIObject.tempSelectedPlayerObject.playerNameString);

}
/*Set the movement mode for both player object and the graphical user interface object.
This function is to make sure that both mode is always the same.*/
public void EditPlayerGroupPlayerModeValueRadioButtonObject            (int _intIndex)     {

    editPlayerGroupGUIObject.tempSelectedPlayerMovementModeInt                  = _intIndex;
    editPlayerGroupGUIObject.tempSelectedPlayerObject.playerMovementModeInt     = _intIndex;

}
/*A function to move the selected player into new exhibition.
This function need to only happened when the appropriate movement mode is selected.*/
public void EditPlayerGroupPlayerExhibitionNextScrollableListObject    (int _indexInt)     {

    if(editPlayerGroupGUIObject.tempSelectedPlayerMovementModeInt == 2){

        String  receivedMuseumNameFullString    = editPlayerGroupGUIObject.editPlayerGroupPlayerExhibitionNextScrollableListObject.getItem(_indexInt).get("text").toString();
        String  receivedMuseumNameAltString     = FindMuseumObject(receivedMuseumNameFullString).nameAltString;

        editPlayerGroupGUIObject.tempSelectedPlayerObject.ExhibitionMoveObject(receivedMuseumNameAltString);

    }

}
public void EditPlayerGroupSetAllModeSoftwareAutoButtonObject          (int _indexInt)     {

    editPlayerGroupGUIObject.tempSelectedPlayerMovementModeInt                                          = 1;
    for(int i = 0; i < playerObjectList.size(); i ++){ playerObjectList.get(i).playerMovementModeInt    = 1; }

}
public void EditPlayerGroupSetAllModeSoftwareManualButtonObject        (int _indexInt)     {

    editPlayerGroupGUIObject.tempSelectedPlayerMovementModeInt                                          = 2;
    for(int i = 0; i < playerObjectList.size(); i ++){ playerObjectList.get(i).playerMovementModeInt    = 2; }

}
public void EditPlayerGroupPlayerResetButtonObject                     (int _indexInt)     { editPlayerGroupGUIObject.tempSelectedPlayerObject.ResetVoid(); }
public void EditPlayerGroupPlayerResetAllButtonObject                  (int _indexInt)     { for(int i = 0; i < playerObjectList.size(); i ++){ playerObjectList.get(i).ResetVoid(); } }
////////////////////////////////////////////////////////////////////////////////////////////////////
//END//EditPlayerGroupGUIObject.pde Controller's Functions./////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////



////////////////////////////////////////////////////////////////////////////////////////////////////
//START//RemovePlayerGroupGUIObject.pde Controller's Functions./////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
/*This function below is for the user to pick which player they want to remove.*/
public void RemovePlayerGroupSelectPlayerToRemoveScrollableListObject  (int _indexInt){

    String  tempIndexSelectedPlayerString                   = removePlayerGroupGUIObject.removePlayerGroupSelectPlayerToRemoveScrollableListObject.getItem(_indexInt).get("text").toString();
    int     tempIndexSelectedPlayerInt                      = Integer.parseInt(tempIndexSelectedPlayerString);
    removePlayerGroupGUIObject.tempPlayerToRemoveObject     = FindPlayerObject(tempIndexSelectedPlayerInt   );

}
public void RemovePlayerGroupRemoveButtonObject                        (int _indexInt){

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



class AddMuseumGroupGUIObject extends GroupGUIObject{

    ControlP5       addMuseumGroupControlP5Object                                                       ;                           /*ControlP5 object to control all graphical user interface controller.              */

    String          tempSelectedParentNameAltString                                                     = "";                       /*Selected object museum parent name alt  string.                                   */
    String          tempSelectedParentNameFullString                                                    = "";                       /*Selected object museum parent name full string.                                   */
    String          tempSelectedTypeObjectMuseumNameAltString                                           = "";                       /*Selected object museum type   name alt  string ("FLR"  , "ROM" , "EXH"       ).   */
    String          tempSelectedTypeObjectMuseumNameFullString                                          = "";                       /*Selected object museum type   name full string ("Floor", "Room", "Exhibition").   */
    List<String>    tempSelectedTagNameFullStringList                                                   = new ArrayList<String>();  /*Selected object museum tag    name full string.                                   */

    /*ControlP5 related graphical user interface controller variables.*/
    Group           addMuseumGroupObject                                                                ;
    ScrollableList  addMuseumGroupSelectTypeMuseumObjectScrollableListObject                            ;
    ScrollableList  addMuseumGroupSelectParentMuseumObjectScrollableListObject                          ;
    Textlabel       addMuseumGroupCanAddMultipleTagTextlabelObject                                      ;
    ScrollableList  addMuseumGroupSelectSubjectTagMuseumObjectScrollableListObject                      ;
    ScrollableList  addMuseumGroupSelectIntransitiveVerbTagMuseumObjectScrollableListObject             ;
    ScrollableList  addMuseumGroupSelectTransitiveVerbTagMuseumObjectScrollableListObject               ;
    ScrollableList  addMuseumGroupSelectNegativeIntransitiveVerbTagMuseumObjectScrollableListObject     ;
    ScrollableList  addMuseumGroupSelectNegativeTransitiveVerbTagMuseumObjectScrollableListObject       ;
    ScrollableList  addMuseumGroupSelectNounTagMuseumObjectScrollableListObject                         ;
    ScrollableList  addMuseumGroupSelectNounAbstractTagMuseumObjectScrollableListObject                 ;
    ScrollableList  addMuseumGroupSelectAdjectiveTagMuseumObjectScrollableListObject                    ;
    ScrollableList  addMuseumGroupSelectNegativeAdjectiveTagMuseumObjectScrollableListObject            ;
    ScrollableList  addMuseumGroupSelectAdverbTagMuseumObjectScrollableListObject                       ;
    ScrollableList  addMuseumGroupSelectNegativeAdverbTagMuseumObjectScrollableListObject               ;
    Textfield       addMuseumGroupExplanation1TextfieldObject                                           ;
    Textfield       addMuseumGroupExplanation2TextfieldObject                                           ;
    Textfield       addMuseumGroupExplanation3TextfieldObject                                           ;
    Textfield       addMuseumGroupExplanation4TextfieldObject                                           ;
    Textfield       addMuseumGroupNameFullMuseumObjectTextfieldObject                                   ;
    Textfield       addMuseumGroupNameAltMuseumObjectTextfieldObject                                    ;
    Button          addMuseumGroupAddMuseumObjectButtonObject                                           ;

    AddMuseumGroupGUIObject                                         (

        int         _guiXInt            ,
        int         _guiYInt            ,
        int         _guiWidthInt        ,
        int         _guiHeightInt       ,
        PApplet     _pAppletObject

    ){

        super                                                                           (_guiXInt, _guiYInt, _guiWidthInt, _guiHeightInt, _pAppletObject);
        addMuseumGroupControlP5Object                                                   = new ControlP5(pAppletObject);                                       /*PENDING.*/



        addMuseumGroupObject                                                            =
            addMuseumGroupControlP5Object   .addGroup                                   ("AddMuseumGroupObject")
                                            .close                                      ()
                                            .setBackgroundColor                         (groupBackgroundColor)
                                            .setBackgroundHeight                        (guiHeightInt)
                                            .setColor                                   (defaultCColor)
                                            .setColorBackground                         (groupColorBackgroundColor)
                                            .setColorLabel                              (groupColorLabelColor)
                                            .setLabel                                   ("ADD MUSEUM OBJECT:")
                                            .setPosition                                (guiXInt, guiYInt)
                                            .setWidth                                   (guiWidthInt);



        addMuseumGroupSelectTypeMuseumObjectScrollableListObject                        =
            addMuseumGroupControlP5Object   .addScrollableList                          ("AddMuseumGroupSelectTypeMuseumObjectScrollableListObject")
                                            .addItems                                   (Arrays.asList("Floor", "Room", "Exhibition"))
                                            .setColor                                   (defaultCColor)
                                            .setGroup                                   (addMuseumGroupObject)
                                            .setLabel                                   ("CHOOSE TYPE:")
                                            .setPosition                                (guiElement4ColumnFirstColumnXInt, guiLayoutOffsetInt)
                                            .setSize                                    (guiElement4ColumnWidth, guiScrollableList4RowHeightInt)
                                            .setType                                    (ControlP5.LIST);



        addMuseumGroupSelectParentMuseumObjectScrollableListObject                      =
            addMuseumGroupControlP5Object   .addScrollableList                          ("AddMuseumGroupSelectParentMuseumObjectScrollableListObject")
                                            .addItems                                   (defaultStringList)
                                            .setColor                                   (defaultCColor)
                                            .setGroup                                   (addMuseumGroupObject)
                                            .setLabel                                   ("PARENT OBJECT:")
                                            .setPosition                                (guiElement4ColumnSecondColumnXInt, guiLayoutOffsetInt)
                                            .setSize                                    (((guiElement4ColumnWidth*3) + (guiLayoutOffsetInt*2)), guiScrollableList4RowHeightInt)
                                            .setType                                    (ControlP5.LIST);



        addMuseumGroupCanAddMultipleTagTextlabelObject                                  =
            addMuseumGroupControlP5Object   .addTextlabel                               ("AddMuseumGroupCanAddMultipleTagTextlabelObject")
                                            .setColor                                   (defaultCColor)
                                            .setColorValue                              (255)
                                            .setGroup                                   (addMuseumGroupObject)
                                            .setPosition                                (guiElement1ColumnFirstColumnXInt, ((guiLayoutOffsetInt*2) + guiScrollableList4RowHeightInt))
                                            .setText                                    ("*YOU CAN ADD MULTIPLE TAGS\nBUT MINIMUM ONE TAG IN EACH CATEGORY.");



        addMuseumGroupSelectSubjectTagMuseumObjectScrollableListObject                  =
            addMuseumGroupControlP5Object   .addScrollableList                          ("AddMuseumGroupSelectSubjectTagMuseumObjectScrollableListObject")
                                            .addItems                                   (subjectTagNameFullStringList)
                                            .setColor                                   (falseCheckListCColor)
                                            .setGroup                                   (addMuseumGroupObject)
                                            .setLabel                                   ("SUBJECT TAG:")
                                            .setPosition                                (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*5) + guiScrollableList4RowHeightInt))
                                            .setSize                                    (guiElement2ColumnWidth, guiScrollableList4RowHeightInt)
                                            .setType                                    (ControlP5.LIST);



        addMuseumGroupSelectIntransitiveVerbTagMuseumObjectScrollableListObject         =
            addMuseumGroupControlP5Object   .addScrollableList                          ("AddMuseumGroupSelectIntransitiveVerbTagMuseumObjectScrollableListObject")
                                            .addItems                                   (intransitiveVerbTagNameFullStringList)
                                            .setColor                                   (falseCheckListCColor)
                                            .setGroup                                   (addMuseumGroupObject)
                                            .setLabel                                   ("INTRANSITIVE VERB TAG:")
                                            .setPosition                                (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*5) + guiScrollableList4RowHeightInt))
                                            .setSize                                    (guiElement2ColumnWidth, guiScrollableList4RowHeightInt)
                                            .setType                                    (ControlP5.LIST);



        addMuseumGroupSelectNegativeIntransitiveVerbTagMuseumObjectScrollableListObject =
            addMuseumGroupControlP5Object   .addScrollableList                          ("AddMuseumGroupSelectNegativeIntransitiveVerbTagMuseumObjectScrollableListObject")
                                            .addItems                                   (negativeIntransitiveVerbTagNameFullStringList)
                                            .setColor                                   (falseCheckListCColor)
                                            .setLabel                                   ("NEGATIVE INTRANSITIVE TAG:")
                                            .setGroup                                   (addMuseumGroupObject)
                                            .setPosition                                (guiElement3ColumnSecondColumnXInt, ((guiLayoutOffsetInt*6) + (guiScrollableList4RowHeightInt*2)))
                                            .setSize                                    (guiElement3ColumnWidth, guiScrollableList4RowHeightInt)
                                            .setType                                    (ControlP5.LIST);



        addMuseumGroupSelectTransitiveVerbTagMuseumObjectScrollableListObject           =
            addMuseumGroupControlP5Object   .addScrollableList                          ("AddMuseumGroupSelectTransitiveVerbTagMuseumObjectScrollableListObject")
                                            .addItems                                   (transitiveVerbTagNameFullStringList)
                                            .setColor                                   (falseCheckListCColor)
                                            .setGroup                                   (addMuseumGroupObject)
                                            .setLabel                                   ("TRANSITIVE VERB TAG:")
                                            .setPosition                                (guiElement3ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + (guiScrollableList4RowHeightInt*2)))
                                            .setSize                                    (guiElement3ColumnWidth, guiScrollableList4RowHeightInt)
                                            .setType                                    (ControlP5.LIST);



        addMuseumGroupSelectNegativeTransitiveVerbTagMuseumObjectScrollableListObject   =
            addMuseumGroupControlP5Object   .addScrollableList                          ("AddMuseumGroupSelectNegativeTransitiveVerbTagMuseumObjectScrollableListObject")
                                            .addItems                                   (negativeTransitiveVerbTagNameFullStringList)
                                            .setColor                                   (falseCheckListCColor)
                                            .setGroup                                   (addMuseumGroupObject)
                                            .setLabel                                   ("NEGATIVE TRANSITIVE VERB TAG:")
                                            .setPosition                                (guiElement3ColumnThirdColumnXInt, ((guiLayoutOffsetInt*6) + (guiScrollableList4RowHeightInt*2)))
                                            .setSize                                    (guiElement3ColumnWidth, guiScrollableList4RowHeightInt)
                                            .setType                                    (ControlP5.LIST);



        addMuseumGroupSelectNounTagMuseumObjectScrollableListObject                     =
            addMuseumGroupControlP5Object   .addScrollableList                          ("AddMuseumGroupSelectNounTagMuseumObjectScrollableListObject")
                                            .addItems                                   (nounTagNameFullStringList)
                                            .setColor                                   (falseCheckListCColor)
                                            .setGroup                                   (addMuseumGroupObject)
                                            .setLabel                                   ("NOUN TAG:")
                                            .setPosition                                (guiElement3ColumnFirstColumnXInt, ((guiLayoutOffsetInt*7) + (guiScrollableList4RowHeightInt*3)))
                                            .setSize                                    (guiElement3ColumnWidth, guiScrollableList4RowHeightInt)
                                            .setType                                    (ControlP5.LIST);



        addMuseumGroupSelectNounAbstractTagMuseumObjectScrollableListObject             =
            addMuseumGroupControlP5Object   .addScrollableList                          ("AddMuseumGroupSelectNounAbstractTagMuseumObjectScrollableListObject")
                                            .addItems                                   (nounAbstractTagNameFullStringList)
                                            .setColor                                   (falseCheckListCColor)
                                            .setGroup                                   (addMuseumGroupObject)
                                            .setLabel                                   ("NOUN ABSTRACT TAG:")
                                            .setPosition                                (guiElement3ColumnSecondColumnXInt, ((guiLayoutOffsetInt*7) + (guiScrollableList4RowHeightInt*3)))
                                            .setSize                                    (guiElement3ColumnWidth, guiScrollableList4RowHeightInt)
                                            .setType                                    (ControlP5.LIST);



        addMuseumGroupSelectAdjectiveTagMuseumObjectScrollableListObject                =
            addMuseumGroupControlP5Object   .addScrollableList                          ("AddMuseumGroupSelectAdjectiveTagMuseumObjectScrollableListObject")
                                            .addItems                                   (adjectiveTagNameFullStringList)
                                            .setColor                                   (falseCheckListCColor)
                                            .setGroup                                   (addMuseumGroupObject)
                                            .setLabel                                   ("ADJECTIVE TAG:")
                                            .setPosition                                (guiElement3ColumnThirdColumnXInt, ((guiLayoutOffsetInt*7) + (guiScrollableList4RowHeightInt*3)))
                                            .setSize                                    (guiElement3ColumnWidth, guiScrollableList4RowHeightInt)
                                            .setType                                    (ControlP5.LIST);



        addMuseumGroupSelectNegativeAdjectiveTagMuseumObjectScrollableListObject        =
            addMuseumGroupControlP5Object   .addScrollableList                          ("AddMuseumGroupSelectNegativeAdjectiveTagMuseumObjectScrollableListObject")
                                            .addItems                                   (negativeAdjectiveTagNameFullStringList)
                                            .setColor                                   (falseCheckListCColor)
                                            .setGroup                                   (addMuseumGroupObject)
                                            .setLabel                                   ("NEGATIVE ADJECTIVE TAG:")
                                            .setPosition                                (guiElement3ColumnFirstColumnXInt, ((guiLayoutOffsetInt*8) + (guiScrollableList4RowHeightInt*4)))
                                            .setSize                                    (guiElement3ColumnWidth, guiScrollableList4RowHeightInt)
                                            .setType                                    (ControlP5.LIST);



        addMuseumGroupSelectAdverbTagMuseumObjectScrollableListObject                   =
            addMuseumGroupControlP5Object   .addScrollableList                          ("AddMuseumGroupSelectAdverbTagMuseumObjectScrollableListObject")
                                            .addItems                                   (adverbTagNameFullStringList)
                                            .setColor                                   (falseCheckListCColor)
                                            .setGroup                                   (addMuseumGroupObject)
                                            .setLabel                                   ("ADVERB TAG:")
                                            .setPosition                                (guiElement3ColumnSecondColumnXInt, ((guiLayoutOffsetInt*8) + (guiScrollableList4RowHeightInt*4)))
                                            .setSize                                    (guiElement3ColumnWidth, guiScrollableList4RowHeightInt)
                                            .setType                                    (ControlP5.LIST);



        addMuseumGroupSelectNegativeAdverbTagMuseumObjectScrollableListObject           =
            addMuseumGroupControlP5Object   .addScrollableList                          ("AddMuseumGroupSelectNegativeAdverbTagMuseumObjectScrollableListObject")
                                            .addItems                                   (negativeAdverbTagNameFullStringList)
                                            .setColor                                   (falseCheckListCColor)
                                            .setGroup                                   (addMuseumGroupObject)
                                            .setLabel                                   ("NEGATIVE ADVERB TAG:")
                                            .setPosition                                (guiElement3ColumnThirdColumnXInt, ((guiLayoutOffsetInt*8) + (guiScrollableList4RowHeightInt*4)))
                                            .setSize                                    (guiElement3ColumnWidth, guiScrollableList4RowHeightInt)
                                            .setType                                    (ControlP5.LIST);



        addMuseumGroupExplanation1TextfieldObject                                       =
            addMuseumGroupControlP5Object   .addTextfield                               ("AddMuseumGroupExplanation1TextfieldObject")
                                            .setColor                                   (defaultCColor)
                                            .setGroup                                   (addMuseumGroupObject)
                                            .setLabel                                   ("EXPLANATION 1:")
                                            .setPosition                                (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*9) + (guiScrollableList4RowHeightInt*5)))
                                            .setSize                                    (guiElement2ColumnWidth, guiElement2LineHeight);


                                            
        addMuseumGroupExplanation2TextfieldObject                                       =
            addMuseumGroupControlP5Object   .addTextfield                               ("AddMuseumGroupExplanation2TextfieldObject")
                                            .setColor                                   (defaultCColor)
                                            .setGroup                                   (addMuseumGroupObject)
                                            .setLabel                                   ("EXPLANATION 2:")
                                            .setPosition                                (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*9) + (guiScrollableList4RowHeightInt*5)))
                                            .setSize                                    (guiElement2ColumnWidth, guiElement2LineHeight);


                                            
        addMuseumGroupExplanation3TextfieldObject                                       =
            addMuseumGroupControlP5Object   .addTextfield                               ("AddMuseumGroupExplanation3TextfieldObject")
                                            .setColor                                   (defaultCColor)
                                            .setGroup                                   (addMuseumGroupObject)
                                            .setLabel                                   ("EXPLANATION 3:")
                                            .setPosition                                (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*13) + (guiScrollableList4RowHeightInt*5)))
                                            .setSize                                    (guiElement2ColumnWidth, guiElement2LineHeight);


                                            
        addMuseumGroupExplanation4TextfieldObject                                       =
            addMuseumGroupControlP5Object   .addTextfield                               ("AddMuseumGroupExplanation4TextfieldObject")
                                            .setColor                                   (defaultCColor)
                                            .setGroup                                   (addMuseumGroupObject)
                                            .setLabel                                   ("EXPLANATION 4:")
                                            .setPosition                                (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*13) + (guiScrollableList4RowHeightInt*5)))
                                            .setSize                                    (guiElement2ColumnWidth, guiElement2LineHeight);


        addMuseumGroupNameFullMuseumObjectTextfieldObject                               =
            addMuseumGroupControlP5Object   .addTextfield                               ("AddMuseumGroupNameFullMuseumObjectTextfieldObject")
                                            .setColor                                   (defaultCColor)
                                            .setGroup                                   (addMuseumGroupObject)
                                            .setLabel                                   ("NAME FULL")
                                            .setPosition                                (guiElement3ColumnFirstColumnXInt, ((guiLayoutOffsetInt*17) + (guiScrollableList4RowHeightInt*5)))
                                            .setSize                                    (guiElement3ColumnWidth, guiElement2LineHeight);



        addMuseumGroupNameAltMuseumObjectTextfieldObject                                =
            addMuseumGroupControlP5Object   .addTextfield                               ("AddMuseumGroupNameAltMuseumObjectTextfieldObject")
                                            .setColor                                   (defaultCColor)
                                            .setGroup                                   (addMuseumGroupObject)
                                            .setLabel                                   ("NAME ALTERNATIVE")
                                            .setPosition                                (guiElement3ColumnSecondColumnXInt, ((guiLayoutOffsetInt*17) + (guiScrollableList4RowHeightInt*5)))
                                            .setSize                                    (guiElement3ColumnWidth, guiElement2LineHeight);



        addMuseumGroupAddMuseumObjectButtonObject                                       =
            addMuseumGroupControlP5Object   .addButton                                  ("AddMuseumGroupAddMuseumObjectButtonObject")
                                            .setColor                                   (defaultCColor)
                                            .setGroup                                   (addMuseumGroupObject)
                                            .setLabel                                   ("ADD MUSEUM OBJECT")
                                            .setPosition                                (guiElement3ColumnThirdColumnXInt, ((guiLayoutOffsetInt*17) + (guiScrollableList4RowHeightInt*5)))
                                            .setSize                                    (guiElement3ColumnWidth, guiElement2LineHeight);



    }

    public void DrawVoid                                                   (float _alphaFloat){

        super.DrawVoid(_alphaFloat, addMuseumGroupObject);

        addMuseumGroupExplanation1TextfieldObject           .setColorValue(groupColorLabelColor);
        addMuseumGroupExplanation2TextfieldObject           .setColorValue(groupColorLabelColor);
        addMuseumGroupExplanation3TextfieldObject           .setColorValue(groupColorLabelColor);
        addMuseumGroupExplanation4TextfieldObject           .setColorValue(groupColorLabelColor);
        addMuseumGroupNameFullMuseumObjectTextfieldObject   .setColorValue(groupColorLabelColor);
        addMuseumGroupNameAltMuseumObjectTextfieldObject    .setColorValue(groupColorLabelColor);

    }

}



class AddPlayerGroupGUIObject extends GroupGUIObject{

    ControlP5       addPlayerGroupControlP5Object                           ;

    String          tempExhibitionStartNameAltString                        = "";

    /*ControlP5 related graphical user interface controller variables.*/
    Group           addPlayerGroupObject                                    ;
    Textlabel       addPlayerGroupPlayerIndexTextlabelObject                ;
    Textlabel       addPlayerGroupPlayerIndexValueTextlabelObject           ;
    ScrollableList  addPlayerGroupPickExhibitionStartScrollableListObject   ;
    Textfield       addPlayerGroupPlayerNameTextfieldObject                 ;
    Button          addPlayerGroupPlayerAddButtonObject                     ;

    AddPlayerGroupGUIObject                                         (

        int         _guiXInt                    ,
        int         _guiYInt                    ,
        int         _guiWidthInt                ,
        int         _guiHeightInt               ,
        PApplet     _pAppletObject

    ){

        super                                                       (_guiXInt, _guiYInt, _guiWidthInt, _guiHeightInt, _pAppletObject);
        addPlayerGroupControlP5Object                               = new ControlP5(pAppletObject);

        addPlayerGroupObject                                        =
            addPlayerGroupControlP5Object   .addGroup               ("AddPlayerGroupObject")
                                            .close                  ()
                                            .setBackgroundColor     (groupBackgroundColor)
                                            .setBackgroundHeight    (guiHeightInt)
                                            .setColor               (defaultCColor)
                                            .setColorBackground     (groupColorBackgroundColor)
                                            .setColorLabel          (groupColorLabelColor)
                                            .setLabel               ("ADD VISITOR:")
                                            .setPosition            (guiXInt, guiYInt)
                                            .setWidth               (guiWidthInt);



        addPlayerGroupPlayerIndexTextlabelObject                    =
            addPlayerGroupControlP5Object   .addTextlabel           ("AddPlayerGroupPlayerIndexTextlabelObject")
                                            .setColor               (defaultCColor)
                                            .setColorValue          (255)
                                            .setGroup               (addPlayerGroupObject)
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, guiLayoutOffsetInt)
                                            .setText                ("VISITOR INDEX:");



        addPlayerGroupPlayerIndexValueTextlabelObject               =
            addPlayerGroupControlP5Object   .addTextlabel           ("AdPlayerGroupPlayerIndexValueTextlabelObject")
                                            .setColor               (defaultCColor)
                                            .setColorValue          (255)
                                            .setGroup               (addPlayerGroupObject)
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, guiLayoutOffsetInt)
                                            .setText                ("" + playerAmountInt);



        addPlayerGroupPickExhibitionStartScrollableListObject       =
            addPlayerGroupControlP5Object   .addScrollableList      ("AddPlayerGroupPickExhibitionStartScrollableListObject")
                                            .addItems               (exhibitionNameFullStringList)
                                            .setColor               (defaultCColor)
                                            .setGroup               (addPlayerGroupObject)
                                            .setLabel               ("PICK STARTING EXHIBITION:")
                                            .setPosition            (guiElement1ColumnFirstColumnXInt, (guiLayoutOffsetInt*3))
                                            .setSize                (guiElement1ColumnWidth, guiScrollableList5RowHeightInt)
                                            .setType                (ControlP5.LIST);



        addPlayerGroupPlayerNameTextfieldObject                     =
            addPlayerGroupControlP5Object   .addTextfield           ("AddPlayerGroupPlayerNameTextfieldObject")
                                            .setColor               (defaultCColor)
                                            .setGroup               (addPlayerGroupObject)
                                            .setLabel               ("VISITOR NAME:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*4) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addPlayerGroupPlayerAddButtonObject                         =
            addPlayerGroupControlP5Object   .addButton              ("AddPlayerGroupPlayerAddButtonObject")
                                            .setColor               (defaultCColor)
                                            .setGroup               (addPlayerGroupObject)
                                            .setLabel               ("ADD PLAYER")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*4) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);

    }

    public void DrawVoid                                                   (float   _alphaFloat){

        super.DrawVoid(_alphaFloat, addPlayerGroupObject);

        addPlayerGroupPlayerNameTextfieldObject.setColorValue(groupColorLabelColor);

    }

}



class AddTagGroupGUIObject extends GroupGUIObject{

    ControlP5       addTagGroupControllerP5Object                               ;

    String          tempSelectedTagTypeNameFullString                           = "";

    /*ControlP5 related graphical user interface controller variables.*/
    Group           addTagGroupObject                                           ;
    ScrollableList  addTagGroupTagTypeNameFullScrollableListObject              ;
    Textfield       addTagGroupTagNameAltTextfieldObject                        ;
    Textfield       addTagGroupTagNameFullTextfieldObject                       ;
    Textfield       addTagGroupTagSubjectTextfieldObject                        ;
    Textfield       addTagGroupTagSubjectPossesionTextfieldObject               ;
    Textfield       addTagGroupTagIntransitiveVerb1TextfieldObject              ;
    Textfield       addTagGroupTagIntransitiveVerb2TextfieldObject              ;
    Textfield       addTagGroupTagIntransitiveVerb3TextfieldObject              ;
    Textfield       addTagGroupTagIntransitiveVerbIngTextfieldObject            ;
    Textfield       addTagGroupTagIntransitiveVerbSTextfieldObject              ;
    Textfield       addTagGroupTagNegativeIntransitiveVerb1TextfieldObject      ;
    Textfield       addTagGroupTagNegativeIntransitiveVerb2TextfieldObject      ;
    Textfield       addTagGroupTagNegativeIntransitiveVerb3TextfieldObject      ;
    Textfield       addTagGroupTagNegativeIntransitiveVerbIngTextfieldObject    ;
    Textfield       addTagGroupTagNegativeIntransitiveVerbSTextfieldObject      ;
    Textfield       addTagGroupTagTransitiveVerb1TextfieldObject                ;
    Textfield       addTagGroupTagTransitiveVerb2TextfieldObject                ;
    Textfield       addTagGroupTagTransitiveVerb3TextfieldObject                ;
    Textfield       addTagGroupTagTransitiveVerbIngTextfieldObject              ;
    Textfield       addTagGroupTagTransitiveVerbSTextfieldObject                ;
    Textfield       addTagGroupTagNegativeTransitiveVerb1TextfieldObject        ;
    Textfield       addTagGroupTagNegativeTransitiveVerb2TextfieldObject        ;
    Textfield       addTagGroupTagNegativeTransitiveVerb3TextfieldObject        ;
    Textfield       addTagGroupTagNegativeTransitiveVerbIngTextfieldObject      ;
    Textfield       addTagGroupTagNegativeTransitiveVerbSTextfieldObject        ;
    Textfield       addTagGroupTagNounAbstractTextfieldObject                   ;
    Textfield       addTagGroupTagNounAbstractSTextfieldObject                  ;
    Textfield       addTagGroupTagNounTextfieldObject                           ;
    Textfield       addTagGroupTagNounSTextfieldObject                          ;
    Textfield       addTagGroupTagAdjectiveTextfieldObject                      ;
    Textfield       addTagGroupTagNegativeAdjectiveTextfieldObject              ;
    Textfield       addTagGroupTagAdverbTextfieldObject                         ;
    Textfield       addTagGroupTagNegativeAdverbTextfieldObject                 ;
    Button          addTagGroupTagAddButtonObject                               ;

    AddTagGroupGUIObject(

        int                 _guiXInt                                ,
        int                 _guiYInt                                ,
        int                 _guiWidthInt                            ,
        int                 _guiHeightInt                           ,
        PApplet             _pAppletObject

    ){


        super(_guiXInt, _guiYInt, _guiWidthInt, _guiHeightInt, _pAppletObject);
        addTagGroupControllerP5Object               = new ControlP5(pAppletObject);



        addTagGroupObject                                           =
            addTagGroupControllerP5Object   .addGroup               ("AddTagGroupObject")
                                            .close                  ()
                                            .setBackgroundColor     (groupBackgroundColor)
                                            .setBackgroundHeight    (guiHeightInt)
                                            .setColor               (defaultCColor)
                                            .setColorBackground     (groupColorBackgroundColor)
                                            .setColorLabel          (groupColorLabelColor)
                                            .setLabel               ("ADD TAG:")
                                            .setPosition            (guiXInt, guiYInt)
                                            .setWidth               (guiWidthInt);



        addTagGroupTagTypeNameFullScrollableListObject              =
            addTagGroupControllerP5Object   .addScrollableList      ("AddTagGroupTagTypeNameFullScrollableListObject")
                                            .addItems               (Arrays.asList("SUBJECT", "INTRANSITIVE VERB", "NEGATIVE INTRANSITIVE VERB", "TRANSITIVE VERB", "NEGATIVE TRANSITIVE VERB", "NOUN", "NOUN ABSTRACT", "ADJECTIVE", "NEGATIVE ADJECTIVE", "ADVERB", "NEGATIVE ADVERB"))
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("SELECT TAG TYPE:")
                                            .setPosition            (guiElement1ColumnFirstColumnXInt, guiLayoutOffsetInt)
                                            .setSize                (guiElement1ColumnWidth, guiScrollableList4RowHeightInt)
                                            .setType                (ControlP5.LIST);



        addTagGroupTagNameFullTextfieldObject                       =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNameFullTextfieldObject")
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("TAG NAME FULL:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*2) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagNameAltTextfieldObject                        =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNameAltTextfieldObject")
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("TAG NAME ALT:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*2) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagSubjectTextfieldObject                        =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagSubjectTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("SUBJECT:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagSubjectPossesionTextfieldObject               =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagSubjectPossesionTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("SUBJECT POSSESION:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagIntransitiveVerb1TextfieldObject              =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagIntransitiveVerb1TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("INTRANSITIVE VERB 1:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);


 
        addTagGroupTagIntransitiveVerb2TextfieldObject              =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagIntransitiveVerb2TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("INTRANSITIVE VERB 2:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagIntransitiveVerb3TextfieldObject              =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagIntransitiveVerb3TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("INTRANSITIVE VERB 3:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*10) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagIntransitiveVerbIngTextfieldObject            =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagIntransitiveVerbIngTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("INTRANSITIVE VERB + ING:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*10) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagIntransitiveVerbSTextfieldObject              =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagIntransitiveVerbSTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("INTRANSITIVE VERB + S:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*14) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagNegativeIntransitiveVerb1TextfieldObject      =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNegativeIntransitiveVerb1TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("NEGATIVE INTRANSITIVE VERB 1:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagNegativeIntransitiveVerb2TextfieldObject      =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNegativeIntransitiveVerb2TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("NEGATIVE INTRANSITIVE VERB 2:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagNegativeIntransitiveVerb3TextfieldObject      =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNegativeIntransitiveVerb3TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("NEGATIVE INTRANSITIVE VERB 3:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*10) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagNegativeIntransitiveVerbIngTextfieldObject    =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNegativeIntransitiveVerbIngTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("NEGATIVE INTRANSITIVE VERB + ING:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*10) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagNegativeIntransitiveVerbSTextfieldObject      =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNegativeIntransitiveVerbSTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("NEGATIVE INTRANSITIVE VERB + S:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*14) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagTransitiveVerb1TextfieldObject                =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagTransitiveVerb1TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("TRANSITIVE VERB 1:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagTransitiveVerb2TextfieldObject                =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagTransitiveVerb2TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("TRANSITIVE VERB 2:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagTransitiveVerb3TextfieldObject                =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagTransitiveVerb3TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("TRANSITIVE VERB 3:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*10) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagTransitiveVerbIngTextfieldObject              =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagTransitiveVerbIngTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("TRANSITIVE VERB + ING:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*10) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagTransitiveVerbSTextfieldObject                =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagTransitiveVerbSTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("TRANSITIVE VERB + S:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*14) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagNegativeTransitiveVerb1TextfieldObject        =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNegativeTransitiveVerb1TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("NEGATIVE TRANSITIVE VERB 1:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagNegativeTransitiveVerb2TextfieldObject        =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNegativeTransitiveVerb2TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("NEGATIVE TRANSITIVE VERB 2:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagNegativeTransitiveVerb3TextfieldObject        =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNegativeTransitiveVerb3TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("NEGATIVE TRANSITIVE VERB 3:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*10) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagNegativeTransitiveVerbIngTextfieldObject      =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNegativeTransitiveVerbIngTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("NEGATIVE TRANSITIVE VERB + ING:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*10) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagNegativeTransitiveVerbSTextfieldObject        =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNegativeTransitiveVerbSTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("NEGATIVE TRANSITIVE VERB + S:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*14) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagNounAbstractTextfieldObject                   =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNounAbstractTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("NOUN ABSTRACT:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagNounAbstractSTextfieldObject                  =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNounAbstractSTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("NOUN ABSTRACT + S:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagNounTextfieldObject                           =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNounTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("NOUN:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagNounSTextfieldObject                          =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNounSTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("NOUN + S:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagAdjectiveTextfieldObject                      =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagAdjectiveTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("ADJECTIVE:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagNegativeAdjectiveTextfieldObject              =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNegativeAdjectiveTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("NEGATIVE ADJECTIVE:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagAdverbTextfieldObject                         =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagAdverbTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("ADVERB:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagNegativeAdverbTextfieldObject                 =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNegativeAdverbTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("NEGATIVE ADVERB:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagAddButtonObject                               =
            addTagGroupControllerP5Object   .addButton              ("AddTagGroupTagAddButtonObject")
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("ADD TAG")  
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*14) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



    }

    public void DrawVoid(float   _alphaFloat){

        super.DrawVoid(_alphaFloat, addTagGroupObject);

        ControlFormVoid();

        addTagGroupTagNameAltTextfieldObject                        .setColorValue(groupColorLabelColor);
        addTagGroupTagNameFullTextfieldObject                       .setColorValue(groupColorLabelColor);
        addTagGroupTagSubjectTextfieldObject                        .setColorValue(groupColorLabelColor);
        addTagGroupTagSubjectPossesionTextfieldObject               .setColorValue(groupColorLabelColor);
        addTagGroupTagIntransitiveVerb1TextfieldObject              .setColorValue(groupColorLabelColor);
        addTagGroupTagIntransitiveVerb2TextfieldObject              .setColorValue(groupColorLabelColor);
        addTagGroupTagIntransitiveVerb3TextfieldObject              .setColorValue(groupColorLabelColor);
        addTagGroupTagIntransitiveVerbIngTextfieldObject            .setColorValue(groupColorLabelColor);
        addTagGroupTagIntransitiveVerbSTextfieldObject              .setColorValue(groupColorLabelColor);
        addTagGroupTagNegativeIntransitiveVerb1TextfieldObject      .setColorValue(groupColorLabelColor);
        addTagGroupTagNegativeIntransitiveVerb2TextfieldObject      .setColorValue(groupColorLabelColor);
        addTagGroupTagNegativeIntransitiveVerb3TextfieldObject      .setColorValue(groupColorLabelColor);
        addTagGroupTagNegativeIntransitiveVerbIngTextfieldObject    .setColorValue(groupColorLabelColor);
        addTagGroupTagNegativeIntransitiveVerbSTextfieldObject      .setColorValue(groupColorLabelColor);
        addTagGroupTagTransitiveVerb1TextfieldObject                .setColorValue(groupColorLabelColor);
        addTagGroupTagTransitiveVerb2TextfieldObject                .setColorValue(groupColorLabelColor);
        addTagGroupTagTransitiveVerb3TextfieldObject                .setColorValue(groupColorLabelColor);
        addTagGroupTagTransitiveVerbIngTextfieldObject              .setColorValue(groupColorLabelColor);
        addTagGroupTagTransitiveVerbSTextfieldObject                .setColorValue(groupColorLabelColor);
        addTagGroupTagNegativeTransitiveVerb1TextfieldObject        .setColorValue(groupColorLabelColor);
        addTagGroupTagNegativeTransitiveVerb2TextfieldObject        .setColorValue(groupColorLabelColor);
        addTagGroupTagNegativeTransitiveVerb3TextfieldObject        .setColorValue(groupColorLabelColor);
        addTagGroupTagNegativeTransitiveVerbIngTextfieldObject      .setColorValue(groupColorLabelColor);
        addTagGroupTagNegativeTransitiveVerbSTextfieldObject        .setColorValue(groupColorLabelColor);
        addTagGroupTagNounAbstractTextfieldObject                   .setColorValue(groupColorLabelColor);
        addTagGroupTagNounAbstractSTextfieldObject                  .setColorValue(groupColorLabelColor);
        addTagGroupTagNounTextfieldObject                           .setColorValue(groupColorLabelColor);
        addTagGroupTagNounSTextfieldObject                          .setColorValue(groupColorLabelColor);
        addTagGroupTagAdjectiveTextfieldObject                      .setColorValue(groupColorLabelColor);
        addTagGroupTagNegativeAdjectiveTextfieldObject              .setColorValue(groupColorLabelColor);
        addTagGroupTagAdverbTextfieldObject                         .setColorValue(groupColorLabelColor);
        addTagGroupTagNegativeAdverbTextfieldObject                 .setColorValue(groupColorLabelColor);

    }

    /*Show the necessary text field according to the selected type tag.*/
    public void ControlFormVoid(){

        if(tempSelectedTagTypeNameFullString.equals("SUBJECT"))                             {

            addTagGroupTagSubjectTextfieldObject                        .show();
            addTagGroupTagSubjectPossesionTextfieldObject               .show();
            addTagGroupTagIntransitiveVerb1TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerb2TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerb3TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerbIngTextfieldObject            .hide();
            addTagGroupTagIntransitiveVerbSTextfieldObject              .hide();
            addTagGroupTagNegativeIntransitiveVerb1TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerb2TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerb3TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerbIngTextfieldObject    .hide();
            addTagGroupTagNegativeIntransitiveVerbSTextfieldObject      .hide();
            addTagGroupTagTransitiveVerb1TextfieldObject                .hide();
            addTagGroupTagTransitiveVerb2TextfieldObject                .hide();
            addTagGroupTagTransitiveVerb3TextfieldObject                .hide();
            addTagGroupTagTransitiveVerbIngTextfieldObject              .hide();
            addTagGroupTagTransitiveVerbSTextfieldObject                .hide();
            addTagGroupTagNegativeTransitiveVerb1TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerb2TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerb3TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerbIngTextfieldObject      .hide();
            addTagGroupTagNegativeTransitiveVerbSTextfieldObject        .hide();
            addTagGroupTagNounAbstractTextfieldObject                   .hide();
            addTagGroupTagNounAbstractSTextfieldObject                  .hide();
            addTagGroupTagNounTextfieldObject                           .hide();
            addTagGroupTagNounSTextfieldObject                          .hide();
            addTagGroupTagAdjectiveTextfieldObject                      .hide();
            addTagGroupTagNegativeAdjectiveTextfieldObject              .hide();
            addTagGroupTagAdverbTextfieldObject                         .hide();
            addTagGroupTagNegativeAdverbTextfieldObject                 .hide();

        }
        else if(tempSelectedTagTypeNameFullString.equals("INTRANSITIVE VERB"))              {

            addTagGroupTagSubjectTextfieldObject                        .hide();
            addTagGroupTagSubjectPossesionTextfieldObject               .hide();
            addTagGroupTagIntransitiveVerb1TextfieldObject              .show();
            addTagGroupTagIntransitiveVerb2TextfieldObject              .show();
            addTagGroupTagIntransitiveVerb3TextfieldObject              .show();
            addTagGroupTagIntransitiveVerbIngTextfieldObject            .show();
            addTagGroupTagIntransitiveVerbSTextfieldObject              .show();
            addTagGroupTagNegativeIntransitiveVerb1TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerb2TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerb3TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerbIngTextfieldObject    .hide();
            addTagGroupTagNegativeIntransitiveVerbSTextfieldObject      .hide();
            addTagGroupTagTransitiveVerb1TextfieldObject                .hide();
            addTagGroupTagTransitiveVerb2TextfieldObject                .hide();
            addTagGroupTagTransitiveVerb3TextfieldObject                .hide();
            addTagGroupTagTransitiveVerbIngTextfieldObject              .hide();
            addTagGroupTagTransitiveVerbSTextfieldObject                .hide();
            addTagGroupTagNegativeTransitiveVerb1TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerb2TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerb3TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerbIngTextfieldObject      .hide();
            addTagGroupTagNegativeTransitiveVerbSTextfieldObject        .hide();
            addTagGroupTagNounAbstractTextfieldObject                   .hide();
            addTagGroupTagNounAbstractSTextfieldObject                  .hide();
            addTagGroupTagNounTextfieldObject                           .hide();
            addTagGroupTagNounSTextfieldObject                          .hide();
            addTagGroupTagAdjectiveTextfieldObject                      .hide();
            addTagGroupTagNegativeAdjectiveTextfieldObject              .hide();
            addTagGroupTagAdverbTextfieldObject                         .hide();
            addTagGroupTagNegativeAdverbTextfieldObject                 .hide();

        }
        else if(tempSelectedTagTypeNameFullString.equals("NEGATIVE INTRANSITIVE VERB"))     {

            addTagGroupTagSubjectTextfieldObject                        .hide();
            addTagGroupTagSubjectPossesionTextfieldObject               .hide();
            addTagGroupTagIntransitiveVerb1TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerb2TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerb3TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerbIngTextfieldObject            .hide();
            addTagGroupTagIntransitiveVerbSTextfieldObject              .hide();
            addTagGroupTagNegativeIntransitiveVerb1TextfieldObject      .show();
            addTagGroupTagNegativeIntransitiveVerb2TextfieldObject      .show();
            addTagGroupTagNegativeIntransitiveVerb3TextfieldObject      .show();
            addTagGroupTagNegativeIntransitiveVerbIngTextfieldObject    .show();
            addTagGroupTagNegativeIntransitiveVerbSTextfieldObject      .show();
            addTagGroupTagTransitiveVerb1TextfieldObject                .hide();
            addTagGroupTagTransitiveVerb2TextfieldObject                .hide();
            addTagGroupTagTransitiveVerb3TextfieldObject                .hide();
            addTagGroupTagTransitiveVerbIngTextfieldObject              .hide();
            addTagGroupTagTransitiveVerbSTextfieldObject                .hide();
            addTagGroupTagNegativeTransitiveVerb1TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerb2TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerb3TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerbIngTextfieldObject      .hide();
            addTagGroupTagNegativeTransitiveVerbSTextfieldObject        .hide();
            addTagGroupTagNounAbstractTextfieldObject                   .hide();
            addTagGroupTagNounAbstractSTextfieldObject                  .hide();
            addTagGroupTagNounTextfieldObject                           .hide();
            addTagGroupTagNounSTextfieldObject                          .hide();
            addTagGroupTagAdjectiveTextfieldObject                      .hide();
            addTagGroupTagNegativeAdjectiveTextfieldObject              .hide();
            addTagGroupTagAdverbTextfieldObject                         .hide();
            addTagGroupTagNegativeAdverbTextfieldObject                 .hide();

        }
        else if(tempSelectedTagTypeNameFullString.equals("TRANSITIVE VERB"))                {

            addTagGroupTagSubjectTextfieldObject                        .hide();
            addTagGroupTagSubjectPossesionTextfieldObject               .hide();
            addTagGroupTagIntransitiveVerb1TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerb2TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerb3TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerbIngTextfieldObject            .hide();
            addTagGroupTagIntransitiveVerbSTextfieldObject              .hide();
            addTagGroupTagNegativeIntransitiveVerb1TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerb2TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerb3TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerbIngTextfieldObject    .hide();
            addTagGroupTagNegativeIntransitiveVerbSTextfieldObject      .hide();
            addTagGroupTagTransitiveVerb1TextfieldObject                .show();
            addTagGroupTagTransitiveVerb2TextfieldObject                .show();
            addTagGroupTagTransitiveVerb3TextfieldObject                .show();
            addTagGroupTagTransitiveVerbIngTextfieldObject              .show();
            addTagGroupTagTransitiveVerbSTextfieldObject                .show();
            addTagGroupTagNegativeTransitiveVerb1TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerb2TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerb3TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerbIngTextfieldObject      .hide();
            addTagGroupTagNegativeTransitiveVerbSTextfieldObject        .hide();
            addTagGroupTagNounAbstractTextfieldObject                   .hide();
            addTagGroupTagNounAbstractSTextfieldObject                  .hide();
            addTagGroupTagNounTextfieldObject                           .hide();
            addTagGroupTagNounSTextfieldObject                          .hide();
            addTagGroupTagAdjectiveTextfieldObject                      .hide();
            addTagGroupTagNegativeAdjectiveTextfieldObject              .hide();
            addTagGroupTagAdverbTextfieldObject                         .hide();
            addTagGroupTagNegativeAdverbTextfieldObject                 .hide();

        }
        else if(tempSelectedTagTypeNameFullString.equals("NEGATIVE TRANSITIVE VERB"))       {

            addTagGroupTagSubjectTextfieldObject                        .hide();
            addTagGroupTagSubjectPossesionTextfieldObject               .hide();
            addTagGroupTagIntransitiveVerb1TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerb2TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerb3TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerbIngTextfieldObject            .hide();
            addTagGroupTagIntransitiveVerbSTextfieldObject              .hide();
            addTagGroupTagNegativeIntransitiveVerb1TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerb2TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerb3TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerbIngTextfieldObject    .hide();
            addTagGroupTagNegativeIntransitiveVerbSTextfieldObject      .hide();
            addTagGroupTagTransitiveVerb1TextfieldObject                .hide();
            addTagGroupTagTransitiveVerb2TextfieldObject                .hide();
            addTagGroupTagTransitiveVerb3TextfieldObject                .hide();
            addTagGroupTagTransitiveVerbIngTextfieldObject              .hide();
            addTagGroupTagTransitiveVerbSTextfieldObject                .hide();
            addTagGroupTagNegativeTransitiveVerb1TextfieldObject        .show();
            addTagGroupTagNegativeTransitiveVerb2TextfieldObject        .show();
            addTagGroupTagNegativeTransitiveVerb3TextfieldObject        .show();
            addTagGroupTagNegativeTransitiveVerbIngTextfieldObject      .show();
            addTagGroupTagNegativeTransitiveVerbSTextfieldObject        .show();
            addTagGroupTagNounAbstractTextfieldObject                   .hide();
            addTagGroupTagNounAbstractSTextfieldObject                  .hide();
            addTagGroupTagNounTextfieldObject                           .hide();
            addTagGroupTagNounSTextfieldObject                          .hide();
            addTagGroupTagAdjectiveTextfieldObject                      .hide();
            addTagGroupTagNegativeAdjectiveTextfieldObject              .hide();
            addTagGroupTagAdverbTextfieldObject                         .hide();
            addTagGroupTagNegativeAdverbTextfieldObject                 .hide();

        }
        else if(tempSelectedTagTypeNameFullString.equals("NOUN ABSTRACT"))                  {

            addTagGroupTagSubjectTextfieldObject                        .hide();
            addTagGroupTagSubjectPossesionTextfieldObject               .hide();
            addTagGroupTagIntransitiveVerb1TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerb2TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerb3TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerbIngTextfieldObject            .hide();
            addTagGroupTagIntransitiveVerbSTextfieldObject              .hide();
            addTagGroupTagNegativeIntransitiveVerb1TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerb2TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerb3TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerbIngTextfieldObject    .hide();
            addTagGroupTagNegativeIntransitiveVerbSTextfieldObject      .hide();
            addTagGroupTagTransitiveVerb1TextfieldObject                .hide();
            addTagGroupTagTransitiveVerb2TextfieldObject                .hide();
            addTagGroupTagTransitiveVerb3TextfieldObject                .hide();
            addTagGroupTagTransitiveVerbIngTextfieldObject              .hide();
            addTagGroupTagTransitiveVerbSTextfieldObject                .hide();
            addTagGroupTagNegativeTransitiveVerb1TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerb2TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerb3TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerbIngTextfieldObject      .hide();
            addTagGroupTagNegativeTransitiveVerbSTextfieldObject        .hide();
            addTagGroupTagNounAbstractTextfieldObject                   .show();
            addTagGroupTagNounAbstractSTextfieldObject                  .show();
            addTagGroupTagNounTextfieldObject                           .hide();
            addTagGroupTagNounSTextfieldObject                          .hide();
            addTagGroupTagAdjectiveTextfieldObject                      .hide();
            addTagGroupTagNegativeAdjectiveTextfieldObject              .hide();
            addTagGroupTagAdverbTextfieldObject                         .hide();
            addTagGroupTagNegativeAdverbTextfieldObject                 .hide();
        }
        else if(tempSelectedTagTypeNameFullString.equals("NOUN"))                           {

            addTagGroupTagSubjectTextfieldObject                        .hide();
            addTagGroupTagSubjectPossesionTextfieldObject               .hide();
            addTagGroupTagIntransitiveVerb1TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerb2TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerb3TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerbIngTextfieldObject            .hide();
            addTagGroupTagIntransitiveVerbSTextfieldObject              .hide();
            addTagGroupTagNegativeIntransitiveVerb1TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerb2TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerb3TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerbIngTextfieldObject    .hide();
            addTagGroupTagNegativeIntransitiveVerbSTextfieldObject      .hide();
            addTagGroupTagTransitiveVerb1TextfieldObject                .hide();
            addTagGroupTagTransitiveVerb2TextfieldObject                .hide();
            addTagGroupTagTransitiveVerb3TextfieldObject                .hide();
            addTagGroupTagTransitiveVerbIngTextfieldObject              .hide();
            addTagGroupTagTransitiveVerbSTextfieldObject                .hide();
            addTagGroupTagNegativeTransitiveVerb1TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerb2TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerb3TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerbIngTextfieldObject      .hide();
            addTagGroupTagNegativeTransitiveVerbSTextfieldObject        .hide();
            addTagGroupTagNounAbstractTextfieldObject                   .hide();
            addTagGroupTagNounAbstractSTextfieldObject                  .hide();
            addTagGroupTagNounTextfieldObject                           .show();
            addTagGroupTagNounSTextfieldObject                          .show();
            addTagGroupTagAdjectiveTextfieldObject                      .hide();
            addTagGroupTagNegativeAdjectiveTextfieldObject              .hide();
            addTagGroupTagAdverbTextfieldObject                         .hide();
            addTagGroupTagNegativeAdverbTextfieldObject                 .hide();

        }
        else if(tempSelectedTagTypeNameFullString.equals("ADJECTIVE"))                      {

            addTagGroupTagSubjectTextfieldObject                        .hide();
            addTagGroupTagSubjectPossesionTextfieldObject               .hide();
            addTagGroupTagIntransitiveVerb1TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerb2TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerb3TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerbIngTextfieldObject            .hide();
            addTagGroupTagIntransitiveVerbSTextfieldObject              .hide();
            addTagGroupTagNegativeIntransitiveVerb1TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerb2TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerb3TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerbIngTextfieldObject    .hide();
            addTagGroupTagNegativeIntransitiveVerbSTextfieldObject      .hide();
            addTagGroupTagTransitiveVerb1TextfieldObject                .hide();
            addTagGroupTagTransitiveVerb2TextfieldObject                .hide();
            addTagGroupTagTransitiveVerb3TextfieldObject                .hide();
            addTagGroupTagTransitiveVerbIngTextfieldObject              .hide();
            addTagGroupTagTransitiveVerbSTextfieldObject                .hide();
            addTagGroupTagNegativeTransitiveVerb1TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerb2TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerb3TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerbIngTextfieldObject      .hide();
            addTagGroupTagNegativeTransitiveVerbSTextfieldObject        .hide();
            addTagGroupTagNounAbstractTextfieldObject                   .hide();
            addTagGroupTagNounAbstractSTextfieldObject                  .hide();
            addTagGroupTagNounTextfieldObject                           .hide();
            addTagGroupTagNounSTextfieldObject                          .hide();
            addTagGroupTagAdjectiveTextfieldObject                      .show();
            addTagGroupTagNegativeAdjectiveTextfieldObject              .hide();
            addTagGroupTagAdverbTextfieldObject                         .hide();
            addTagGroupTagNegativeAdverbTextfieldObject                 .hide();

        }
        else if(tempSelectedTagTypeNameFullString.equals("NEGATIVE ADJECTIVE"))             {

            addTagGroupTagSubjectTextfieldObject                        .hide();
            addTagGroupTagSubjectPossesionTextfieldObject               .hide();
            addTagGroupTagIntransitiveVerb1TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerb2TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerb3TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerbIngTextfieldObject            .hide();
            addTagGroupTagIntransitiveVerbSTextfieldObject              .hide();
            addTagGroupTagNegativeIntransitiveVerb1TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerb2TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerb3TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerbIngTextfieldObject    .hide();
            addTagGroupTagNegativeIntransitiveVerbSTextfieldObject      .hide();
            addTagGroupTagTransitiveVerb1TextfieldObject                .hide();
            addTagGroupTagTransitiveVerb2TextfieldObject                .hide();
            addTagGroupTagTransitiveVerb3TextfieldObject                .hide();
            addTagGroupTagTransitiveVerbIngTextfieldObject              .hide();
            addTagGroupTagTransitiveVerbSTextfieldObject                .hide();
            addTagGroupTagNegativeTransitiveVerb1TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerb2TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerb3TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerbIngTextfieldObject      .hide();
            addTagGroupTagNegativeTransitiveVerbSTextfieldObject        .hide();
            addTagGroupTagNounAbstractTextfieldObject                   .hide();
            addTagGroupTagNounAbstractSTextfieldObject                  .hide();
            addTagGroupTagNounTextfieldObject                           .hide();
            addTagGroupTagNounSTextfieldObject                          .hide();
            addTagGroupTagAdjectiveTextfieldObject                      .hide();
            addTagGroupTagNegativeAdjectiveTextfieldObject              .show();
            addTagGroupTagAdverbTextfieldObject                         .hide();
            addTagGroupTagNegativeAdverbTextfieldObject                 .hide();

        }
        else if(tempSelectedTagTypeNameFullString.equals("ADVERB"))                         {

            addTagGroupTagSubjectTextfieldObject                        .hide();
            addTagGroupTagSubjectPossesionTextfieldObject               .hide();
            addTagGroupTagIntransitiveVerb1TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerb2TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerb3TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerbIngTextfieldObject            .hide();
            addTagGroupTagIntransitiveVerbSTextfieldObject              .hide();
            addTagGroupTagNegativeIntransitiveVerb1TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerb2TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerb3TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerbIngTextfieldObject    .hide();
            addTagGroupTagNegativeIntransitiveVerbSTextfieldObject      .hide();
            addTagGroupTagTransitiveVerb1TextfieldObject                .hide();
            addTagGroupTagTransitiveVerb2TextfieldObject                .hide();
            addTagGroupTagTransitiveVerb3TextfieldObject                .hide();
            addTagGroupTagTransitiveVerbIngTextfieldObject              .hide();
            addTagGroupTagTransitiveVerbSTextfieldObject                .hide();
            addTagGroupTagNegativeTransitiveVerb1TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerb2TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerb3TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerbIngTextfieldObject      .hide();
            addTagGroupTagNegativeTransitiveVerbSTextfieldObject        .hide();
            addTagGroupTagNounAbstractTextfieldObject                   .hide();
            addTagGroupTagNounAbstractSTextfieldObject                  .hide();
            addTagGroupTagNounTextfieldObject                           .hide();
            addTagGroupTagNounSTextfieldObject                          .hide();
            addTagGroupTagAdjectiveTextfieldObject                      .hide();
            addTagGroupTagNegativeAdjectiveTextfieldObject              .hide();
            addTagGroupTagAdverbTextfieldObject                         .show();
            addTagGroupTagNegativeAdverbTextfieldObject                 .hide();

        }
        else if(tempSelectedTagTypeNameFullString.equals("NEGATIVE ADVERB"))                {

            addTagGroupTagSubjectTextfieldObject                        .hide();
            addTagGroupTagSubjectPossesionTextfieldObject               .hide();
            addTagGroupTagIntransitiveVerb1TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerb2TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerb3TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerbIngTextfieldObject            .hide();
            addTagGroupTagIntransitiveVerbSTextfieldObject              .hide();
            addTagGroupTagNegativeIntransitiveVerb1TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerb2TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerb3TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerbIngTextfieldObject    .hide();
            addTagGroupTagNegativeIntransitiveVerbSTextfieldObject      .hide();
            addTagGroupTagTransitiveVerb1TextfieldObject                .hide();
            addTagGroupTagTransitiveVerb2TextfieldObject                .hide();
            addTagGroupTagTransitiveVerb3TextfieldObject                .hide();
            addTagGroupTagTransitiveVerbIngTextfieldObject              .hide();
            addTagGroupTagTransitiveVerbSTextfieldObject                .hide();
            addTagGroupTagNegativeTransitiveVerb1TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerb2TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerb3TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerbIngTextfieldObject      .hide();
            addTagGroupTagNegativeTransitiveVerbSTextfieldObject        .hide();
            addTagGroupTagNounAbstractTextfieldObject                   .hide();
            addTagGroupTagNounAbstractSTextfieldObject                  .hide();
            addTagGroupTagNounTextfieldObject                           .hide();
            addTagGroupTagNounSTextfieldObject                          .hide();
            addTagGroupTagAdjectiveTextfieldObject                      .hide();
            addTagGroupTagNegativeAdjectiveTextfieldObject              .hide();
            addTagGroupTagAdverbTextfieldObject                         .hide();
            addTagGroupTagNegativeAdverbTextfieldObject                 .show();

        }

    }

}
/*A class for toggle open and close button.
This button will be used to open a panel made using
    P5 user interface.*/
class ButtonOpenClose{

    PShape  buttonOpenCloseCircleObject = null; /*This is a child shape of this button, later will be combined together into main shape.*/
    PShape  buttonOpenCloseCross1Object = null; /*This is a child shape of this button, later will be combined together into main shape.*/
    PShape  buttonOpenCloseCross2Object = null; /*This is a child shape of this button, later will be combined together into main shape.*/
    boolean isAnimatingBoolean          = false;
    boolean isButtonOpenBoolean         = false;
    boolean isFunctionTriggerBoolean    = false;
    int     buttonRotationCounterInt    = 0;
    int     buttonSizeInt               = -1;   /*The size of this button.*/
    int     buttonXInt                  = -1;   /*The x position of this button.*/
    int     buttonYInt                  = -1;   /*The y position of this button.*/
    PShape  buttonOpenCloseObject       = null; /*The main shape for this button.*/

    /*This object constructor, the only argument is this button size.*/
    ButtonOpenClose                     (int _buttonSizeInt){

        buttonSizeInt                   = _buttonSizeInt;
        int originXInt                  = -(buttonSizeInt/2);       /*This button origin point is adjusted by substracting a half of button size.*/
        int originYInt                  = -(buttonSizeInt/2);       /*This button origin point is adjusted by substracting a half of button size.*/

        fill                            (255);
        stroke                          (0);
        shapeMode                       (CENTER);                   /*Set this button origin point mode as center.*/

        buttonOpenCloseObject           = createShape(GROUP);       /*Create a shape type GROUP, which is an accumulation of other shapes.*/
        
        /*Create the sub shape components.
        The components are the main circle shape and two lines that formed a plus.*/
        buttonOpenCloseCircleObject     = createShape(

            ELLIPSE, 
            originXInt, 
            originYInt, 
            buttonSizeInt, 
            buttonSizeInt

        );
        buttonOpenCloseCross1Object     = createShape(

            LINE, 
            (originXInt + (buttonSizeInt/2)),
            (originYInt + (buttonSizeInt/4)),
            (originXInt + (buttonSizeInt/2)),
            (originYInt + (buttonSizeInt/4)) + (buttonSizeInt/2)
             
        );
        buttonOpenCloseCross2Object     = createShape(

            LINE, 
            (originXInt + (buttonSizeInt/4)),
            (originYInt + (buttonSizeInt/2)),
            (originXInt + (buttonSizeInt/4)) + (buttonSizeInt/2), 
            (originYInt + (buttonSizeInt/2))

        );

        /*Add the three components into the main shape.
        After this is done you can just the main shape as the whole shape,
            and you do not need to set the properties of each shapes one
            by one.*/
        buttonOpenCloseObject.addChild  (buttonOpenCloseCircleObject);
        buttonOpenCloseObject.addChild  (buttonOpenCloseCross1Object);
        buttonOpenCloseObject.addChild  (buttonOpenCloseCross2Object);

        noFill                          ();
        noStroke                        ();
        shapeMode                       (CORNER);                   /*Set this button origin point mode as center.*/

    }

    /*A function to draw the combined shape.*/
    public void DrawVoid                               (int _buttonXInt, int _buttonYInt){

        fill                                    (255);
        stroke                                  (0);
        shapeMode                               (CENTER);                                                   /*Set this button origin point mode as center.*/

        if(isFunctionTriggerBoolean == true)    { isFunctionTriggerBoolean = false; }

        buttonXInt                              = _buttonXInt + (buttonSizeInt/2);                          /*Determine the position of this button axis with additional (buttonSizeInt/2) to fix the position resulted from shapeMode(CENTER).*/
        buttonYInt                              = _buttonYInt + (buttonSizeInt/2);                          /*Determine the position of this button axis with additional (buttonSizeInt/2) to fix the position resulted from shapeMode(CENTER).*/
        shape                                   (buttonOpenCloseObject, buttonXInt, buttonYInt);            /*Draw the main shape with additional last two parameters are the position on screen.*/

        if(isAnimatingBoolean == true)                 {

            if      (isButtonOpenBoolean        == true)  { buttonOpenCloseObject.rotate(-radians(1));  }   /*This button animation based on the current state of this button.*/
            else if (isButtonOpenBoolean        == false) { buttonOpenCloseObject.rotate( radians(1));  }   /*This button animation based on the current state of this button.*/

            buttonRotationCounterInt            ++;                                                         /*The animation is 45 degrees rotation clock wise or anti - clock wise depending on button state.*/

            /*If the animation is finished.*/
            if(buttonRotationCounterInt         >= 45){

                buttonRotationCounterInt        =  0;                                                       /*Reset the animation counter, so that next time the counter start counting from 0 degree.*/
                if      (isButtonOpenBoolean    == true)  { isButtonOpenBoolean = false; }                  /*Change button state, if button is open then change the state to close.*/
                else if (isButtonOpenBoolean    == false) { isButtonOpenBoolean = true;  }                  /*Change button state, if button is close then change the state to open.*/
                isAnimatingBoolean              =  false;                                                   /*The animation trigger boolean.*/
                isFunctionTriggerBoolean        =  true;                                                    /*The function trigger boolean. The function will only happened one tick after state change.*/

            }

        }

        fill                                    (255);
        stroke                                  (0);
        shapeMode                               (CORNER);                   /*Set this button origin point mode as center.*/

    }

    /*A function that will return boolean whether or not mouse pointer is above
        this button or not.*/
    public boolean MouseOverBoolean            (){

        /*Local variable to hold the boolean value.
        This variable will return true if the mouse pointer is above this button.
        Will return false if the mouse pointer is everywhere else but above the mouse pointer.*/
        boolean hoverBoolean            = false;

        if(

            /*Setting up boundaries of which this button is belong.*/
            mouseX > (buttonXInt - (buttonSizeInt/2) - (buttonSizeInt/2)) &&
            mouseX < (buttonXInt - (buttonSizeInt/2) + (buttonSizeInt/2)) &&
            mouseY > (buttonYInt - (buttonSizeInt/2) - (buttonSizeInt/2)) &&
            mouseY < (buttonYInt - (buttonSizeInt/2) + (buttonSizeInt/2))

        ){ hoverBoolean                 = true; }

        /*Return the boolean.*/
        return  hoverBoolean;

    } 

};









class EditMuseumGroupGUIObject extends GroupGUIObject{

    ControlP5       editMuseumGroupControlP5Object              ;
    Group           editMuseumGroupObject                       ;
    Button          editMuseumGroupResetAllMuseumButtonObject   ;

    EditMuseumGroupGUIObject(

        int             _guiXInt        ,
        int             _guiYInt        ,
        int             _guiWidthInt    ,
        int             _guiHeightInt   ,
        PApplet         _pAppletObject

    ){

        super                                   (_guiXInt, _guiYInt, _guiWidthInt, _guiHeightInt, _pAppletObject);
        editMuseumGroupControlP5Object    = new ControlP5(pAppletObject);



        editMuseumGroupObject                                       =
            editMuseumGroupControlP5Object  
                .addGroup                                           ("EditMuseumObjectGroupObject")
                .close                                              ()
                .setBackgroundColor                                 (groupBackgroundColor)
                .setBackgroundHeight                                (guiHeightInt)
                .setColor                                           (defaultCColor)
                .setColorBackground                                 (groupColorBackgroundColor)
                .setColorLabel                                      (groupColorLabelColor)
                .setLabel                                           ("EDIT MUSEUM OBJECT:")
                .setPosition                                        (guiXInt, guiYInt)
                .setWidth                                           (guiWidthInt);



        editMuseumGroupResetAllMuseumButtonObject                   =
            editMuseumGroupControlP5Object
                .addButton                                          ("EditMuseumGroupResetAllMuseumButtonObject")
                .setColor                                           (defaultCColor)
                .setGroup                                           (editMuseumGroupObject)
                .setLabel                                           ("RESET ALL MUSEUM OBJECT")
                .setPosition                                        (guiElement1ColumnFirstColumnXInt, guiLayoutOffsetInt)
                .setSize                                            (guiElement1ColumnWidth, guiLayoutOffsetInt);



    }

    public void DrawVoid(float   _alphaFloat){

        super.DrawVoid(_alphaFloat, editMuseumGroupObject);

    }

}



class EditPlayerGroupGUIObject extends GroupGUIObject{

    ControlP5       editPlayerGroupControlP5Object                              ;                           /*ControlP5 object to control all graphical user interface controller.                              */

    ObjectPlayer    tempSelectedPlayerObject                                    ;                           /*Selected player object.*/
    int             tempSelectedPlayerMovementModeInt                           = 2;                        /*Movement mode of selected player object.                                                          */
    String          tempSelectedPlayerExplanationString                         = "";
    String          tempSelectedPlayerSentenceString                            = "";                       /*Temporary variable that contains selected player object sentence                           String.*/
    String          tempSelectedPlayerFinishedString                            = "";                       /*Temporary variable that contains selected player object finished                           String.*/
    List<String>    tempSelectedPlayerExhibitionTargetNameFullStringList        = new ArrayList<String>();  /*Temporary variable that contains selected player object target   exhibition list full name String.*/
    List<String>    tempSelectedPlayerExhibitionVisitedNameFullStringList       = new ArrayList<String>();  /*Temporary variable that contains selected player object visited  exhibition list full name String.*/
    List<String>    tempSelectedPlayerTagNameFullStringList                     = new ArrayList<String>();  /*Temporary variable that contains selected player object tag                 list full name String.*/

    /*ControlP5 related graphical user interface controller variables.*/
    Group           editPlayerGroupObject                                       ;
    Textlabel       editPlayerGroupPlayerIndexTextlabelObject                   ;
    Textlabel       editPlayerGroupPlayerIndexValueTextlabelObject              ;
    Textfield       editPlayerGroupPlayerNameTextfieldObject                    ;
    Button          editPlayerGroupPlayerNameChangeButtonObject                 ;
    Textlabel       editPlayerGroupPlayerFinishedTextlabelObject                ;
    Textlabel       editPlayerGroupPlayerFinishedValueTextlabelObject           ;
    Textlabel       editPlayerGroupPlayerScoreTextlabelObject                   ;
    Textlabel       editPlayerGroupPlayerScoreValueTextlabelObject              ;
    Textlabel       editPlayerGroupPlayerExhibitionCurrentTextlabelObject       ;
    Textlabel       editPlayerGroupPlayerExhibitionCurrentValueTextlabelObject  ;
    ScrollableList  editPlayerGroupPlayerExhibitionTargetScrollableListObject   ;
    ScrollableList  editPlayerGroupPlayerExhibitionVisitedScrollableListObject  ;
    Textlabel       editPlayerGroupPlayerSentenceTextlabelObject                ;
    Textarea        editPlayerGroupPlayerSentenceValueTextareaObject            ;
    Textlabel       editPlayerGroupPlayerExplanationTextlabelObject             ;
    Textarea        editPlayerGroupPlayerExplanationValueTextareaObject         ;
    ScrollableList  editPlayerGroupPlayerTagScrollableListObject                ;
    Textlabel       editPlayerGroupPlayerModeTextlabelObject                    ;
    RadioButton     editPlayerGroupPlayerModeValueRadioButtonObject             ;
    ScrollableList  editPlayerGroupPlayerExhibitionNextScrollableListObject     ;
    Button          editPlayerGroupSetAllModeSoftwareAutoButtonObject           ;
    Button          editPlayerGroupSetAllModeSoftwareManualButtonObject         ;
    Button          editPlayerGroupPlayerResetAllButtonObject                   ;
    Button          editPlayerGroupPlayerResetButtonObject                      ;
    Button          editPlayerGroupPlayerGeneratePatternButtonObject            ;

    EditPlayerGroupGUIObject                                        (

        int             _guiXInt                            ,
        int             _guiYInt                            ,
        int             _guiWidthInt                        ,
        int             _guiHeightInt                       ,
        PApplet         _pAppletObject

    ){

        super                                                   (_guiXInt, _guiYInt, _guiWidthInt, _guiHeightInt, _pAppletObject);
        editPlayerGroupControlP5Object                          = new ControlP5(pAppletObject);                                                                         /*PENDING.*/

        tempSelectedPlayerObject                                =  playerObjectList     .get(0);                                                                        /*Set the default player object.                                            */
        tempSelectedPlayerFinishedString                        = (tempSelectedPlayerObject .playerFinishedBoolean == true) ? "True" : "False";                         /*Convert boolean value into String type data with sentence case.           */
        for(int i = 0; i < tempSelectedPlayerObject.explanationStringList.size(); i ++){                                                                                /*Put all selected player sentences into one paragraph of a String variable.*/

            if(i == 0)  { tempSelectedPlayerExplanationString   =                                                tempSelectedPlayerObject.explanationStringList.get(i); }
            else        { tempSelectedPlayerExplanationString   = tempSelectedPlayerExplanationString + "\n\n" + tempSelectedPlayerObject.explanationStringList.get(i); }

        }
        for(int i = 0; i < tempSelectedPlayerObject.sentenceStringList.size(); i ++){                                                                                   /*Put all selected player sentences into one paragraph of a String variable.*/

            if(i == 0)  { tempSelectedPlayerSentenceString      =                                             tempSelectedPlayerObject.sentenceStringList.get(i); }
            else        { tempSelectedPlayerSentenceString      = tempSelectedPlayerSentenceString + "\n\n" + tempSelectedPlayerObject.sentenceStringList.get(i); }

        }


        editPlayerGroupObject                                       =
            editPlayerGroupControlP5Object
                .addGroup                                           ("EditPlayerGroupObject")
                .close                                              ()
                .setBackgroundColor                                 (groupBackgroundColor)
                .setBackgroundHeight                                (guiHeightInt)
                .setColor                                           (defaultCColor)
                .setColorBackground                                 (groupColorBackgroundColor)
                .setColorLabel                                      (groupColorLabelColor)
                .setLabel                                           ("EDIT VISITOR:")
                .setPosition                                        (guiXInt, guiYInt)
                .setWidth                                           (guiWidthInt);



        editPlayerGroupPlayerIndexTextlabelObject                   =
            editPlayerGroupControlP5Object
                .addTextlabel                                       ("EditPlayerGroupPlayerIndexTextlabelObject")
                .setColor                                           (defaultCColor)
                .setColorValue                                      (255)
                .setGroup                                           (editPlayerGroupObject)
                .setPosition                                        (guiElement2ColumnFirstColumnXInt, guiLayoutOffsetInt)
                .setText                                            ("VISITOR INDEX:");



        editPlayerGroupPlayerIndexValueTextlabelObject              =   
            editPlayerGroupControlP5Object
                .addTextlabel                                       ("EditPlayerGroupPlayerIndexValueTextlabelObject")
                .setColor                                           (defaultCColor)
                .setColorValue                                      (255)
                .setGroup                                           (editPlayerGroupObject)
                .setPosition                                        (guiElement2ColumnSecondColumnXInt, guiLayoutOffsetInt)
                .setText                                            ("" + tempSelectedPlayerObject.playerIndexInt);



        editPlayerGroupPlayerNameTextfieldObject                    =
            editPlayerGroupControlP5Object
                .addTextfield                                       ("EditPlayerGroupPlayerNameTextfieldObject")
                .setColor                                           (defaultCColor)
                .setGroup                                           (editPlayerGroupObject)
                .setLabel                                           ("VISITOR NAME:")
                .setPosition                                        (guiElement2ColumnFirstColumnXInt, (guiLayoutOffsetInt*3))
                .setSize                                            (guiElement2ColumnWidth,  guiElement2LineHeight)
                .setText                                            (tempSelectedPlayerObject.playerNameString);



        editPlayerGroupPlayerNameChangeButtonObject                 =
            editPlayerGroupControlP5Object
                .addButton                                          ("EditPlayerGroupPlayerNameChangeButtonObject")
                .setColor                                           (defaultCColor)
                .setGroup                                           (editPlayerGroupObject)
                .setLabel                                           ("CHANGE VISITOR NAME")
                .setPosition                                        (guiElement2ColumnSecondColumnXInt, (guiLayoutOffsetInt*3))
                .setSize                                            (guiElement2ColumnWidth,  guiElement2LineHeight);



        editPlayerGroupPlayerFinishedTextlabelObject                =   
            editPlayerGroupControlP5Object
                .addTextlabel                                       ("EditPlayerGroupPlayerFinishedTextlabelObject")
                .setColor                                           (defaultCColor)
                .setColorValue                                      (255)
                .setGroup                                           (editPlayerGroupObject)
                .setPosition                                        (guiElement2ColumnFirstColumnXInt, (guiLayoutOffsetInt*7))
                .setText                                            ("VISITOR FINISHED:");



        editPlayerGroupPlayerFinishedValueTextlabelObject           =
                editPlayerGroupControlP5Object
                    .addTextlabel                                   ("EditPlayerGroupPlayerFinishedValueTextlabelObject")
                    .setColor                                       (defaultCColor)
                    .setColorValue                                  (255)
                    .setGroup                                       (editPlayerGroupObject)
                    .setPosition                                    (guiElement2ColumnSecondColumnXInt, (guiLayoutOffsetInt*7))
                    .setText                                        (tempSelectedPlayerFinishedString);



        editPlayerGroupPlayerScoreTextlabelObject                   =
            editPlayerGroupControlP5Object
                .addTextlabel                                       ("EditPlayerGroupPlayerScoreTextlabelObject")
                .setColor                                           (defaultCColor)
                .setColorValue                                      (255)
                .setGroup                                           (editPlayerGroupObject)
                .setPosition                                        (guiElement2ColumnFirstColumnXInt, (guiLayoutOffsetInt*8))
                .setText                                            ("VISITOR SCORE:");



        editPlayerGroupPlayerScoreValueTextlabelObject              =
            editPlayerGroupControlP5Object
                .addTextlabel                                       ("EditPlayerGroupPlayerScoreValueTextlabelObject")
                .setColor                                           (defaultCColor)
                .setColorValue                                      (255)
                .setGroup                                           (editPlayerGroupObject)
                .setPosition                                        (guiElement2ColumnSecondColumnXInt, (guiLayoutOffsetInt*8))
                .setText                                            ("" + tempSelectedPlayerObject.playerScoreInt);



        editPlayerGroupPlayerExhibitionCurrentTextlabelObject       =
            editPlayerGroupControlP5Object
                .addTextlabel                                       ("EditPlayerGroupPlayerExhibitionCurrentTextlabelObject")
                .setColor                                           (defaultCColor)
                .setColorValue                                      (255)
                .setGroup                                           (editPlayerGroupObject)
                .setPosition                                        (guiElement2ColumnFirstColumnXInt, (guiLayoutOffsetInt*9))
                .setText                                            ("VISITOR CURRENT EXHIBITION:");



        editPlayerGroupPlayerExhibitionCurrentValueTextlabelObject  =
            editPlayerGroupControlP5Object
                .addTextlabel                                       ("EditPlayerGroupPlayerExhibitionCurrentValueTextlabelObject")
                .setColor                                           (defaultCColor)
                .setColorValue                                      (255)
                .setGroup                                           (editPlayerGroupObject)
                .setPosition                                        (guiElement2ColumnSecondColumnXInt, (guiLayoutOffsetInt*9))
                .setText                                            ("" + tempSelectedPlayerObject.exhibitionCurrentNameFullString);



        editPlayerGroupPlayerExhibitionTargetScrollableListObject   =
            editPlayerGroupControlP5Object
                .addScrollableList                                  ("EditPlayerGroupPlayerExhibitionTargetScrollableListObject")
                .addItems                                           (tempSelectedPlayerObject.exhibitionTargetNameFullStringList)
                .setColor                                           (staticScrollableListCColor)
                .setGroup                                           (editPlayerGroupObject)
                .setLabel                                           ("VISITOR TARGET EXHIBITIONS:")
                .setPosition                                        (guiElement2ColumnFirstColumnXInt,  (guiLayoutOffsetInt*11))
                .setSize                                            (guiElement2ColumnWidth, guiScrollableList4RowHeightInt)
                .setType                                            (ControlP5.LIST);



        editPlayerGroupPlayerExhibitionVisitedScrollableListObject  =
            editPlayerGroupControlP5Object
                .addScrollableList                                  ("EditPlayerGroupPlayerExhibitionVisitedScrollableListObject")
                .addItems                                           (tempSelectedPlayerObject.exhibitionVisitedNameFullStringList)
                .setColor                                           (staticScrollableListCColor)
                .setGroup                                           (editPlayerGroupObject)
                .setLabel                                           ("VISITOR VISITED EXHIBITIONS:")
                .setPosition                                        (guiElement2ColumnSecondColumnXInt,  (guiLayoutOffsetInt*11))
                .setSize                                            (guiElement2ColumnWidth, guiScrollableList5RowHeightInt)
                .setType                                            (ControlP5.LIST);



        editPlayerGroupPlayerSentenceTextlabelObject                =
            editPlayerGroupControlP5Object
                .addTextlabel                                       ("EditPlayerGroupPlayerSentenceTextlabelObject")
                .setColor                                           (defaultCColor)
                .setColorValue                                      (255)
                .setGroup                                           (editPlayerGroupObject)
                .setPosition                                        (guiElement2ColumnFirstColumnXInt,  ((guiLayoutOffsetInt*12) + guiScrollableList5RowHeightInt))
                .setText                                            ("VISITOR SENTENCES:");



        editPlayerGroupPlayerSentenceValueTextareaObject            =
            editPlayerGroupControlP5Object
                .addTextarea                                        ("editPlayerGroupPlayerSentenceValueTextareaObject")
                .setColor                                           (defaultCColor)
                .setGroup                                           (editPlayerGroupObject)
                .setPosition                                        (guiElement2ColumnFirstColumnXInt,  ((guiLayoutOffsetInt*13) + guiScrollableList5RowHeightInt))
                .setSize                                            (guiElement2ColumnWidth, guiScrollableList5RowHeightInt)
                .setText                                            (tempSelectedPlayerSentenceString);

        

        editPlayerGroupPlayerExplanationTextlabelObject             =
            editPlayerGroupControlP5Object
                .addTextlabel                                       ("EditPlayerGroupPlayerExplanationTextlabelObject")
                .setColor                                           (defaultCColor)
                .setColorValue                                      (255)
                .setGroup                                           (editPlayerGroupObject)
                .setPosition                                        (guiElement2ColumnSecondColumnXInt,  ((guiLayoutOffsetInt*12) + guiScrollableList5RowHeightInt))
                .setText                                            ("VISITOR EXPLANATIONS:");



        editPlayerGroupPlayerExplanationValueTextareaObject         =
            editPlayerGroupControlP5Object
                .addTextarea                                        ("EditPlayerGroupPlayerExaplanationValueTextareaObject")
                .setColor                                           (defaultCColor)
                .setGroup                                           (editPlayerGroupObject)
                .setPosition                                        (guiElement2ColumnSecondColumnXInt,  ((guiLayoutOffsetInt*13) + guiScrollableList5RowHeightInt))
                .setSize                                            (guiElement2ColumnWidth , guiScrollableList5RowHeightInt)
                .setText                                            (tempSelectedPlayerExplanationString);



        editPlayerGroupPlayerTagScrollableListObject                =
            editPlayerGroupControlP5Object
                .addScrollableList                                  ("EditPlayerGroupPlayerTagScrollableListObject")
                .addItems                                           (tempSelectedPlayerObject.exhibitionTagCounterNameFullStringList)
                .setColor                                           (staticScrollableListCColor)
                .setGroup                                           (editPlayerGroupObject)
                .setLabel                                           ("VISITOR COLLECTED TAGS:")
                .setPosition                                        (guiElement2ColumnFirstColumnXInt,  ((guiLayoutOffsetInt*14) + (guiScrollableList5RowHeightInt*2)))
                .setSize                                            (guiElement1ColumnWidth , guiScrollableList5RowHeightInt)
                .setType                                            (ControlP5.LIST);



        editPlayerGroupPlayerModeTextlabelObject                    =
            editPlayerGroupControlP5Object
                .addTextlabel                                       ("EditPlayerGroupPlayerModeTextlabelObject")
                .setColor                                           (defaultCColor)
                .setColorValue                                      (255)
                .setGroup                                           (editPlayerGroupObject)
                .setPosition                                        (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*15) + (guiScrollableList5RowHeightInt*3)))
                .setText                                            ("MODES:");



        editPlayerGroupPlayerModeValueRadioButtonObject             =
            editPlayerGroupControlP5Object
                .addRadioButton                                     ("EditPlayerGroupPlayerModeValueRadioButtonObject")
                .activate                                           (1)
                .addItem                                            ("SOFTWARE - AUTO"  , 1)
                .addItem                                            ("SOFTWARE - MANUAL", 2)
                .addItem                                            ("HARDWARE - MANUAL", 3)
                .setGroup                                           (editPlayerGroupObject)
                .setNoneSelectedAllowed                             (true)
                .setPosition                                        (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*16) + (guiScrollableList5RowHeightInt*3)))
                .setSize                                            (guiLayoutOffsetInt, guiLayoutOffsetInt);



        editPlayerGroupPlayerExhibitionNextScrollableListObject     =
            editPlayerGroupControlP5Object
                .addScrollableList                                  ("EditPlayerGroupPlayerExhibitionNextScrollableListObject")
                .addItems                                           (exhibitionNameFullStringList)
                .setColor                                           (defaultCColor)
                .setGroup                                           (editPlayerGroupObject)
                .setLabel                                           ("SELECT VISITOR NEXT EXHIBITION:")
                .setPosition                                        (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*15) + (guiScrollableList5RowHeightInt*3)))
                .setSize                                            (guiElement2ColumnWidth , 64)
                .setType                                            (ControlP5.LIST);



        editPlayerGroupSetAllModeSoftwareAutoButtonObject           =
            editPlayerGroupControlP5Object
                .addButton                                          ("EditPlayerGroupSetAllModeSoftwareAutoButtonObject")
                .setColor                                           (defaultCColor)
                .setGroup                                           (editPlayerGroupObject)
                .setLabel                                           ("SET ALL VISITOR SOFTWARE AUTO")
                .setPosition                                        (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*16) + (guiScrollableList5RowHeightInt*4)))
                .setSize                                            (guiElement2ColumnWidth, guiLayoutOffsetInt);



        editPlayerGroupSetAllModeSoftwareManualButtonObject         =
            editPlayerGroupControlP5Object
                .addButton                                          ("EditPlayerGroupSetAllModeSoftwareManualButtonObject")
                .setColor                                           (defaultCColor)
                .setGroup                                           (editPlayerGroupObject)
                .setLabel                                           ("SET ALL VISITOR SOFTWARE MANUAL")
                .setPosition                                        (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*16) + (guiScrollableList5RowHeightInt*4)))
                .setSize                                            (guiElement2ColumnWidth, guiLayoutOffsetInt);



        editPlayerGroupPlayerResetAllButtonObject                   =
            editPlayerGroupControlP5Object
                .addButton                                          ("EditPlayerGroupPlayerResetAllButtonObject")
                .setColor                                           (defaultCColor)
                .setGroup                                           (editPlayerGroupObject)
                .setLabel                                           ("RESET ALL VISITOR")
                .setPosition                                        (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*17) + (guiScrollableList5RowHeightInt*4)))
                .setSize                                            (guiElement2ColumnWidth, guiLayoutOffsetInt);



        editPlayerGroupPlayerResetButtonObject                      =
            editPlayerGroupControlP5Object
                .addButton                                          ("EditPlayerGroupPlayerResetButtonObject")
                .setColor                                           (defaultCColor)
                .setGroup                                           (editPlayerGroupObject)
                .setLabel                                           ("RESET VISITOR")
                .setPosition                                        (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*17) + (guiScrollableList5RowHeightInt*4)))
                .setSize                                            (guiElement2ColumnWidth, guiLayoutOffsetInt);



        editPlayerGroupPlayerGeneratePatternButtonObject            =
            editPlayerGroupControlP5Object
                .addButton                                          ("EditPlayerGroupPlayerGeneratePatternButtonObject")
                .setColor                                           (defaultCColor)
                .setGroup                                           (editPlayerGroupObject)
                .setLabel                                           ("GENERATE PATTERN")
                .setPosition                                        (guiElement1ColumnFirstColumnXInt, ((guiLayoutOffsetInt*18) + (guiScrollableList5RowHeightInt*4)))
                .setSize                                            (guiElement1ColumnWidth, guiLayoutOffsetInt);



    }

    public void DrawVoid                                                   (float   _alphaFloat){

        super.DrawVoid(_alphaFloat, editPlayerGroupObject);

        /*Always assign values to the controllers.*/
        if(tempSelectedPlayerObject                                 != null ){

            tempSelectedPlayerFinishedString                        = (tempSelectedPlayerObject .playerFinishedBoolean == true) ? "True" : "False";     /*Convert boolean value into String type data with sentence case.           */
            if(tempSelectedPlayerObject.explanationStringList.size() <= 0)  { tempSelectedPlayerExplanationString = ""; }
            for(int i = 0; i < tempSelectedPlayerObject.explanationStringList.size(); i ++){                                                                                /*Put all selected player sentences into one paragraph of a String variable.*/

                if(i == 0)  { tempSelectedPlayerExplanationString   =                                                tempSelectedPlayerObject.explanationStringList.get(i); }
                else        { tempSelectedPlayerExplanationString   = tempSelectedPlayerExplanationString + "\n\n" + tempSelectedPlayerObject.explanationStringList.get(i); }

            }
            if(tempSelectedPlayerObject.sentenceStringList.size() <= 0)     { tempSelectedPlayerSentenceString = ""; }
            for(int i = 0; i < tempSelectedPlayerObject.sentenceStringList.size(); i ++){                                                                                   /*Put all selected player sentences into one paragraph of a String variable.*/

                if(i == 0)  { tempSelectedPlayerSentenceString      =                                             tempSelectedPlayerObject.sentenceStringList.get(i); }
                else        { tempSelectedPlayerSentenceString      = tempSelectedPlayerSentenceString + "\n\n" + tempSelectedPlayerObject.sentenceStringList.get(i); }

            }

            editPlayerGroupPlayerIndexValueTextlabelObject              .setText (("" + tempSelectedPlayerObject.playerIndexInt                         ));
            //editPlayerGroupPlayerNameTextfieldObject                  .setText ((     tempSelectedPlayerObject.playerNameString                       ));
            editPlayerGroupPlayerFinishedValueTextlabelObject           .setText ((     tempSelectedPlayerFinishedString                                ));
            editPlayerGroupPlayerScoreValueTextlabelObject              .setText (("" + tempSelectedPlayerObject.playerScoreInt                         ));
            editPlayerGroupPlayerExhibitionCurrentValueTextlabelObject  .setText ((     tempSelectedPlayerObject.exhibitionCurrentNameFullString        ));
            editPlayerGroupPlayerExhibitionTargetScrollableListObject   .setItems((     tempSelectedPlayerObject.exhibitionTargetNameFullStringList     ));
            editPlayerGroupPlayerExhibitionVisitedScrollableListObject  .setItems((     tempSelectedPlayerObject.exhibitionVisitedNameFullStringList    ));
            editPlayerGroupPlayerTagScrollableListObject                .setItems((     tempSelectedPlayerObject.exhibitionTagCounterNameFullStringList ));
            editPlayerGroupPlayerSentenceValueTextareaObject            .setText ((     tempSelectedPlayerSentenceString                                ));
            editPlayerGroupPlayerExplanationValueTextareaObject         .setText ((     tempSelectedPlayerExplanationString                             ));
            editPlayerGroupPlayerExhibitionNextScrollableListObject     .setItems((     exhibitionNameFullStringList                                    ));
            editPlayerGroupPlayerModeValueRadioButtonObject             .activate((     (tempSelectedPlayerObject.playerMovementModeInt - 1)            ));

        }

        /*Hide the unecessary controller, for example when movement player mode int is not 2 (software, manual control) then
            we do not need to show scrollable list that show next exhibition to be choose.*/
        if      (tempSelectedPlayerMovementModeInt == 1){ editPlayerGroupPlayerExhibitionNextScrollableListObject.hide(); }
        else if (tempSelectedPlayerMovementModeInt == 2){ editPlayerGroupPlayerExhibitionNextScrollableListObject.show(); }
        else if (tempSelectedPlayerMovementModeInt == 3){ editPlayerGroupPlayerExhibitionNextScrollableListObject.hide(); }
        else                                            { editPlayerGroupPlayerExhibitionNextScrollableListObject.hide(); }

        editPlayerGroupPlayerNameTextfieldObject                .setColorValue(groupColorLabelColor);
        editPlayerGroupPlayerSentenceValueTextareaObject        .setColorValue(groupColorLabelColor);
        editPlayerGroupPlayerExplanationValueTextareaObject     .setColorValue(groupColorLabelColor);

    }

}



class EditTagGroupGUIObject extends GroupGUIObject{

    ControlP5       editTagGroupControlP5Object                                 ;

    String          tempSelectedTagTypeNameAltString                            = "";
    String          tempSelectedTagNameAltString                                = "";
    String          tempSelectedTagNameFullString                               = "";
    String          tempSelectedTagSubjectString                                = "";
    String          tempSelectedTagSubjectPossesionString                       = "";
    String          tempSelectedTagIntransitiveVerb1String                      = "";
    String          tempSelectedTagIntransitiveVerb2String                      = "";
    String          tempSelectedTagIntransitiveVerb3String                      = "";
    String          tempSelectedTagIntransitiveVerbIngString                    = "";
    String          tempSelectedTagIntransitiveVerbSString                      = "";
    String          tempSelectedTagNegativeIntransitiveVerb1String              = "";
    String          tempSelectedTagNegativeIntransitiveVerb2String              = "";
    String          tempSelectedTagNegativeIntransitiveVerb3String              = "";
    String          tempSelectedTagNegativeIntransitiveVerbIngString            = "";
    String          tempSelectedTagNegativeIntransitiveVerbSString              = "";
    String          tempSelectedTagTransitiveVerb1String                        = "";
    String          tempSelectedTagTransitiveVerb2String                        = "";
    String          tempSelectedTagTransitiveVerb3String                        = "";
    String          tempSelectedTagTransitiveVerbIngString                      = "";
    String          tempSelectedTagTransitiveVerbSString                        = "";
    String          tempSelectedTagNegativeTransitiveVerb1String                = "";
    String          tempSelectedTagNegativeTransitiveVerb2String                = "";
    String          tempSelectedTagNegativeTransitiveVerb3String                = "";
    String          tempSelectedTagNegativeTransitiveVerbIngString              = "";
    String          tempSelectedTagNegativeTransitiveVerbSString                = "";
    String          tempSelectedTagNounAbstractString                           = "";
    String          tempSelectedTagNounAbstractSString                          = "";
    String          tempSelectedTagNounString                                   = "";
    String          tempSelectedTagNounSString                                  = "";
    String          tempSelectedTagAdjectiveString                              = "";
    String          tempSelectedTagNegativeAdjectiveString                      = "";
    String          tempSelectedTagAdverbString                                 = "";
    String          tempSelectedTagNegativeAdverbString                         = "";
    Tag             tempSelectedTagObject                                       = null;
    List<String>    tempTagNameFullStringList                                   = new ArrayList<String>();

    Group           editTagGroupObject                                          ;
    ScrollableList  editTagGroupSelectTagScrollableListObject                   ;
    Textfield       editTagGroupTagNameAltTextfieldObject                       ;
    Textfield       editTagGroupTagNameFullTextfieldObject                      ;
    Textfield       editTagGroupTagSubjectTextfieldObject                       ;
    Textfield       editTagGroupTagSubjectPossesionTextfieldObject              ;
    Textfield       editTagGroupTagIntransitiveVerb1TextfieldObject             ;
    Textfield       editTagGroupTagIntransitiveVerb2TextfieldObject             ;
    Textfield       editTagGroupTagIntransitiveVerb3TextfieldObject             ;
    Textfield       editTagGroupTagIntransitiveVerbIngTextfieldObject           ;
    Textfield       editTagGroupTagIntransitiveVerbSTextfieldObject             ;
    Textfield       editTagGroupTagNegativeIntransitiveVerb1TextfieldObject     ;
    Textfield       editTagGroupTagNegativeIntransitiveVerb2TextfieldObject     ;
    Textfield       editTagGroupTagNegativeIntransitiveVerb3TextfieldObject     ;
    Textfield       editTagGroupTagNegativeIntransitiveVerbIngTextfieldObject   ;
    Textfield       editTagGroupTagNegativeIntransitiveVerbSTextfieldObject     ;
    Textfield       editTagGroupTagTransitiveVerb1TextfieldObject               ;
    Textfield       editTagGroupTagTransitiveVerb2TextfieldObject               ;
    Textfield       editTagGroupTagTransitiveVerb3TextfieldObject               ;
    Textfield       editTagGroupTagTransitiveVerbIngTextfieldObject             ;
    Textfield       editTagGroupTagTransitiveVerbSTextfieldObject               ;
    Textfield       editTagGroupTagNegativeTransitiveVerb1TextfieldObject       ;
    Textfield       editTagGroupTagNegativeTransitiveVerb2TextfieldObject       ;
    Textfield       editTagGroupTagNegativeTransitiveVerb3TextfieldObject       ;
    Textfield       editTagGroupTagNegativeTransitiveVerbIngTextfieldObject     ;
    Textfield       editTagGroupTagNegativeTransitiveVerbSTextfieldObject       ;
    Textfield       editTagGroupTagNounAbstractTextfieldObject                  ;
    Textfield       editTagGroupTagNounAbstractSTextfieldObject                 ;
    Textfield       editTagGroupTagNounTextfieldObject                          ;
    Textfield       editTagGroupTagNounSTextfieldObject                         ;
    Textfield       editTagGroupTagAdjectiveTextfieldObject                     ;
    Textfield       editTagGroupTagNegativeAdjectiveTextfieldObject             ;
    Textfield       editTagGroupTagAdverbTextfieldObject                        ;
    Textfield       editTagGroupTagNegativeAdverbTextfieldObject                ;
    Button          editTagGroupTagEditButtonObject                             ;

    EditTagGroupGUIObject(

        int             _guiXInt        ,
        int             _guiYInt        ,
        int             _guiWidthInt    ,
        int             _guiHeightInt   ,
        PApplet         _pAppletObject

    ){

        super                                   (_guiXInt, _guiYInt, _guiWidthInt, _guiHeightInt, _pAppletObject);
        editTagGroupControlP5Object             = new ControlP5(pAppletObject);

        GenerateAllTagNameFullVoid();



        editTagGroupObject                                          =
            editTagGroupControlP5Object     .addGroup               ("EditTagGroupObject")
                                            .close                  ()
                                            .setBackgroundColor     (groupBackgroundColor)
                                            .setBackgroundHeight    (guiHeightInt)
                                            .setColor               (defaultCColor)
                                            .setColorBackground     (groupColorBackgroundColor)
                                            .setColorLabel          (groupColorLabelColor)
                                            .setLabel               ("EDIT TAG:")
                                            .setPosition            (guiXInt, guiYInt)
                                            .setWidth               (guiWidthInt);



        editTagGroupSelectTagScrollableListObject                   =
            editTagGroupControlP5Object     .addScrollableList      ("EditTagGroupSelectTagScrollableListObject")
                                            .addItems               (tempTagNameFullStringList)
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("SELECT TAG:")
                                            .setPosition            (guiElement1ColumnFirstColumnXInt, guiLayoutOffsetInt)
                                            .setSize                (guiElement1ColumnWidth, guiScrollableList4RowHeightInt)
                                            .setType                (ControlP5.LIST);



        editTagGroupTagNameAltTextfieldObject                       =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagNameAltTextfieldObject")
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("TAG NAME FULL:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*2) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNameFullTextfieldObject                      =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagNameFullTextfieldObject")
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("TAG NAME ALT:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*2) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



         editTagGroupTagSubjectTextfieldObject                      =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagSubjectTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("SUBJECT:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagSubjectPossesionTextfieldObject              =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagSubjectPossesionTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("SUBJECT POSSESION:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagIntransitiveVerb1TextfieldObject             =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagIntransitiveVerb1TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("INTRANSITIVE VERB 1:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);


 
        editTagGroupTagIntransitiveVerb2TextfieldObject             =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagIntransitiveVerb2TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("INTRANSITIVE VERB 2:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagIntransitiveVerb3TextfieldObject             =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagIntransitiveVerb3TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("INTRANSITIVE VERB 3:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*10) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagIntransitiveVerbIngTextfieldObject           =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagIntransitiveVerbIngTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("INTRANSITIVE VERB + ING:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*10) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagIntransitiveVerbSTextfieldObject             =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagIntransitiveVerbSTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("INTRANSITIVE VERB + S:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*14) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNegativeIntransitiveVerb1TextfieldObject     =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagNegativeIntransitiveVerb1TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NEGATIVE INTRANSITIVE VERB 1:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNegativeIntransitiveVerb2TextfieldObject     =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagNegativeIntransitiveVerb2TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NEGATIVE INTRANSITIVE VERB 2:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNegativeIntransitiveVerb3TextfieldObject     =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagNegativeIntransitiveVerb3TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NEGATIVE INTRANSITIVE VERB 3:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*10) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNegativeIntransitiveVerbIngTextfieldObject   =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagNegativeIntransitiveVerbIngTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NEGATIVE INTRANSITIVE VERB + ING:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*10) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNegativeIntransitiveVerbSTextfieldObject     =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagNegativeIntransitiveVerbSTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NEGATIVE INTRANSITIVE VERB + S:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*14) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagTransitiveVerb1TextfieldObject               =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagTransitiveVerb1TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("TRANSITIVE VERB 1:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagTransitiveVerb2TextfieldObject               =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagTransitiveVerb2TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("TRANSITIVE VERB 2:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagTransitiveVerb3TextfieldObject               =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagTransitiveVerb3TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("TRANSITIVE VERB 3:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*10) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagTransitiveVerbIngTextfieldObject             =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagTransitiveVerbIngTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("TRANSITIVE VERB + ING:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*10) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagTransitiveVerbSTextfieldObject               =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagTransitiveVerbSTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("TRANSITIVE VERB + S:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*14) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNegativeTransitiveVerb1TextfieldObject       =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagNegativeTransitiveVerb1TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NEGATIVE TRANSITIVE VERB 1:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNegativeTransitiveVerb2TextfieldObject       =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagNegativeTransitiveVerb2TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NEGATIVE TRANSITIVE VERB 2:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNegativeTransitiveVerb3TextfieldObject       =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagNegativeTransitiveVerb3TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NEGATIVE TRANSITIVE VERB 3:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*10) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNegativeTransitiveVerbIngTextfieldObject     =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagNegativeTransitiveVerbIngTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NEGATIVE TRANSITIVE VERB + ING:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*10) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNegativeTransitiveVerbSTextfieldObject       =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagNegativeTransitiveVerbSTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NEGATIVE TRANSITIVE VERB + S:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*14) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNounAbstractTextfieldObject                  =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagNounAbstractTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NOUN ABSTRACT:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNounAbstractSTextfieldObject                 =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagNounAbstractSTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NOUN ABSTRACT + S:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNounTextfieldObject                          =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagNounTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NOUN:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNounSTextfieldObject                         =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagNounSTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NOUN + S:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagAdjectiveTextfieldObject                     =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagAdjectiveTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("ADJECTIVE:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNegativeAdjectiveTextfieldObject             =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagNegativeAdjectiveTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NEGATIVE ADJECTIVE:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagAdverbTextfieldObject                        =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagAdverbTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("ADVERB:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNegativeAdverbTextfieldObject                =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagNegativeAdverbTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NEGATIVE ADVERB:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);


        editTagGroupTagEditButtonObject                             =
            editTagGroupControlP5Object     .addButton              ("EditTagGroupTagEditButtonObject")
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("EDIT TAG")  
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*14) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



    }

    public void DrawVoid(float   _alphaFloat){

        super.DrawVoid(_alphaFloat, editTagGroupObject);

        ControlFormVoid();

        editTagGroupTagNameAltTextfieldObject                        .setColorValue(groupColorLabelColor);
        editTagGroupTagNameFullTextfieldObject                       .setColorValue(groupColorLabelColor);
        editTagGroupTagSubjectTextfieldObject                        .setColorValue(groupColorLabelColor);
        editTagGroupTagSubjectPossesionTextfieldObject               .setColorValue(groupColorLabelColor);
        editTagGroupTagIntransitiveVerb1TextfieldObject              .setColorValue(groupColorLabelColor);
        editTagGroupTagIntransitiveVerb2TextfieldObject              .setColorValue(groupColorLabelColor);
        editTagGroupTagIntransitiveVerb3TextfieldObject              .setColorValue(groupColorLabelColor);
        editTagGroupTagIntransitiveVerbIngTextfieldObject            .setColorValue(groupColorLabelColor);
        editTagGroupTagIntransitiveVerbSTextfieldObject              .setColorValue(groupColorLabelColor);
        editTagGroupTagNegativeIntransitiveVerb1TextfieldObject      .setColorValue(groupColorLabelColor);
        editTagGroupTagNegativeIntransitiveVerb2TextfieldObject      .setColorValue(groupColorLabelColor);
        editTagGroupTagNegativeIntransitiveVerb3TextfieldObject      .setColorValue(groupColorLabelColor);
        editTagGroupTagNegativeIntransitiveVerbIngTextfieldObject    .setColorValue(groupColorLabelColor);
        editTagGroupTagNegativeIntransitiveVerbSTextfieldObject      .setColorValue(groupColorLabelColor);
        editTagGroupTagTransitiveVerb1TextfieldObject                .setColorValue(groupColorLabelColor);
        editTagGroupTagTransitiveVerb2TextfieldObject                .setColorValue(groupColorLabelColor);
        editTagGroupTagTransitiveVerb3TextfieldObject                .setColorValue(groupColorLabelColor);
        editTagGroupTagTransitiveVerbIngTextfieldObject              .setColorValue(groupColorLabelColor);
        editTagGroupTagTransitiveVerbSTextfieldObject                .setColorValue(groupColorLabelColor);
        editTagGroupTagNegativeTransitiveVerb1TextfieldObject        .setColorValue(groupColorLabelColor);
        editTagGroupTagNegativeTransitiveVerb2TextfieldObject        .setColorValue(groupColorLabelColor);
        editTagGroupTagNegativeTransitiveVerb3TextfieldObject        .setColorValue(groupColorLabelColor);
        editTagGroupTagNegativeTransitiveVerbIngTextfieldObject      .setColorValue(groupColorLabelColor);
        editTagGroupTagNegativeTransitiveVerbSTextfieldObject        .setColorValue(groupColorLabelColor);
        editTagGroupTagNounAbstractTextfieldObject                   .setColorValue(groupColorLabelColor);
        editTagGroupTagNounAbstractSTextfieldObject                  .setColorValue(groupColorLabelColor);
        editTagGroupTagNounTextfieldObject                           .setColorValue(groupColorLabelColor);
        editTagGroupTagNounSTextfieldObject                          .setColorValue(groupColorLabelColor);
        editTagGroupTagAdjectiveTextfieldObject                      .setColorValue(groupColorLabelColor);
        editTagGroupTagNegativeAdjectiveTextfieldObject              .setColorValue(groupColorLabelColor);
        editTagGroupTagAdverbTextfieldObject                         .setColorValue(groupColorLabelColor);
        editTagGroupTagNegativeAdverbTextfieldObject                 .setColorValue(groupColorLabelColor);

    }

    /*Show the necessary text field according to the selected type tag.*/
    public void ControlFormVoid(){

        if(tempSelectedTagTypeNameAltString.equals("SUB")){

            editTagGroupTagSubjectTextfieldObject                        .show();
            editTagGroupTagSubjectPossesionTextfieldObject               .show();
            editTagGroupTagIntransitiveVerb1TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerb2TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerb3TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerbIngTextfieldObject            .hide();
            editTagGroupTagIntransitiveVerbSTextfieldObject              .hide();
            editTagGroupTagNegativeIntransitiveVerb1TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerb2TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerb3TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerbIngTextfieldObject    .hide();
            editTagGroupTagNegativeIntransitiveVerbSTextfieldObject      .hide();
            editTagGroupTagTransitiveVerb1TextfieldObject                .hide();
            editTagGroupTagTransitiveVerb2TextfieldObject                .hide();
            editTagGroupTagTransitiveVerb3TextfieldObject                .hide();
            editTagGroupTagTransitiveVerbIngTextfieldObject              .hide();
            editTagGroupTagTransitiveVerbSTextfieldObject                .hide();
            editTagGroupTagNegativeTransitiveVerb1TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerb2TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerb3TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerbIngTextfieldObject      .hide();
            editTagGroupTagNegativeTransitiveVerbSTextfieldObject        .hide();
            editTagGroupTagNounAbstractTextfieldObject                   .hide();
            editTagGroupTagNounAbstractSTextfieldObject                  .hide();
            editTagGroupTagNounTextfieldObject                           .hide();
            editTagGroupTagNounSTextfieldObject                          .hide();
            editTagGroupTagAdjectiveTextfieldObject                      .hide();
            editTagGroupTagNegativeAdjectiveTextfieldObject              .hide();
            editTagGroupTagAdverbTextfieldObject                         .hide();
            editTagGroupTagNegativeAdverbTextfieldObject                 .hide();

        }
        else if(tempSelectedTagTypeNameAltString.equals("IVR")){

            editTagGroupTagSubjectTextfieldObject                        .hide();
            editTagGroupTagSubjectPossesionTextfieldObject               .hide();
            editTagGroupTagIntransitiveVerb1TextfieldObject              .show();
            editTagGroupTagIntransitiveVerb2TextfieldObject              .show();
            editTagGroupTagIntransitiveVerb3TextfieldObject              .show();
            editTagGroupTagIntransitiveVerbIngTextfieldObject            .show();
            editTagGroupTagIntransitiveVerbSTextfieldObject              .show();
            editTagGroupTagNegativeIntransitiveVerb1TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerb2TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerb3TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerbIngTextfieldObject    .hide();
            editTagGroupTagNegativeIntransitiveVerbSTextfieldObject      .hide();
            editTagGroupTagTransitiveVerb1TextfieldObject                .hide();
            editTagGroupTagTransitiveVerb2TextfieldObject                .hide();
            editTagGroupTagTransitiveVerb3TextfieldObject                .hide();
            editTagGroupTagTransitiveVerbIngTextfieldObject              .hide();
            editTagGroupTagTransitiveVerbSTextfieldObject                .hide();
            editTagGroupTagNegativeTransitiveVerb1TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerb2TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerb3TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerbIngTextfieldObject      .hide();
            editTagGroupTagNegativeTransitiveVerbSTextfieldObject        .hide();
            editTagGroupTagNounAbstractTextfieldObject                   .hide();
            editTagGroupTagNounAbstractSTextfieldObject                  .hide();
            editTagGroupTagNounTextfieldObject                           .hide();
            editTagGroupTagNounSTextfieldObject                          .hide();
            editTagGroupTagAdjectiveTextfieldObject                      .hide();
            editTagGroupTagNegativeAdjectiveTextfieldObject              .hide();
            editTagGroupTagAdverbTextfieldObject                         .hide();
            editTagGroupTagNegativeAdverbTextfieldObject                 .hide();

        }
        else if(tempSelectedTagTypeNameAltString.equals("NIV")){

            editTagGroupTagSubjectTextfieldObject                        .hide();
            editTagGroupTagSubjectPossesionTextfieldObject               .hide();
            editTagGroupTagIntransitiveVerb1TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerb2TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerb3TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerbIngTextfieldObject            .hide();
            editTagGroupTagIntransitiveVerbSTextfieldObject              .hide();
            editTagGroupTagNegativeIntransitiveVerb1TextfieldObject      .show();
            editTagGroupTagNegativeIntransitiveVerb2TextfieldObject      .show();
            editTagGroupTagNegativeIntransitiveVerb3TextfieldObject      .show();
            editTagGroupTagNegativeIntransitiveVerbIngTextfieldObject    .show();
            editTagGroupTagNegativeIntransitiveVerbSTextfieldObject      .show();
            editTagGroupTagTransitiveVerb1TextfieldObject                .hide();
            editTagGroupTagTransitiveVerb2TextfieldObject                .hide();
            editTagGroupTagTransitiveVerb3TextfieldObject                .hide();
            editTagGroupTagTransitiveVerbIngTextfieldObject              .hide();
            editTagGroupTagTransitiveVerbSTextfieldObject                .hide();
            editTagGroupTagNegativeTransitiveVerb1TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerb2TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerb3TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerbIngTextfieldObject      .hide();
            editTagGroupTagNegativeTransitiveVerbSTextfieldObject        .hide();
            editTagGroupTagNounAbstractTextfieldObject                   .hide();
            editTagGroupTagNounAbstractSTextfieldObject                  .hide();
            editTagGroupTagNounTextfieldObject                           .hide();
            editTagGroupTagNounSTextfieldObject                          .hide();
            editTagGroupTagAdjectiveTextfieldObject                      .hide();
            editTagGroupTagNegativeAdjectiveTextfieldObject              .hide();
            editTagGroupTagAdverbTextfieldObject                         .hide();
            editTagGroupTagNegativeAdverbTextfieldObject                 .hide();

        }
        else if(tempSelectedTagTypeNameAltString.equals("TVR")){

            editTagGroupTagSubjectTextfieldObject                        .hide();
            editTagGroupTagSubjectPossesionTextfieldObject               .hide();
            editTagGroupTagIntransitiveVerb1TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerb2TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerb3TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerbIngTextfieldObject            .hide();
            editTagGroupTagIntransitiveVerbSTextfieldObject              .hide();
            editTagGroupTagNegativeIntransitiveVerb1TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerb2TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerb3TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerbIngTextfieldObject    .hide();
            editTagGroupTagNegativeIntransitiveVerbSTextfieldObject      .hide();
            editTagGroupTagTransitiveVerb1TextfieldObject                .show();
            editTagGroupTagTransitiveVerb2TextfieldObject                .show();
            editTagGroupTagTransitiveVerb3TextfieldObject                .show();
            editTagGroupTagTransitiveVerbIngTextfieldObject              .show();
            editTagGroupTagTransitiveVerbSTextfieldObject                .show();
            editTagGroupTagNegativeTransitiveVerb1TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerb2TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerb3TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerbIngTextfieldObject      .hide();
            editTagGroupTagNegativeTransitiveVerbSTextfieldObject        .hide();
            editTagGroupTagNounAbstractTextfieldObject                   .hide();
            editTagGroupTagNounAbstractSTextfieldObject                  .hide();
            editTagGroupTagNounTextfieldObject                           .hide();
            editTagGroupTagNounSTextfieldObject                          .hide();
            editTagGroupTagAdjectiveTextfieldObject                      .hide();
            editTagGroupTagNegativeAdjectiveTextfieldObject              .hide();
            editTagGroupTagAdverbTextfieldObject                         .hide();
            editTagGroupTagNegativeAdverbTextfieldObject                 .hide();

        }
        else if(tempSelectedTagTypeNameAltString.equals("NTV")){

            editTagGroupTagSubjectTextfieldObject                        .hide();
            editTagGroupTagSubjectPossesionTextfieldObject               .hide();
            editTagGroupTagIntransitiveVerb1TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerb2TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerb3TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerbIngTextfieldObject            .hide();
            editTagGroupTagIntransitiveVerbSTextfieldObject              .hide();
            editTagGroupTagNegativeIntransitiveVerb1TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerb2TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerb3TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerbIngTextfieldObject    .hide();
            editTagGroupTagNegativeIntransitiveVerbSTextfieldObject      .hide();
            editTagGroupTagTransitiveVerb1TextfieldObject                .hide();
            editTagGroupTagTransitiveVerb2TextfieldObject                .hide();
            editTagGroupTagTransitiveVerb3TextfieldObject                .hide();
            editTagGroupTagTransitiveVerbIngTextfieldObject              .hide();
            editTagGroupTagTransitiveVerbSTextfieldObject                .hide();
            editTagGroupTagNegativeTransitiveVerb1TextfieldObject        .show();
            editTagGroupTagNegativeTransitiveVerb2TextfieldObject        .show();
            editTagGroupTagNegativeTransitiveVerb3TextfieldObject        .show();
            editTagGroupTagNegativeTransitiveVerbIngTextfieldObject      .show();
            editTagGroupTagNegativeTransitiveVerbSTextfieldObject        .show();
            editTagGroupTagNounAbstractTextfieldObject                   .hide();
            editTagGroupTagNounAbstractSTextfieldObject                  .hide();
            editTagGroupTagNounTextfieldObject                           .hide();
            editTagGroupTagNounSTextfieldObject                          .hide();
            editTagGroupTagAdjectiveTextfieldObject                      .hide();
            editTagGroupTagNegativeAdjectiveTextfieldObject              .hide();
            editTagGroupTagAdverbTextfieldObject                         .hide();
            editTagGroupTagNegativeAdverbTextfieldObject                 .hide();

        }
        else if(tempSelectedTagTypeNameAltString.equals("NOA")){

            editTagGroupTagSubjectTextfieldObject                        .hide();
            editTagGroupTagSubjectPossesionTextfieldObject               .hide();
            editTagGroupTagIntransitiveVerb1TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerb2TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerb3TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerbIngTextfieldObject            .hide();
            editTagGroupTagIntransitiveVerbSTextfieldObject              .hide();
            editTagGroupTagNegativeIntransitiveVerb1TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerb2TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerb3TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerbIngTextfieldObject    .hide();
            editTagGroupTagNegativeIntransitiveVerbSTextfieldObject      .hide();
            editTagGroupTagTransitiveVerb1TextfieldObject                .hide();
            editTagGroupTagTransitiveVerb2TextfieldObject                .hide();
            editTagGroupTagTransitiveVerb3TextfieldObject                .hide();
            editTagGroupTagTransitiveVerbIngTextfieldObject              .hide();
            editTagGroupTagTransitiveVerbSTextfieldObject                .hide();
            editTagGroupTagNegativeTransitiveVerb1TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerb2TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerb3TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerbIngTextfieldObject      .hide();
            editTagGroupTagNegativeTransitiveVerbSTextfieldObject        .hide();
            editTagGroupTagNounAbstractTextfieldObject                   .show();
            editTagGroupTagNounAbstractSTextfieldObject                  .show();
            editTagGroupTagNounTextfieldObject                           .hide();
            editTagGroupTagNounSTextfieldObject                          .hide();
            editTagGroupTagAdjectiveTextfieldObject                      .hide();
            editTagGroupTagNegativeAdjectiveTextfieldObject              .hide();
            editTagGroupTagAdverbTextfieldObject                         .hide();
            editTagGroupTagNegativeAdverbTextfieldObject                 .hide();
        }
        else if(tempSelectedTagTypeNameAltString.equals("NOU")){

            editTagGroupTagSubjectTextfieldObject                        .hide();
            editTagGroupTagSubjectPossesionTextfieldObject               .hide();
            editTagGroupTagIntransitiveVerb1TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerb2TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerb3TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerbIngTextfieldObject            .hide();
            editTagGroupTagIntransitiveVerbSTextfieldObject              .hide();
            editTagGroupTagNegativeIntransitiveVerb1TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerb2TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerb3TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerbIngTextfieldObject    .hide();
            editTagGroupTagNegativeIntransitiveVerbSTextfieldObject      .hide();
            editTagGroupTagTransitiveVerb1TextfieldObject                .hide();
            editTagGroupTagTransitiveVerb2TextfieldObject                .hide();
            editTagGroupTagTransitiveVerb3TextfieldObject                .hide();
            editTagGroupTagTransitiveVerbIngTextfieldObject              .hide();
            editTagGroupTagTransitiveVerbSTextfieldObject                .hide();
            editTagGroupTagNegativeTransitiveVerb1TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerb2TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerb3TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerbIngTextfieldObject      .hide();
            editTagGroupTagNegativeTransitiveVerbSTextfieldObject        .hide();
            editTagGroupTagNounAbstractTextfieldObject                   .hide();
            editTagGroupTagNounAbstractSTextfieldObject                  .hide();
            editTagGroupTagNounTextfieldObject                           .show();
            editTagGroupTagNounSTextfieldObject                          .show();
            editTagGroupTagAdjectiveTextfieldObject                      .hide();
            editTagGroupTagNegativeAdjectiveTextfieldObject              .hide();
            editTagGroupTagAdverbTextfieldObject                         .hide();
            editTagGroupTagNegativeAdverbTextfieldObject                 .hide();

        }
        else if(tempSelectedTagTypeNameAltString.equals("ADJ")){

            editTagGroupTagSubjectTextfieldObject                        .hide();
            editTagGroupTagSubjectPossesionTextfieldObject               .hide();
            editTagGroupTagIntransitiveVerb1TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerb2TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerb3TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerbIngTextfieldObject            .hide();
            editTagGroupTagIntransitiveVerbSTextfieldObject              .hide();
            editTagGroupTagNegativeIntransitiveVerb1TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerb2TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerb3TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerbIngTextfieldObject    .hide();
            editTagGroupTagNegativeIntransitiveVerbSTextfieldObject      .hide();
            editTagGroupTagTransitiveVerb1TextfieldObject                .hide();
            editTagGroupTagTransitiveVerb2TextfieldObject                .hide();
            editTagGroupTagTransitiveVerb3TextfieldObject                .hide();
            editTagGroupTagTransitiveVerbIngTextfieldObject              .hide();
            editTagGroupTagTransitiveVerbSTextfieldObject                .hide();
            editTagGroupTagNegativeTransitiveVerb1TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerb2TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerb3TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerbIngTextfieldObject      .hide();
            editTagGroupTagNegativeTransitiveVerbSTextfieldObject        .hide();
            editTagGroupTagNounAbstractTextfieldObject                   .hide();
            editTagGroupTagNounAbstractSTextfieldObject                  .hide();
            editTagGroupTagNounTextfieldObject                           .hide();
            editTagGroupTagNounSTextfieldObject                          .hide();
            editTagGroupTagAdjectiveTextfieldObject                      .show();
            editTagGroupTagNegativeAdjectiveTextfieldObject              .hide();
            editTagGroupTagAdverbTextfieldObject                         .hide();
            editTagGroupTagNegativeAdverbTextfieldObject                 .hide();

        }
        else if(tempSelectedTagTypeNameAltString.equals("NDJ")){

            editTagGroupTagSubjectTextfieldObject                        .hide();
            editTagGroupTagSubjectPossesionTextfieldObject               .hide();
            editTagGroupTagIntransitiveVerb1TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerb2TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerb3TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerbIngTextfieldObject            .hide();
            editTagGroupTagIntransitiveVerbSTextfieldObject              .hide();
            editTagGroupTagNegativeIntransitiveVerb1TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerb2TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerb3TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerbIngTextfieldObject    .hide();
            editTagGroupTagNegativeIntransitiveVerbSTextfieldObject      .hide();
            editTagGroupTagTransitiveVerb1TextfieldObject                .hide();
            editTagGroupTagTransitiveVerb2TextfieldObject                .hide();
            editTagGroupTagTransitiveVerb3TextfieldObject                .hide();
            editTagGroupTagTransitiveVerbIngTextfieldObject              .hide();
            editTagGroupTagTransitiveVerbSTextfieldObject                .hide();
            editTagGroupTagNegativeTransitiveVerb1TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerb2TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerb3TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerbIngTextfieldObject      .hide();
            editTagGroupTagNegativeTransitiveVerbSTextfieldObject        .hide();
            editTagGroupTagNounAbstractTextfieldObject                   .hide();
            editTagGroupTagNounAbstractSTextfieldObject                  .hide();
            editTagGroupTagNounTextfieldObject                           .hide();
            editTagGroupTagNounSTextfieldObject                          .hide();
            editTagGroupTagAdjectiveTextfieldObject                      .hide();
            editTagGroupTagNegativeAdjectiveTextfieldObject              .show();
            editTagGroupTagAdverbTextfieldObject                         .hide();
            editTagGroupTagNegativeAdverbTextfieldObject                 .hide();

        }
        else if(tempSelectedTagTypeNameAltString.equals("ADV")){

            editTagGroupTagSubjectTextfieldObject                        .hide();
            editTagGroupTagSubjectPossesionTextfieldObject               .hide();
            editTagGroupTagIntransitiveVerb1TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerb2TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerb3TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerbIngTextfieldObject            .hide();
            editTagGroupTagIntransitiveVerbSTextfieldObject              .hide();
            editTagGroupTagNegativeIntransitiveVerb1TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerb2TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerb3TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerbIngTextfieldObject    .hide();
            editTagGroupTagNegativeIntransitiveVerbSTextfieldObject      .hide();
            editTagGroupTagTransitiveVerb1TextfieldObject                .hide();
            editTagGroupTagTransitiveVerb2TextfieldObject                .hide();
            editTagGroupTagTransitiveVerb3TextfieldObject                .hide();
            editTagGroupTagTransitiveVerbIngTextfieldObject              .hide();
            editTagGroupTagTransitiveVerbSTextfieldObject                .hide();
            editTagGroupTagNegativeTransitiveVerb1TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerb2TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerb3TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerbIngTextfieldObject      .hide();
            editTagGroupTagNegativeTransitiveVerbSTextfieldObject        .hide();
            editTagGroupTagNounAbstractTextfieldObject                   .hide();
            editTagGroupTagNounAbstractSTextfieldObject                  .hide();
            editTagGroupTagNounTextfieldObject                           .hide();
            editTagGroupTagNounSTextfieldObject                          .hide();
            editTagGroupTagAdjectiveTextfieldObject                      .hide();
            editTagGroupTagNegativeAdjectiveTextfieldObject              .hide();
            editTagGroupTagAdverbTextfieldObject                         .show();
            editTagGroupTagNegativeAdverbTextfieldObject                 .hide();

        }
        else if(tempSelectedTagTypeNameAltString.equals("NDV")){

            editTagGroupTagSubjectTextfieldObject                        .hide();
            editTagGroupTagSubjectPossesionTextfieldObject               .hide();
            editTagGroupTagIntransitiveVerb1TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerb2TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerb3TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerbIngTextfieldObject            .hide();
            editTagGroupTagIntransitiveVerbSTextfieldObject              .hide();
            editTagGroupTagNegativeIntransitiveVerb1TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerb2TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerb3TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerbIngTextfieldObject    .hide();
            editTagGroupTagNegativeIntransitiveVerbSTextfieldObject      .hide();
            editTagGroupTagTransitiveVerb1TextfieldObject                .hide();
            editTagGroupTagTransitiveVerb2TextfieldObject                .hide();
            editTagGroupTagTransitiveVerb3TextfieldObject                .hide();
            editTagGroupTagTransitiveVerbIngTextfieldObject              .hide();
            editTagGroupTagTransitiveVerbSTextfieldObject                .hide();
            editTagGroupTagNegativeTransitiveVerb1TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerb2TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerb3TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerbIngTextfieldObject      .hide();
            editTagGroupTagNegativeTransitiveVerbSTextfieldObject        .hide();
            editTagGroupTagNounAbstractTextfieldObject                   .hide();
            editTagGroupTagNounAbstractSTextfieldObject                  .hide();
            editTagGroupTagNounTextfieldObject                           .hide();
            editTagGroupTagNounSTextfieldObject                          .hide();
            editTagGroupTagAdjectiveTextfieldObject                      .hide();
            editTagGroupTagNegativeAdjectiveTextfieldObject              .hide();
            editTagGroupTagAdverbTextfieldObject                         .hide();
            editTagGroupTagNegativeAdverbTextfieldObject                 .show();

        }

    }

    public void GenerateAllTagNameFullVoid(){

        tempTagNameFullStringList.addAll(adjectiveTagNameFullStringList                 );
        tempTagNameFullStringList.addAll(adverbTagNameFullStringList                    );
        tempTagNameFullStringList.addAll(intransitiveVerbTagNameFullStringList          );
        tempTagNameFullStringList.addAll(negativeAdjectiveTagNameFullStringList         );
        tempTagNameFullStringList.addAll(negativeAdverbTagNameFullStringList            );
        tempTagNameFullStringList.addAll(negativeIntransitiveVerbTagNameFullStringList  );
        tempTagNameFullStringList.addAll(negativeTransitiveVerbTagNameFullStringList    );
        tempTagNameFullStringList.addAll(nounAbstractTagNameFullStringList              );
        tempTagNameFullStringList.addAll(nounTagNameFullStringList                      );
        tempTagNameFullStringList.addAll(subjectTagNameFullStringList                   );
        tempTagNameFullStringList.addAll(transitiveVerbTagNameFullStringList            );

    }

}



class GroupGUIObject{

    int           groupBackgroundColor                                        ;                           /*The color of group main  panel background color.*/
    int           groupColorBackgroundColor                                   ;                           /*The color of group title panel background color.*/
    int           groupColorLabelColor                                        ;                           /*The color of group title panel text       color.*/

    float           alphaFloat                                                  = 255;                      /*The opacity of all controllers in group object. */

    int             guiXInt                                                     ;                           /*The x position  of group object.*/
    int             guiYInt                                                     ;                           /*The y position  of group object.*/
    int             guiWidthInt                                                 ;                           /*The height size of group object.*/
    int             guiHeightInt                                                ;                           /*The width  size of group object.*/

    int             guiLayoutOffsetInt                                          = 10;                       /*The offset used to space each controllers in group object.*/

    int 			guiElement1ColumnFirstColumnXInt 							;                           /*The x position of first  controller in 1 Columns row.*/
    int             guiElement2ColumnFirstColumnXInt                            ;                           /*The x position of first  controller in 2 Columns row.*/
    int             guiElement2ColumnSecondColumnXInt                           ;                           /*The x position of second controller in 2 Columns row.*/
    int             guiElement3ColumnFirstColumnXInt                            ;                           /*The x position of first  controller in 3 Columns row.*/
    int             guiElement3ColumnSecondColumnXInt                           ;                           /*The x position of second controller in 3 Columns row.*/
    int             guiElement3ColumnThirdColumnXInt                            ;                           /*The x position of third  controller in 3 Columns row.*/
    int             guiElement4ColumnFirstColumnXInt                            ;                           /*The x position of first  controller in 4 Columns row.*/
    int             guiElement4ColumnSecondColumnXInt                           ;                           /*The x position of second controller in 4 Columns row.*/
    int             guiElement4ColumnThirdColumnXInt                            ;                           /*The x position of third  controller in 4 Columns row.*/
    int             guiElement4ColumnFourthColumnXInt                           ;                           /*The x position of fourth controller in 4 Columns row.*/

    int 			guiElement1ColumnWidth 									    ; 							/*The width of any controller in 1 Column  row.*/
    int             guiElement2ColumnWidth                                      ;                           /*The width of any controller in 2 Columns row.*/
    int             guiElement3ColumnWidth                                      ;                           /*The width of any controller in 3 Columns row.*/
    int             guiElement4ColumnWidth                                      ;                           /*The width of any controller in 4 Columns row.*/

    int             guiElement1LineHeight                                       = 10;                       /*The height of any element that only one line height.
                                                                                                            For example, button, text label.*/
    int             guiElement2LineHeight                                       = 20;                       /*The height of any element that only one line height.
                                                                                                            For example, text field.*/

    int             guiScrollableList5RowHeightInt                              = 62;                       /*The height of scrollable list controller that contains four  elements with additional one element of controller's title panel.*/
    int             guiScrollableList4RowHeightInt                              = 50;                       /*The height of scrollable list controller that contains three elements with additional one element of controller's title panel.*/

    CColor          defaultCColor                                               = new CColor();             /*This is controller color for default                            object.*/
    CColor          trueCheckListCColor                							= new CColor();             /*This is controller color for selected checklist scrollable list object.*/
    CColor          falseCheckListCColor               							= new CColor();             /*This is controller color for selected checklist scrollable list object.*/
    CColor          staticScrollableListCColor                                  = new CColor();             /*This is controller color for static             scrollable list object.*/

    PApplet         pAppletObject                                               ;                           /*Refer this object back to main PApplet object.*/

    GroupGUIObject 								(

    	int     _guiXInt        ,
        int     _guiYInt        ,
        int     _guiWidthInt    ,
        int     _guiHeightInt   ,
        PApplet _pAppletObject

    ){

        guiXInt                                         =  _guiXInt                         ;
        guiYInt                                         = (_guiYInt + guiLayoutOffsetInt)   ;
        guiWidthInt                                     =  _guiWidthInt                     ;
        guiHeightInt                                    =  _guiHeightInt                    ;
        pAppletObject                                   =  _pAppletObject                   ;

        guiElement1ColumnWidth                          = ((guiWidthInt - (guiLayoutOffsetInt*2))/1)                ;
        guiElement2ColumnWidth                          = ((guiWidthInt - (guiLayoutOffsetInt*3))/2)                ;
        guiElement3ColumnWidth                          = ((guiWidthInt - (guiLayoutOffsetInt*4))/3)                ;
        guiElement4ColumnWidth                          = ((guiWidthInt - (guiLayoutOffsetInt*5))/4)                ;
        guiElement1ColumnFirstColumnXInt                = ((guiLayoutOffsetInt*1) + (guiElement1ColumnWidth*0))     ;
        guiElement2ColumnFirstColumnXInt                = ((guiLayoutOffsetInt*1) + (guiElement2ColumnWidth*0))     ;
        guiElement2ColumnSecondColumnXInt               = ((guiLayoutOffsetInt*2) + (guiElement2ColumnWidth*1))     ;
        guiElement3ColumnFirstColumnXInt                = ((guiLayoutOffsetInt*1) + (guiElement3ColumnWidth*0))     ;
        guiElement3ColumnSecondColumnXInt               = ((guiLayoutOffsetInt*2) + (guiElement3ColumnWidth*1))     ;
        guiElement3ColumnThirdColumnXInt                = ((guiLayoutOffsetInt*3) + (guiElement3ColumnWidth*2))     ;
        guiElement4ColumnFirstColumnXInt	 			= ((guiLayoutOffsetInt*1) + (guiElement4ColumnWidth*0))     ;
		guiElement4ColumnSecondColumnXInt	 			= ((guiLayoutOffsetInt*2) + (guiElement4ColumnWidth*1))     ;
		guiElement4ColumnThirdColumnXInt	 			= ((guiLayoutOffsetInt*3) + (guiElement4ColumnWidth*2))     ;
		guiElement4ColumnFourthColumnXInt	 			= ((guiLayoutOffsetInt*4) + (guiElement4ColumnWidth*3))     ;

        groupBackgroundColor                            = color(50 , 60 , 57 , alphaFloat)  ;
        groupColorBackgroundColor                       = color(2  , 45 , 89 , alphaFloat)  ;
        groupColorLabelColor                            = color(255, 255, 255, alphaFloat)  ;

        defaultCColor               .setActive          (color(0  , 170, 255, alphaFloat))						/*The color of controller when an element  is clicked by mouse pointer.*/
                                    .setBackground      (color(0  , 45 , 90 , alphaFloat))						/*The color of controller         elements background.                 */
                                    .setCaptionLabel    (color(255, 255, 255, alphaFloat))						/*The color of controller         elements text.                       */
                                    .setForeground      (color(0  , 116, 217, alphaFloat))						/*The color of controller when an element  is hovered by mouse pointer */
                                    .setValueLabel      (color(255, 255, 255, alphaFloat));						/*The color of controller         elements text.                       */
        staticScrollableListCColor  .setActive          (color(0  , 45 , 90 , alphaFloat))						/*The color of controller when an element  is clicked by mouse pointer.*/
                                    .setBackground      (color(0  , 45 , 90 , alphaFloat))						/*The color of controller         elements background.                 */
                                    .setCaptionLabel    (color(255, 255, 255, alphaFloat))						/*The color of controller         elements text.                       */
                                    .setForeground      (color(0  , 45 , 90 , alphaFloat))						/*The color of controller when an element  is hovered by mouse pointer */
                                    .setValueLabel      (color(255, 255, 255, alphaFloat));						/*The color of controller         elements text.                       */
        trueCheckListCColor			.setActive          (color(0  , 116, 217, alphaFloat))						/*The color of controller when an element  is clicked by mouse pointer.*/
                                    .setBackground      (color(0  , 116, 217, alphaFloat))						/*The color of controller         elements background.                 */
                                    .setCaptionLabel    (color(255, 255, 255, alphaFloat))						/*The color of controller         elements text.                       */
                                    .setForeground      (color(0  , 116, 217, alphaFloat))						/*The color of controller when an element  is hovered by mouse pointer */
                                    .setValueLabel      (color(255, 255, 255, alphaFloat));						/*The color of controller         elements text.                       */
        falseCheckListCColor		.setActive          (color(0  , 45 , 90 , alphaFloat))						/*The color of controller when an element  is clicked by mouse pointer.*/
	                                .setBackground      (color(0  , 45 , 90 , alphaFloat))						/*The color of controller         elements background.                 */
	                                .setCaptionLabel    (color(255, 255, 255, alphaFloat))						/*The color of controller         elements text.                       */
	                                .setForeground      (color(0  , 116, 217, alphaFloat))						/*The color of controller when an element  is hovered by mouse pointer */
	                                .setValueLabel      (color(255, 255, 255, alphaFloat));						/*The color of controller         elements text.                       */

    }

    public void DrawVoid 								(

    	float _alphaFloat		,
    	Group _mainGroupObject

    ){

        alphaFloat                  = _alphaFloat;

        /*Codes to create fade in and fade out animation.*/
        if                          (alphaFloat >  (255f/45f)){ _mainGroupObject.show(); }
        else if                     (alphaFloat <= (255f/45f)){ _mainGroupObject.hide(); }

        groupBackgroundColor        = color(50 , 60 , 57 , alphaFloat + (255f/45f)) ;
        groupColorBackgroundColor   = color(2  , 45 , 89 , alphaFloat + (255f/45f)) ;
        groupColorLabelColor        = color(255, 255, 255, alphaFloat + (255f/45f)) ;

        defaultCColor               .setActive          (color(0  , 170, 255, alphaFloat))                      /*The color of controller when an element  is clicked by mouse pointer.*/
                                    .setBackground      (color(0  , 45 , 90 , alphaFloat))                      /*The color of controller         elements background.                 */
                                    .setCaptionLabel    (color(255, 255, 255, alphaFloat))                      /*The color of controller         elements text.                       */
                                    .setForeground      (color(0  , 116, 217, alphaFloat))                      /*The color of controller when an element  is hovered by mouse pointer */
                                    .setValueLabel      (color(255, 255, 255, alphaFloat));                     /*The color of controller         elements text.                       */
        staticScrollableListCColor  .setActive          (color(0  , 45 , 90 , alphaFloat))                      /*The color of controller when an element  is clicked by mouse pointer.*/
                                    .setBackground      (color(0  , 45 , 90 , alphaFloat))                      /*The color of controller         elements background.                 */
                                    .setCaptionLabel    (color(255, 255, 255, alphaFloat))                      /*The color of controller         elements text.                       */
                                    .setForeground      (color(0  , 45 , 90 , alphaFloat))                      /*The color of controller when an element  is hovered by mouse pointer */
                                    .setValueLabel      (color(255, 255, 255, alphaFloat));                     /*The color of controller         elements text.                       */
        trueCheckListCColor			.setActive          (color(0  , 116, 217, alphaFloat))						/*The color of controller when an element  is clicked by mouse pointer.*/
                                    .setBackground      (color(0  , 116, 217, alphaFloat))						/*The color of controller         elements background.                 */
                                    .setCaptionLabel    (color(255, 255, 255, alphaFloat))						/*The color of controller         elements text.                       */
                                    .setForeground      (color(0  , 116, 217, alphaFloat))						/*The color of controller when an element  is hovered by mouse pointer */
                                    .setValueLabel      (color(255, 255, 255, alphaFloat));						/*The color of controller         elements text.                       */
        falseCheckListCColor		.setActive          (color(0  , 45 , 90 , alphaFloat))						/*The color of controller when an element  is clicked by mouse pointer.*/
	                                .setBackground      (color(0  , 45 , 90 , alphaFloat))						/*The color of controller         elements background.                 */
	                                .setCaptionLabel    (color(255, 255, 255, alphaFloat))						/*The color of controller         elements text.                       */
	                                .setForeground      (color(0  , 116, 217, alphaFloat))						/*The color of controller when an element  is hovered by mouse pointer */
	                                .setValueLabel      (color(255, 255, 255, alphaFloat));						/*The color of controller         elements text.                       */

        _mainGroupObject       		.setBackgroundColor (groupBackgroundColor           );
        _mainGroupObject       		.setColor           (defaultCColor                  );
        _mainGroupObject       		.setColorBackground (groupColorBackgroundColor      );
        _mainGroupObject       		.setColorLabel      (groupColorLabelColor           );

    }

	/*This function below is used to "convert" scrollable list into checklist.*/
	public void CovertScrollableListIntoCheckListVoid	(int _indexInt, ScrollableList _scrollableListObject)   {

	    /*If there is no property named isSelected in the hashmap than we need to create one.
	    After that assign the isSelected value to true and also assign the color.*/
	    if( _scrollableListObject.getItem(_indexInt).get("isSelected") == null){

	        _scrollableListObject.getItem(_indexInt).put("isSelected" , true				); /*Create a new property called "isSelected" and assign initial value of true.*/
	        _scrollableListObject.getItem(_indexInt).put("color"      , trueCheckListCColor	); /*Change the color of this specific element into trueCheckListColor.         */

	    }
	    /*If there is isSelected property than revert it between true and false everytime we clicked it and set the appropriate color scheme.*/
	    else{

	        boolean  stateBoolean	=   _scrollableListObject.getItem(_indexInt).get("isSelected").toString().equals("true") ? true : false; 	/*Check wheter the currently selected element is used to be selected or not.                         */
	                                    _scrollableListObject.getItem(_indexInt).put("isSelected", !stateBoolean           ); 					/*If the selected element is used to be selected then unselect it, vice versa.                       */
	                 stateBoolean	=   _scrollableListObject.getItem(_indexInt).get("isSelected").toString().equals("true") ? true : false; 	/*Since the returned value of the hash map is in string we need to convert the value back to boolean.*/

	        if      (stateBoolean 	== true ){ _scrollableListObject.getItem(_indexInt).put("color", trueCheckListCColor ); } 					/*Assign the appropriate color whether the newly selected element is not selected or not.            */
	        else if (stateBoolean 	== false){ _scrollableListObject.getItem(_indexInt).put("color", falseCheckListCColor); } 					/*Assign the appropriate color whether the newly selected element is not selected or not.            */

	    }

	}

    /*This function is to put every selected tags into a String List.*/
    public List<String> SetSelectedCheckListStringList	(

        List<String>    _scrollableListItemStringList 	,
        List<String> 	_selectedItemStringList			,
        ScrollableList  _scrollableListObject

    ){

        /*Iterate through all the content elements..*/
        for(int i = 0; i < _scrollableListItemStringList.size(); i ++){

            /*Check if there is property in the hash map named "isSelected".*/
            if      (_scrollableListObject.getItem(i).get("isSelected") != null){

            	String selectedItemString = _scrollableListObject.getItem(i).get("text").toString();

                /*If there is a properties called "isSelected" and it is returned true then add the selected "text" properties into the String list if only
                    it is not yet inside the list.
                PENDING: Implementation of HashSet could be more suitable in here instead of using List.*/
                if      (_scrollableListObject 		.getItem(i)	.get("isSelected").toString().equals("true" )){
                    if  (!_selectedItemStringList 	.contains	(selectedItemString)){ _selectedItemStringList.add		(selectedItemString); }
                }
                /*If "isSelected" is false then remove the element from the list.*/
                else if (_scrollableListObject 		.getItem(i)	.get("isSelected").toString().equals("false")){
                   	if  (_selectedItemStringList 	.contains	(selectedItemString)){ _selectedItemStringList.remove	(selectedItemString); }
                }

            }

        }

        return _selectedItemStringList;

    }

}


/*A class for museum object.
The museum objects within this application are things that can interract with visitor.
For example floor, room, and exhibition.*/
class   ObjectMuseum                                                                    {

    boolean             activeBoolean               = false;                            /*Variable to control ControlP5 GUI element.                                                                            */
    boolean             fullBoolean                 = false;                            /*Whether this museum object is full or not.                                                                            */
    int                 indexGlobalInt              = -1;                               /*This is an index number of the location of this object in its respective list.                                        */
    int                 indexLocalInt               = -1;                               /*This is an index number of the location of this object within its parent child object list.                           */
    int                 visitorCurrentInt           = 0;                                /*This museum object current visitor.                                                                                   */
    int                 visitorTotalInt             = 0;                                /*This museum objecy total visitor.                                                                                     */
    Name                nameObject                  = null;                             /*Name object that contains the alternative name and the full name of this object.                                      */
    ObjectMuseum        parentObject                = null;                             /*The object parent of this object, which means this object should be inside the parent object's child object list.     */
    String              nameAltString               = "";                               /*This variable is intended solely to store the alternative name of this object.                                        */
    String              nameFullString              = "";                               /*This variable is intended solely to store the full name of this object.                                               */
    String              parentNameAltString         = "";                               /*The alternative name of the parent object.                                                                            */
    String              typeString                  = "";                               /*The type of this object (the only possible values are "FLR", "ROM", and "EXH").                                       */
    /*Variables of panel graphical user interfaces.*/
    boolean             hoverBoolean                = false;
    int               exhibitionPanelColor        = color(143, 86, 59);
    int               floorPanelColor             = color(69 , 40, 60);
    int               roomPanelColor              = color(102, 57, 49);
    int                 widthPanelInt               = 0;
    int                 heightPanelInt              = 0;
    int                 xPanelInt                   = 0;
    int                 yPanelInt                   = 0;
    Panel               panelObject                 = null;

    List<ObjectMuseum>  childObjectList             = new ArrayList<ObjectMuseum>();    /*This list contains all possible exhibition object.    */
    List<ObjectPlayer>  childPlayerObjectList       = new ArrayList<ObjectPlayer>(); 
    List<String>        tagMuseumNameAltStringList  = new ArrayList<String>();          /*The tags for this museum object.                      */
    List<String>        tagMuseumNameFullStringList = new ArrayList<String>();          /*The tags for this museum object.                      */
    List<Tag>           tagMuseumObjectList         = new ArrayList<Tag>();             /*Object tag list.                                      */
    String[]            explanationStringArray      = new String[4];

    ObjectMuseum                                    (

        Name                                        _nameObject             ,
        String                                      _parentNameAltString    ,
        String                                      _typeString             ,
        String[]                                    _explanationStringArray ,
        Tag...                                      _tagObjectArray

    ){

        /*We put in the name object from the first argument of this class.
        The name object is an object that contains only two variables,
            the alternative name of an object and the full name of an object
        For processing within this whoel application we used the alternative name.*/
        nameObject                                  = _nameObject;
        nameAltString                               = nameObject.nameAltString;
        nameFullString                              = nameObject.nameFullString;

        /*We put the alternative name of the parent here.
        For example the anternative name of an exhibition object must be
            an object with type string of "ROM" which mean the parent object
            is an room object.*/
        parentNameAltString                         = _parentNameAltString;

        /*This is the type of this object.
        The only possible input will be,
            "FLR" if this object is a room object,
            "ROM" if this object is a room object,
            "EXH" if this object is an exhibition object.*/
        typeString                                  = _typeString;

        /*Assign the added tags and then convert it from array to List.*/
        tagMuseumObjectList                         = Arrays.asList(_tagObjectArray);
        for(int i = 0; i < tagMuseumObjectList.size(); i ++){

            tagMuseumNameAltStringList  .add(tagMuseumObjectList.get(i).tagNameAltString );
            tagMuseumNameFullStringList .add(tagMuseumObjectList.get(i).tagNameFullString);

        }

        for(int i = 0; i < 4; i ++){ explanationStringArray[i] = nameFullString + " " + _explanationStringArray[i]; }

        /*Create panel.*/
        panelObject                                 = new Panel();

    }

    /*A function to update this object museum variables over time.*/
    public void DrawVoid()                                                                     {

        SetFullBoolean  ();
        SetHoverBoolean ();
        PanelDrawVoid   ();

    }

    public void ResetVoid(){

        fullBoolean         = false;
        visitorCurrentInt   = 0;
        visitorTotalInt     = 0;

    }

    /*A set of functions to move this object into a new parent object.
    For initial use, use SetInitialParentObject() instead of this function!.*/
    public void SetParentVoid(

        List<ObjectMuseum>  _targetObjectList       , 
        String              _parentNameAltString

    ){

        RemoveChildObjectList       (_targetObjectList      );
        SetParentNameAltString      (_parentNameAltString   );
        SetInitialParentObject      (_targetObjectList      );
        SetChildObjectList          (_targetObjectList      );
        SetIndexAllInsideVoid       (                       );

    }

    /*This class function to set both local and global index.*/
    public void SetIndexInsideVoid()                                                           {

        indexLocalInt           = SetIndexLocalInt();
        indexGlobalInt          = SetIndexGlobalInsideInt();

    }

    /*This function is to set all index in all possible museum object within this application.*/
    public void SetIndexAllInsideVoid()                                                        {

        /*Set the index of all object museum in the application.*/
        for(int i = 0; i < floorObjectList.size()       ; i ++){ floorObjectList        .get(i).SetIndexInsideVoid(); }
        for(int i = 0; i < roomObjectList.size()        ; i ++){ roomObjectList         .get(i).SetIndexInsideVoid(); }
        for(int i = 0; i < exhibitionObjectList.size()  ; i ++){ exhibitionObjectList   .get(i).SetIndexInsideVoid(); }

    }

    public void SetPanelVariableInsideVoid()                                                   {

        /*Panel layout calculations.*/
        if          (typeString.equals("FLR")){

            widthPanelInt   = (width - (panelLayoutOffsetSideInt*2) - (panelLayoutOffsetInt*floorObjectList.size()))/floorObjectList.size();
            heightPanelInt  = (height - ((panelLayoutOffsetInt*panelLayoutTotalRowInt) + panelLayoutOffsetInt))/panelLayoutTotalRowInt;
            xPanelInt       = panelLayoutOffsetSideInt + (indexGlobalInt*widthPanelInt) + (indexGlobalInt*panelLayoutOffsetInt);
            yPanelInt       = panelLayoutOffsetInt;

            if      (widthPanelInt <= 10 ){ widthPanelInt = 10;  }
            else if (heightPanelInt <= 10){ heightPanelInt = 10; }

        }

        /*PENDING: Noise error here.*/
        //if(nameAltString.equals("EXH_TES")){ println(parentObject.childObjectList.size()); }

        else if     (typeString.equals("ROM") || typeString.equals("EXH")){

            /*Check whether the parent object has been deleted or not.*/
            if(parentObject == null){
                if      (typeString.equals("ROM")){ parentObject = floorObjectList.get(0); }
                else if (typeString.equals("EXH")){ parentObject = roomObjectList.get(0) ; }
            }

            widthPanelInt   = ((parentObject.widthPanelInt - ((parentObject.childObjectList.size() - 1)*panelLayoutOffsetInt))/parentObject.childObjectList.size());
            heightPanelInt  = parentObject.heightPanelInt;
            xPanelInt       = parentObject.xPanelInt + (indexLocalInt*widthPanelInt) + (indexLocalInt*panelLayoutOffsetInt);
            yPanelInt       = parentObject.yPanelInt + parentObject.heightPanelInt + panelLayoutOffsetInt;

            if      (widthPanelInt <= 10 ){ widthPanelInt = 10;  }
            else if (heightPanelInt <= 10){ heightPanelInt = 10; }

        }
        
    }

    /*A function to set the threshold to determine whether this museum object is full or not.*/
    public boolean SetFullBoolean()                                                            {

        if      (museumObjectFullThresholdInt   <= visitorCurrentInt)  { fullBoolean = true;  }
        else if (museumObjectFullThresholdInt   >  visitorCurrentInt)  { fullBoolean = false; }

        return                      fullBoolean;
        
    }

    /*A function to determine whether this object is hovered by mouse or not.*/
    public boolean SetHoverBoolean()                                                           {

        if(

            (mouseX < panelObject.xPanelInt + panelObject.widthPanelInt )   &&
            (mouseX > panelObject.xPanelInt                             )   &&
            (mouseY < panelObject.yPanelInt + panelObject.heightPanelInt)   &&
            (mouseY > panelObject.yPanelInt                             )

        )   { hoverBoolean = true ; }
        else{ hoverBoolean = false; }

        return hoverBoolean;

    }

    /*A function to find this object index in its array list (not parent nor child object list).*/
    public int SetIndexInt(List<ObjectMuseum> _targetObjectList)                              {

        int indexInt            = -1;
        for(int i = 0; i < _targetObjectList.size(); i ++){
            if(_targetObjectList.get(i).nameAltString.equals(nameAltString)){ indexInt = i; break; }
        }

        return indexInt;

    }

    /*A bare function to set global index int of this object in the main global object list.*/
    public int SetIndexGlobalInt(List<ObjectMuseum> _targetObjectList)                         {

        indexGlobalInt  = SetIndexInt(_targetObjectList);
        return          indexGlobalInt;

    }

    /*A class specific function to set global index int.*/
    public int SetIndexGlobalInsideInt()                                                       {

        if      (typeString.equals("FLR")){ indexGlobalInt = SetIndexGlobalInt(floorObjectList);        }
        else if (typeString.equals("ROM")){ indexGlobalInt = SetIndexGlobalInt(roomObjectList);         }
        else if (typeString.equals("EXH")){ indexGlobalInt = SetIndexGlobalInt(exhibitionObjectList);   }
        return  indexGlobalInt;

    }

    /*A function to set local index int of this object in its parent index.*/
    public int SetIndexLocalInt()                                                              {

        if(!typeString.equals("FLR")){ indexLocalInt = SetIndexInt(parentObject.childObjectList); }
        return indexLocalInt;

    }

    /*A function to remove this object from child object of its parent.*/
    public List<ObjectMuseum> RemoveChildObjectList(List<ObjectMuseum> _targetObjectList)      {

        for(int i = 0; i < parentObject.childObjectList.size(); i ++){
            if(parentObject.childObjectList.get(i).nameAltString.equals(nameAltString)){ parentObject.childObjectList.remove(i); }
        }
        return _targetObjectList;

    }

    /*A function to set children of this museum object.*/
    public List<ObjectMuseum> SetChildObjectList(List<ObjectMuseum> _targetObjectList){

        if(childObjectList.size() > 0){ childObjectList.clear(); }                                                                                                                      /*Clear the child object List and then this function will make a new child object List.                                 */
        for(int i = 0; i < _targetObjectList.size(); i ++){ if(nameAltString.equals(_targetObjectList.get(i).parentNameAltString)){ childObjectList.add(_targetObjectList.get(i)); } }  /*Iterate through _targetObjectList to find any object of which has this object alternate name as its parent object.    */
        return childObjectList;

    }

    /*A function to return object from any object list.*/
    public ObjectMuseum FindObject(

        List<ObjectMuseum>  _targetObjectList       , 
        String              _nameAltString

    ){

        ObjectMuseum objectMuseum = null;
        for(int i = 0; i < _targetObjectList.size(); i ++){
            if(_targetObjectList.get(i).nameAltString.equals(_nameAltString)){ objectMuseum = _targetObjectList.get(i); }
        }
        return objectMuseum;

    }

    /*A function to set this object parent object.*/
    public ObjectMuseum SetInitialParentObject(List<ObjectMuseum> _targetObjectList){

        /*Iterate through all parent object to find this object parent object.*/
        for(int i = 0; i < _targetObjectList.size(); i ++){
            if(parentNameAltString.equals(_targetObjectList.get(i).nameAltString)){ parentObject = _targetObjectList.get(i); return parentObject; }
        }
        /*If the parent object is not found within the list then move this object into the the first index of _targetObjectList.                                                                        */
        parentObject                = _targetObjectList.get(0)      ; /*Change the object.                                                                                                              */
        parentNameAltString         = parentObject.nameAltString    ; /*Do not forget to change the parent alternate name.                                                                              */
        return                      parentObject                    ; /*Return the parent object. This line of code executed when this object failed to find its parent within the _targetObjectList.   */

    }
    
    /*A function to draw panel.*/
    public Panel PanelDrawVoid()                                                                 {

        SetPanelVariableInsideVoid  ();

        /*Adjust the color based on what panel is this object used for.*/
        int   usedColor;
        if      (typeString.equals("FLR"))  { usedColor = floorPanelColor;          }
        else if (typeString.equals("ROM"))  { usedColor = roomPanelColor;           }
        else if (typeString.equals("EXH"))  { usedColor = exhibitionPanelColor;     }
        else                                { usedColor = color(0);                 }

        panelObject             .DrawVoid(

            usedColor           ,
            widthPanelInt       ,
            heightPanelInt      ,
            xPanelInt           ,
            yPanelInt           ,
            nameAltString

        );

        return panelObject;

    }

    /*Set the parent alternative name String.*/
    public String SetParentNameAltString(String _parentNameAltString)                          {

        parentNameAltString     = _parentNameAltString;
        return                  parentNameAltString;

    }
    
};


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
    public void                SetTagObject            (Tag    _tagObject)         { tagObject         = _tagObject; }
    public void                SetTagNameAltString     (String _tagNameAltString)  { tagNameAltString  = _tagNameAltString;    }
    public void                SetTagNameFullString    (String _tagNameFullString) { tagNameFullString = _tagNameFullString;   }
    public void                SetTagCounterIntVoid    (int    _tagCounterInt)     {

                        /*I create an array becuse comparator will not working on primitive data type.
                        Hence, I put the value in one element List.*/
                        tagCounterInt       = _tagCounterInt;
                        tagCounterIntList   = new ArrayList<Integer>();
                        tagCounterIntList   .add(tagCounterInt);

    }
    public int                 GetTagCounterInt        (){ return tagCounterInt;       }
    public Tag                 GetTagObject            (){ return tagObject;           }
    public String              GetTagNameAltString     (){ return tagNameAltString;    }
    public String              GetTagNameFullString    (){ return tagNameFullString;   }

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
    int               panelFinishedColor                                      = color(223, 113, 38 );
    int               panelUnfinishedColor                                    = color(217, 160, 102);
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
    public void AddTagCounterVoid(

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
    public void AddRemoveChildVoid(boolean _isAdd)                 {

        ObjectMuseum exhibitionCurrentObject                = FindObject(exhibitionObjectList, exhibitionCurrentString);
        if      (_isAdd == true )                           { exhibitionCurrentObject.childPlayerObjectList.add(this);      }
        else if (_isAdd == false)                           { exhibitionCurrentObject.childPlayerObjectList.remove(this);   }

    }

    public void AIAutoVoid()                                       {

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
    public void DrawVoid()                                                                     {

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

    public void ResetVoid(){

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
    public void PopulateTagStringList(boolean _isPreviousBoolean)                              {

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
    public void SetPanelVariableInsideVoid()                                                   {

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
    public boolean SetHoverBoolean()                                                           {

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
    public int SetPlayerSiblingIndexInt(

        List<ObjectPlayer> _playerSiblingObjectList

    ){

        playerSiblingIndexInt = -1;
        for(int i = 0; i < _playerSiblingObjectList.size(); i ++){ if(_playerSiblingObjectList.get(i) == this){ playerSiblingIndexInt = i; } }
        return playerSiblingIndexInt;

    }

    /*A function to automatically add other player of which in the same exhibition.*/
    public List<ObjectPlayer> SetSiblingObjectList()               {

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
    public List<String> SetExhibitionTargetNameAltStringList()      {

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
    public ObjectMuseum ExhibitionMoveObject(String _targetNameAltString){

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
    public ObjectMuseum FindObject(

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
    public Panel PanelDrawVoid()                                                                 {

        exhibitionCurrentObject         = FindObject(exhibitionObjectList, exhibitionCurrentString);
        exhibitionCurrentNameAltString  = exhibitionCurrentObject.nameAltString;
        exhibitionCurrentNameFullString = exhibitionCurrentObject.nameFullString;

        SetPanelVariableInsideVoid      ();

        /*Here we determine the color based whether this player/visitor has visited total amount exhibition or not.*/
        int   usedColor;
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
    public int RandomNumberWithExclusionInt(int _startInt, int _endInt, Integer... _excludeIntArray){

        int randomInt = 0;
        do{ randomInt = (int)random(_startInt, _endInt); }
        while(Arrays.binarySearch(_excludeIntArray, randomInt) >= 0);
        return randomInt;

    }

    /*Set of functions to generate sentence.
    PENDING: Make this functions into a class.*/
    public int     SentenceRandomNumberGeneratorInt    (int        _randomNumber)          { return (int)(Math.round(Math.random()*(_randomNumber - 1))); }
    public String  SentenceWordFixString               (String     _fixString)             { return _fixString.substring(0, 1).toUpperCase() + _fixString.substring(1, _fixString.length()); }
    public String  SentenceMultipleGenerateString      (int        _numberOfSentenceInt)   {

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
    public String  SentenceSingleGenerateString        (String _patternString){

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
                        if(Math.random() <= 0.50f){  wordString = subjectCurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(subjectCurrentPrevTagStringList.size())); }
                    }
            }
            else    if(scanString.equals("`")){ /*Subject possesion.                  */
                            if(playerNameString == ""){
                                                    wordString = subjectPossesionCurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(subjectPossesionCurrentPrevTagStringList.size())); 
                    }
                    else    if(playerNameString != ""){
                                                    wordString = playerNameString + "'s";
                        if(Math.random() <= 0.50f){  wordString = subjectPossesionCurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(subjectPossesionCurrentPrevTagStringList.size())); }
                    }
            }
            else    if(scanString.equals("!")){ /*Intransitive verb 1.                */
                            if(playerVisitCorrectExhibitionBoolean == true ){ wordString = intransitiveVerb1CurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(intransitiveVerb1CurrentPrevTagStringList.size())); }
                    else    if(playerVisitCorrectExhibitionBoolean == false){
                        if  (Math.random() > 0.80f)  { wordString = negativeIntransitiveVerb1CurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(negativeIntransitiveVerb1CurrentPrevTagStringList.size())); }
                        else                        { wordString = intransitiveVerb1CurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(intransitiveVerb1CurrentPrevTagStringList.size())); }
                    }
            }
            else    if(scanString.equals("@")){ /*Intransitive verb 2.                */
                            if(playerVisitCorrectExhibitionBoolean == true ){ wordString = intransitiveVerb2CurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(intransitiveVerb2CurrentPrevTagStringList.size())); }
                    else    if(playerVisitCorrectExhibitionBoolean == false){
                        if  (Math.random() > 0.80f)  { wordString = negativeIntransitiveVerb2CurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(negativeIntransitiveVerb2CurrentPrevTagStringList.size())); }
                        else                        { wordString = intransitiveVerb2CurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(intransitiveVerb2CurrentPrevTagStringList.size())); }
                    }
            }
            else    if(scanString.equals("#")){ /*Intransitive verb 3.                */
                            if(playerVisitCorrectExhibitionBoolean == true ){ wordString = intransitiveVerb3CurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(intransitiveVerb3CurrentPrevTagStringList.size())); }
                    else    if(playerVisitCorrectExhibitionBoolean == false){
                        if  (Math.random() > 0.80f)  { wordString = negativeIntransitiveVerb3CurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(negativeIntransitiveVerb3CurrentPrevTagStringList.size())); }
                        else                        { wordString = intransitiveVerb3CurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(intransitiveVerb3CurrentPrevTagStringList.size())); }
                    }
            }
            else    if(scanString.equals("$")){ /*Intransitive verb + Ing.            */
                            if(playerVisitCorrectExhibitionBoolean == true ){ wordString = intransitiveVerbIngCurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(intransitiveVerbIngCurrentPrevTagStringList.size())); }
                    else    if(playerVisitCorrectExhibitionBoolean == false){
                        if  (Math.random() > 0.80f)  { wordString = negativeIntransitiveVerbIngCurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(negativeIntransitiveVerbIngCurrentPrevTagStringList.size())); }
                        else                        { wordString = intransitiveVerbIngCurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(intransitiveVerbIngCurrentPrevTagStringList.size())); }
                    }
            }
            else    if(scanString.equals("$")){ /*Intransitive verb + s.              */
                            if(playerVisitCorrectExhibitionBoolean == true ){ wordString = intransitiveVerbSCurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(intransitiveVerbSCurrentPrevTagStringList.size())); }
                    else    if(playerVisitCorrectExhibitionBoolean == false){
                        if  (Math.random() > 0.80f)  { wordString = negativeIntransitiveVerbSCurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(negativeIntransitiveVerbSCurrentPrevTagStringList.size())); }
                        else                        { wordString = intransitiveVerbSCurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(intransitiveVerbSCurrentPrevTagStringList.size())); }
                    }
            }
            else    if(scanString.equals(")")){ /*Transitive verb 1.                  */
                            if(playerVisitCorrectExhibitionBoolean == true ){ wordString = transitiveVerb1CurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(transitiveVerb1CurrentPrevTagStringList.size())); }
                    else    if(playerVisitCorrectExhibitionBoolean == false){
                        if  (Math.random() > 0.80f)  { wordString = negativeTransitiveVerb1CurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(negativeTransitiveVerb1CurrentPrevTagStringList.size())); }
                        else                        { wordString = transitiveVerb1CurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(transitiveVerb1CurrentPrevTagStringList.size())); }
                    }
            }
            else    if(scanString.equals("-")){ /*Transitive verb 2.                  */
                            if(playerVisitCorrectExhibitionBoolean == true ){ wordString = transitiveVerb2CurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(transitiveVerb2CurrentPrevTagStringList.size())); }
                    else    if(playerVisitCorrectExhibitionBoolean == false){
                        if  (Math.random() > 0.80f)  { wordString = negativeTransitiveVerb2CurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(negativeTransitiveVerb2CurrentPrevTagStringList.size())); }
                        else                        { wordString = transitiveVerb2CurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(transitiveVerb2CurrentPrevTagStringList.size())); }
                    }
            }
            else    if(scanString.equals("_")){ /*Transitive verb 3.                  */
                            if(playerVisitCorrectExhibitionBoolean == true ){ wordString = transitiveVerb3CurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(transitiveVerb3CurrentPrevTagStringList.size())); }
                    else    if(playerVisitCorrectExhibitionBoolean == false){
                        if  (Math.random() > 0.80f)  { wordString = negativeTransitiveVerb3CurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(negativeTransitiveVerb3CurrentPrevTagStringList.size())); }
                        else                        { wordString = transitiveVerb3CurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(transitiveVerb3CurrentPrevTagStringList.size())); }
                    }
            }
            else    if(scanString.equals("+")){ /*Transitive verb + Ing.              */
                            if(playerVisitCorrectExhibitionBoolean == true ){ wordString = transitiveVerbIngCurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(transitiveVerbIngCurrentPrevTagStringList.size())); }
                    else    if(playerVisitCorrectExhibitionBoolean == false){
                        if  (Math.random() > 0.80f)  { wordString = negativeTransitiveVerbIngCurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(negativeTransitiveVerbIngCurrentPrevTagStringList.size())); }
                        else                        { wordString = transitiveVerbIngCurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(transitiveVerbIngCurrentPrevTagStringList.size())); }
                    }
            }
            else    if(scanString.equals("=")){ /*Transitive verb + s.                */
                            if(playerVisitCorrectExhibitionBoolean == true ){ wordString = transitiveVerbSCurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(transitiveVerbSCurrentPrevTagStringList.size())); }
                    else    if(playerVisitCorrectExhibitionBoolean == false){
                        if  (Math.random() > 0.80f)  { wordString = negativeTransitiveVerbSCurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(negativeTransitiveVerbSCurrentPrevTagStringList.size())); }
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
                        if  (Math.random() > 0.80f)  { wordString = negativeAdjectiveCurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(negativeAdjectiveCurrentPrevTagStringList.size())); }
                        else                        { wordString = adjectiveCurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(adjectiveCurrentPrevTagStringList.size())); }
                    }
            }
            else    if(scanString.equals("1")){ /*Adverb.                             */
                            if(playerVisitCorrectExhibitionBoolean == true ){ wordString = adverbCurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(adverbCurrentPrevTagStringList.size())); }
                    else    if(playerVisitCorrectExhibitionBoolean == false){
                        if  (Math.random() > 0.80f)  { wordString = negativeAdverbCurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(negativeAdverbCurrentPrevTagStringList.size())); }
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
/*Creating a Panel class for each object museum.*/
class Panel                                         {

    PFont   layoutPanelPFont        ;   /*Font variable to hold the font style.*/
    int   fillColor               ;   /*The color of the panel.*/
    int     widthPanelInt           ;
    int     heightPanelInt          ;
    int     xPanelInt               ;
    int     yPanelInt               ;
    int     layoutTextSizeInt   = 12;   /*The default font size for the panel.*/

    Panel(){

        layoutPanelPFont        = createFont(panelFontString, layoutTextSizeInt);

    }

    public void DrawVoid(

        int   _fillColor      ,
        int     _widthPanelInt  ,
        int     _heightPanelInt ,
        int     _xPanelInt      ,
        int     _yPanelInt      ,
        String  _textString

    ){

        widthPanelInt           = _widthPanelInt    ;
        heightPanelInt          = _heightPanelInt   ;
        xPanelInt               = _xPanelInt        ;
        yPanelInt               = _yPanelInt        ;

        noStroke                ();

    	/*Fill color for the panel.*/
        fill                    (_fillColor);
        rect                    (xPanelInt, yPanelInt, widthPanelInt, heightPanelInt, 10);
        noFill                  ();

        /*Fill white color for the text.*/
        fill                    (255);
        textAlign               (CENTER);
        textFont                (layoutPanelPFont);
        String textTextString   = _textString;

        /*Set the text position.*/
        int xTextInt            = xPanelInt + ( widthPanelInt/2);
        int yTextInt            = yPanelInt + (heightPanelInt/2) + ((layoutTextSizeInt*11)/45);

        /*Display the text.*/
        text                    (textTextString, xTextInt, yTextInt);
        textAlign               (LEFT);
        noFill                  ();

    }


}



class RemoveMuseumGroupGUIObject extends GroupGUIObject{

    ControlP5       removeMuseumGroupControlP5Object;
    Group           removeMuseumGroupObject;

    RemoveMuseumGroupGUIObject(

        int             _guiXInt        ,
        int             _guiYInt        ,
        int             _guiWidthInt    ,
        int             _guiHeightInt   ,
        PApplet         _pAppletObject

    ){

        super                                   (_guiXInt, _guiYInt, _guiWidthInt, _guiHeightInt, _pAppletObject);
        removeMuseumGroupControlP5Object        = new ControlP5(pAppletObject);



        removeMuseumGroupObject                                         =
            removeMuseumGroupControlP5Object    .addGroup               ("EditMuseumObjectGroupObject")
                                                .close                  ()
                                                .setBackgroundColor     (groupBackgroundColor)
                                                .setBackgroundHeight    (guiHeightInt)
                                                .setColor               (defaultCColor)
                                                .setColorBackground     (groupColorBackgroundColor)
                                                .setColorLabel          (groupColorLabelColor)
                                                .setLabel               ("REMOVE MUSEUM OBJECT:")
                                                .setPosition            (guiXInt, guiYInt)
                                                .setWidth               (guiWidthInt);



    }

    public void DrawVoid(float   _alphaFloat){

        super.DrawVoid(_alphaFloat, removeMuseumGroupObject);

    }

}



class RemovePlayerGroupGUIObject extends GroupGUIObject{

    ControlP5       removePlayerGroupControlP5Object                            ;

    ObjectPlayer    tempPlayerToRemoveObject                                    ;

    /*ControlP5 related graphical user interface controller variables.*/
    Group           removePlayerGroupObject                                     ;
    ScrollableList  removePlayerGroupSelectPlayerToRemoveScrollableListObject   ;
    Button          removePlayerGroupRemoveButtonObject                         ;

    RemovePlayerGroupGUIObject                                        (

        int             _guiXInt                        ,
        int             _guiYInt                        ,
        int             _guiWidthInt                    ,
        int             _guiHeightInt                   ,
        PApplet         _pAppletObject

    ){

        super                                   (_guiXInt, _guiYInt, _guiWidthInt, _guiHeightInt, _pAppletObject);
        removePlayerGroupControlP5Object        = new ControlP5(pAppletObject);



        removePlayerGroupObject                                         =
            removePlayerGroupControlP5Object    .addGroup               ("RemovePlayerGroupObject")
                                                .close                  ()
                                                .setBackgroundColor     (groupBackgroundColor)
                                                .setBackgroundHeight    (guiHeightInt)
                                                .setColor               (defaultCColor)
                                                .setColorBackground     (groupColorBackgroundColor)
                                                .setColorLabel          (groupColorLabelColor)
                                                .setLabel               ("REMOVE VISITOR:")
                                                .setPosition            (guiXInt, guiYInt)
                                                .setWidth               (guiWidthInt);



        removePlayerGroupSelectPlayerToRemoveScrollableListObject       =
            removePlayerGroupControlP5Object    .addScrollableList      ("RemovePlayerGroupSelectPlayerToRemoveScrollableListObject")
                                                .addItems               (playerStringList)
                                                .setColor               (defaultCColor)
                                                .setGroup               (removePlayerGroupObject)
                                                .setLabel               ("PICK VISITOR YOU WANT TO REMOVE:")
                                                .setPosition            (guiElement1ColumnFirstColumnXInt, guiLayoutOffsetInt)
                                                .setSize                (guiElement1ColumnWidth, guiScrollableList5RowHeightInt)
                                                .setType                (ControlP5.LIST);



        removePlayerGroupRemoveButtonObject                             =
            removePlayerGroupControlP5Object    .addButton              ("RemovePlayerGroupRemoveButtonObject")
                                                .setColor               (defaultCColor)
                                                .setGroup               (removePlayerGroupObject)
                                                .setLabel               ("REMOVE VISITOR")
                                                .setPosition            (guiElement1ColumnFirstColumnXInt, ((guiLayoutOffsetInt*2) + guiScrollableList5RowHeightInt))
                                                .setSize                (guiElement1ColumnWidth, guiLayoutOffsetInt);



    }

    public void DrawVoid(float _alphaFloat){

        super.DrawVoid(_alphaFloat, removePlayerGroupObject);

    }

}



class RemoveTagGroupGUIObject extends GroupGUIObject{

    ControlP5       removeTagGroupControlP5Object;
    Group           removeTagGroupObject;

    RemoveTagGroupGUIObject(

        int             _guiXInt        ,
        int             _guiYInt        ,
        int             _guiWidthInt    ,
        int             _guiHeightInt   ,
        PApplet         _pAppletObject

    ){

        super                                   (_guiXInt, _guiYInt, _guiWidthInt, _guiHeightInt, _pAppletObject);
        removeTagGroupControlP5Object           = new ControlP5(pAppletObject);



        removeTagGroupObject                                        =
            removeTagGroupControlP5Object   .addGroup               ("RemoveTagGroupObject")
                                            .close                  ()
                                            .setBackgroundColor     (groupBackgroundColor)
                                            .setBackgroundHeight    (guiHeightInt)
                                            .setColor               (defaultCColor)
                                            .setColorBackground     (groupColorBackgroundColor)
                                            .setColorLabel          (groupColorLabelColor)
                                            .setLabel               ("REMOVE TAG:")
                                            .setPosition            (guiXInt, guiYInt)
                                            .setWidth               (guiWidthInt);



    }

    public void DrawVoid(float   _alphaFloat){

        super.DrawVoid(_alphaFloat, removeTagGroupObject);

    }

}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "JavaProcessingMuseumManager" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
