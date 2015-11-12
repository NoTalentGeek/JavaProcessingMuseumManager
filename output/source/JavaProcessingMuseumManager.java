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
import java.util.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class JavaProcessingMuseumManager extends PApplet {




boolean                 buttonOpenCloseBoolean          = false ;
ControlP5               cp5Object                       ;
ButtonOpenClose         buttonOpenCloseMuseumObject     ;
ButtonOpenClose         buttonOpenClosePlayerObject     ;

/*Determine global variables.*/
int                     playerAmountInt                 = 2;                                /*The number of players in this simulation.*/
//List<Tag>             tagObjectList                   = new ArrayList<Tag>();             /*Array List of tag.*/
List<Tag>               subjectTagObjectList            = new ArrayList<Tag>();
List<Tag>               verbTagObjectList               = new ArrayList<Tag>();
List<Tag>               nounTagObjectList               = new ArrayList<Tag>();
List<Tag>               adjectiveTagObjectList          = new ArrayList<Tag>();
List<Tag>               adverbTagObjectList             = new ArrayList<Tag>();
List<ObjectMuseum>      floorObjectList                 = new ArrayList<ObjectMuseum>();    /*Array List of museom object floor.*/
List<ObjectMuseum>      roomObjectList                  = new ArrayList<ObjectMuseum>();    /*Array List of museum object room*/
List<ObjectMuseum>      exhibitionObjectList            = new ArrayList<ObjectMuseum>();    /*Array List of museum object exhibition*/
List<ObjectPlayer>      playerObjectList                = new ArrayList<ObjectPlayer>();    /*Array List of player object.*/

/*The graphical user interface framework, the ControlP5 work by assigning a List of String to its controller.
Hence these String List below is bascially a convert of the actual object array nameAltString.
I have not done anything with the player, however the String list will be taken from the index number of the player.
PENDING: Make another Lists to support the nameFullString and nameAltString.*/
boolean                 useNameAltBoolean               = false;
List<String>            museumNameAltStringList         = new ArrayList<String>();
List<String>            floorNameAltStringList          = new ArrayList<String>();
List<String>            roomNameAltStringList           = new ArrayList<String>();
List<String>            exhibitionNameAltStringList     = new ArrayList<String>();

List<String>            museumNameFullStringList        = new ArrayList<String>();
List<String>            floorNameFullStringList         = new ArrayList<String>();
List<String>            roomNameFullStringList          = new ArrayList<String>();
List<String>            exhibitionNameFullStringList    = new ArrayList<String>();

List<String>            playerStringList                = new ArrayList<String>();

/*PROTOTYPE: For testing.
PENDING: In the future I want so that when a player visited an exhibition it received three different kind of tags.
PENDING: And then when player visit different exhibition I want that the tags collected transformed into a neat japanese style poem called haiku.*/
List<String>            subjectTagNameAltStringList     = new ArrayList<String>();
List<String>            verbTagNameAltStringList        = new ArrayList<String>();
List<String>            nounTagNameAltStringList        = new ArrayList<String>();
List<String>            adjectiveTagNameAltStringList   = new ArrayList<String>();
List<String>            adverbTagNameAltStringList      = new ArrayList<String>();
List<String>            subjectTagNameFullStringList    = new ArrayList<String>();
List<String>            verbTagNameFullStringList       = new ArrayList<String>();
List<String>            nounTagNameFullStringList       = new ArrayList<String>();
List<String>            adjectiveTagNameFullStringList  = new ArrayList<String>();
List<String>            adverbTagNameFullStringList     = new ArrayList<String>();
List<String>            defaultStringList               ;                                   /*When the object that you want to add has no parent, we need to show empty List of String.*/

/*GUI variables.*/
AddMuseumGUIObject      addMuseumGUIObject              ;
AddPlayerGUIObject      addPlayerGUIObject              ;
EditPlayerGUIObject     editPlayerGUIObject             ;

/*Variable to display information card when mouse pointer is hovered over either museum or player object.*/
boolean                 panelCardChangeBoolean          = true;                             /*Whether panel need to be re - created or not.*/
int                   panelCardColor                  = color(63, 63, 116);               /*Color of the panel card.*/
int                     xPanelCardInt                   = -1;                               /*X position of the panel card.*/
int                     yPanelCardInt                   = -1;                               /*Y position of the panel card.*/
int                     widthPanelCardInt               = 200;                              /*Width position of the panel card.*/
int                     heightPanelCardInt              = 280;                              /*Height position of the panel card.*/
int                     panelLineSpacingInt             = 5;                                /*Number of additional pixel within line break.*/
int                     rowInt                          = 0;                                /*How many maximum row is necessary for each panel (updated every tick).*/
int                     textSizePanelInt                = 16;                               /*Text size of the panel.*/
/*PENDING: Instead of using "selected" change the name of these two variables below into "hovered".*/
ObjectMuseum            selectedMuseumObject            = null;                             /*Which museum object is hovered.*/
ObjectPlayer            selectedPlayerObject            = null;                             /*Which player object is hovered.*/
PFont                   panelCardPFont                  ;                                   /*Font setting for panel object.*/
String                  panelFontString                 = "Monospaced.plain";               /*String name of font we used in this application.*/
String                  panelString                     = "";                               /*String in the panel object.*/

/*Variable for String fixing.
In order for the text to be in alignment this application need to have one line of 10 characters.
These Strings is to make sure every line has always be 10 characters long.*/
String                  tempVisitorCurrentString        ;
String                  tempVisitorTotalString          ;
String                  tempFullString                  ;

/*Simple calculation from the amount of player and exhibition to determine whethe the exhibition is full of people or not.*/
int                     fullThresholdInt                = 0;

/*General layout variable.*/
int                     layoutOffsetInt                 = 5;
int                     layoutOffsetSideInt             = 50;
int                     layoutTotalRowInt               = 10;

/*This is the time step necessary for fade in and fade out animation.
The 255f is the floating number of the maximum opacity.
While the 45f is the tick necessary to finish the rotating animation of
    button open close.*/
float                   animationStepFloat              = (255f/45f);

float                   dropdownMObjectAlphaFloat       = 0;
float                   dropdownPlayerAlphaFloat        = 0;                                /*The opacity number for dropdown player P5 component.*/
int                     guiOffsetInt                    = 20;                               /*Offset for layouting the graphical user interface.*/

/*Name class to manage an object name.*/
class Name                                      {

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
class Tag                                       {

    Name            tagName             = null;
    String          nameAltString       = "";
    String          nameFullString      = "";

    boolean         emotionIsGoodBoolean;
    String          tagTypeString       = "";
    String          tagSubjectString    = "";
    String          tagVerb1String      = "";
    String          tagVerb2String      = "";
    String          tagVerb3String      = "";
    String          tagVerbSString      = "";
    String          tagVerbIngString    = "";
    String          tagNounString       = "";
    String          tagNounSString      = "";
    String          tagAdjectiveString  = "";
    String          tagAdverbString     = "";

    Tag(

        Name        _nameObject                 ,
        String      _tagTypeString              ,
        String...   _wordDerivativeStringArray

    ){

        tagName                 = _nameObject;
        nameAltString           = tagName.nameAltString;
        nameFullString          = tagName.nameFullString;
        tagTypeString           = _tagTypeString;

        if      (tagTypeString.equals("SUB")){ tagSubjectString     = _wordDerivativeStringArray[0]; }
        else if (tagTypeString.equals("VER")){

            tagVerb1String      = _wordDerivativeStringArray[0];
            tagVerb2String      = _wordDerivativeStringArray[1];
            tagVerb3String      = _wordDerivativeStringArray[2];
            tagVerbSString      = _wordDerivativeStringArray[3];
            tagVerbIngString    = _wordDerivativeStringArray[4];

        }
        else if (tagTypeString.equals("NOU")){

            tagNounString       = _wordDerivativeStringArray[0];
            tagNounSString      = _wordDerivativeStringArray[1];

        }
        

    }

    Tag(

        Name        _nameObject             ,
        String      _tagTypeString          ,
        String      _wordString             ,
        boolean     _emotionIsGoodBoolean

    ){

        tagName                 = _nameObject;
        nameAltString           = tagName.nameAltString;
        nameFullString          = tagName.nameFullString;
        tagTypeString           = _tagTypeString;

        if      (tagTypeString.equals("ADJ")){ tagAdjectiveString   = _wordString; }
        else if (tagTypeString.equals("ADV")){ tagAdverbString      = _wordString; }

        emotionIsGoodBoolean    = _emotionIsGoodBoolean;

    }

}

public void setup()                                    {

    /*Setting up application.*/
    size                                (1024, 576, P2D);
    noStroke                            ();

    /*
    <<Create the tag list.>>
    tagObjectList           = Arrays.asList(

        <<
        new Tag(new Name("TAG_AGR", "Agreeable"     )),
        new Tag(new Name("TAG_BRA", "Brave"         )),
        new Tag(new Name("TAG_CAL", "Calm"          )),
        new Tag(new Name("TAG_DEL", "Delightful"    )),
        new Tag(new Name("TAG_EAG", "Eager"         )),
        new Tag(new Name("TAG_FAI", "Faithful"      )),
        new Tag(new Name("TAG_GEN", "Gentle"        )),
        new Tag(new Name("TAG_HAP", "Happy"         )),
        new Tag(new Name("TAG_JOL", "Jolly"         )),
        new Tag(new Name("TAG_KIN", "Kind"          )),
        new Tag(new Name("TAG_LIV", "Lively"        )),
        new Tag(new Name("TAG_NIC", "Nice"          )),
        new Tag(new Name("TAG_OBE", "Obedient"      )),
        new Tag(new Name("TAG_PRO", "Proud"         )),
        new Tag(new Name("TAG_REL", "Relieved"      )),
        new Tag(new Name("TAG_SIL", "Silly"         )),
        new Tag(new Name("TAG_THA", "Thankful"      )),
        new Tag(new Name("TAG_VIC", "Victorious"    )),
        new Tag(new Name("TAG_WIT", "Witty"         )),
        new Tag(new Name("TAG_ZEA", "Zealous"       ))
        >>

        new Tag(new Name("SUB_NAP", "Subject Napoleon"      ), "SUB", "Napoleon"),
        new Tag(new Name("SUB_WAS", "Subject Washington"    ), "SUB", "Washington"),
        new Tag(new Name("VER_JUM", "Verb Jump"             ), "VER", "jump", "jumped", "jumped", "jumps", "jumping"),
        new Tag(new Name("VER_RUN", "Verb Run"              ), "VER", "run", "ran", "run", "runs", "running"),
        new Tag(new Name("NOU_BAL", "Noun Ball"             ), "NOU", "ball", "balls"),
        new Tag(new Name("NOU_GUN", "Noun Gun"              ), "NOU", "gun", "guns"),
        new Tag(new Name("ADJ_GOD", "Adjective Good"        ), "ADJ", "good", true),
        new Tag(new Name("ADJ_BAD", "Adjective Bad"         ), "ADJ", "bad", false),
        new Tag(new Name("ADV_QUI", "Adverb Quickly"        ), "ADV", "quickly", true),
        new Tag(new Name("ADV_SLO", "Adverb Slowly"         ), "ADV", "slowly", false)
    
    );
    */

    subjectTagObjectList    = Arrays.asList(

        new Tag(new Name("SUB_NAP", "Subject Napoleon"      ), "SUB", "Napoleon"),
        new Tag(new Name("SUB_WAS", "Subject Washington"    ), "SUB", "Washington")

    );

    verbTagObjectList       = Arrays.asList(

        new Tag(new Name("VER_JUM", "Verb Jump"             ), "VER", "jump", "jumped", "jumped", "jumps", "jumping"),
        new Tag(new Name("VER_RUN", "Verb Run"              ), "VER", "run", "ran", "run", "runs", "running")

    );

    nounTagObjectList       = Arrays.asList(

        new Tag(new Name("NOU_BAL", "Noun Ball"             ), "NOU", "ball", "balls"),
        new Tag(new Name("NOU_GUN", "Noun Gun"              ), "NOU", "gun", "guns")

    );

    adjectiveTagObjectList  = Arrays.asList(

        new Tag(new Name("ADJ_GOD", "Adjective Good"        ), "ADJ", "good", true),
        new Tag(new Name("ADJ_BAD", "Adjective Bad"         ), "ADJ", "bad", false)

    );

    adverbTagObjectList     = Arrays.asList(

        new Tag(new Name("ADV_QUI", "Adverb Quickly"        ), "ADV", "quickly", true),
        new Tag(new Name("ADV_SLO", "Adverb Slowly"         ), "ADV", "slowly", false)

    );

    /*Set up the museum objects.*/
    floorObjectList         = Arrays.asList(

        new ObjectMuseum(new Name("FLR_001", "First Floor"                        ), "XXX_XXX", "FLR", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, nounTagObjectList, adjectiveTagObjectList, adverbTagObjectList)),
        new ObjectMuseum(new Name("FLR_002", "Second Floor"                       ), "XXX_XXX", "FLR", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, nounTagObjectList, adjectiveTagObjectList, adverbTagObjectList))

    );
    roomObjectList          = Arrays.asList(

        new ObjectMuseum(new Name("ROM_AFK", "Room Afrika"                        ), "FLR_001", "ROM", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, nounTagObjectList, adjectiveTagObjectList, adverbTagObjectList)),
        new ObjectMuseum(new Name("ROM_AME", "Room America"                       ), "FLR_001", "ROM", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, nounTagObjectList, adjectiveTagObjectList, adverbTagObjectList)),
        new ObjectMuseum(new Name("ROM_ASI", "Room Asia"                          ), "FLR_002", "ROM", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, nounTagObjectList, adjectiveTagObjectList, adverbTagObjectList)),
        new ObjectMuseum(new Name("ROM_EUR", "Room Europe"                        ), "FLR_002", "ROM", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, nounTagObjectList, adjectiveTagObjectList, adverbTagObjectList))

    );
    exhibitionObjectList    = Arrays.asList(

        new ObjectMuseum(new Name("EXH_CAO", "Exhibition Cameroon"                ), "ROM_AFK", "EXH", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, nounTagObjectList, adjectiveTagObjectList, adverbTagObjectList)),
        new ObjectMuseum(new Name("EXH_EGY", "Exhibition Egypt"                   ), "ROM_AFK", "EXH", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, nounTagObjectList, adjectiveTagObjectList, adverbTagObjectList)),
        new ObjectMuseum(new Name("EXH_ETH", "Exhibition Ethiopia"                ), "ROM_AFK", "EXH", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, nounTagObjectList, adjectiveTagObjectList, adverbTagObjectList)),
        new ObjectMuseum(new Name("EXH_NIG", "Exhibition Nigeria"                 ), "ROM_AFK", "EXH", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, nounTagObjectList, adjectiveTagObjectList, adverbTagObjectList)),
        new ObjectMuseum(new Name("EXH_BRA", "Exhibition Brazil"                  ), "ROM_AME", "EXH", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, nounTagObjectList, adjectiveTagObjectList, adverbTagObjectList)),
        new ObjectMuseum(new Name("EXH_CAN", "Exhibition Canada"                  ), "ROM_AME", "EXH", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, nounTagObjectList, adjectiveTagObjectList, adverbTagObjectList)),
        new ObjectMuseum(new Name("EXH_MEX", "Exhibition Mexico"                  ), "ROM_AME", "EXH", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, nounTagObjectList, adjectiveTagObjectList, adverbTagObjectList)),
        new ObjectMuseum(new Name("EXH_USA", "Exhibition United States Of America"), "ROM_AME", "EXH", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, nounTagObjectList, adjectiveTagObjectList, adverbTagObjectList)),
        new ObjectMuseum(new Name("EXH_CAM", "Exhibition Cambodia"                ), "ROM_ASI", "EXH", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, nounTagObjectList, adjectiveTagObjectList, adverbTagObjectList)),
        new ObjectMuseum(new Name("EXH_IND", "Exhibition India"                   ), "ROM_ASI", "EXH", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, nounTagObjectList, adjectiveTagObjectList, adverbTagObjectList)),
        new ObjectMuseum(new Name("EXH_JAP", "Exhibition Japan"                   ), "ROM_ASI", "EXH", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, nounTagObjectList, adjectiveTagObjectList, adverbTagObjectList)),
        new ObjectMuseum(new Name("EXH_SIN", "Exhibition Singapore"               ), "ROM_ASI", "EXH", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, nounTagObjectList, adjectiveTagObjectList, adverbTagObjectList)),
        new ObjectMuseum(new Name("EXH_BEL", "Exhibition Belgium"                 ), "ROM_EUR", "EXH", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, nounTagObjectList, adjectiveTagObjectList, adverbTagObjectList)),
        new ObjectMuseum(new Name("EXH_FRA", "Exhibition France"                  ), "ROM_EUR", "EXH", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, nounTagObjectList, adjectiveTagObjectList, adverbTagObjectList)),
        new ObjectMuseum(new Name("EXH_GER", "Exhibition Germany"                 ), "ROM_EUR", "EXH", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, nounTagObjectList, adjectiveTagObjectList, adverbTagObjectList)),
        new ObjectMuseum(new Name("EXH_NED", "Exhibition The Netherlands"         ), "ROM_EUR", "EXH", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, nounTagObjectList, adjectiveTagObjectList, adverbTagObjectList))

    );

    /*Copy the List to itself so it changed from static List into dynamic List.*/
    subjectTagObjectList    = new ArrayList<Tag>            (subjectTagObjectList   );
    verbTagObjectList       = new ArrayList<Tag>            (verbTagObjectList      );
    nounTagObjectList       = new ArrayList<Tag>            (nounTagObjectList      );
    adjectiveTagObjectList  = new ArrayList<Tag>            (adjectiveTagObjectList );
    adverbTagObjectList     = new ArrayList<Tag>            (adverbTagObjectList    );
    floorObjectList         = new ArrayList<ObjectMuseum>   (floorObjectList        );
    roomObjectList          = new ArrayList<ObjectMuseum>   (roomObjectList         );
    exhibitionObjectList    = new ArrayList<ObjectMuseum>   (exhibitionObjectList   );

    /*Initiate object parents and children for all object museum.*/
    for(int i = 0; i < floorObjectList.size()           ; i ++) { floorObjectList.get(i).SetChildObjectList  (roomObjectList); }
    for(int i = 0; i < roomObjectList.size()            ; i ++) {

        roomObjectList      .get(i).SetInitialParentObject  (floorObjectList);
        roomObjectList      .get(i).SetChildObjectList      (exhibitionObjectList);

    }
    for(int i = 0; i < exhibitionObjectList.size()      ; i ++) { exhibitionObjectList.get(i)   .SetInitialParentObject(roomObjectList); }

    /*Determine index for all museum object.*/
    for(int i = 0; i < floorObjectList.size()           ; i ++) { floorObjectList.get(i)        .SetIndexInsideVoid(); }
    for(int i = 0; i < roomObjectList.size()            ; i ++) { roomObjectList.get(i)         .SetIndexInsideVoid(); }
    for(int i = 0; i < exhibitionObjectList.size()      ; i ++) { exhibitionObjectList.get(i)   .SetIndexInsideVoid(); }

    /*Initiate all players.*/
    for(int i = 0; i < playerAmountInt; i ++)                   {

        ObjectPlayer objectPlayer = new ObjectPlayer(

            (i + 1),
            exhibitionObjectList.get((int)(Math.floor((Math.random()*exhibitionObjectList.size()) + 0))).nameAltString      /*Generate random starting exhibition for the player.*/

        );

    }

    /*Populate String list.*/
    for(int i = 0; i < subjectTagObjectList     .size(); i ++){ subjectTagNameAltStringList     .add(subjectTagObjectList   .get(i).nameAltString); subjectTagNameFullStringList    .add(subjectTagObjectList   .get(i).nameFullString); }
    for(int i = 0; i < verbTagObjectList        .size(); i ++){ verbTagNameAltStringList        .add(verbTagObjectList      .get(i).nameAltString); verbTagNameFullStringList       .add(verbTagObjectList      .get(i).nameFullString); }
    for(int i = 0; i < nounTagObjectList        .size(); i ++){ nounTagNameAltStringList        .add(nounTagObjectList      .get(i).nameAltString); nounTagNameFullStringList       .add(nounTagObjectList      .get(i).nameFullString); }
    for(int i = 0; i < adjectiveTagObjectList   .size(); i ++){ adjectiveTagNameAltStringList   .add(adjectiveTagObjectList .get(i).nameAltString); adjectiveTagNameFullStringList  .add(adjectiveTagObjectList .get(i).nameFullString); }
    for(int i = 0; i < adverbTagObjectList      .size(); i ++){ adverbTagNameAltStringList      .add(adverbTagObjectList    .get(i).nameAltString); adverbTagNameFullStringList     .add(adverbTagObjectList    .get(i).nameFullString); }
    /*Create empty list to display if the object created has no parent (for example, floor object will have no parent).*/
    defaultStringList       = Arrays.asList();
    for(int i = 0; i < floorObjectList.size()       ; i ++){ floorNameAltStringList         .add(     floorObjectList       .get(i).nameAltString ); floorNameFullStringList        .add(floorObjectList       .get(i).nameFullString); }
    for(int i = 0; i < roomObjectList.size()        ; i ++){ roomNameAltStringList          .add(     roomObjectList        .get(i).nameAltString ); roomNameFullStringList         .add(roomObjectList        .get(i).nameFullString); }
    for(int i = 0; i < exhibitionObjectList.size()  ; i ++){ exhibitionNameAltStringList    .add(     exhibitionObjectList  .get(i).nameAltString ); exhibitionNameFullStringList   .add(exhibitionObjectList  .get(i).nameFullString); }
    for(int i = 0; i < playerObjectList.size()      ; i ++){ playerStringList               .add("" + playerObjectList      .get(i).playerIndexInt); }

    cp5Object                           = new ControlP5(this);

    int buttonSizeInt                   = (width > height) ? ((width*15)/512) : ((height*15)/512);  /*Button size temporary variable.*/
    buttonOpenCloseMuseumObject         = new ButtonOpenClose(buttonSizeInt);                       /*Initiates button open close with size depends on the screen size.*/
    buttonOpenClosePlayerObject         = new ButtonOpenClose(buttonSizeInt);                       /*Initiates button open close with size depends on the screen size.*/

    int dropdownObjectWidthInt          = (width/3);
    int dropdownObjectHeightInt         = (height - (guiOffsetInt*2) - ((buttonSizeInt/2)*2));
    int itemHeightInt                   = (dropdownObjectHeightInt/20);

    /*Add the museum object GUI.*/
    addMuseumGUIObject                  = new AddMuseumGUIObject(

        (width - guiOffsetInt - (buttonSizeInt/2) - dropdownObjectWidthInt) ,
        (        guiOffsetInt + (buttonSizeInt/2)                         ) ,
        dropdownObjectWidthInt                                              ,
        335                                                                 ,
        buttonSizeInt                                                       ,
        dropdownObjectWidthInt                                              ,
        dropdownObjectHeightInt

    );

    /*Add the add player GUI.*/
    addPlayerGUIObject                  = new AddPlayerGUIObject(

        this                                        ,
        (guiOffsetInt + (buttonSizeInt/2))          ,
        (guiOffsetInt + (buttonSizeInt/2))          ,
        dropdownObjectWidthInt                      ,
        162                                         ,
        buttonSizeInt                               ,
        dropdownObjectWidthInt                      ,
        dropdownObjectHeightInt


    );

    /*Add the edit player GUI.*/
    editPlayerGUIObject                 = new EditPlayerGUIObject(


        (guiOffsetInt + (buttonSizeInt/2))  ,
        (guiOffsetInt + (buttonSizeInt/2))  ,
        dropdownObjectWidthInt              ,
        369                                 ,
        buttonSizeInt                       ,
        dropdownObjectWidthInt              ,
        dropdownObjectHeightInt

    );

    /*Create museum object dropdown menu.*/
    cp5Object
        .addScrollableList              ("ExhibitionSList")
        .setPosition                    (

            (width -  guiOffsetInt      - (buttonSizeInt/2) - dropdownObjectWidthInt                ),
            (         guiOffsetInt      + (buttonSizeInt/2)                                         )

        )
        .setSize                        (dropdownObjectWidthInt, dropdownObjectHeightInt)
        .setBarHeight                   (itemHeightInt)
        .setItemHeight                  (itemHeightInt)
        .setType                        (ControlP5.LIST)
        .setLabel                       ("Exhibition:")
        .hide                           ();

    /*Create player dropdown menu.*/
    cp5Object
        .addScrollableList              ("VisitorSList")
        .setPosition                    (

            (guiOffsetInt + (buttonSizeInt/2)),
            (guiOffsetInt + (buttonSizeInt/2))

        )
        .setSize                        (dropdownObjectWidthInt, dropdownObjectHeightInt)
        .setBarHeight                   (itemHeightInt)
        .setItemHeight                  (itemHeightInt)
        .setType                        (ControlP5.LIST)
        .setLabel                       ("Visitor:")
        .hide                           ();

    museumNameAltStringList             = new ArrayList<String>(floorNameAltStringList);                                                                       /*Set the initial item for this scrollable list.*/
    museumNameFullStringList            = new ArrayList<String>(floorNameFullStringList);
    if      (useNameAltBoolean == true ){ cp5Object.get(ScrollableList.class, "ExhibitionSList").setItems(museumNameAltStringList ); }  /*Set the initial display using alternative name.*/
    else if (useNameAltBoolean == false){ cp5Object.get(ScrollableList.class, "ExhibitionSList").setItems(museumNameFullStringList); }  /*Set the initial display using full name.*/
    

    /*Set the items for the scrollabnle list of the visitors.
    PENDING - DONE: The next thing I need to do is to make the a panel of which gather the informations of the player.
    PENDING - DONE: For the current working milestone I think I will take these informations to the display group panel.
    PENDING - DONE: List of informations.
        1. Player Index.
        2. Player Current Exhibition.
        3. Player Three Target Exhibitions.
        3. Player Three Most Visited Tags.
        4. Player Movement Modes.
        5. If Software Manual Control is toggled on there is another scrollable list to pick which exhibition to visit next.
    PENDING - DONE: The player movement mode is a radio list of how can certain player be controlled.
    PENDING - DONE: At this moment I can think of three ways to control player/visitor in this application.
    PENDING - DONE: Player movement mode.
        1. AI Mode, player move within the museum simulator with AIAutoVoid() method.
        2. Software Manual Control, player move within the museum simulator with dictation from a human using the museum manager application.
        3. Hardware Manual Control, player is move in synchronize with movement from Arduino device.
    PENDING - DONE: Create prototype of player panel.
    PENDING - DONE: Before working on the player edit panel please turn off the card display first.*/
    cp5Object                           .get(ScrollableList.class, "VisitorSList")
                                        .setItems(playerStringList);

}

