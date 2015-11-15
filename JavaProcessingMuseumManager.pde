import controlP5.*;
import java.util.*;

boolean                 buttonOpenCloseBoolean          = false ;
ControlP5               cp5Object                       ;
ButtonOpenClose         buttonOpenCloseMuseumObject     ;
ButtonOpenClose         buttonOpenClosePlayerObject     ;

/*Determine global variables.*/
int                     playerAmountInt                 = 30;                               /*The number of players in this simulation.*/
//List<Tag>             tagObjectList                   = new ArrayList<Tag>();             /*Array List of tag.*/

List<Tag>               subjectTagObjectList            = new ArrayList<Tag>();
List<Tag>               verbTagObjectList               = new ArrayList<Tag>();
List<Tag>               negativeVerbTagObjectList       = new ArrayList<Tag>();
List<Tag>               nounTagObjectList               = new ArrayList<Tag>();
List<Tag>               adjectiveTagObjectList          = new ArrayList<Tag>();
List<Tag>               negativeAdjectiveTagObjectList  = new ArrayList<Tag>();
List<Tag>               adverbTagObjectList             = new ArrayList<Tag>();
List<Tag>               negativeAdverbTagObjectList     = new ArrayList<Tag>();

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
List<String>            subjectTagNameAltStringList             = new ArrayList<String>();
List<String>            verbTagNameAltStringList                = new ArrayList<String>();
List<String>            negativeVerbTagNameAltStringList        = new ArrayList<String>();
List<String>            nounTagNameAltStringList                = new ArrayList<String>();
List<String>            adjectiveTagNameAltStringList           = new ArrayList<String>();
List<String>            negativeAdjectiveTagNameAltStringList   = new ArrayList<String>();
List<String>            adverbTagNameAltStringList              = new ArrayList<String>();
List<String>            negativeAdverbTagNameAltStringList      = new ArrayList<String>();

List<String>            subjectTagNameFullStringList            = new ArrayList<String>();
List<String>            verbTagNameFullStringList               = new ArrayList<String>();
List<String>            negativeVerbTagNameFullStringList       = new ArrayList<String>();
List<String>            nounTagNameFullStringList               = new ArrayList<String>();
List<String>            adjectiveTagNameFullStringList          = new ArrayList<String>();
List<String>            negativeAdjectiveTagNameFullStringList  = new ArrayList<String>();
List<String>            adverbTagNameFullStringList             = new ArrayList<String>();
List<String>            negativeAdverbTagNameFullStringList     = new ArrayList<String>();

List<String>            defaultStringList               ;                                   /*When the object that you want to add has no parent, we need to show empty List of String.*/

/*GUI variables.*/
AddMuseumGroupGUIObject          addMuseumGroupGUIObject              ;
AddTagGUIObject             addTagGUIObject                 ;
AddPlayerGroupGUIObject          addPlayerGroupGUIObject              ;
RemovePlayerGUIObject       removePlayerGUIObject           ;
EditPlayerGroupGUIObject    editPlayerGroupGUIObject             ;

/*Variable to display information card when mouse pointer is hovered over either museum or player object.*/
boolean                 panelCardChangeBoolean          = true;                             /*Whether panel need to be re - created or not.*/
color                   panelCardColor                  = color(63, 63, 116);               /*Color of the panel card.*/
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



int buttonSizeInt                   = 0;  /*Button size temporary variable.*/


int biggestPlayerIndexInt = 0;




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