public void draw()                                     {

    /*Set the background color for this application.*/
    background              (34, 32, 52);

    /*Always update the full threshold and layout total row int.*/
    fullThresholdInt        = 2 + (int)(Math.ceil(playerObjectList.size()/exhibitionObjectList.size()));
    layoutTotalRowInt       = (int)(Math.ceil(playerObjectList.size()/exhibitionObjectList.size()) + 5)*2;

    /*This one is to check wether we need to replace the current showed card with a new one.*/
    if      (selectedMuseumObject != null){

        if(

            (mouseX > xPanelCardInt + (selectedMuseumObject.panelObject.widthPanelInt /2)) ||
            (mouseX < xPanelCardInt - (selectedMuseumObject.panelObject.widthPanelInt /2)) ||
            (mouseY > yPanelCardInt + (selectedMuseumObject.panelObject.heightPanelInt/2)) ||
            (mouseY < yPanelCardInt - (selectedMuseumObject.panelObject.heightPanelInt/2))

        ){ panelCardChangeBoolean = true; }

    }
    else if (selectedPlayerObject != null){

        if(

            (mouseX > xPanelCardInt + (selectedPlayerObject.panelObject.widthPanelInt /2)) ||
            (mouseX < xPanelCardInt - (selectedPlayerObject.panelObject.widthPanelInt /2)) ||
            (mouseY > yPanelCardInt + (selectedPlayerObject.panelObject.heightPanelInt/2)) ||
            (mouseY < yPanelCardInt - (selectedPlayerObject.panelObject.heightPanelInt/2))

        ){ panelCardChangeBoolean = true; }

    }

    /*IN case we need a new card then we reset all card properties.*/
    if(panelCardChangeBoolean   == true){

        xPanelCardInt           = -1;
        yPanelCardInt           = -1;
        rowInt                  = 0;
        selectedMuseumObject    = null;
        selectedPlayerObject    = null;

    }

    /*Update function for all museum objects and player objects.
    Also within these four for loops we need to get which object is hovered.*/
    for(int i = 0; i < floorObjectList      .size(); i ++){ floorObjectList         .get(i).DrawVoid(); CheckMuseumObjectHoverVoid(i, floorObjectList       ); }
    for(int i = 0; i < roomObjectList       .size(); i ++){ roomObjectList          .get(i).DrawVoid(); CheckMuseumObjectHoverVoid(i, roomObjectList        ); }
    for(int i = 0; i < exhibitionObjectList .size(); i ++){ exhibitionObjectList    .get(i).DrawVoid(); CheckMuseumObjectHoverVoid(i, exhibitionObjectList  ); }
    for(int i = 0; i < playerObjectList     .size(); i ++){ playerObjectList        .get(i).DrawVoid(); CheckPlayerObjectHoverVoid(i                        ); }

    /*
    playerObjectList        .get(playerLoopCounterInt).AIAutoVoid();
    playerLoopCounterInt    = (playerLoopCounterInt >= (playerObjectList.size() - 1)) ? 0 : (playerLoopCounterInt + 1);
    */

    /*Update the value for animation of both button open close.*/
    dropdownMObjectAlphaFloat               = ScrollableDrawFloat(dropdownMObjectAlphaFloat   , (width - guiOffsetInt)   , guiOffsetInt     , buttonOpenCloseMuseumObject   , "ExhibitionSList" );
    dropdownPlayerAlphaFloat                = ScrollableDrawFloat(dropdownPlayerAlphaFloat    , guiOffsetInt             , guiOffsetInt     , buttonOpenClosePlayerObject   , "VisitorSList"    );
    
    /*Update the add museum object GUI.*/
    addMuseumGUIObject                      .DrawVoid(dropdownMObjectAlphaFloat);
    /*Update the add player object GUI.*/
    addPlayerGUIObject                      .DrawVoid(dropdownPlayerAlphaFloat);
    /*Update the edit player object GUI.*/
    editPlayerGUIObject                     .DrawVoid(buttonOpenClosePlayerObject.isButtonOpenBoolean, dropdownPlayerAlphaFloat);
    
    /*Update buttonOpenCloseBoolean.*/
    SetButtonOpenCloseBoolean               ();    
    /*Create the card.*/
    if(buttonOpenCloseBoolean == false)     { CreatePanelCardVoid(); }

}

/*The mouse pressed override function is for the open and close button.*/
public void mousePressed()                             {

    if(buttonOpenClosePlayerObject.MouseOverBoolean() == true){ buttonOpenClosePlayerObject.isAnimatingBoolean = true; }
    if(buttonOpenCloseMuseumObject.MouseOverBoolean() == true){ buttonOpenCloseMuseumObject.isAnimatingBoolean = true; }

}

/*Function to assign specific tag into the whole tag of object player.*/
public void AssignRandomTagLoopVoid(

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
        
        /*If the assignTagObjectList has three or more elements then we need to start reducing the changce.*/
        if(_targetTagObjectList .size() >= (_sourceTagObjectList.size()/2)) { randomCounterFloat -= 0.2f; }
        counterInt                                                          ++;
        /*Add/push a tag object into the temporary list.*/
        if(insideBoolean == false)                                          { _targetTagObjectList.add(tagObject); }

    }

}

/*A function to check whether an object of museum is hovered by mouse pointer.*/
public void CheckMuseumObjectHoverVoid(

    int _indexInt                           , 
    List<ObjectMuseum> _targetObjectList

){

    /*This is to check which museum/player object is hovered, then create panel based on that object position.*/
    if(_targetObjectList.get(_indexInt).SetHoverBoolean() == true && panelCardChangeBoolean == true && buttonOpenCloseBoolean == false){

        xPanelCardInt           = _targetObjectList.get(_indexInt).panelObject.xPanelInt + (_targetObjectList.get(_indexInt).panelObject.widthPanelInt /2 );
        yPanelCardInt           = _targetObjectList.get(_indexInt).panelObject.yPanelInt + (_targetObjectList.get(_indexInt).panelObject.heightPanelInt/2);
        selectedMuseumObject    = _targetObjectList.get(_indexInt);

        panelCardChangeBoolean  = false;

    }

}

/*A function to check whether an object of player is hovered by mouse pointer.*/
public void CheckPlayerObjectHoverVoid(int _indexInt)  {

    /*This is to check which museum/player object is hovered, then create panel based on that object position.*/
    if(playerObjectList.get(_indexInt).SetHoverBoolean() == true && panelCardChangeBoolean == true && buttonOpenCloseBoolean == false){

        xPanelCardInt           = playerObjectList.get(_indexInt).panelObject.xPanelInt + (playerObjectList.get(_indexInt).panelObject.widthPanelInt/2 );
        yPanelCardInt           = playerObjectList.get(_indexInt).panelObject.yPanelInt + (playerObjectList.get(_indexInt).panelObject.heightPanelInt/2);
        selectedPlayerObject    = playerObjectList.get(_indexInt);

        panelCardChangeBoolean  = false;

    }

}

/*A function to control color for each possible type of museum object buttons.*/
public void ColorControlVoid(

    String  _captionString          ,
    CColor  _floorCColorObject      ,
    CColor  _roomCColorObject       ,
    CColor  _exhibitionCColorObject

){

    if(_captionString.equals("ExhibitionSList") && (useNameAltBoolean == true)){

        for(int i = 0; i < museumNameAltStringList.size(); i ++){

            String  itemScrollableString        = cp5Object.get(ScrollableList.class, _captionString).getItem(i).get("text").toString();
            String  tempTypeString              = "";
            if      (FindObjectMuseumIndexInt   (itemScrollableString, floorObjectList)        != -1){ tempTypeString = "FLR";    }
            else if (FindObjectMuseumIndexInt   (itemScrollableString, roomObjectList)         != -1){ tempTypeString = "ROM";    }
            else if (FindObjectMuseumIndexInt   (itemScrollableString, exhibitionObjectList)   != -1){ tempTypeString = "EXH";    }
            if      (tempTypeString             .equals("FLR")){ cp5Object.get(ScrollableList.class, _captionString).getItem(i).put("color", _floorCColorObject);        }
            else if (tempTypeString             .equals("ROM")){ cp5Object.get(ScrollableList.class, _captionString).getItem(i).put("color", _roomCColorObject);         }
            else if (tempTypeString             .equals("EXH")){ cp5Object.get(ScrollableList.class, _captionString).getItem(i).put("color", _exhibitionCColorObject);   }

        }

    }
    else if(_captionString.equals("ExhibitionSList") && (useNameAltBoolean == false)){

        for(int i = 0; i < museumNameFullStringList.size(); i ++){

            String  itemScrollableString        = cp5Object.get(ScrollableList.class, _captionString).getItem(i).get("text").toString();
            String  tempTypeString              = "";
            if      (FindObjectMuseumIndexInt   (itemScrollableString, floorObjectList)        != -1){ tempTypeString = "FLR";    }
            else if (FindObjectMuseumIndexInt   (itemScrollableString, roomObjectList)         != -1){ tempTypeString = "ROM";    }
            else if (FindObjectMuseumIndexInt   (itemScrollableString, exhibitionObjectList)   != -1){ tempTypeString = "EXH";    }
            if      (tempTypeString             .equals("FLR")){ cp5Object.get(ScrollableList.class, _captionString).getItem(i).put("color", _floorCColorObject);        }
            else if (tempTypeString             .equals("ROM")){ cp5Object.get(ScrollableList.class, _captionString).getItem(i).put("color", _roomCColorObject);         }
            else if (tempTypeString             .equals("EXH")){ cp5Object.get(ScrollableList.class, _captionString).getItem(i).put("color", _exhibitionCColorObject);   }

        }

    }

}

/*A function to create panel card.*/
public void CreatePanelCardVoid()                      {

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
        if          (selectedMuseumObject == null){

            rowInt      = 9;

            ObjectMuseum exhibitionCurrentObject    = selectedPlayerObject.FindObject(exhibitionObjectList  , selectedPlayerObject.exhibitionCurrentString          );
            ObjectMuseum roomCurrentObject          = selectedPlayerObject.FindObject(roomObjectList        , exhibitionCurrentObject   .parentObject.nameAltString );
            ObjectMuseum floorCurrentObject         = selectedPlayerObject.FindObject(floorObjectList       , roomCurrentObject         .parentObject.nameAltString );

            panelString  =

                "FLR_CUR = " + exhibitionCurrentObject.nameAltString                                            + "\n" +
                "ROM_CUR = " + roomCurrentObject.nameAltString                                                  + "\n" +
                "EXH_CUR = " + exhibitionCurrentObject.nameAltString                                            + "\n" +
                "EXH_TAR = " + selectedPlayerObject.exhibitionTargetNameAltStringList .get(0)                   + "\n" +
                "EXH_TAR = " + selectedPlayerObject.exhibitionTargetNameAltStringList .get(1)                   + "\n" +
                "EXH_TAR = " + selectedPlayerObject.exhibitionTargetNameAltStringList .get(2)                   + "\n" +
                "EXH_TAG = " + selectedPlayerObject.exhibitionTagCounterList   .get(0).GetTagNameAltString()    + "\n" +
                "EXH_TAG = " + selectedPlayerObject.exhibitionTagCounterList   .get(1).GetTagNameAltString()    + "\n" +
                "EXH_TAG = " + selectedPlayerObject.exhibitionTagCounterList   .get(2).GetTagNameAltString()

            ;

        }
        /*String display for the museum object.*/
        else if     (selectedPlayerObject == null){

            rowInt      = 4;

            if      (selectedMuseumObject.visitorCurrentInt < 10   ){ tempVisitorCurrentString = "______"   + selectedMuseumObject.visitorCurrentInt; }
            else if (selectedMuseumObject.visitorCurrentInt < 100  ){ tempVisitorCurrentString = "_____"    + selectedMuseumObject.visitorCurrentInt; }
            else if (selectedMuseumObject.visitorCurrentInt < 1000 ){ tempVisitorCurrentString = "____"     + selectedMuseumObject.visitorCurrentInt; }
            else if (selectedMuseumObject.visitorCurrentInt < 10000){ tempVisitorCurrentString = "___"      + selectedMuseumObject.visitorCurrentInt; }

            if      (selectedMuseumObject.visitorTotalInt   < 10   ){ tempVisitorTotalString = "______"     + selectedMuseumObject.visitorTotalInt; }
            else if (selectedMuseumObject.visitorTotalInt   < 100  ){ tempVisitorTotalString = "_____"      + selectedMuseumObject.visitorTotalInt; }
            else if (selectedMuseumObject.visitorTotalInt   < 1000 ){ tempVisitorTotalString = "____"       + selectedMuseumObject.visitorTotalInt; }
            else if (selectedMuseumObject.visitorTotalInt   < 10000){ tempVisitorTotalString = "___"        + selectedMuseumObject.visitorTotalInt; }

            if      (selectedMuseumObject.fullBoolean == true ){ tempFullString = "____TRU"; }
            else if (selectedMuseumObject.fullBoolean == false){ tempFullString = "____FAL"; }

            panelString = 

                "NAM_ALT = " + selectedMuseumObject.nameAltString   + "\n" + 
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

/*A function to set if there is at least one button in open state.*/
public boolean SetButtonOpenCloseBoolean()             {

    if(buttonOpenCloseMuseumObject.isButtonOpenBoolean == true || buttonOpenClosePlayerObject.isButtonOpenBoolean == true)  { buttonOpenCloseBoolean = true ; }
    else                                                                                                                    { buttonOpenCloseBoolean = false; }
    return buttonOpenCloseBoolean;

}

public float ButtonOpenCloseAnimatingFloat(

    boolean _buttonOpenCloseBoolean ,
    boolean _isAnimatingBoolean     ,
    String  _captionString          ,
    CColor  _defaultCColorObject    ,
    CColor  _floorCColorObject      ,
    CColor  _roomCColorObject       ,
    CColor  _exhibitionCColorObject ,
    float   _alphaFloat

){

    /*Invert the state of when button is open or close.
    I am not really sure why I need to invert the boolean while it is supposed
        to work even without inverting the value.
    So when the buttonOpenCloseObject.isButtonOpenBoolean is true the button is actually closed.
    And when the buttonOpenCloseObject.isButtonOpenBoolean is false the button is actually open.*/
    /*When the button is animating (fade in - fade out).*/
    if                          (_isAnimatingBoolean == true ){

        /*For closing animation.*/
        if                      (_buttonOpenCloseBoolean == true ){
            
            /*Set the color according to the caption title.*/
            ColorControlVoid(_captionString, _floorCColorObject, _roomCColorObject, _exhibitionCColorObject);
            /*Show the scrollable list.*/
            cp5Object        
                .get            (ScrollableList.class, _captionString)
                .setColor       (_defaultCColorObject)
                .show           ();
            /*Decrease the opacity value over time.*/
            _alphaFloat -= (255f/45f);

        }
        /*For opening animation.*/
        else if                 (_buttonOpenCloseBoolean == false){
            
            /*Set the color according to the caption title.*/
            ColorControlVoid(_captionString, _floorCColorObject, _roomCColorObject, _exhibitionCColorObject);
            /*Show the scrollable list.*/
            cp5Object        
                .get            (ScrollableList.class, _captionString)
                .setColor       (_defaultCColorObject)
                .show           ();
            /*Increase the opacity value over time.*/
            _alphaFloat         += (255f/45f);

        }

    }
    /*When the button is not animating.*/
    else if     (_isAnimatingBoolean == false){

        /*When the button is not animating and the button is close.*/
        if      (_buttonOpenCloseBoolean == true ){

            /*Set the color according to the caption title.*/
            ColorControlVoid(_captionString, _floorCColorObject, _roomCColorObject, _exhibitionCColorObject);
            /*Show the scrollable list.*/
            cp5Object        
                .get            (ScrollableList.class, _captionString)
                .show           ();
            /*Set the alpha value of this scrollable list to one tick before it goes full opacity.*/
            _alphaFloat         = (255f - (255f/45f));

        }
        /*When the button is not animating and the button is open.*/
        else if (_buttonOpenCloseBoolean == false){

            /*Hide the scrollable list.*/
            cp5Object        
                .get            (ScrollableList.class, _captionString)
                .hide           ();
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
    String          _captionString

){


    /*Determine color for each possible buttons.*/
    CColor  defaultCColorObject             = new CColor();                     /*Color for default ubuttons scrollable list.*/
    CColor  floorCColorObject               = new CColor();                     /*Color for floor buttons scrollable list.*/
    CColor  roomCColorObject                = new CColor();                     /*Color for room buttons scrollable list.*/
    CColor  exhibitionCColorObject          = new CColor();                     /*Color for exhibition buttons scrollable list.*/
            defaultCColorObject
                .setActive                  (color(0    , 45    , 90    , _alphaFloat))
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
    if                              (_buttonOpenCloseObject.isAnimatingBoolean == true ){

        _alphaFloat = ButtonOpenCloseAnimatingFloat(

            _buttonOpenCloseObject.isButtonOpenBoolean  ,
            _buttonOpenCloseObject.isAnimatingBoolean   ,
            _captionString                              ,
            defaultCColorObject                         ,
            floorCColorObject                           ,
            roomCColorObject                            ,
            exhibitionCColorObject                      ,
            _alphaFloat

        );

    }
    /*If statement when the animation is stopped playing.*/
    else if                         (_buttonOpenCloseObject.isAnimatingBoolean == false){

        _alphaFloat = ButtonOpenCloseAnimatingFloat(

            _buttonOpenCloseObject.isButtonOpenBoolean  ,
            _buttonOpenCloseObject.isAnimatingBoolean   ,
            _captionString                              ,
            defaultCColorObject                         ,
            floorCColorObject                           ,
            roomCColorObject                            ,
            exhibitionCColorObject                     ,
            _alphaFloat

        );

    }

    return _alphaFloat;

}

/*Neat function to calculate text height.
PENDING: Please remove this function.*/
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

/*Create a function to add museum object.
PENDING: Later I need to add additional arguments so that the tags will also be added.*/
public ObjectMuseum AddMuseumObject(

    String  _nameAltString       ,
    String  _nameFullString      ,
    String  _parentNameAltString ,
    String  _typeString         ,
    Tag[]   _tagObjectArray

){

    /*Create temporary list for object that we want to make, its list, and its parent list.*/
    List<ObjectMuseum>  museumObjectList            = new ArrayList<ObjectMuseum>();
    List<ObjectMuseum>  parentMuseumObjectList      = new ArrayList<ObjectMuseum>();
    List<String>        temporaryMuseumStringList   = new ArrayList<String>();
    ObjectMuseum        museumObject                = new ObjectMuseum(new Name(_nameAltString, _nameFullString), _parentNameAltString, _typeString, _tagObjectArray);

    /*If statement to determine which List we should put in.*/
    if      (_typeString.equals("FLR")){

        museumObjectList            = floorObjectList;
        temporaryMuseumStringList   = (useNameAltBoolean == true) ? floorNameAltStringList : floorNameFullStringList;

    }
    else if (_typeString.equals("ROM")){

        museumObjectList            = roomObjectList;
        parentMuseumObjectList      = floorObjectList;
        temporaryMuseumStringList   = (useNameAltBoolean == true) ? roomNameAltStringList : roomNameFullStringList;

    }
    else if (_typeString.equals("EXH")){

        museumObjectList            = exhibitionObjectList;
        parentMuseumObjectList      = roomObjectList;
        temporaryMuseumStringList   = (useNameAltBoolean == true) ? exhibitionNameAltStringList : exhibitionNameFullStringList;

    }


    /*Assign the object into the object List and the String List.*/
    museumObjectList                    .add(museumObject);
    if      (useNameAltBoolean == true ){ temporaryMuseumStringList.add(museumObject.nameAltString ); }
    else if (useNameAltBoolean == false){ temporaryMuseumStringList.add(museumObject.nameFullString); }
    
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

    if      (useNameAltBoolean == true ){ cp5Object.get(ScrollableList.class, "ExhibitionSList").setItems(museumNameAltStringList ); }
    else if (useNameAltBoolean == false){ cp5Object.get(ScrollableList.class, "ExhibitionSList").setItems(museumNameFullStringList); }

    return                      museumObject;

}

public ObjectMuseum FindMuseumObject(String _objectNameString)                              {

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
    
public Tag FindTagObject(String _tagName){

    Tag tempTagObject = null;
    for(int i = 0; i < subjectTagObjectList.size(); i ++){

        if(subjectTagObjectList.get(i).nameAltString     .equals(_tagName)){ tempTagObject = subjectTagObjectList.get(i); }
        if(subjectTagObjectList.get(i).nameFullString    .equals(_tagName)){ tempTagObject = subjectTagObjectList.get(i); }

    }
    for(int i = 0; i < verbTagObjectList.size(); i ++){

        if(verbTagObjectList.get(i).nameAltString     .equals(_tagName)){ tempTagObject = verbTagObjectList.get(i); }
        if(verbTagObjectList.get(i).nameFullString    .equals(_tagName)){ tempTagObject = verbTagObjectList.get(i); }

    }
    for(int i = 0; i < nounTagObjectList.size(); i ++){

        if(nounTagObjectList.get(i).nameAltString     .equals(_tagName)){ tempTagObject = nounTagObjectList.get(i); }
        if(nounTagObjectList.get(i).nameFullString    .equals(_tagName)){ tempTagObject = nounTagObjectList.get(i); }

    }
    for(int i = 0; i < adjectiveTagObjectList.size(); i ++){

        if(adjectiveTagObjectList.get(i).nameAltString     .equals(_tagName)){ tempTagObject = adjectiveTagObjectList.get(i); }
        if(adjectiveTagObjectList.get(i).nameFullString    .equals(_tagName)){ tempTagObject = adjectiveTagObjectList.get(i); }

    }
    for(int i = 0; i < adverbTagObjectList.size(); i ++){

        if(adverbTagObjectList.get(i).nameAltString     .equals(_tagName)){ tempTagObject = adverbTagObjectList.get(i); }
        if(adverbTagObjectList.get(i).nameFullString    .equals(_tagName)){ tempTagObject = adverbTagObjectList.get(i); }

    }

    return tempTagObject;

}

/*
<<A function to return an array of object tag to be put in the museum object, randomly.>>
Tag[] AssignRandomTagArray(List<Tag> _tagObjectList)                                 {

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

    List<Tag> _subjectTagObjectList     ,
    List<Tag> _verbTagObjectList        ,
    List<Tag> _nounTagObjectList        ,
    List<Tag> _adjectiveTagObjectList   ,
    List<Tag> _adverbTagObjectList

){

    /*Temporary tag object list to be returned later on this function.*/
    List<Tag> assignTagObjectList                   = new ArrayList<Tag>();
    
    AssignRandomTagLoopVoid(_subjectTagObjectList   , assignTagObjectList);
    AssignRandomTagLoopVoid(_verbTagObjectList      , assignTagObjectList);
    AssignRandomTagLoopVoid(_nounTagObjectList      , assignTagObjectList);
    AssignRandomTagLoopVoid(_adjectiveTagObjectList , assignTagObjectList);
    AssignRandomTagLoopVoid(_adverbTagObjectList    , assignTagObjectList);

    /*Before returning the value, the object here is still in List, hence we need to convert it to array.
    Thus, it can be used in params.*/
    Tag[] assignTagObjectArray                              = new Tag[assignTagObjectList.size()];
    for(int i = 0; i < assignTagObjectArray.length; i ++)   { assignTagObjectArray[i] = assignTagObjectList.get(i); }
    
    return assignTagObjectArray;

}

/*This function is to control what will happen when mouse pointer clicked above the active element of scrollable button.*/
public void ExhibitionSList(int _indexInt)                                                 {

    List<ObjectMuseum>                  selectedMuseumObjectList            = new ArrayList<ObjectMuseum>();                                                                    /*This is a list to hold the selected object list. For example FLR_001 is selected, then this variable will be filled with floorObjectList.*/
    List<String>                        museumStringList                    = new ArrayList<String>();
    ObjectMuseum                        selectedMuseumObject                = null;                                                                                             /*This is the selected museum object. From here this application will try to modify the selected museum objects values.*/
    String                              itemScrollableString                = cp5Object.get(ScrollableList.class, "ExhibitionSList").getItem(_indexInt).get("text").toString(); /*This String is for holding the name of the selected button.*/
    String                              tempTypeString                      = "";                                                                                               /*Take the first three characters so that this application can know which can of object is selected. Alternatively you can search over selected object type String.*/
    if                                  (FindObjectMuseumIndexInt           (itemScrollableString, floorObjectList)        != -1){ tempTypeString = "FLR";    }
    else if                             (FindObjectMuseumIndexInt           (itemScrollableString, roomObjectList)         != -1){ tempTypeString = "ROM";    }
    else if                             (FindObjectMuseumIndexInt           (itemScrollableString, exhibitionObjectList)   != -1){ tempTypeString = "EXH";    }
    int                                 selectedMuseumIndexInt              = -1;                                                                                               /*The selected index of the selected object in its object list.*/

    if      (useNameAltBoolean == true )    { museumStringList = museumNameAltStringList;  }
    else if (useNameAltBoolean == false)    { museumStringList = museumNameFullStringList; }

    /*We assign the selected museum object list according to the temporary type String.*/
    if     (tempTypeString.equals("FLR")){ selectedMuseumObjectList         = floorObjectList;          }
    else if(tempTypeString.equals("ROM")){ selectedMuseumObjectList         = roomObjectList;           }
    else if(tempTypeString.equals("EXH")){ selectedMuseumObjectList         = exhibitionObjectList;     }

    /*The for loop below is for assigning which museum object is actually selected*/
    for(int i = 0; i < museumStringList.size(); i ++){

        /*Compare every possible String in the museum String list with the selected scrollable String.*/
        if(museumStringList.get(i)                                          == itemScrollableString){

            /*If the String match we will take the index of name of the object inside the museum String list.*/
            for(int j = 0; j < selectedMuseumObjectList.size(); j ++)       {

                /*Iterate once more to to find the named object inside its object list.
                After this done, we get access to the object local and public variables and functions.*/
                if(selectedMuseumObjectList.get(j).nameAltString            == museumStringList.get(i)){ selectedMuseumObject = selectedMuseumObjectList.get(j); }
                if(selectedMuseumObjectList.get(j).nameFullString           == museumStringList.get(i)){ selectedMuseumObject = selectedMuseumObjectList.get(j); }

            }

            /*Return the object index inside the museum String list.
            This variable is for determining the layout later on within the scrollable dropdown list.*/
            selectedMuseumIndexInt                                          = i + 1;

        }

    }
    /*After we get the "selected object" object.
    We will revert its active boolean variable.
    We will keep reverting this for everytime the selected object is clicked.*/
    selectedMuseumObject.activeBoolean                                      = !selectedMuseumObject.activeBoolean;

    /*If the selected museum object active boolean is true then add all of its children (if any) to the scrollable drop list.*/
    if     (selectedMuseumObject.activeBoolean == true){

        /*Iterate all children objects and add all of it to the museum String list.
        We need to set (delete the previous ones and initiate the new ones) the children to the museum String list according to the index position of the parent in the museum String list.*/
        for(

           int i    = selectedMuseumObject.childObjectList.size() - 1;
           i        >= 0;
           i        --

        ){

            museumNameAltStringList .add(selectedMuseumIndexInt, selectedMuseumObject.childObjectList.get(i).nameAltString );
            museumNameFullStringList.add(selectedMuseumIndexInt, selectedMuseumObject.childObjectList.get(i).nameFullString);

        }
        /*Set the items into the scrollable list.*/
        cp5Object.get(ScrollableList.class, "ExhibitionSList").setItems(museumStringList);

    }
    /*If the selected museum object active boolean is false then remove all of its children from the museum String List and the scrollable list.*/
    else if(selectedMuseumObject.activeBoolean == false){

        /*If close the floor we must carefully close the inner most button, in this case it is the exhibition buttons.
        We need to close the room buttons and then loop again to close the exhibition buttons.*/
        if(tempTypeString.equals("FLR")){

            for(int i = 0; i < selectedMuseumObject.childObjectList.size(); i ++){

                for(int j = 0; j < selectedMuseumObject.childObjectList.get(i).childObjectList.size(); j ++){

                    for(int k = 0; k < museumStringList.size(); k ++){

                        boolean tempBoolean         =  true;  
                        if      (useNameAltBoolean  == true )    { tempBoolean = museumStringList.get(k).equals(selectedMuseumObject.childObjectList.get(i).childObjectList.get(j).nameAltString ); }
                        else if (useNameAltBoolean  == false)    { tempBoolean = museumStringList.get(k).equals(selectedMuseumObject.childObjectList.get(i).childObjectList.get(j).nameFullString); }
                        if(tempBoolean){

                            selectedMuseumObject.childObjectList.get(i).childObjectList.get(j).activeBoolean = false;
                            if      (useNameAltBoolean == true )    { cp5Object.get(ScrollableList.class, "ExhibitionSList").removeItem(selectedMuseumObject.childObjectList.get(i).childObjectList.get(j).nameAltString ); }
                            else if (useNameAltBoolean == false)    { cp5Object.get(ScrollableList.class, "ExhibitionSList").removeItem(selectedMuseumObject.childObjectList.get(i).childObjectList.get(j).nameFullString); }
                            museumNameAltStringList .remove(k);
                            museumNameFullStringList.remove(k);
                            k --;

                        }

                    }

                }

                for(int j = 0; j < museumStringList.size(); j ++){

                    boolean tempBoolean         =  true;  
                    if      (useNameAltBoolean  == true )    { tempBoolean = museumStringList.get(j).equals(selectedMuseumObject.childObjectList.get(i).nameAltString ); }
                    else if (useNameAltBoolean  == false)    { tempBoolean = museumStringList.get(j).equals(selectedMuseumObject.childObjectList.get(i).nameFullString); }
                    if(tempBoolean){

                        selectedMuseumObject.childObjectList.get(i).activeBoolean = false;
                        if      (useNameAltBoolean == true )    { cp5Object.get(ScrollableList.class, "ExhibitionSList").removeItem(selectedMuseumObject.childObjectList.get(i).nameAltString );  }
                        else if (useNameAltBoolean == false)    { cp5Object.get(ScrollableList.class, "ExhibitionSList").removeItem(selectedMuseumObject.childObjectList.get(i).nameFullString);  }
                        museumNameAltStringList .remove(j);
                        museumNameFullStringList.remove(j);
                        j --;

                    }

                }

            }

        }
        /*If the button is not a floor button then we do not need to iterate deeper.*/
        else{

            for(int i = 0; i < selectedMuseumObject.childObjectList.size(); i ++){

                for(int j = 0; j < museumStringList.size(); j ++){

                    boolean tempBoolean         =  true;  
                    if      (useNameAltBoolean  == true )    { museumStringList.get(j).equals(selectedMuseumObject.childObjectList.get(i).nameAltString ); }
                    else if (useNameAltBoolean  == false)    { museumStringList.get(j).equals(selectedMuseumObject.childObjectList.get(i).nameFullString); }
                    if(tempBoolean){

                        selectedMuseumObject.childObjectList.get(i).activeBoolean = false;
                        if      (useNameAltBoolean == true )    { cp5Object.get(ScrollableList.class, "ExhibitionSList").removeItem(selectedMuseumObject.childObjectList.get(i).nameAltString);  }
                        else if (useNameAltBoolean == false)    { cp5Object.get(ScrollableList.class, "ExhibitionSList").removeItem(selectedMuseumObject.childObjectList.get(i).nameAltString);  }
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
/*This function is to control player scrollable list.*/
public void VisitorSList                   (int _indexInt)                                 {

    /*Assign the selected player.*/
    editPlayerGUIObject.selectedPlayerObject = playerObjectList.get(_indexInt);
    /*Change the radio button accordingly.*/
    cp5Object.get(RadioButton.class, "ModeRadioButton").activate((editPlayerGUIObject.selectedPlayerObject.editPlayerModeInt - 1));

}
/*Control function for the EditPlayerGUIObject.pde.*/              
public void ModeRadioButton                (int _intIndex)                                 {

    /*Change the mode for both in player object and in the player GUI object.*/
    editPlayerGUIObject.selectedPlayerObject.editPlayerModeInt  = _intIndex;
    editPlayerGUIObject                     .editPlayerModeInt  = _intIndex;

}
/*Function to move to new exhibition.*/
public void PleaseSelectNextExhibitionSList(int _indexInt)                                 {

    if(editPlayerGUIObject.selectedPlayerObject.editPlayerModeInt == 2){

        String          receivedString          = cp5Object.get(ScrollableList.class, "PleaseSelectNextExhibitionSList").getItem(_indexInt).get("text").toString();
        ObjectMuseum    receivedMuseumObject    = editPlayerGUIObject.selectedPlayerObject.FindObject(exhibitionObjectList, receivedString);
        editPlayerGUIObject.selectedPlayerObject.ExhibitionMoveObject(receivedMuseumObject.nameAltString);

    }

}
/*Control functions for the AddMuseumGUIObject.pde.
This function below is for to know what kind of object the class will have to make.*/
public void TypeObjectMuseumSList          (int _indexInt)                                 {

    addMuseumGUIObject.typeObjectMuseumString   = cp5Object.get(ScrollableList.class, "TypeObjectMuseumSList").getItem(_indexInt).get("text").toString();
    if      (addMuseumGUIObject.typeObjectMuseumString.equals("Floor"      ))       { addMuseumGUIObject.selectedTypeObjectString = "FLR"; }
    else if (addMuseumGUIObject.typeObjectMuseumString.equals("Room"       ))       { addMuseumGUIObject.selectedTypeObjectString = "ROM"; }
    else if (addMuseumGUIObject.typeObjectMuseumString.equals("Exhibition" ))       { addMuseumGUIObject.selectedTypeObjectString = "EXH"; }
    else                                                                            { addMuseumGUIObject.selectedTypeObjectString = addMuseumGUIObject.typeObjectMuseumString; }

}
/*These three functions is used to convert the scrollable list into scrollable checklist.*/
public void SelectTagSubjectSList          (int _indexInt)                                 { ScrollableChecklistVoid("SelectTagSubjectSList"   , _indexInt); addMuseumGUIObject.SetSelectedTagStringList(addMuseumGUIObject.tempSelectTagSubjectSList      , "SelectTagSubjectSList"   ); }
public void SelectTagVerbSList             (int _indexInt)                                 { ScrollableChecklistVoid("SelectTagVerbSList"      , _indexInt); addMuseumGUIObject.SetSelectedTagStringList(addMuseumGUIObject.tempSelectTagVerbSList         , "SelectTagVerbSList"      ); }
public void SelectTagNounSList             (int _indexInt)                                 { ScrollableChecklistVoid("SelectTagNounSList"      , _indexInt); addMuseumGUIObject.SetSelectedTagStringList(addMuseumGUIObject.tempSelectTagNounSList         , "SelectTagNounSList"      ); }
public void SelectTagAdjectiveSList        (int _indexInt)                                 { ScrollableChecklistVoid("SelectTagAdjectiveSList" , _indexInt); addMuseumGUIObject.SetSelectedTagStringList(addMuseumGUIObject.tempSelectTagAdjectiveSList    , "SelectTagAdjectiveSList" ); }
public void SelectTagAdverbSList           (int _indexInt)                                 { ScrollableChecklistVoid("SelectTagAdverbSList"    , _indexInt); addMuseumGUIObject.SetSelectedTagStringList(addMuseumGUIObject.tempSelectTagAdverbSList       , "SelectTagAdverbSList"    ); }
public void SelectParentObjectMuseumSList  (int _indexInt)                                 { addMuseumGUIObject.selectedParentString           = cp5Object.get(ScrollableList.class, "SelectParentObjectMuseumSList").getItem(_indexInt).get("text").toString(); }
/*Submit button callback function.*/
public void SubmitButton                   (int _indexInt)                                 {

    /*Put everything into temporary variables.*/
    String          tempNameAltString           = cp5Object.get(Textfield   .class, "NameAltTextfield" ).getText();
    String          tempNameFullString          = cp5Object.get(Textfield   .class, "NameFullTextfield").getText();
    String          tempParentNameAltString     = "";
    String          tempTypeString              = addMuseumGUIObject.selectedTypeObjectString; addMuseumGUIObject.selectedTypeObjectString = "";
    List<String>    tempSelectedTagStringList   = addMuseumGUIObject.selectedTagStringList;
    Tag[]           tempSelectedTagObjectArray  = new Tag[tempSelectedTagStringList.size()];

    /*Due to museum object floor will ever have no parent object, then we need to specifically set its parent object.*/
    if      ( tempTypeString.equals("FLR")) { tempParentNameAltString = "XXX_XXX";                               addMuseumGUIObject.selectedParentString = ""; }
    else if (!tempTypeString.equals("FLR")) { tempParentNameAltString = addMuseumGUIObject.selectedParentString; addMuseumGUIObject.selectedParentString = ""; }
    else                                    { tempParentNameAltString = "XXX_XXX";                               addMuseumGUIObject.selectedParentString = ""; }

    if(useNameAltBoolean == false){ tempParentNameAltString     = FindMuseumObject(tempParentNameAltString).nameAltString; }
    for(int i = 0; i < tempSelectedTagStringList.size(); i ++)  { tempSelectedTagObjectArray[i] = FindTagObject(tempSelectedTagStringList.get(i)); }

    /*Create the museum object.*/
    AddMuseumObject                         (tempNameAltString, tempNameFullString, tempParentNameAltString, tempTypeString, tempSelectedTagObjectArray);

}
/*This function below is used to "convert" scrollable list into scrollable checklist.
The arguments are the name of the controller and the index of which the controller's item is selected.*/
public void ScrollableChecklistVoid        (String _scrollableNameString, int _indexInt)   {

    /*If there is no property named isSelected in the hashmap than we need to create one.
    After that assign the isSelected value to true and also assign the color.*/
    if( cp5Object.get(ScrollableList.class, _scrollableNameString).getItem(_indexInt).get("isSelected") == null){

        cp5Object.get(ScrollableList.class, _scrollableNameString).getItem(_indexInt).put("isSelected" , true                                       );
        cp5Object.get(ScrollableList.class, _scrollableNameString).getItem(_indexInt).put("color"      , addMuseumGUIObject.sChecklistTrueCColor    );

    }
    /*If there is isSelected property than revert it between true and false everytime we clicked it and set the appropriate color scheme.*/
    else{

        boolean stateBoolean    =   cp5Object.get(ScrollableList.class, _scrollableNameString).getItem(_indexInt).get("isSelected").toString().equals("true") ? true : false;
                                    cp5Object.get(ScrollableList.class, _scrollableNameString).getItem(_indexInt).put("isSelected", !stateBoolean           );
                stateBoolean    =   cp5Object.get(ScrollableList.class, _scrollableNameString).getItem(_indexInt).get("isSelected").toString().equals("true") ? true : false;

        if      (stateBoolean == true ){ cp5Object.get(ScrollableList.class, _scrollableNameString).getItem(_indexInt).put("color", addMuseumGUIObject.sChecklistTrueCColor ); }
        else if (stateBoolean == false){ cp5Object.get(ScrollableList.class, _scrollableNameString).getItem(_indexInt).put("color", addMuseumGUIObject.sChecklistFalseCColor); }

    }

}
/*A class to creating a GUI object on adding museum object.*/


class AddMuseumGUIObject{

    /*Some variables :).*/
    int           groupBackgroundColor                ;                           /*The color of group panel group background.*/
    int           groupColorBackgroundColor           ;                           /*The title background color of panel group.*/
    int           groupColorLabelColor                ;                           /*The title font colot of the panel group.*/
    float           alphaFloat                          = 255;                      /*The opacity of this object.*/
    int             parentButtonSizeInt                 ;                           /*A variable for layout taken from the main class.*/
    int             parentDropdownObjectWidthInt        ;                           /*A variable for layout taken from the main class.*/
    int             parentDropdownObjectHeightInt       ;                           /*A variable for layout taken from the main class.*/
    int             groupLayoutOffsetInt                = 10;                       /*This object layout offset.*/
    int             groupXInt                           ;                           /*X position of this GUI object in the main class.*/
    int             groupYInt                           ;                           /*Y position of this GUI object in the main class.*/
    int             groupAddWidthInt                    ;                           /*Width of the group, dependent on screen size.*/
    int             groupAddHeightInt                   ;                           /*Fixed height of the group, you need to carefully arrange the height of this variable using pixel ruler..*/
    int             scrollableOffsetInt                 = 1;                        /*Fixed offset of scrollable list.*/
    int             scrollableWidthInt                  ;                           /*Width of every scrollable list component, dependent on group size.*/
    int             scrollableHeightInt                 ;                           /*Height of every scrollable list component, dependent group label height.*/
    int             oneLineComponentWidthInt            ;                           /*Width for every one line component like button or text field, dependent on scrollable component size.*/
    int             oneLineComponentHeightInt           ;                           /*Height for every one line component like button or text field, dependent on scrollable component size.*/
    CColor          otherCColor                         = new CColor();             /*The color for other component than the scrollableChecklist.*/
    CColor          sChecklistTrueCColor                = new CColor();             /*The color of the item when an item in scroll checklist is selected.*/
    CColor          sChecklistFalseCColor               = new CColor();             /*The color of the item when an item in scroll checklist is not selected.*/
    String          typeObjectMuseumString              = "";                       /*The type of the object that will be added, it will be either floor, room, or exhibition object.*/
    List<String>    selectedTagStringList               = new ArrayList<String>();
    List<String>    tempSelectTagSubjectSList           = new ArrayList<String>();
    List<String>    tempSelectTagVerbSList              = new ArrayList<String>();
    List<String>    tempSelectTagNounSList              = new ArrayList<String>();
    List<String>    tempSelectTagAdjectiveSList         = new ArrayList<String>();
    List<String>    tempSelectTagAdverbSList            = new ArrayList<String>();
    String          selectedParentString                = "";                       /*Variable to be used and altered in the main class.*/
    String          selectedTypeObjectString            = "";                       /*Variable to be used and altered in the main class.*/

    /*Constructor.
    PENDING: Move the parent argument into the argument for DrawVoid() method.*/
    AddMuseumGUIObject(

        int     _groupXInt                      ,
        int     _groupYInt                      ,
        int     _groupAddWidthInt               ,
        int     _groupAddHeightInt              ,
        int     _parentButtonSizeInt            ,
        int     _parentDropdownObjectWidthInt   ,
        int     _parentDropdownObjwctHeightInt

    ){

        groupXInt                               = _groupXInt;
        groupYInt                               = _groupYInt + groupLayoutOffsetInt;
        groupAddWidthInt                        = _groupAddWidthInt;
        groupAddHeightInt                       = _groupAddHeightInt;
        parentButtonSizeInt                     = _parentButtonSizeInt;
        parentDropdownObjectWidthInt            = _parentDropdownObjectWidthInt;
        parentDropdownObjectHeightInt           = _parentDropdownObjwctHeightInt;

        scrollableWidthInt                      = ((groupAddWidthInt - groupLayoutOffsetInt*4)/3);      /*Create the scrollable list width to accomodate three scrollable list in a row.*/
        scrollableHeightInt                     = ((6*groupLayoutOffsetInt) + (5*scrollableOffsetInt)); /*Create the scrollable list height to accomodate five items + header in.*/
        oneLineComponentWidthInt                = ((groupAddWidthInt - groupLayoutOffsetInt*3)/2);      /*Create the one line object width to accomodate two similar object in a row.*/
        oneLineComponentHeightInt               = groupLayoutOffsetInt;                                 /*This need to be at the same height as the layout offset or the label height.*/

        /*Set the colors, however most of controller's color will be updated every tick in the DrawVoid() function.*/
        groupBackgroundColor                    = color(50  , 60    , 57    , alphaFloat);
        groupColorBackgroundColor               = color(2   , 45    , 89    , alphaFloat);
        groupColorLabelColor                    = color(255 , 255   , 255   , alphaFloat);
        otherCColor                             .setActive          (color(0    , 170   , 255   , alphaFloat))
                                                .setBackground      (color(0    , 45    , 90    , alphaFloat))
                                                .setCaptionLabel    (color(255  , 255   , 255   , alphaFloat))
                                                .setForeground      (color(0    , 116   , 217   , alphaFloat))
                                                .setValueLabel      (color(255  , 255   , 255   , alphaFloat));
        sChecklistFalseCColor                   .setActive          (color(0    , 45    , 90    , alphaFloat))
                                                .setBackground      (color(0    , 45    , 90    , alphaFloat))
                                                .setCaptionLabel    (color(255  , 255   , 255   , alphaFloat))
                                                .setForeground      (color(0    , 116   , 217   , alphaFloat))
                                                .setValueLabel      (color(255  , 255   , 255   , alphaFloat));
        sChecklistTrueCColor                    .setActive          (color(0    , 116   , 217   , alphaFloat))
                                                .setBackground      (color(0    , 116   , 217   , alphaFloat))
                                                .setCaptionLabel    (color(255  , 255   , 255   , alphaFloat))
                                                .setForeground      (color(0    , 116   , 217   , alphaFloat))
                                                .setValueLabel      (color(255  , 255   , 255   , alphaFloat));

        if(useNameAltBoolean        == true ){

            tempSelectTagSubjectSList           = subjectTagNameAltStringList;
            tempSelectTagVerbSList              = verbTagNameAltStringList;
            tempSelectTagNounSList              = nounTagNameAltStringList;
            tempSelectTagAdjectiveSList         = adjectiveTagNameAltStringList;
            tempSelectTagAdverbSList            = adverbTagNameAltStringList;

        }
        else if(useNameAltBoolean   == false){

            tempSelectTagSubjectSList           = subjectTagNameFullStringList;
            tempSelectTagVerbSList              = verbTagNameFullStringList;
            tempSelectTagNounSList              = nounTagNameFullStringList;
            tempSelectTagAdjectiveSList         = adjectiveTagNameFullStringList;
            tempSelectTagAdverbSList            = adverbTagNameFullStringList;

        }

        /*Create the group and all components.*/
        Group   AddMuseumGroupObject            =
                cp5Object                       .addGroup               ("AddMuseumGroupObject")
                                                .setPosition            (groupXInt, groupYInt)
                                                .setWidth               (groupAddWidthInt)
                                                .setBackgroundHeight    (groupAddHeightInt)
                                                .setBackgroundColor     (groupBackgroundColor)
                                                .setColor               (otherCColor)
                                                .setColorBackground     (groupColorBackgroundColor)
                                                .setColorLabel          (groupColorLabelColor)
                                                .setLabel               ("Add Museum Object:");

                cp5Object                       .addScrollableList      ("TypeObjectMuseumSList")
                                                .setPosition            (groupLayoutOffsetInt, groupLayoutOffsetInt)
                                                .setSize                (scrollableWidthInt, scrollableHeightInt)
                                                .setGroup               (AddMuseumGroupObject)
                                                .addItems               (Arrays.asList("Floor", "Room", "Exhibition"))
                                                .setType                (ControlP5.LIST)
                                                .setColor               (otherCColor)
                                                .setLabel               ("Choose Type:");

                cp5Object                       .addScrollableList      ("SelectParentObjectMuseumSList")
                                                .setPosition            (((groupLayoutOffsetInt*2) + scrollableWidthInt), groupLayoutOffsetInt)
                                                .setSize                (((scrollableWidthInt*2) + groupLayoutOffsetInt), scrollableHeightInt)
                                                .setGroup               (AddMuseumGroupObject)
                                                .addItems               (defaultStringList)
                                                .setType                (ControlP5.LIST)
                                                .setColor               (otherCColor)
                                                .setLabel               ("Parent Object:");

                cp5Object                       .addScrollableList      ("SelectTagSubjectSList")
                                                .setPosition            (groupLayoutOffsetInt, ((groupLayoutOffsetInt*2) + scrollableHeightInt))
                                                .setSize                (scrollableWidthInt, scrollableHeightInt)
                                                .setGroup               (AddMuseumGroupObject)
                                                .addItems               (tempSelectTagSubjectSList)
                                                .setType                (ControlP5.LIST)
                                                .setColor               (sChecklistFalseCColor)
                                                .setLabel               ("Subject Tag:");

                cp5Object                       .addScrollableList      ("SelectTagVerbSList")
                                                .setPosition            (((groupLayoutOffsetInt*2) + scrollableWidthInt), ((groupLayoutOffsetInt*2) + scrollableHeightInt))
                                                .setSize                (scrollableWidthInt, scrollableHeightInt)
                                                .setGroup               (AddMuseumGroupObject)
                                                .addItems               (tempSelectTagVerbSList)
                                                .setType                (ControlP5.LIST)
                                                .setColor               (sChecklistFalseCColor)
                                                .setLabel               ("Verb Tag:");

                cp5Object                       .addScrollableList      ("SelectTagNounSList")
                                                .setPosition            (((groupLayoutOffsetInt*3) + (scrollableWidthInt*2)), ((groupLayoutOffsetInt*2) + scrollableHeightInt))
                                                .setSize                (scrollableWidthInt, scrollableHeightInt)
                                                .setGroup               (AddMuseumGroupObject)
                                                .addItems               (tempSelectTagNounSList)
                                                .setType                (ControlP5.LIST)
                                                .setColor               (sChecklistFalseCColor)
                                                .setLabel               ("Noun Tag:");

                cp5Object                       .addScrollableList      ("SelectTagAdjectiveSList")
                                                .setPosition            (((groupLayoutOffsetInt) + (scrollableWidthInt/2)), ((groupLayoutOffsetInt*3) + (scrollableHeightInt*2)))
                                                .setSize                (scrollableWidthInt, scrollableHeightInt)
                                                .setGroup               (AddMuseumGroupObject)
                                                .addItems               (tempSelectTagAdjectiveSList)
                                                .setType                (ControlP5.LIST)
                                                .setColor               (sChecklistFalseCColor)
                                                .setLabel               ("Adjective Tag:");

                cp5Object                       .addScrollableList      ("SelectTagAdverbSList")
                                                .setPosition            (((groupLayoutOffsetInt*2) + ((scrollableWidthInt/2)*3)), ((groupLayoutOffsetInt*3) + (scrollableHeightInt*2)))
                                                .setSize                (scrollableWidthInt, scrollableHeightInt)
                                                .setGroup               (AddMuseumGroupObject)
                                                .addItems               (tempSelectTagAdverbSList)
                                                .setType                (ControlP5.LIST)
                                                .setColor               (sChecklistFalseCColor)
                                                .setLabel               ("Adverb Tag:");

                cp5Object                       .addTextlabel           ("CanAddMultipleTagsTextlabel")
                                                .setPosition            (groupLayoutOffsetInt, ((groupLayoutOffsetInt*4) + (scrollableHeightInt*3)))
                                                .setGroup               (AddMuseumGroupObject)
                                                .setColor               (otherCColor)
                                                .setColorValue          (255)
                                                .setText                ("*You can add multiple tags,\nbut minimum one tag in each category.");

                cp5Object                       .addTextfield           ("NameFullTextfield")
                                                .setPosition            (groupLayoutOffsetInt, ((groupLayoutOffsetInt*7) + (scrollableHeightInt*3)))
                                                .setSize                (oneLineComponentWidthInt, (oneLineComponentHeightInt*2))
                                                .setGroup               (AddMuseumGroupObject)
                                                .setColor               (otherCColor)
                                                .setLabel               ("Name Full:");

                cp5Object                       .addTextfield           ("NameAltTextfield")
                                                .setPosition            (((groupLayoutOffsetInt*2) + oneLineComponentWidthInt), ((groupLayoutOffsetInt*7) + (scrollableHeightInt*3)))
                                                .setSize                (oneLineComponentWidthInt, (oneLineComponentHeightInt*2))
                                                .setGroup               (AddMuseumGroupObject)
                                                .setColor               (otherCColor)
                                                .setLabel               ("Name Alternative:");

                cp5Object                       .addButton              ("SubmitButton")
                                                .setPosition            (groupLayoutOffsetInt, ((groupLayoutOffsetInt*10) + (scrollableHeightInt*3) + oneLineComponentHeightInt))
                                                .setSize                (((oneLineComponentWidthInt*2) + groupLayoutOffsetInt), oneLineComponentHeightInt)
                                                .setGroup               (AddMuseumGroupObject)
                                                .setColor               (otherCColor)
                                                .setLabel               ("Submit");

        /*DEBUG.*/
        /*
        println("AddMuseumGroupObject\t\t"                              + cp5Object.get(Group.class         , "AddMuseumGroupObject"            ).getColor());
        println("TypeObjectMuseumSList\t\t"                             + cp5Object.get(ScrollableList.class, "TypeObjectMuseumSList"           ).getColor());
        println("SelectParentObjectMuseumSList\t"                       + cp5Object.get(ScrollableList.class, "SelectParentObjectMuseumSList"   ).getColor());
        println("SelectTagSubjectSList\t\t"                             + cp5Object.get(ScrollableList.class, "SelectTagSubjectSList"           ).getColor());
        println("SelectTagVerbSList\t\t"                                + cp5Object.get(ScrollableList.class, "SelectTagVerbSList"              ).getColor());
        println("SelectTagNounSList\t\t"                                + cp5Object.get(ScrollableList.class, "SelectTagNounSList"              ).getColor());
        println("CanAddMultipleTagsTextlabel\t"                         + cp5Object.get(Textlabel.class     , "CanAddMultipleTagsTextlabel"     ).getColor());
        println("NameFullTextfield\t\t"                                 + cp5Object.get(Textfield.class     , "NameFullTextfield"               ).getColor());
        println("NameAltTextfield\t\t"                                  + cp5Object.get(Textfield.class     , "NameAltTextfield"                ).getColor());
        println("SubmitButton\t\t\t"                                    + cp5Object.get(Button.class        , "SubmitButton"                    ).getColor());
        */

    }

    public void DrawVoid(float _alphaFloat)        {

        /*For ebery tick/frame make sure to sync this object with the value received from the main class.*/
        alphaFloat                  = _alphaFloat;

        /*Show/hide controller based on the alpha value received from the main class.*/
        if                          (alphaFloat >  (255f/45f)){ cp5Object.get(Group         .class  , "AddMuseumGroupObject"            ).show(); }
        else if                     (alphaFloat <= (255f/45f)){ cp5Object.get(Group         .class  , "AddMuseumGroupObject"            ).hide(); }
        groupBackgroundColor        = color             (50         , 60    , 57    , alphaFloat + (255f/45f));
        groupColorBackgroundColor   = color             (2          , 45    , 89    , alphaFloat + (255f/45f));
        groupColorLabelColor        = color             (255        , 255   , 255   , alphaFloat + (255f/45f));
        otherCColor                 .setActive          (color(0    , 170   , 255   , alphaFloat))
                                    .setBackground      (color(0    , 45    , 90    , alphaFloat))
                                    .setCaptionLabel    (color(255  , 255   , 255   , alphaFloat))
                                    .setForeground      (color(0    , 116   , 217   , alphaFloat))
                                    .setValueLabel      (color(255  , 255   , 255   , alphaFloat));
        sChecklistFalseCColor       .setActive          (color(0    , 45    , 90    , alphaFloat))
                                    .setBackground      (color(0    , 45    , 90    , alphaFloat))
                                    .setCaptionLabel    (color(255  , 255   , 255   , alphaFloat))
                                    .setForeground      (color(0    , 116   , 217   , alphaFloat))
                                    .setValueLabel      (color(255  , 255   , 255   , alphaFloat));
        sChecklistTrueCColor        .setActive          (color(0    , 116   , 217   , alphaFloat))
                                    .setBackground      (color(0    , 116   , 217   , alphaFloat))
                                    .setCaptionLabel    (color(255  , 255   , 255   , alphaFloat))
                                    .setForeground      (color(0    , 116   , 217   , alphaFloat))
                                    .setValueLabel      (color(255  , 255   , 255   , alphaFloat));

        /*Especially for group controller you need to adjust four methods instead of just one methods.*/
        cp5Object.get(Group         .class  , "AddMuseumGroupObject"            ).setBackgroundColor    (groupBackgroundColor);
        cp5Object.get(Group         .class  , "AddMuseumGroupObject"            ).setColor              (otherCColor);
        cp5Object.get(Group         .class  , "AddMuseumGroupObject"            ).setColorBackground    (groupColorBackgroundColor);
        cp5Object.get(Group         .class  , "AddMuseumGroupObject"            ).setColorLabel         (groupColorLabelColor);

        /*The rest of the controller you only need to adjust for one method, which is setColor().*/
        cp5Object.get(ScrollableList.class  , "TypeObjectMuseumSList"           ).setColor              (otherCColor            );
        cp5Object.get(ScrollableList.class  , "SelectParentObjectMuseumSList"   ).setColor              (otherCColor            );
        cp5Object.get(ScrollableList.class  , "SelectTagSubjectSList"           ).setColor              (sChecklistFalseCColor  );
        cp5Object.get(ScrollableList.class  , "SelectTagVerbSList"              ).setColor              (sChecklistFalseCColor  );
        cp5Object.get(ScrollableList.class  , "SelectTagNounSList"              ).setColor              (sChecklistFalseCColor  );
        cp5Object.get(Textlabel     .class  , "CanAddMultipleTagsTextlabel"     ).setColor              (otherCColor            );
        cp5Object.get(Textfield     .class  , "NameFullTextfield"               ).setColor              (otherCColor            );
        cp5Object.get(Textfield     .class  , "NameAltTextfield"                ).setColor              (otherCColor            );
        cp5Object.get(Button        .class  , "SubmitButton"                    ).setColor              (otherCColor            );

        /*This to re - set SelectParentObjectMuseumSList so that it display options according to the TypeObjectMuseumSList selection.*/
        if      (useNameAltBoolean == true ){

            if      (typeObjectMuseumString.equals("Floor"      )){ cp5Object.get(ScrollableList.class, "SelectParentObjectMuseumSList").setItems(defaultStringList         ); typeObjectMuseumString = ""; }
            else if (typeObjectMuseumString.equals("Room"       )){ cp5Object.get(ScrollableList.class, "SelectParentObjectMuseumSList").setItems(floorNameAltStringList    ); typeObjectMuseumString = ""; }
            else if (typeObjectMuseumString.equals("Exhibition" )){ cp5Object.get(ScrollableList.class, "SelectParentObjectMuseumSList").setItems(roomNameAltStringList     ); typeObjectMuseumString = ""; }

        }
        else if (useNameAltBoolean == false){

            if      (typeObjectMuseumString.equals("Floor"      )){ cp5Object.get(ScrollableList.class, "SelectParentObjectMuseumSList").setItems(defaultStringList         ); typeObjectMuseumString = ""; }
            else if (typeObjectMuseumString.equals("Room"       )){ cp5Object.get(ScrollableList.class, "SelectParentObjectMuseumSList").setItems(floorNameFullStringList   ); typeObjectMuseumString = ""; }
            else if (typeObjectMuseumString.equals("Exhibition" )){ cp5Object.get(ScrollableList.class, "SelectParentObjectMuseumSList").setItems(roomNameFullStringList    ); typeObjectMuseumString = ""; }

        }


        /*This code below is for controlling controllers outside of this class.
        These two if statements is for controlling the position of the other object in the same open close button.*/
        if      (cp5Object.get(Group.class, "AddMuseumGroupObject").isOpen() == true ){

                /*Change the position when the group object is open.*/
                 cp5Object.get(ScrollableList.class, "ExhibitionSList").setPosition(

                    (width -  guiOffsetInt      - (parentButtonSizeInt/2) - parentDropdownObjectWidthInt    ),
                    (        (guiOffsetInt*1.5f) + (parentButtonSizeInt/2) + groupAddHeightInt               )

                );
                /*Change the size when the group object is open.*/
                 cp5Object.get(ScrollableList.class, "ExhibitionSList").setSize(

                    parentDropdownObjectWidthInt,
                    parentDropdownObjectHeightInt - groupAddHeightInt

                );
                
        }
        else if (cp5Object.get(Group.class, "AddMuseumGroupObject").isOpen() == false){

                /*Change the position when the group object is close.*/
                 cp5Object.get(ScrollableList.class, "ExhibitionSList").setPosition(

                    (width -  guiOffsetInt - (parentButtonSizeInt/2) - parentDropdownObjectWidthInt ),
                    (         guiOffsetInt + (parentButtonSizeInt/2) + groupLayoutOffsetInt         )

                );
                /*Change the size when the group object is close.*/
                 cp5Object.get(ScrollableList.class, "ExhibitionSList").setSize(

                    parentDropdownObjectWidthInt  ,
                    parentDropdownObjectHeightInt

                );

        }

    }

    /*This function is to put every selected tags into a String List.*/
    public void SetSelectedTagStringList(

        List<String>    _specificTagStringList ,
        String          _controllerName

    ){

        /*Iterate through all the list elements.*/
        for(int i = 0; i < _specificTagStringList.size(); i ++){

            /*Check if there is property in the hash map named "isSelected".*/
            if      (cp5Object.get(ScrollableList.class, _controllerName).getItem(i).get("isSelected") != null){

                /*If there is a properties called "isSelected" and it is returned true then add the selected "text" properties into the String list if only
                    it is not yet inside the list.
                PENDING: Implementation of HashSet could be more suitable here instead of using List.*/
                if      (cp5Object.get(ScrollableList.class, _controllerName).getItem(i).get("isSelected").toString().equals("true" )){

                    if(!selectedTagStringList.contains(cp5Object.get(ScrollableList.class, _controllerName).getItem(i).get("text").toString())){

                        selectedTagStringList.add(cp5Object.get(ScrollableList.class, _controllerName).getItem(i).get("text").toString());

                    }

                }
                /*If "isSelected" is false then delete the element from the list.*/
                else if (cp5Object.get(ScrollableList.class, _controllerName).getItem(i).get("isSelected").toString().equals("false")){

                    selectedTagStringList.remove(cp5Object.get(ScrollableList.class, _controllerName).getItem(i).get("text").toString()); 

                }

            }

        }

    }

}



class AddPlayerGUIObject{

	/*Add three color for the background color.*/
	int 		groupBackgroundColor			;					/*The color of group panel group background.*/
    int 		groupColorBackgroundColor 		;					/*The title background color of panel group.*/
    int 		groupColorLabelColor 			; 					/*The title font colot of the panel group.*/
    /*Add transparency variable.*/
    float		alphaFloat 						= 255;				/*The opacity for this object.*/
	int			groupXInt						;					/*The x position of this graphical user interface.*/
    int			groupYInt						;					/*The x position of this graphical user interface.*/
    int			groupLayoutOffsetInt			= 10;				/*This object offset.*/
    int			groupWidthInt					;					/*This object width.*/
	int			groupHeightInt					;					/*This object height.*/
    int			parentButtonSizeInt				;					/*A variable for layout taken from the main class.*/
    int			parentDropdownObjectWidthInt	;					/*A variable for layout taken from the main class.*/
    int			parentDropdownObjectHeightInt	;					/*A variable for layout taken from the main class.*/
    int			scrollableWidthInt				;
	int			scrollableHeightInt				= 62;
	CColor 		otherCColor						= new CColor();		/*The color for other component than the scrollableChecklist.*/
	ControlP5 	cp5Object 						;

	AddPlayerGUIObject(

		PApplet _pApplet						,
		int     _groupXInt                      ,
        int     _groupYInt                      ,
        int     _groupWidthInt               	,
        int     _groupHeightInt              	,
        int     _parentButtonSizeInt            ,
        int     _parentDropdownObjectWidthInt   ,
        int     _parentDropdownObjwctHeightInt

	){

		cp5Object 						= new ControlP5(_pApplet);

		groupXInt 						= _groupXInt;
		groupYInt 						= _groupYInt + groupLayoutOffsetInt;
		groupWidthInt 					= _groupWidthInt;
		groupHeightInt 					= _groupHeightInt;
		parentButtonSizeInt 			= _parentButtonSizeInt;
		parentDropdownObjectWidthInt 	= _parentDropdownObjectWidthInt;
		parentDropdownObjectHeightInt 	= _parentDropdownObjwctHeightInt;

		scrollableWidthInt				= (groupWidthInt - (groupLayoutOffsetInt*2));      		/*Create the scrollable list width to accomodate three scrollable list in a row.*/

		/*Set the colors, however most of controller's color will be updated every tick in the DrawVoid() function.*/
        groupBackgroundColor			= color(50  , 60    , 57    , alphaFloat);
        groupColorBackgroundColor		= color(2   , 45    , 89    , alphaFloat);
        groupColorLabelColor			= color(255 , 255   , 255   , alphaFloat);
		otherCColor						.setActive          (color(0    , 170   , 255   , alphaFloat))
                                        .setBackground      (color(0    , 45    , 90    , alphaFloat))
                                        .setCaptionLabel    (color(255  , 255   , 255   , alphaFloat))
                                        .setForeground      (color(0    , 116   , 217   , alphaFloat))
                                        .setValueLabel      (color(255  , 255   , 255   , alphaFloat));

		if(useNameAltBoolean        == true ){



		}
		else if(useNameAltBoolean   == false){



		}

		Group   AddPlayerGroupObject		=
                cp5Object	.addGroup               ("AddPlayerGroupObject")
							.setPosition            (groupXInt, groupYInt)
                            .setWidth               (groupWidthInt)
                            .setBackgroundHeight    (groupHeightInt)
                            .setBackgroundColor     (groupBackgroundColor)
                            .setColor               (otherCColor)
                            .setColorBackground     (groupColorBackgroundColor)
                            .setColorLabel          (groupColorLabelColor)
                            .setLabel               ("Add Visitor:");

	            cp5Object	.addTextlabel           ("PlayerIndexTextlabel")
							.setPosition            (groupLayoutOffsetInt, groupLayoutOffsetInt)
							.setGroup               (AddPlayerGroupObject)
							.setColor               (otherCColor)
							.setColorValue          (255)
							.setText                ("Player Index:");

                cp5Object	.addTextlabel           ("PlayerIndexValueTextlabel")
							.setPosition            (((groupHeightInt/2) + (groupLayoutOffsetInt*2)), groupLayoutOffsetInt)
							.setGroup               (AddPlayerGroupObject)
							.setColor               (otherCColor)
							.setColorValue          (255)
							.setText                ("1");

				cp5Object	.addScrollableList      ("PickStartingExhibitionSList")
                            .setPosition            (groupLayoutOffsetInt, (groupLayoutOffsetInt*3))
                            .setSize                (scrollableWidthInt, scrollableHeightInt)
                            .setGroup               (AddPlayerGroupObject)
                            .addItems               (exhibitionNameFullStringList)
                            .setType                (ControlP5.LIST)
                            .setColor               (otherCColor)
                            .setLabel               ("Pick Starting Exhibition:");

                cp5Object	.addTextfield           ("VisitorNameTextfield")
                            .setPosition            (groupLayoutOffsetInt, ((groupLayoutOffsetInt*4) + scrollableHeightInt))
                            .setSize                (scrollableWidthInt  ,  (groupLayoutOffsetInt*2))
                            .setGroup               (AddPlayerGroupObject)
                            .setColor               (otherCColor)
                            .setLabel               ("Visitor Name:");

	            cp5Object	.addButton              ("SubmitButton")
							.setPosition            (groupLayoutOffsetInt, ((groupLayoutOffsetInt*6) + scrollableHeightInt + (groupLayoutOffsetInt*2)))
							.setSize                (scrollableWidthInt, groupLayoutOffsetInt)
							.setGroup               (AddPlayerGroupObject)
							.setColor               (otherCColor)
							.setLabel               ("Submit");

	}

	public void DrawVoid(float   _alphaFloat){

        alphaFloat                  = _alphaFloat;

        /*Show/hide controller based on the alpha value received from the main class.*/
        if                          	(alphaFloat >  (255f/45f)){ cp5Object.get(Group   .class  , "AddPlayerGroupObject"            ).show(); }
        else if                     	(alphaFloat <= (255f/45f)){ cp5Object.get(Group   .class  , "AddPlayerGroupObject"            ).hide(); }
        groupBackgroundColor        	= color             (50         , 60    , 57    , alphaFloat    + (255f/45f));
        groupColorBackgroundColor   	= color             (2          , 45    , 89    , alphaFloat    + (255f/45f));
        groupColorLabelColor        	= color             (255        , 255   , 255   , alphaFloat    + (255f/45f));
        otherCColor                 	.setActive          (color(0    , 170   , 255   , alphaFloat))
                                    	.setBackground      (color(0    , 45    , 90    , alphaFloat))
                                    	.setCaptionLabel    (color(255  , 255   , 255   , alphaFloat))
                                    	.setForeground      (color(0    , 116   , 217   , alphaFloat))
                                    	.setValueLabel      (color(255  , 255   , 255   , alphaFloat));

        /*Especially for group controller you need to adjust four methods instead of just one methods.*/
        cp5Object.get(Group             .class , "AddPlayerGroupObject"            ).setBackgroundColor    (groupBackgroundColor);
        cp5Object.get(Group             .class , "AddPlayerGroupObject"            ).setColor              (otherCColor);
        cp5Object.get(Group             .class , "AddPlayerGroupObject"            ).setColorBackground    (groupColorBackgroundColor);
        cp5Object.get(Group             .class , "AddPlayerGroupObject"            ).setColorLabel         (groupColorLabelColor);

        /*The rest of the controller you only need to adjust for one method, which is setColor().*/
        cp5Object.get(Textlabel         .class , "PlayerIndexTextlabel"				).setColor(otherCColor);
        cp5Object.get(Textlabel         .class , "PlayerIndexValueTextlabel"		).setColor(otherCColor);
        cp5Object.get(ScrollableList	.class , "PickStartingExhibitionSList"		).setColor(otherCColor);
        cp5Object.get(Textfield         .class , "VisitorNameTextfield"   			).setColor(otherCColor);
        cp5Object.get(Button    		.class , "SubmitButton"             		).setColor(otherCColor);

	}

}
/*A class for toggle open and close button.
This button will be used to open a panel made using
    P5 user interface.*/
public class ButtonOpenClose{

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






/*A class for creating GUI object for editing player movement around the museum.
PENDING: Please do not forget to create default value, so when the system starts this GUI object displays the information of the first player.*/


class EditPlayerGUIObject{

    int           groupBackgroundColor                        ;                               /*The color of group panel group background.*/
    int           groupColorBackgroundColor                   ;                               /*The title background color of panel group.*/
    int           groupColorLabelColor                        ;                               /*The title font colot of the panel group.*/
    /*PENDING: alphaFloat is actually unecessary please delete this variable later and just directly refers the value from the arguments.*/
    float           alphaFloat                                  = 255;                          /*The opacity for this object.*/
    int             editPlayerModeInt                           = 2;                            /*Whether the selected player object is controlled by AI, manual control, or hardware control.*/
    int             playerGroupXInt                             ;                               /*The x position of this graphical user interface.*/
    int             playerGroupYInt                             ;                               /*The x position of this graphical user interface.*/
    int             parentButtonSizeInt                         ;                               /*A variable for layout taken from the main class.*/
    int             parentDropdownObjectWidthInt                ;                               /*A variable for layout taken from the main class.*/
    int             parentDropdownObjectHeightInt               ;                               /*A variable for layout taken from the main class.*/
    int             groupLayoutOffsetInt                        = 10;                           /*This object offset.*/
    //int           playerGroupWidthInt                         = (width/3);                    /*This object width.*/
    int             playerGroupWidthInt                         ;                               /*This object width.*/
    //int           playerGroupHeightInt                        = (367 + 2);                    /*Additional 2 to fix layouting error in the radio buttons.*/
    int             playerGroupHeightInt                        ;                               /*This object height.*/
    int             playerScrollableListHeightInt               = 62;                           /*Height of scrollable list controller in this object that has five rows.*/
    int             playerScrollableListHeight3Int              = 50;                           /*Height of scrollable list controller in this object that has three rows.*/
    CColor          otherCColor                                 = new CColor();                 /*The color for other component than the scrollableChecklist.*/
    CColor          sListStaticCColor                           = new CColor();                 /*The color of the scrollable list that has no interaction (User cannot choose the elements).*/
    /*Determine whether to display object name in full name or in alternate name.*/
    String          tempPlayerExhibitionCurrentValueTextlabel   = "";
    List<String>    tempPlayerExhibitionTargetSList             = new ArrayList<String>();
    List<String>    tempPlayerExhibitionVisitedSList            = new ArrayList<String>();
    List<String>    tempPlayerTagSList                          = new ArrayList<String>();
    List<String>    tempPleaseSelectNextExhibitionSList         = new ArrayList<String>();
    ObjectPlayer    selectedPlayerObject                        = null;                     /*Selected object player from this graphical user interface.*/
    //ObjectPlayer  selectedPlayerPrevObject                    = null;                     /*Selected object player from this graphical user interface.*/

    /*Constructor.*/
    EditPlayerGUIObject     (

        int _playerGroupXInt                ,
        int _playerGroupYInt                ,
        int _playerGroupWidthInt            ,
        int _playerGroupHeightInt           ,
        int _parentButtonSizeInt            ,
        int _parentDropdownObjectWidthInt   ,
        int _parentDropdownObjwctHeightInt

    ){

        /*Fill the argument in.*/
        playerGroupXInt                         = _playerGroupXInt;
        playerGroupYInt                         = _playerGroupYInt + groupLayoutOffsetInt;
        playerGroupWidthInt                     = _playerGroupWidthInt;
        playerGroupHeightInt                    = _playerGroupHeightInt;
        parentButtonSizeInt                     = _parentButtonSizeInt;
        parentDropdownObjectWidthInt            = _parentDropdownObjectWidthInt;
        parentDropdownObjectHeightInt           = _parentDropdownObjwctHeightInt;

        /*Set the colors, however most of controller's color will be updated every tick in the DrawVoid() function.*/
        groupBackgroundColor                    = color(50  , 60    , 57    , alphaFloat);
        groupColorBackgroundColor               = color(2   , 45    , 89    , alphaFloat);
        groupColorLabelColor                    = color(255 , 255   , 255   , alphaFloat);
        otherCColor                             .setActive          (color(0    , 170   , 255   , alphaFloat))
                                                .setBackground      (color(0    , 45    , 90    , alphaFloat))
                                                .setCaptionLabel    (color(255  , 255   , 255   , alphaFloat))
                                                .setForeground      (color(0    , 116   , 217   , alphaFloat))
                                                .setValueLabel      (color(255  , 255   , 255   , alphaFloat));
        sListStaticCColor                       .setActive          (color(0    , 45    , 90    , alphaFloat))
                                                .setBackground      (color(0    , 45    , 90    , alphaFloat))
                                                .setCaptionLabel    (color(255  , 255   , 255   , alphaFloat))
                                                .setForeground      (color(0    , 45    , 90    , alphaFloat))
                                                .setValueLabel      (color(255  , 255   , 255   , alphaFloat));

        /*Set the default player object.*/
        selectedPlayerObject                    = playerObjectList.get(0);

        if(useNameAltBoolean        == true ){

            tempPlayerExhibitionCurrentValueTextlabel               = selectedPlayerObject.exhibitionCurrentObject.nameAltString;
            tempPlayerExhibitionTargetSList                         = selectedPlayerObject.exhibitionTargetNameAltStringList;
            tempPlayerExhibitionVisitedSList                        = selectedPlayerObject.exhibitionVisitedNameAltStringList;
            tempPlayerTagSList                                      = selectedPlayerObject.exhibitionTagCounterNameAltStringList;
            tempPleaseSelectNextExhibitionSList                     = exhibitionNameAltStringList;

        }
        else if(useNameAltBoolean   == false){

            tempPlayerExhibitionCurrentValueTextlabel               = selectedPlayerObject.exhibitionCurrentObject.nameFullString;
            tempPlayerExhibitionTargetSList                         = selectedPlayerObject.exhibitionTargetNameFullStringList;
            tempPlayerExhibitionVisitedSList                        = selectedPlayerObject.exhibitionVisitedNameFullStringList;
            tempPlayerTagSList                                      = selectedPlayerObject.exhibitionTagCounterNameFullStringList;
            tempPleaseSelectNextExhibitionSList                     = exhibitionNameFullStringList;

        }

        Group   EditPlayerGroupObject               = 
                cp5Object   .addGroup               ("EditPlayerGroupObject")
                            //.setPosition          (((width/2) - (playerGroupWidthInt/2)), ((height/2) - (playerGroupHeightInt/2)))
                            .setPosition            (playerGroupXInt, playerGroupYInt)
                            .setWidth               (playerGroupWidthInt)
                            .setBackgroundHeight    (playerGroupHeightInt)
                            .setBackgroundColor     (groupBackgroundColor)
                            .setColor               (otherCColor)
                            .setColorBackground     (groupColorBackgroundColor)
                            .setColorLabel          (groupColorLabelColor)
                            .setLabel               ("Edit Player Object:");

                /*PENDING - DONE: Create the text panel. Many text panel!!!*/
                cp5Object   .addTextlabel           ("PlayerIndexTextlabel")
                            .setPosition            (groupLayoutOffsetInt, (groupLayoutOffsetInt*1))
                            .setGroup               (EditPlayerGroupObject)
                            .setColor               (otherCColor)
                            .setColorValue          (255)
                            .setText                ("Player Index:");

                cp5Object   .addTextlabel           ("PlayerIndexValueTextlabel")
                            .setPosition            (((playerGroupWidthInt/2) + (groupLayoutOffsetInt/2)), (groupLayoutOffsetInt*1))
                            .setGroup               (EditPlayerGroupObject)
                            .setColor               (otherCColor)
                            .setColorValue          (255)
                            .setText                ("" + selectedPlayerObject.playerIndexInt);

                cp5Object   .addTextlabel           ("PlayerExhibitionCurrentTextlabel")
                            .setPosition            (groupLayoutOffsetInt, (groupLayoutOffsetInt*2))
                            .setGroup               (EditPlayerGroupObject)
                            .setColor               (otherCColor)
                            .setColorValue          (255)
                            .setText                ("Player Current Exhibition:");

                cp5Object   .addTextlabel           ("PlayerExhibitionCurrentValueTextlabel")
                            .setPosition            (((playerGroupWidthInt/2) + (groupLayoutOffsetInt/2)), (groupLayoutOffsetInt*2))
                            .setGroup               (EditPlayerGroupObject)
                            .setColor               (otherCColor)
                            .setColorValue          (255)
                            .setText                (tempPlayerExhibitionCurrentValueTextlabel);

                /*PENDING - DONE: Please make this unselectable.*/
                cp5Object   .addScrollableList      ("PlayerExhibitionTargetSList")
                            .setPosition            (groupLayoutOffsetInt,  (groupLayoutOffsetInt*4))
                            .setSize                ((playerGroupWidthInt - (groupLayoutOffsetInt*2)), playerScrollableListHeight3Int)
                            .setGroup               (EditPlayerGroupObject)
                            .addItems               (tempPlayerExhibitionTargetSList)
                            .setType                (ControlP5.LIST)
                            .setColor               (sListStaticCColor)
                            .setLabel               ("Player Target Exhibitions:");

                /*PENDING - DONE: Please make this unselectable.*/
                cp5Object   .addScrollableList      ("PlayerExhibitionVisitedSList")
                            .setPosition            (groupLayoutOffsetInt,  (groupLayoutOffsetInt*5) + playerScrollableListHeight3Int)
                            .setSize                ((playerGroupWidthInt - (groupLayoutOffsetInt*2)), playerScrollableListHeightInt)
                            .setGroup               (EditPlayerGroupObject)
                            .addItems               (tempPlayerExhibitionVisitedSList)
                            .setType                (ControlP5.LIST)
                            .setColor               (sListStaticCColor)
                            .setLabel               ("Player Visited Exhibitions:");

                cp5Object   .addScrollableList      ("PlayerTagSList")
                            .setPosition            (groupLayoutOffsetInt,  (groupLayoutOffsetInt*6) + playerScrollableListHeight3Int + playerScrollableListHeightInt)
                            .setSize                ((playerGroupWidthInt - (groupLayoutOffsetInt*2)), playerScrollableListHeightInt)
                            .setGroup               (EditPlayerGroupObject)
                            .addItems               (tempPlayerTagSList)
                            .setType                (ControlP5.LIST)
                            .setColor               (sListStaticCColor)
                            .setLabel               ("Player Collected Tags:");

                cp5Object   .addTextlabel           ("ModeTextlabel")
                            .setPosition            (groupLayoutOffsetInt, ((groupLayoutOffsetInt*7) + playerScrollableListHeight3Int + (playerScrollableListHeightInt*2)))
                            .setGroup               (EditPlayerGroupObject)
                            .setColor               (otherCColor)
                            .setColorValue          (255)
                            .setText                ("Modes:");

                /*PENDING - DONE: Adding radio buttons to select mode on how player should be moved.*/
                cp5Object   .addRadioButton         ("ModeRadioButton")
                            .setPosition            (groupLayoutOffsetInt, ((groupLayoutOffsetInt*8) + playerScrollableListHeight3Int + (playerScrollableListHeightInt*2)))
                            .setSize                (groupLayoutOffsetInt, groupLayoutOffsetInt)
                            .setGroup               (EditPlayerGroupObject)
                            .addItem                ("Software - Auto"  , 1)
                            .addItem                ("Software - Manual", 2)
                            .addItem                ("hardware - Manual", 3)
                            .activate               (1);

                cp5Object   .addScrollableList      ("PleaseSelectNextExhibitionSList")
                            .setPosition            (groupLayoutOffsetInt, ((groupLayoutOffsetInt*12) + playerScrollableListHeight3Int + (playerScrollableListHeightInt*2) + 2))    /*Additional 2 to fix layouting error in the radio buttons.*/
                            .setSize                ((playerGroupWidthInt - (groupLayoutOffsetInt*2 )), 64)
                            .setGroup               (EditPlayerGroupObject)
                            .addItems               (tempPleaseSelectNextExhibitionSList)
                            .setType                (ControlP5.LIST)
                            .setColor               (otherCColor)
                            .setLabel               ("Please Select Next Exhibition:");

    }

    public void DrawVoid           (

        boolean _buttonOpenClosePlayerBoolean,
        float   _alphaFloat

    ){

        if(useNameAltBoolean        == true ){

            tempPlayerExhibitionCurrentValueTextlabel               = selectedPlayerObject.exhibitionCurrentObject.nameAltString;
            tempPlayerExhibitionTargetSList                         = selectedPlayerObject.exhibitionTargetNameAltStringList;
            tempPlayerExhibitionVisitedSList                        = selectedPlayerObject.exhibitionVisitedNameAltStringList;
            tempPlayerTagSList                                      = selectedPlayerObject.exhibitionTagCounterNameAltStringList;
            tempPleaseSelectNextExhibitionSList                     = exhibitionNameAltStringList;

        }
        else if(useNameAltBoolean   == false){

            tempPlayerExhibitionCurrentValueTextlabel               = selectedPlayerObject.exhibitionCurrentObject.nameFullString;
            tempPlayerExhibitionTargetSList                         = selectedPlayerObject.exhibitionTargetNameFullStringList;
            tempPlayerExhibitionVisitedSList                        = selectedPlayerObject.exhibitionVisitedNameFullStringList;
            tempPlayerTagSList                                      = selectedPlayerObject.exhibitionTagCounterNameFullStringList;
            tempPleaseSelectNextExhibitionSList                     = exhibitionNameFullStringList;

        }

        /*If there is a button open close for player is close then we need to reset the reference to the selected object.*/
        if(_buttonOpenClosePlayerBoolean    == false){ selectedPlayerObject = playerObjectList.get(0); }
        /*If selected player object is not null than populate the controller using the value of the selected player object.*/
        if(selectedPlayerObject             != null ){

            cp5Object.get(Textlabel         .class, "PlayerIndexValueTextlabel"             )   .setText (("" + selectedPlayerObject.playerIndexInt));
            cp5Object.get(Textlabel         .class, "PlayerExhibitionCurrentValueTextlabel" )   .setText ((     tempPlayerExhibitionCurrentValueTextlabel));
            cp5Object.get(ScrollableList    .class, "PlayerExhibitionTargetSList"           )   .setItems((     tempPlayerExhibitionTargetSList));
            cp5Object.get(ScrollableList    .class, "PlayerExhibitionVisitedSList"          )   .setItems((     tempPlayerExhibitionVisitedSList));
            cp5Object.get(ScrollableList    .class, "PlayerTagSList"                        )   .setItems((     tempPlayerTagSList));
            cp5Object.get(ScrollableList    .class, "PleaseSelectNextExhibitionSList"       )   .setItems((     tempPleaseSelectNextExhibitionSList));

        }

        alphaFloat                  = _alphaFloat;

        /*Show/hide controller based on the alpha value received from the main class.*/
        if                          (alphaFloat >  (255f/45f)){ cp5Object.get(Group   .class  , "EditPlayerGroupObject"            ).show(); }
        else if                     (alphaFloat <= (255f/45f)){ cp5Object.get(Group   .class  , "EditPlayerGroupObject"            ).hide(); }
        groupBackgroundColor        = color             (50         , 60    , 57    , alphaFloat    + (255f/45f));
        groupColorBackgroundColor   = color             (2          , 45    , 89    , alphaFloat    + (255f/45f));
        groupColorLabelColor        = color             (255        , 255   , 255   , alphaFloat    + (255f/45f));
        otherCColor                 .setActive          (color(0    , 170   , 255   , alphaFloat))
                                    .setBackground      (color(0    , 45    , 90    , alphaFloat))
                                    .setCaptionLabel    (color(255  , 255   , 255   , alphaFloat))
                                    .setForeground      (color(0    , 116   , 217   , alphaFloat))
                                    .setValueLabel      (color(255  , 255   , 255   , alphaFloat));
        sListStaticCColor           .setActive          (color(0    , 45    , 90    , alphaFloat))
                                    .setBackground      (color(0    , 45    , 90    , alphaFloat))
                                    .setCaptionLabel    (color(255  , 255   , 255   , alphaFloat))
                                    .setForeground      (color(0    , 45    , 90    , alphaFloat))
                                    .setValueLabel      (color(255  , 255   , 255   , alphaFloat));

        /*Especially for group controller you need to adjust four methods instead of just one methods.*/
        cp5Object.get(Group             .class , "EditPlayerGroupObject"            ).setBackgroundColor    (groupBackgroundColor);
        cp5Object.get(Group             .class , "EditPlayerGroupObject"            ).setColor              (otherCColor);
        cp5Object.get(Group             .class , "EditPlayerGroupObject"            ).setColorBackground    (groupColorBackgroundColor);
        cp5Object.get(Group             .class , "EditPlayerGroupObject"            ).setColorLabel         (groupColorLabelColor);

        /*The rest of the controller you only need to adjust for one method, which is setColor().*/
        cp5Object.get(Textlabel         .class , "PlayerIndexTextlabel"                    ).setColor(otherCColor       );
        cp5Object.get(Textlabel         .class , "PlayerIndexValueTextlabel"               ).setColor(otherCColor       );
        cp5Object.get(Textlabel         .class , "PlayerExhibitionCurrentTextlabel"        ).setColor(otherCColor       );
        cp5Object.get(Textlabel         .class , "PlayerExhibitionCurrentValueTextlabel"   ).setColor(otherCColor       );
        cp5Object.get(ScrollableList    .class , "PlayerExhibitionTargetSList"             ).setColor(sListStaticCColor );
        cp5Object.get(ScrollableList    .class , "PlayerExhibitionVisitedSList"            ).setColor(sListStaticCColor );
        cp5Object.get(ScrollableList    .class , "PlayerTagSList"                          ).setColor(sListStaticCColor );
        cp5Object.get(Textlabel         .class , "ModeTextlabel"                           ).setColor(otherCColor       );
        cp5Object.get(RadioButton       .class , "ModeRadioButton"                         ).setColor(otherCColor       );
        cp5Object.get(ScrollableList    .class , "PleaseSelectNextExhibitionSList"         ).setColor(otherCColor       );


        /*If the user does not need the exhibition list we hide it.
        For example when the player/visitor that user currently inspecting is not in Software - Manual,
            then the scrollable list of exhibitions is not neccessary, hence we hide it.*/
        if      (editPlayerModeInt == 1){ cp5Object.get(ScrollableList.class, "PleaseSelectNextExhibitionSList").hide(); }
        else if (editPlayerModeInt == 2){ cp5Object.get(ScrollableList.class, "PleaseSelectNextExhibitionSList").show(); }
        else if (editPlayerModeInt == 3){ cp5Object.get(ScrollableList.class, "PleaseSelectNextExhibitionSList").hide(); }
        else                            { cp5Object.get(ScrollableList.class, "PleaseSelectNextExhibitionSList").hide(); }

        /*This code below is for controlling controllers outside of this class.
        These two if statements is for controlling the position of the other object in the same open close button.*/
        if      (cp5Object.get(Group.class, "EditPlayerGroupObject").isOpen() == true ){

                /*Change the position when the group object is open.*/
                 cp5Object.get(ScrollableList.class, "VisitorSList").setPosition(

                    ( guiOffsetInt      + (parentButtonSizeInt/2)),
                    ((guiOffsetInt*1.5f) + (parentButtonSizeInt/2) + playerGroupHeightInt    )

                );
                /*Change the size when the group object is open.*/
                 cp5Object.get(ScrollableList.class, "VisitorSList").setSize(

                    parentDropdownObjectWidthInt,
                    parentDropdownObjectHeightInt - playerGroupHeightInt

                );
                
        }
        else if (cp5Object.get(Group.class, "EditPlayerGroupObject").isOpen() == false){

                /*Change the position when the group object is close.*/
                 cp5Object.get(ScrollableList.class, "VisitorSList").setPosition(

                    (guiOffsetInt + (parentButtonSizeInt/2)                         ),
                    (guiOffsetInt + (parentButtonSizeInt/2) + groupLayoutOffsetInt  )

                );
                /*Change the size when the group object is close.*/
                 cp5Object.get(ScrollableList.class, "VisitorSList").setSize(

                    parentDropdownObjectWidthInt  ,
                    parentDropdownObjectHeightInt

                );

        }

    }

}


/*A class for museum object.
The museum objects within this application are things that can interract with visitor.
For example floor, room, and exhibition.*/
class   ObjectMuseum                                                                    {

    List<ObjectMuseum>  childObjectList             = new ArrayList<ObjectMuseum>();    /*This list contains all possible exhibition object.*/
    List<ObjectPlayer>  childPlayerObjectList       = new ArrayList<ObjectPlayer>(); 

    int                 indexGlobalInt              = -1;                               /*This is an index number of the location of this object in its respective list.*/
    int                 indexLocalInt               = -1;                               /*This is an index number of the location of this object within its parent child object list.*/

    Name                nameObject                  = null;                             /*Name object that contains the alternative name and the full name of this object.*/
    String              nameAltString               = "";                               /*This variable is intended solely to store the alternative name of this object.*/
    String              nameFullString              = "";                               /*This variable is intended solely to store the full name of this object.*/

    ObjectMuseum        parentObject                = null;                             /*The object parent of this object, which means this object should be inside the parent object's child object list.*/
    String              parentNameAltString         = "";                               /*The alternative name of the parent object.*/
    
    String              typeString                  = "";                               /*The type of this object (the only possible values are "FLR", "ROM", and "EXH").*/

    List<Tag>           tagMuseumObjectList         = new ArrayList<Tag>();             /*Object tag list.*/
    List<String>        tagMuseumNameAltStringList  = new ArrayList<String>();          /*The tags for this museum object.*/
    List<String>        tagMuseumNameFullStringList = new ArrayList<String>();          /*The tags for this museum object.*/

    boolean             fullBoolean                 = false;                            /*Whether this museum object is full or not.*/
    int                 visitorCurrentInt           = 0;                                /*This museum object current visitor.*/
    int                 visitorTotalInt             = 0;                                /*This museum objecy total visitor.*/

    boolean             activeBoolean               = false;                            /*Variable to control ControlP5 GUI element.*/

    /*Variables of panel graphical user interfaces.*/
    boolean             hoverBoolean                = false;
    int               floorPanelColor             = color(69 , 40, 60);
    int               roomPanelColor              = color(102, 57, 49);
    int               exhibitionPanelColor        = color(143, 86, 59);
    int                 widthPanelInt               = 0;
    int                 heightPanelInt              = 0;
    int                 xPanelInt                   = 0;
    int                 yPanelInt                   = 0;
    Panel               panelObject                 = null;

    ObjectMuseum                                    (

        Name                                        _nameObject             ,
        String                                      _parentNameAltString    ,
        String                                      _typeString             ,
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

            tagMuseumNameAltStringList.add(tagMuseumObjectList.get(i).nameAltString);
            tagMuseumNameFullStringList.add(tagMuseumObjectList.get(i).nameFullString);

        }

        /*Create panel.*/
        panelObject                                 = new Panel();

    }

    /*A function to update this object museum variables over time.*/
    public void DrawVoid()                                                                     {

        SetFullBoolean  ();
        SetHoverBoolean ();
        //PanelDrawVoid ();

    }

    /*A set of functions to move this object into a new parent object.
    For initial use use SetParentObject() instead of this function!.*/
    public void SetParentVoid(

        List<ObjectMuseum>  _targetObjectList       , 
        String              _parentNameAltString

    ){

        RemoveChildObjectList       (_targetObjectList      );
        SetParentNameAltString      (_parentNameAltString   );
        SetInitialParentObject      (_targetObjectList      );
        SetChildObjectList          (_targetObjectList      );
        SetIndexAllInsideVoid       ();

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

            //widthPanelInt = (width - (layoutOffsetSideInt*2));
            widthPanelInt   = (width - (layoutOffsetSideInt*2) - (layoutOffsetInt*floorObjectList.size()))/floorObjectList.size();
            heightPanelInt  = (height - ((layoutOffsetInt*layoutTotalRowInt) + layoutOffsetInt))/layoutTotalRowInt;
            xPanelInt       = layoutOffsetSideInt + (indexGlobalInt*widthPanelInt) + (indexGlobalInt*layoutOffsetInt);
            yPanelInt       = layoutOffsetInt;

            if      (widthPanelInt <= 10 ){ widthPanelInt = 10;  }
            else if (heightPanelInt <= 10){ heightPanelInt = 10; }

        }

        /*PENDING: Noise error here.*/
        //if(nameAltString.equals("EXH_TES")){ println(parentObject.childObjectList.size()); }

        else if     (typeString.equals("ROM") || typeString.equals("EXH")){

            widthPanelInt   = ((parentObject.widthPanelInt - ((parentObject.childObjectList.size() - 1)*layoutOffsetInt))/parentObject.childObjectList.size());
            heightPanelInt  = parentObject.heightPanelInt;
            xPanelInt       = parentObject.xPanelInt + (indexLocalInt*widthPanelInt) + (indexLocalInt*layoutOffsetInt);
            yPanelInt       = parentObject.yPanelInt + parentObject.heightPanelInt + layoutOffsetInt;

            if      (widthPanelInt <= 10 ){ widthPanelInt = 10;  }
            else if (heightPanelInt <= 10){ heightPanelInt = 10; }

        }
        
    }

    /*A function to set the threshold to determine whether this museum object is full or not.*/
    public boolean SetFullBoolean()                                                            {

        if      (fullThresholdInt   <= visitorCurrentInt)  { fullBoolean = true;  }
        else if (fullThresholdInt   >  visitorCurrentInt)  { fullBoolean = false; }

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
        return          indexLocalInt;

    }

    /*A function to remove this object from child object of its parent.*/
    public List<ObjectMuseum> RemoveChildObjectList(List<ObjectMuseum> _targetObjectList)      {

        for(int i = 0; i < parentObject.childObjectList.size(); i ++){

            if(parentObject.childObjectList.get(i).nameAltString.equals(nameAltString)){ parentObject.childObjectList.remove(i); }

        }

        return _targetObjectList;

    }

    /*A function to add the children of this object into childObjectList.*/
    public List<ObjectMuseum> SetChildObjectList(List<ObjectMuseum> _targetObjectList)         {

        if(childObjectList.size() > 0){ childObjectList.clear(); }                                                                  /*Clear the previous child object array.*/

        for(int i = 0;          i < _targetObjectList.size(); i ++){                                                                /*Itarete through all the object list to find whether or not there is a museum object that refers this object as its parent.*/

            if(nameAltString    == _targetObjectList.get(i).parentNameAltString){ childObjectList.add(_targetObjectList.get(i)); }  /*If the parent object from the _targetObjectList is the same with this object name then add the object into this object child object list.*/

        }

        return                  childObjectList;

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

    /*A function to set this object parent.*/
    public ObjectMuseum SetInitialParentObject(List<ObjectMuseum> _targetObjectList)           {

        /*Iterate through all parent object list to find this object parent object.*/
        for(int i = 0; i < _targetObjectList.size(); i ++){

            if(parentNameAltString == _targetObjectList.get(i).nameAltString){ parentObject = _targetObjectList.get(i); break; }

        }

        return parentObject;

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
    int             tagCounterInt       = -1;
    List<Integer>   tagCounterIntList   = new ArrayList<Integer>();
    String          tagNameAltString    = "";
    String          tagNameFullString   = "";
    Tag             tagObject           ;

    TagCounter(){}

    /*Getter and setter function for counting tha tags.*/
    public void    SetTagObject            (Tag    _tagObject)         { tagObject         = _tagObject; }
    public void    SetTagNameAltString     (String _tagNameAltString)  { tagNameAltString  = _tagNameAltString;    }
    public void    SetTagNameFullString    (String _tagNameFullString) { tagNameFullString = _tagNameFullString;   }
    public void    SetTagCounterIntVoid    (int    _tagCounterInt)     {

        /*I create an array becuse comparator will not working on primitive data type.
        Hence, I put the value in one element List.*/
        tagCounterInt       = _tagCounterInt;
        tagCounterIntList   = new ArrayList<Integer>();
        tagCounterIntList   .add(tagCounterInt);

    }
    public int     GetTagCounterInt        (){ return tagCounterInt;       }
    public Tag     GetTagObject            (){ return tagObject;           }
    public String  GetTagNameAltString     (){ return tagNameAltString;    }
    public String  GetTagNameFullString    (){ return tagNameFullString;   }

}

/*A class of player object.
The player object will be the class that can be either played by the user (somekind like simulation)
    or being automated.*/
class ObjectPlayer{

    String              exhibitionCurrentString                 = "";                               /*Current exhibition in String.*/
    ObjectMuseum        exhibitionCurrentObject                 = null;
    List<String>        exhibitionTargetNameAltStringList       = new ArrayList<String>();          /*Target exhibition that will be given to the player*/
    List<String>        exhibitionVisitedNameAltStringList      = new ArrayList<String>();          /*Amount of exhibition that have just visited by the player.*/
    List<String>        exhibitionTagCounterNameAltStringList   = new ArrayList<String>();          /*This is exactly the exhibitionTagCounter but with easy String coversion so that the value can be easily displayed.*/
    
    List<String>        exhibitionTargetNameFullStringList      = new ArrayList<String>();          /*Target exhibition that will be given to the player*/
    List<String>        exhibitionVisitedNameFullStringList     = new ArrayList<String>();          /*Amount of exhibition that have just visited by the player.*/
    List<String>        exhibitionTagCounterNameFullStringList  = new ArrayList<String>();          /*This is exactly the exhibitionTagCounter but with easy String coversion so that the value can be easily displayed.*/
    
    List<String>        sentenceStringList                      = new ArrayList<String>();
    List<String>        subjectCurrentPrevTagStringList         = new ArrayList<String>();
    List<String>        verb1CurrentPrevTagStringList           = new ArrayList<String>();
    List<String>        verb2CurrentPrevTagStringList           = new ArrayList<String>();
    List<String>        verb3CurrentPrevTagStringList           = new ArrayList<String>();
    List<String>        verbSCurrentPrevTagStringList           = new ArrayList<String>();
    List<String>        verbIngCurrentPrevTagStringList         = new ArrayList<String>();
    List<String>        nounCurrentPrevTagStringList            = new ArrayList<String>();
    List<String>        nounSCurrentPrevTagStringList           = new ArrayList<String>();
    List<String>        adjectiveCurrentPrevTagStringList       = new ArrayList<String>();
    List<String>        adverbCurrentPrevTagStringList          = new ArrayList<String>();
    List<TagCounter>    exhibitionTagCounterList                = new ArrayList<TagCounter>();      /*The amount of tag that have been collected by this player.*/

    int                 playerIndexInt                          = 0;                                /*Unique identifier for each player object, can be changed later to name.*/

    List<ObjectPlayer>  playerSiblingObjectList                 = new ArrayList<ObjectPlayer>();    /*How many player object are in the same exhibition.*/
    int                 playerSiblingIndexInt                   = -1;                               /*The index of this object within the List of object player sibling.*/

    int                 editPlayerModeInt                       = 2;                               /*The mode that runs this player.
                                                                                                        editPlayerMode =    1, this player controlled by AIAutoVoid.
                                                                                                        editPlayerMode =    2, this player controlled manually using this application.
                                                                                                        editPlayerMode =    3, this player controlled manually using Arduino.*/
    float               timeCurrentExhibitionFloat              = 0f;                               /*How many frame/tick this player already stay in an exhibition.*/

    /*Panel variable.*/
    boolean hoverBoolean                                        = false;
    int   panelUnfinishedColor                                = color(217, 160, 102);
    int   panelFinishedColor                                  = color(223, 113, 38 );
    int     widthPanelInt                                       = 0;
    int     heightPanelInt                                      = 0;
    int     xPanelInt                                           = 0;
    int     yPanelInt                                           = 0;
    Panel   panelObject                                         = null;

    /*Constructor.*/
    ObjectPlayer(

        int     _playerIndexInt            ,
        String  _exhibitionStartString

    ){

        playerIndexInt              = _playerIndexInt;
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

            boolean     newBoolean             = true;     /*Whether the tag is new to the array or there is already existing one.*/
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
        if(exhibitionObjectList.size()                      > exhibitionVisitedNameAltStringList.size()){

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
        //PanelDrawVoid ();

        /*PROTOTYPE: Changing player mode.*/
        if(editPlayerModeInt == 1){ AIAutoVoid(); }
        /*PROTOTYPE: Creating function to move this player manually.*/

        /*PENDING: Give the codes below in the new own method and create commentation for these code below.*/
        exhibitionTagCounterNameAltStringList .clear();
        exhibitionTagCounterNameFullStringList.clear();
        for(int i = 0; i < exhibitionTagCounterList.size(); i ++){

            String  tempTagNameAltString                = "";
            String  tempTagNameFullString               = "";
                    tempTagNameAltString                = ("(" + exhibitionTagCounterList.get(i).GetTagCounterInt() + ") " + exhibitionTagCounterList.get(i).GetTagNameAltString ());
                    tempTagNameFullString               = ("(" + exhibitionTagCounterList.get(i).GetTagCounterInt() + ") " + exhibitionTagCounterList.get(i).GetTagNameFullString());
            exhibitionTagCounterNameAltStringList       .add(tempTagNameAltString);
            exhibitionTagCounterNameFullStringList      .add(tempTagNameFullString);

        }

    }

    /*A function to populate tag string received from the current exhibition.*/
    public void PopulateTagStringList(boolean _isPreviousBoolean)                              {

        /*Determine the current exhibition.
        PENDING: Please put current exhibition, current room , and current floor to be public variable of this class.*/
        ObjectMuseum    exhibitionCurrentObject     = FindObject(exhibitionObjectList, exhibitionCurrentString);

        /*If there is a previous exhibition visited before you visit new exhibition clear all TagStringList before adding new one.*/
        if(_isPreviousBoolean == true){

            if(subjectCurrentPrevTagStringList      .size() > 0){ subjectCurrentPrevTagStringList     .clear(); }
            if(verb1CurrentPrevTagStringList        .size() > 0){ verb1CurrentPrevTagStringList       .clear(); }
            if(verb2CurrentPrevTagStringList        .size() > 0){ verb2CurrentPrevTagStringList       .clear(); }
            if(verb3CurrentPrevTagStringList        .size() > 0){ verb3CurrentPrevTagStringList       .clear(); }
            if(verbSCurrentPrevTagStringList        .size() > 0){ verbSCurrentPrevTagStringList       .clear(); }
            if(verbIngCurrentPrevTagStringList      .size() > 0){ verbIngCurrentPrevTagStringList     .clear(); }
            if(nounCurrentPrevTagStringList         .size() > 0){ nounCurrentPrevTagStringList        .clear(); }
            if(nounSCurrentPrevTagStringList        .size() > 0){ nounSCurrentPrevTagStringList       .clear(); }
            if(adjectiveCurrentPrevTagStringList    .size() > 0){ adjectiveCurrentPrevTagStringList   .clear(); }
            if(adverbCurrentPrevTagStringList       .size() > 0){ adverbCurrentPrevTagStringList      .clear(); }

        }

        /*Adding all the string into player word database.
        Here, I make sure that the word entered is always unique to the words that is already in the List.
        PENDING: Use HashSet instead of List.*/
        for(int i = 0; i < exhibitionCurrentObject.tagMuseumObjectList.size(); i ++){

            if      (exhibitionCurrentObject.tagMuseumObjectList.get(i).tagTypeString.equals("SUB")){

                if(!subjectCurrentPrevTagStringList .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagSubjectString)) { subjectCurrentPrevTagStringList.add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagSubjectString); }

            }
            else if (exhibitionCurrentObject.tagMuseumObjectList.get(i).tagTypeString.equals("VER")){

                if(!verb1CurrentPrevTagStringList       .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagVerb1String))       { verb1CurrentPrevTagStringList           .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagVerb1String);      }
                if(!verb2CurrentPrevTagStringList       .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagVerb2String))       { verb2CurrentPrevTagStringList           .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagVerb2String);      }
                if(!verb3CurrentPrevTagStringList       .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagVerb3String))       { verb3CurrentPrevTagStringList           .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagVerb3String);      }
                if(!verbSCurrentPrevTagStringList       .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagVerbSString))       { verbSCurrentPrevTagStringList           .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagVerbSString);      }
                if(!verbIngCurrentPrevTagStringList     .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagVerbIngString))     { verbIngCurrentPrevTagStringList         .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagVerbIngString);    }

            }
            else if (exhibitionCurrentObject.tagMuseumObjectList.get(i).tagTypeString.equals("NOU")){

                if(!nounCurrentPrevTagStringList        .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagNounString))        { nounCurrentPrevTagStringList            .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagNounString);       }
                if(!nounSCurrentPrevTagStringList       .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagNounSString))       { nounSCurrentPrevTagStringList           .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagNounSString);      }

            }
            else if (exhibitionCurrentObject.tagMuseumObjectList.get(i).tagTypeString.equals("ADJ")){

                if(!adjectiveCurrentPrevTagStringList   .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagAdjectiveString))   { adjectiveCurrentPrevTagStringList       .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagAdjectiveString);  }

            }
            else if (exhibitionCurrentObject.tagMuseumObjectList.get(i).tagTypeString.equals("ADV")){

                if(!adverbCurrentPrevTagStringList      .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagAdverbString))      { adverbCurrentPrevTagStringList          .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagAdverbString);     }

            }

        }

    }

    /*A function to manage this player graphical user interface.
    In this function the width, height, x position, and y position are set.*/
    public void SetPanelVariableInsideVoid()                                                   {

        /*Panel layout calculations.*/
        ObjectMuseum    exhibitionCurrentObject = FindObject(exhibitionObjectList, exhibitionCurrentString);
                        widthPanelInt           = exhibitionCurrentObject.widthPanelInt;
                        heightPanelInt          = exhibitionCurrentObject.heightPanelInt;
                        xPanelInt               = exhibitionCurrentObject.xPanelInt;
                        yPanelInt               = exhibitionCurrentObject.yPanelInt + ((playerSiblingIndexInt + 1)*heightPanelInt) + ((playerSiblingIndexInt + 1)*layoutOffsetInt);

        if      (widthPanelInt <= 10 ){ widthPanelInt = 10;  }
        else if (heightPanelInt <= 10){ heightPanelInt = 10; }
        
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
    public ObjectMuseum ExhibitionMoveObject(

        String _targetNameAltString

    ){

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

        exhibitionCurrentString                 = _targetNameAltString;                                         /*Chance the String for current exhibition.*/
        exhibitionCurrentObject                 = FindObject(exhibitionObjectList, exhibitionCurrentString);
        exhibitionVisitedNameAltStringList      .add(exhibitionCurrentObject.nameAltString );                   /*Add the current exhibition to visited exhibition list.*/
        exhibitionVisitedNameFullStringList     .add(exhibitionCurrentObject.nameFullString);
        
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

        PopulateTagStringList           (false);

        AddTagCounterVoid               (exhibitionCurrentObject);
        AddRemoveChildVoid              (true);
        
        SetExhibitionTargetNameAltStringList   ();
        SetSiblingObjectList            ();

        /*For everytime a player move to another exhibition iterate through all player to re - add the siblings.*/
        for(int i = 0; i < playerObjectList.size(); i ++){

            playerObjectList.get(i).SetExhibitionTargetNameAltStringList   ();
            playerObjectList.get(i).SetSiblingObjectList            ();

        }

        /*If this is the second exhibition visited than put the sentence into the sentence List.
        The sentence List is will the container of every sentences that has been collected by this player.*/
        if(

            (exhibitionVisitedNameAltStringList  .size() > 1) &&
            (exhibitionVisitedNameFullStringList .size() > 1)

        ){ sentenceStringList.add(SentenceMultipleGenerateString(3)); }

        /*
        if(playerIndexInt == 1){

            println("===");
            println(subjectCurrentPrevTagStringList);
            println(verb1CurrentPrevTagStringList);
            println(verb2CurrentPrevTagStringList);
            println(verb3CurrentPrevTagStringList);
            println(verbSCurrentPrevTagStringList);
            println(verbIngCurrentPrevTagStringList);
            println(nounCurrentPrevTagStringList);
            println(nounSCurrentPrevTagStringList);
            println(adjectiveCurrentPrevTagStringList);
            println(adverbCurrentPrevTagStringList);
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

    /*Set of functions to generate sentence.
    PENDING: Make this functions into a class.*/
    public int     SentenceRandomNumberGeneratorInt    (int        _randomNumber)          { return (int)(Math.round(Math.random()*(_randomNumber - 1))); }
    public String  SentenceWordFixString               (String     _fixString)             { return _fixString.substring(0, 1).toUpperCase() + _fixString.substring(1, _fixString.length()); }
    public String  SentenceMultipleGenerateString      (int        _numberOfSentenceInt)   {

        String  textString = "";
        for     (int i = 0; i < _numberOfSentenceInt; i ++){ textString = textString + SentenceSingleGenerateString() + "\n"; }
        return  textString;

    }
    public String  SentenceSingleGenerateString        (){

        String[]    patternStringArray                          = new String[]{

            "{ % +."              ,
            "{ * to @."           ,
            "I will & { to @."

        };
        String[]    verbVerbCurrentPrevTagStringList           = new String[]{ "agree", "demand", "desire", "expect", "know how", "like", "need", "offer", "promise", "refuse", "want", "wish" };
        String[]    verbVerbSCurrentPrevTagStringList          = new String[]{ "agrees", "demands", "desires", "expects", "knows how", "likes", "needs", "offers", "promises", "refuses", "wants", "wishes" };
        String[]    adjectiveHabitCurrentPrevTagStringList     = new String[]{ "every day", "about once a week", "all the time", "as often as possible", "at least twice a week", "every evening", "every month", "every night", "every other day", "every other month", "every other week", "every third day", "every thirty minutes", "every year", "four or five times a day", "three times a day", "more than four times a month", "once a week", "once or twice a year", "three times a year", "twice a day", "twice a month" };

        String      patternString   = patternStringArray[SentenceRandomNumberGeneratorInt(patternStringArray.length)];
        String      sentenceString  = "";

        for         (int i = 0; i   < patternString.length(); i ++){

            String  scanString      = patternString.substring(i, i + 1);
            String  wordString      = "";

            if      (scanString.equals("{")){

                /*
                if(playerNameString != ""){

                    wordString          =           playerNameString;
                    if(Math.random()    <= 0.33)    { wordString = subjectCurrentPrevTagStringList[SentenceRandomNumberGeneratorInt(subjectCurrentPrevTagStringList.length)]; }

                }
                */

                wordString      = subjectCurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(subjectCurrentPrevTagStringList.size()));

            }
            else if (scanString.equals("@"))    { wordString = verb1CurrentPrevTagStringList            .get(SentenceRandomNumberGeneratorInt  (verb1CurrentPrevTagStringList           .size())); }
            else if (scanString.equals("#"))    { wordString = verb2CurrentPrevTagStringList            .get(SentenceRandomNumberGeneratorInt  (verb2CurrentPrevTagStringList           .size())); }
            else if (scanString.equals("$"))    { wordString = verb3CurrentPrevTagStringList            .get(SentenceRandomNumberGeneratorInt  (verb3CurrentPrevTagStringList           .size())); }
            else if (scanString.equals("%"))    { wordString = verbSCurrentPrevTagStringList            .get(SentenceRandomNumberGeneratorInt  (verbSCurrentPrevTagStringList           .size())); }
            else if (scanString.equals("^"))    { wordString = verbIngCurrentPrevTagStringList          .get(SentenceRandomNumberGeneratorInt  (verbIngCurrentPrevTagStringList         .size())); }
            else if (scanString.equals("&"))    { wordString = verbVerbCurrentPrevTagStringList         [SentenceRandomNumberGeneratorInt      (verbVerbCurrentPrevTagStringList        .length)]; }
            else if (scanString.equals("*"))    { wordString = verbVerbSCurrentPrevTagStringList        [SentenceRandomNumberGeneratorInt      (verbVerbSCurrentPrevTagStringList       .length)]; }
            else if (scanString.equals("("))    { wordString = nounCurrentPrevTagStringList             .get(SentenceRandomNumberGeneratorInt  (nounCurrentPrevTagStringList            .size())); }
            else if (scanString.equals(")"))    { wordString = nounSCurrentPrevTagStringList            .get(SentenceRandomNumberGeneratorInt  (nounSCurrentPrevTagStringList           .size())); }
            else if (scanString.equals("_"))    { wordString = adjectiveCurrentPrevTagStringList        .get(SentenceRandomNumberGeneratorInt  (adjectiveCurrentPrevTagStringList       .size())); }
            else if (scanString.equals("+"))    { wordString = adjectiveHabitCurrentPrevTagStringList   [SentenceRandomNumberGeneratorInt      (adjectiveHabitCurrentPrevTagStringList  .length)]; }
            else if (scanString.equals("="))    { wordString = adverbCurrentPrevTagStringList           .get(SentenceRandomNumberGeneratorInt  (adverbCurrentPrevTagStringList          .size())); }       
            else                                { wordString = scanString; }
    
            sentenceString  += wordString;

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
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "JavaProcessingMuseumManager" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