void setup()                                    {

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

    /*Set up the museum objects.*/
    floorObjectList         = Arrays.asList(

        new ObjectMuseum(new Name("FLR_001", "First Floor"                        ), "XXX_XXX", "FLR", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
        new ObjectMuseum(new Name("FLR_002", "Second Floor"                       ), "XXX_XXX", "FLR", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList))

    );
    roomObjectList          = Arrays.asList(

        new ObjectMuseum(new Name("ROM_AFK", "Room Afrika"                        ), "FLR_001", "ROM", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
        new ObjectMuseum(new Name("ROM_AME", "Room America"                       ), "FLR_001", "ROM", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
        new ObjectMuseum(new Name("ROM_ASI", "Room Asia"                          ), "FLR_002", "ROM", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
        new ObjectMuseum(new Name("ROM_EUR", "Room Europe"                        ), "FLR_002", "ROM", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList))

    );
    exhibitionObjectList    = Arrays.asList(

        new ObjectMuseum(new Name("EXH_CAO", "Exhibition Cameroon"                ), "ROM_AFK", "EXH", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
        new ObjectMuseum(new Name("EXH_EGY", "Exhibition Egypt"                   ), "ROM_AFK", "EXH", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
        new ObjectMuseum(new Name("EXH_ETH", "Exhibition Ethiopia"                ), "ROM_AFK", "EXH", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
        new ObjectMuseum(new Name("EXH_NIG", "Exhibition Nigeria"                 ), "ROM_AFK", "EXH", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
        new ObjectMuseum(new Name("EXH_BRA", "Exhibition Brazil"                  ), "ROM_AME", "EXH", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
        new ObjectMuseum(new Name("EXH_CAN", "Exhibition Canada"                  ), "ROM_AME", "EXH", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
        new ObjectMuseum(new Name("EXH_MEX", "Exhibition Mexico"                  ), "ROM_AME", "EXH", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
        new ObjectMuseum(new Name("EXH_USA", "Exhibition United States Of America"), "ROM_AME", "EXH", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
        new ObjectMuseum(new Name("EXH_CAM", "Exhibition Cambodia"                ), "ROM_ASI", "EXH", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
        new ObjectMuseum(new Name("EXH_IND", "Exhibition India"                   ), "ROM_ASI", "EXH", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
        new ObjectMuseum(new Name("EXH_JAP", "Exhibition Japan"                   ), "ROM_ASI", "EXH", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
        new ObjectMuseum(new Name("EXH_SIN", "Exhibition Singapore"               ), "ROM_ASI", "EXH", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
        new ObjectMuseum(new Name("EXH_BEL", "Exhibition Belgium"                 ), "ROM_EUR", "EXH", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
        new ObjectMuseum(new Name("EXH_FRA", "Exhibition France"                  ), "ROM_EUR", "EXH", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
        new ObjectMuseum(new Name("EXH_GER", "Exhibition Germany"                 ), "ROM_EUR", "EXH", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
        new ObjectMuseum(new Name("EXH_NED", "Exhibition The Netherlands"         ), "ROM_EUR", "EXH", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList))

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
            "Mikael",
            exhibitionObjectList.get((int)(Math.floor((Math.random()*exhibitionObjectList.size()) + 0))).nameAltString      /*Generate random starting exhibition for the player.*/

        );

    }

    /*Populate String list.*/
    for(int i = 0; i < subjectTagObjectList     .size(); i ++){ subjectTagNameAltStringList             .add(subjectTagObjectList   .get(i).nameAltString); subjectTagNameFullStringList            .add(subjectTagObjectList   .get(i).nameFullString); }
    for(int i = 0; i < verbTagObjectList        .size(); i ++){ verbTagNameAltStringList                .add(verbTagObjectList      .get(i).nameAltString); verbTagNameFullStringList               .add(verbTagObjectList      .get(i).nameFullString); }
    for(int i = 0; i < verbTagObjectList        .size(); i ++){ negativeVerbTagNameAltStringList        .add(verbTagObjectList      .get(i).nameAltString); negativeVerbTagNameFullStringList       .add(verbTagObjectList      .get(i).nameFullString); }
    for(int i = 0; i < nounTagObjectList        .size(); i ++){ nounTagNameAltStringList                .add(nounTagObjectList      .get(i).nameAltString); nounTagNameFullStringList               .add(nounTagObjectList      .get(i).nameFullString); }
    for(int i = 0; i < adjectiveTagObjectList   .size(); i ++){ adjectiveTagNameAltStringList           .add(adjectiveTagObjectList .get(i).nameAltString); adjectiveTagNameFullStringList          .add(adjectiveTagObjectList .get(i).nameFullString); }
    for(int i = 0; i < adjectiveTagObjectList   .size(); i ++){ negativeAdjectiveTagNameAltStringList   .add(adjectiveTagObjectList .get(i).nameAltString); negativeAdjectiveTagNameFullStringList  .add(adjectiveTagObjectList .get(i).nameFullString); }
    for(int i = 0; i < adverbTagObjectList      .size(); i ++){ adverbTagNameAltStringList              .add(adverbTagObjectList    .get(i).nameAltString); adverbTagNameFullStringList             .add(adverbTagObjectList    .get(i).nameFullString); }
    for(int i = 0; i < adverbTagObjectList      .size(); i ++){ negativeAdverbTagNameAltStringList      .add(adverbTagObjectList    .get(i).nameAltString); negativeAdverbTagNameFullStringList     .add(adverbTagObjectList    .get(i).nameFullString); }
    /*Create empty list to display if the object created has no parent (for example, floor object will have no parent).*/
    defaultStringList       = Arrays.asList();
    for(int i = 0; i < floorObjectList.size()       ; i ++){ floorNameAltStringList         .add(     floorObjectList       .get(i).nameAltString ); floorNameFullStringList        .add(floorObjectList       .get(i).nameFullString); }
    for(int i = 0; i < roomObjectList.size()        ; i ++){ roomNameAltStringList          .add(     roomObjectList        .get(i).nameAltString ); roomNameFullStringList         .add(roomObjectList        .get(i).nameFullString); }
    for(int i = 0; i < exhibitionObjectList.size()  ; i ++){ exhibitionNameAltStringList    .add(     exhibitionObjectList  .get(i).nameAltString ); exhibitionNameFullStringList   .add(exhibitionObjectList  .get(i).nameFullString); }
    for(int i = 0; i < playerObjectList.size()      ; i ++){ playerStringList               .add("" + playerObjectList      .get(i).playerIndexInt); }

    cp5Object                           = new ControlP5(this);

    buttonSizeInt                   = (width > height) ? ((width*15)/512) : ((height*15)/512);  /*Button size temporary variable.*/
    buttonOpenCloseMuseumObject         = new ButtonOpenClose(buttonSizeInt);                       /*Initiates button open close with size depends on the screen size.*/
    buttonOpenClosePlayerObject         = new ButtonOpenClose(buttonSizeInt);                       /*Initiates button open close with size depends on the screen size.*/

    int dropdownObjectWidthInt          = (width/3);
    int dropdownObjectHeightInt         = (height - (guiOffsetInt*2) - ((buttonSizeInt/2)*2));
    int itemHeightInt                   = (dropdownObjectHeightInt/20);


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
        .setSize                        (dropdownObjectWidthInt, (dropdownObjectHeightInt - 21))
        .setBarHeight                   (itemHeightInt)
        .setItemHeight                  (itemHeightInt)
        .setType                        (ControlP5.LIST)
        .setLabel                       ("Visitor:")
        .hide                           ();

    addTagGUIObject                     = new AddTagGUIObject(

        (width - guiOffsetInt - (buttonSizeInt/2) - dropdownObjectWidthInt) ,
        (        guiOffsetInt + (buttonSizeInt/2)                         ) ,
        dropdownObjectWidthInt                                              ,
        382                                                                 ,
        buttonSizeInt                                                       ,
        dropdownObjectWidthInt                                              ,
        dropdownObjectHeightInt

    );

    /*Add the museum object GUI.*/
    addMuseumGroupGUIObject                  = new AddMuseumGroupGUIObject(

        (width - guiOffsetInt - (buttonSizeInt/2) - dropdownObjectWidthInt) ,
        (        guiOffsetInt + (buttonSizeInt/2)                         ) ,
        dropdownObjectWidthInt                                              ,
        442                                                                 ,
        cp5Object.get(Group.class, "AddTagGUIObjectAddTagGroupObject")      ,
        this

    );


    /*Add the remove player GUI.*/
    removePlayerGUIObject                  = new RemovePlayerGUIObject(

        (guiOffsetInt + (buttonSizeInt/2))          ,
        (guiOffsetInt + (buttonSizeInt/2))          ,
        dropdownObjectWidthInt                      ,
        104                                         ,
        buttonSizeInt                               ,
        dropdownObjectWidthInt                      ,
        dropdownObjectHeightInt


    );

    /*Add the add player GUI.*/
    addPlayerGroupGUIObject                  = new AddPlayerGroupGUIObject(

        (guiOffsetInt + (buttonSizeInt/2))                                          ,
        (guiOffsetInt + (buttonSizeInt/2))                                          ,
        dropdownObjectWidthInt                                                      ,
        144                                                                         ,
        cp5Object.get(Group.class, "RemovePlayerGUIObjectRemovePlayerGroupObject")  ,
        this


    );

    /*Add the edit player GUI.*/
    editPlayerGroupGUIObject            = new EditPlayerGroupGUIObject(

        (guiOffsetInt + (buttonSizeInt/2))                  ,
        (guiOffsetInt + (buttonSizeInt/2))                  ,
        dropdownObjectWidthInt                              ,
        427                                                 ,
        cp5Object.get(ScrollableList.class, "VisitorSList") ,
        this

    );


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

void draw()                                     {

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
    addMuseumGroupGUIObject                      .DrawVoid(dropdownMObjectAlphaFloat);
    addTagGUIObject                         .DrawVoid(dropdownMObjectAlphaFloat);
    /*Update the add player object GUI.*/
    addPlayerGroupGUIObject                      .DrawVoid(dropdownPlayerAlphaFloat);
    /*Update the remove player object GUI.*/
    removePlayerGUIObject                   .DrawVoid(dropdownPlayerAlphaFloat, editPlayerGroupGUIObject);
    /*Update the edit player object GUI.*/
    editPlayerGroupGUIObject                .DrawVoid(dropdownPlayerAlphaFloat);
    
    /*Update buttonOpenCloseBoolean.*/
    SetButtonOpenCloseBoolean               ();    
    /*Create the card.*/
    if(buttonOpenCloseBoolean == false)     { CreatePanelCardVoid(); }



    /*PENDING: Create a function to return next biggest player index int.*/
    biggestPlayerIndexInt = GetBiggestPlayerIndexInt();
    int nextBiggestPlayerIndexInt = biggestPlayerIndexInt + 1; 
    addPlayerGroupGUIObject.addPlayerGroupPlayerIndexValueTextlabelObject.setText("" + nextBiggestPlayerIndexInt);

}

/*The mouse pressed override function is for the open and close button.*/
void mousePressed()                             {

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

        xPanelCardInt           = _targetObjectList.get(_indexInt).panelObject.xPanelInt + (_targetObjectList.get(_indexInt).panelObject.widthPanelInt /2 );
        yPanelCardInt           = _targetObjectList.get(_indexInt).panelObject.yPanelInt + (_targetObjectList.get(_indexInt).panelObject.heightPanelInt/2);
        selectedMuseumObject    = _targetObjectList.get(_indexInt);

        panelCardChangeBoolean  = false;

    }

}

/*A function to check whether an object of player is hovered by mouse pointer.*/
void CheckPlayerObjectHoverVoid(int _indexInt)  {

    /*This is to check which museum/player object is hovered, then create panel based on that object position.*/
    if(playerObjectList.get(_indexInt).SetHoverBoolean() == true && panelCardChangeBoolean == true && buttonOpenCloseBoolean == false){

        xPanelCardInt           = playerObjectList.get(_indexInt).panelObject.xPanelInt + (playerObjectList.get(_indexInt).panelObject.widthPanelInt/2 );
        yPanelCardInt           = playerObjectList.get(_indexInt).panelObject.yPanelInt + (playerObjectList.get(_indexInt).panelObject.heightPanelInt/2);
        selectedPlayerObject    = playerObjectList.get(_indexInt);

        panelCardChangeBoolean  = false;

    }

}

/*A function to control color for each possible type of museum object buttons.*/
void ColorControlVoid(

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
void CreatePanelCardVoid()                      {

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
boolean SetButtonOpenCloseBoolean()             {

    if(buttonOpenCloseMuseumObject.isButtonOpenBoolean == true || buttonOpenClosePlayerObject.isButtonOpenBoolean == true)  { buttonOpenCloseBoolean = true ; }
    else                                                                                                                    { buttonOpenCloseBoolean = false; }
    return buttonOpenCloseBoolean;

}

float ButtonOpenCloseAnimatingFloat(

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

float ScrollableDrawFloat(

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

/*Create a function to add museum object.
PENDING: Later I need to add additional arguments so that the tags will also be added.*/
ObjectMuseum AddMuseumObject(

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

ObjectMuseum FindMuseumObject(String _objectNameString)                              {

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

/*This function is to control what will happen when mouse pointer clicked above the active element of scrollable button.*/
void ExhibitionSList(int _indexInt)                                                 {

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
void VisitorSList                   (int _indexInt)                                 {

    /*Assign the selected player.*/
    editPlayerGroupGUIObject.selectedPlayerObject = playerObjectList.get(_indexInt);
    /*Change the radio button accordingly.*/
    editPlayerGroupGUIObject.editPlayerGroupPlayerModeValueRadioButtonObject.activate((editPlayerGroupGUIObject.selectedPlayerObject.playerMovementModeInt - 1));

}









int GetBiggestPlayerIndexInt(){

    int tempBiggestIndexInt = 0;
    for(int i = 0; i < playerObjectList.size(); i ++){

        if(playerObjectList.get(i).playerIndexInt > tempBiggestIndexInt){ tempBiggestIndexInt = playerObjectList.get(i).playerIndexInt; }

    }
    return tempBiggestIndexInt;

}











void RemovePlayerGUIObjectPickPlayer(int _indexInt){

    String tempIndexSelectedPlayerString = cp5Object.get(ScrollableList.class, "RemovePlayerGUIObjectPickPlayer").getItem(_indexInt).get("text").toString();
    int tempIndexSelectedPlayerInt = Integer.parseInt(tempIndexSelectedPlayerString);
    removePlayerGUIObject.playerToRemoveObject = FindPlayerObject(tempIndexSelectedPlayerInt);

}

void RemovePlayerGUIObjectRemoveButton(int _indexInt){

    playerObjectList.remove(removePlayerGUIObject.playerToRemoveObject);
    playerStringList.remove("" + removePlayerGUIObject.playerToRemoveObject.playerIndexInt);
    cp5Object.get(ScrollableList.class, "VisitorSList").setItems(playerStringList );
    cp5Object.get(ScrollableList.class, "RemovePlayerGUIObjectPickPlayer").setItems(playerStringList );

    for(int i = 0; i < playerObjectList.size(); i ++){

        playerObjectList.get(i).SetSiblingObjectList();

    }

    removePlayerGUIObject.playerToRemoveObject = null;

}

ObjectPlayer FindPlayerObject(int _playerIndexInt){

    ObjectPlayer tempPlayerObject = null;
    for(int i = 0; i < playerObjectList.size(); i ++){

        if(playerObjectList.get(i).playerIndexInt == _playerIndexInt){ tempPlayerObject = playerObjectList.get(i); }

    }

    return tempPlayerObject;

}










void AddTagGUIObjectSelectTagTypeSList(int _indexInt){

    addTagGUIObject.selectedTagTypeString = cp5Object.get(ScrollableList.class, "AddTagGUIObjectSelectTagTypeSList").getItem(_indexInt).get("text").toString();

}

void AddTagGUIObjectSubmitButton(int _indexInt){

    String          tempTagNameAltString        = cp5Object.get(Textfield.class, "AddTagGUIObjectTagNameAltTextfield" ).getText();
    String          tempTagNameFullString       = cp5Object.get(Textfield.class, "AddTagGUIObjectTagNameFullTextfield").getText();
    String          tempTagTypeString           = "";
    Tag             tempTagObject               = null;
    List<Tag>       tempTagObjectList           = null;
    List<String>    tempTagNameAltStringList    = null;
    List<String>    tempTagNameFullStringList   = null;


    if      (addTagGUIObject.selectedTagTypeString.equals("SUBJECT"))           {

        tempTagTypeString                       = "SUB";
        tempTagObjectList                       = subjectTagObjectList;
        tempTagNameAltStringList                = subjectTagNameAltStringList;
        tempTagNameFullStringList               = subjectTagNameFullStringList;

        String tempSubjectString                = cp5Object.get(Textfield.class, "AddTagGUIObjectSubjectTextfield").getText();
        tempTagObject                           = new Tag(new Name(tempTagNameAltString, tempTagNameFullString), tempTagTypeString, tempSubjectString);

    }
    else if (addTagGUIObject.selectedTagTypeString.equals("VERB"))              {

        tempTagTypeString                       = "VER";
        tempTagObjectList                       = verbTagObjectList;
        tempTagNameAltStringList                = verbTagNameAltStringList;
        tempTagNameFullStringList               = verbTagNameFullStringList;

        String tempVerb1String                  = cp5Object.get(Textfield.class, "AddTagGUIObjectVerb1Textfield"   ).getText();
        String tempVerb2String                  = cp5Object.get(Textfield.class, "AddTagGUIObjectVerb2Textfield"   ).getText();
        String tempVer3bString                  = cp5Object.get(Textfield.class, "AddTagGUIObjectVerb3Textfield"   ).getText();
        String tempVerIngbString                = cp5Object.get(Textfield.class, "AddTagGUIObjectVerbIngTextfield" ).getText();
        String tempVerbSString                  = cp5Object.get(Textfield.class, "AddTagGUIObjectVerbSTextfield"   ).getText();
        tempTagObject                           = new Tag(new Name(tempTagNameAltString, tempTagNameFullString), tempTagTypeString, tempVerb1String, tempVerb2String, tempVer3bString, tempVerIngbString, tempVerbSString);

    }
    else if (addTagGUIObject.selectedTagTypeString.equals("NEGATIVE VERB"))     {

        tempTagTypeString                       = "NVE";
        tempTagObjectList                       = negativeVerbTagObjectList;
        tempTagNameAltStringList                = negativeVerbTagNameAltStringList;
        tempTagNameFullStringList               = negativeVerbTagNameFullStringList;

        String tempNegativeVerb1String          = cp5Object.get(Textfield.class, "AddTagGUIObjectNegativeVerb1Textfield"   ).getText();
        String tempNegativeVerb2String          = cp5Object.get(Textfield.class, "AddTagGUIObjectNegativeVerb2Textfield"   ).getText();
        String tempNegativeVer3bString          = cp5Object.get(Textfield.class, "AddTagGUIObjectNegativeVerb3Textfield"   ).getText();
        String tempNegativeVerIngbString        = cp5Object.get(Textfield.class, "AddTagGUIObjectNegativeVerbIngTextfield" ).getText();
        String tempNegativeVerbSString          = cp5Object.get(Textfield.class, "AddTagGUIObjectNegativeVerbSTextfield"   ).getText();
        tempTagObject                           = new Tag(new Name(tempTagNameAltString, tempTagNameFullString), tempTagTypeString, tempNegativeVerb1String, tempNegativeVerb2String, tempNegativeVer3bString, tempNegativeVerIngbString, tempNegativeVerbSString);

    }
    else if (addTagGUIObject.selectedTagTypeString.equals("NOUN"))              {

        tempTagTypeString                       = "NOU";
        tempTagObjectList                       = nounTagObjectList;
        tempTagNameAltStringList                = nounTagNameAltStringList;
        tempTagNameFullStringList               = nounTagNameFullStringList;

        String tempNounString                   = cp5Object.get(Textfield.class, "AddTagGUIObjectNounTextfield"    ).getText();
        String tempNounSString                  = cp5Object.get(Textfield.class, "AddTagGUIObjectNounSTextfield"   ).getText();
        tempTagObject                           = new Tag(new Name(tempTagNameAltString, tempTagNameFullString), tempTagTypeString, tempNounString, tempNounSString);


    }
    else if (addTagGUIObject.selectedTagTypeString.equals("ADJECTIVE"))         {

        tempTagTypeString                       = "ADJ";
        tempTagObjectList                       = adjectiveTagObjectList;
        tempTagNameAltStringList                = adjectiveTagNameAltStringList;
        tempTagNameFullStringList               = adjectiveTagNameFullStringList;

        String tempAdjectiveString              = cp5Object.get(Textfield.class, "AddTagGUIObjectAdjectiveTextfield").getText();
        tempTagObject                           = new Tag(new Name(tempTagNameAltString, tempTagNameFullString), tempTagTypeString, tempAdjectiveString);


    }
    else if (addTagGUIObject.selectedTagTypeString.equals("NEGATIVE ADJECTIVE")){

        tempTagTypeString                       = "NDJ";
        tempTagObjectList                       = negativeAdjectiveTagObjectList;
        tempTagNameAltStringList                = negativeAdjectiveTagNameAltStringList;
        tempTagNameFullStringList               = negativeAdjectiveTagNameFullStringList;

        String tempNegativeAdjectiveString      = cp5Object.get(Textfield.class, "AddTagGUIObjectNegativeAdjectiveTextfield").getText();
        tempTagObject                           = new Tag(new Name(tempTagNameAltString, tempTagNameFullString), tempTagTypeString, tempNegativeAdjectiveString);


    }
    else if (addTagGUIObject.selectedTagTypeString.equals("ADVERB"))            {

        tempTagTypeString                       = "ADV";
        tempTagObjectList                       = adverbTagObjectList;
        tempTagNameAltStringList                = adverbTagNameAltStringList;
        tempTagNameFullStringList               = adverbTagNameFullStringList;

        String tempAdverbString                 = cp5Object.get(Textfield.class, "AddTagGUIObjectAdverbTextfield").getText();
        tempTagObject                           = new Tag(new Name(tempTagNameAltString, tempTagNameFullString), tempTagTypeString, tempAdverbString);


    }
    else if (addTagGUIObject.selectedTagTypeString.equals("NEGATIVE ADVERB"))   {

        tempTagTypeString                       = "NDV";
        tempTagObjectList                       = negativeAdverbTagObjectList;
        tempTagNameAltStringList                = negativeAdverbTagNameAltStringList;
        tempTagNameFullStringList               = negativeAdverbTagNameFullStringList;

        String tempNegativeAdverbString         = cp5Object.get(Textfield.class, "AddTagGUIObjectNegativeAdverbTextfield").getText();
        tempTagObject                           = new Tag(new Name(tempTagNameAltString, tempTagNameFullString), tempTagTypeString, tempNegativeAdverbString);

    }

    tempTagObjectList                           .add(tempTagObject);
    tempTagNameAltStringList                    .add(tempTagObject.nameAltString );
    tempTagNameFullStringList                   .add(tempTagObject.nameFullString);

    if      (addTagGUIObject.selectedTagTypeString.equals("SUBJECT"))               { addMuseumGroupGUIObject.addMuseumGroupSelectSubjectTagMuseumObjectScrollableListObject            .setItems(tempTagNameFullStringList); }
    else if (addTagGUIObject.selectedTagTypeString.equals("VERB"))                  { addMuseumGroupGUIObject.addMuseumGroupSelectVerbTagMuseumObjectScrollableListObject               .setItems(tempTagNameFullStringList); }
    else if (addTagGUIObject.selectedTagTypeString.equals("NEGATIVE VERB"))       { addMuseumGroupGUIObject.addMuseumGroupSelectNegativeVerbTagMuseumObjectScrollableListObject         .setItems(tempTagNameFullStringList); }
    else if (addTagGUIObject.selectedTagTypeString.equals("NOUN"))                  { addMuseumGroupGUIObject.addMuseumGroupSelectNounTagMuseumObjectScrollableListObject               .setItems(tempTagNameFullStringList); }
    else if (addTagGUIObject.selectedTagTypeString.equals("ADJECTIVE"))             { addMuseumGroupGUIObject.addMuseumGroupSelectAdjectiveTagMuseumObjectScrollableListObject          .setItems(tempTagNameFullStringList); }
    else if (addTagGUIObject.selectedTagTypeString.equals("NEGATIVE ADJECTIVE"))    { addMuseumGroupGUIObject.addMuseumGroupSelectNegativeAdjectiveTagMuseumObjectScrollableListObject  .setItems(tempTagNameFullStringList); }
    else if (addTagGUIObject.selectedTagTypeString.equals("ADVERB"))                { addMuseumGroupGUIObject.addMuseumGroupSelectAdverbTagMuseumObjectScrollableListObject             .setItems(tempTagNameFullStringList); }
    else if (addTagGUIObject.selectedTagTypeString.equals("NEGATIVE ADVERB"))       { addMuseumGroupGUIObject.addMuseumGroupSelectNegativeAdverbTagMuseumObjectScrollableListObject     .setItems(tempTagNameFullStringList); }


    addTagGUIObject.selectedTagTypeString = "";
    cp5Object.get(Textfield         .class , "AddTagGUIObjectTagNameFullTextfield"          ).clear();
    cp5Object.get(Textfield         .class , "AddTagGUIObjectTagNameAltTextfield"           ).clear();
    cp5Object.get(Textfield         .class , "AddTagGUIObjectSubjectTextfield"              ).clear().hide();
    cp5Object.get(Textfield         .class , "AddTagGUIObjectVerb1Textfield"                ).clear().hide();
    cp5Object.get(Textfield         .class , "AddTagGUIObjectVerb2Textfield"                ).clear().hide();
    cp5Object.get(Textfield         .class , "AddTagGUIObjectVerb3Textfield"                ).clear().hide();
    cp5Object.get(Textfield         .class , "AddTagGUIObjectVerbIngTextfield"              ).clear().hide();
    cp5Object.get(Textfield         .class , "AddTagGUIObjectVerbSTextfield"                ).clear().hide();
    cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeVerb1Textfield"        ).clear().hide();
    cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeVerb2Textfield"        ).clear().hide();
    cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeVerb3Textfield"        ).clear().hide();
    cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeVerbIngTextfield"      ).clear().hide();
    cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeVerbSTextfield"        ).clear().hide();
    cp5Object.get(Textfield         .class , "AddTagGUIObjectNounTextfield"                 ).clear().hide();
    cp5Object.get(Textfield         .class , "AddTagGUIObjectNounSTextfield"                ).clear().hide();
    cp5Object.get(Textfield         .class , "AddTagGUIObjectAdjectiveTextfield"            ).clear().hide();
    cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeAdjectiveTextfield"    ).clear().hide();
    cp5Object.get(Textfield         .class , "AddTagGUIObjectAdverbTextfield"               ).clear().hide();
    cp5Object.get(Textfield         .class , "AddTagGUIObjectNagetiveAdverbTextfield"       ).clear().hide();

}


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

    String          tempNameAltString                   = addMuseumGroupGUIObject.addMuseumGroupNameAltMuseumObjectTextfieldObject .getText();                          /*Get the alternate  name for the new museum object that the user will add.     */
    String          tempNameFullString                  = addMuseumGroupGUIObject.addMuseumGroupNameFullMuseumObjectTextfieldObject.getText();                          /*Get the full       name for the new museum object that the user will add.     */
    String          tempParentNameAltString             = addMuseumGroupGUIObject.tempSelectedParentNameAltString;                                                      /*Parent  alr        name for the new museum object that the user will add.     */
    String          tempTypeObjectMuseumNameAltString   = addMuseumGroupGUIObject.tempSelectedTypeObjectMuseumNameAltString;                                            /*Type    alternate  name for the new museum object that the user will add.     */
    List<String>    tempSelectedTagNameFullStringList   = addMuseumGroupGUIObject.tempSelectedTagNameFullStringList;                                                    /*Tags    full       name for the new museum object that the user will add.     */
    Tag[]           tempSelectedTagObjectArray          = new Tag[tempSelectedTagNameFullStringList.size()];                                                            /*Converted full name String List of Tag full name into an array of Tag object. */
    
    for(int i = 0; i < tempSelectedTagNameFullStringList.size(); i ++){ tempSelectedTagObjectArray[i] = FindTagObject(tempSelectedTagNameFullStringList.get(i)); }      /*Convert   full name String List of Tag full name into an array of Tag object. */
    if( tempTypeObjectMuseumNameAltString.equals("FLR")){ tempParentNameAltString = "XXX_XXX"; }                                                                        /*If the object that will be added is a floor object, then set the  alternate parent name into XXX_XXX.*/

    AddMuseumObject(tempNameAltString, tempNameFullString, tempParentNameAltString, tempTypeObjectMuseumNameAltString, tempSelectedTagObjectArray);
    
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
//START//AddPlayerGroupGUIObject.pde Controller's Functions.///////////////////////////////////////
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
void AddPlayerGroupPlayerAddButtonObject                    (int _indexInt){

    int             temporaryBiggestPlayerIndexInt      = biggestPlayerIndexInt + 1;
    String          tempStartingExhibitionNameAltString = addPlayerGroupGUIObject.tempExhibitionStartNameAltString;
    String          tempPlayerNameString                = addPlayerGroupGUIObject.addPlayerGroupPlayerNameTextfieldObject.getText();
    ObjectPlayer    tempPlayerObject                    = new ObjectPlayer(temporaryBiggestPlayerIndexInt, tempPlayerNameString, tempStartingExhibitionNameAltString);

    playerStringList.add("" + tempPlayerObject.playerIndexInt);

    cp5Object.get(ScrollableList.class, "VisitorSList")                     .setItems(playerStringList );
    cp5Object.get(ScrollableList.class, "RemovePlayerGUIObjectPickPlayer")  .setItems(playerStringList );

}
//////////////////////////////////////////////////////////////////////////////////////////////////// 
//END//AddPlayerGroupGUIObject.pde Controller's Functions./////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////// 



//////////////////////////////////////////////////////////////////////////////////////////////////// 
//START//EditPlayerGroupGUIObject.pde Controller's Functions.///////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
/*Set the movement mode for both player object and the graphical user interface object.
This function is to make sure that both mode is always the same.*/
void EditPlayerGroupPlayerModeValueRadioButtonObject            (int _intIndex)     {

    editPlayerGroupGUIObject.tempSelectedPlayerMovementModeInt           = _intIndex;
    editPlayerGroupGUIObject.selectedPlayerObject.playerMovementModeInt  = _intIndex;

}
/*A function to move the selected player into new exhibition.
This function need to only happened when the appropriate movement mode is selected.*/
void EditPlayerGroupPlayerExhibitionNextScrollableListObject    (int _indexInt)     {

    if(editPlayerGroupGUIObject.tempSelectedPlayerMovementModeInt == 2){

        String  receivedMuseumNameFullString    = editPlayerGroupGUIObject.editPlayerGroupPlayerExhibitionNextScrollableListObject.getItem(_indexInt).get("text").toString();
        String  receivedMuseumNameAltString     = FindMuseumObject(receivedMuseumNameFullString).nameAltString;

        editPlayerGroupGUIObject.selectedPlayerObject.ExhibitionMoveObject(receivedMuseumNameAltString);

    }

}
//////////////////////////////////////////////////////////////////////////////////////////////////// 
//END//EditPlayerGroupGUIObject.pde Controller's Functions./////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////// 