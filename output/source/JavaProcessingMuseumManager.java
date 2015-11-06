import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import controlP5.*; 
import java.util.*; 
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
int                     playerAmountInt                 = 100;                              /*The number of players in this simulation.*/
List<Tag>               tagObjectList                   = new ArrayList<Tag>();             /*Array List of tag.*/
List<ObjectMuseum>      floorObjectList                 = new ArrayList<ObjectMuseum>();    /*Array List of museom object floor.*/
List<ObjectMuseum>      roomObjectList                  = new ArrayList<ObjectMuseum>();    /*Array List of museum object room*/
List<ObjectMuseum>      exhibitionObjectList            = new ArrayList<ObjectMuseum>();    /*Array List of museum object exhibition*/
List<ObjectPlayer>      playerObjectList                = new ArrayList<ObjectPlayer>();    /*Array List of player object.*/
List<String>            museumStringList                = new ArrayList<String>();
List<String>            floorStringList                 = new ArrayList<String>();
List<String>            roomStringList                  = new ArrayList<String>();
List<String>            exhibitionStringList            = new ArrayList<String>();
List<String>            playerStringList                = new ArrayList<String>();

/*PROTOTYPE: For testing.*/
List<String>            subjectTagStringList            = new ArrayList<String>();
List<String>            verbTagStringList               = new ArrayList<String>();
List<String>            nounTagStringList               = new ArrayList<String>();
List<String>    defaultStringList                       = new ArrayList<String>();          /*When the object that you want to add has no parent, we need to show empty List of String.*/

/*GUI variables.*/
AddMuseumGUIObject      addMuseumGUIObject              ;

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

/*PROTOTYPE.*/
int test = 0;
boolean testBoolean = true;

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

    Name            tagName         = null;
    String          nameAltString   = "";
    String          nameFullString  = "";
    Tag(Name _nameObject)                       {

        tagName             = _nameObject;
        nameAltString       = tagName.nameAltString;
        nameFullString      = tagName.nameFullString;

    }

}

public void setup()                                    {

    /*Setting up application.*/
    size                                (1024, 576, P2D);
    noStroke                            ();

    /*Create the tag list.*/
    tagObjectList           = Arrays.asList(
    
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
    
    );

    /*PROTOTYPE: For testing.*/
    subjectTagStringList    = Arrays.asList("Mr. X"     , "Mr. Y"   , "Mr. Z");
    verbTagStringList       = Arrays.asList("Eat"       , "Work"    , "Sleep");
    nounTagStringList       = Arrays.asList("Airplane"  , "Car"     , "Ship" );
    /*Create empty list to display if the object created has no parent (for example, floor object will have no parent).*/
    defaultStringList                       = Arrays.asList();

    /*Set up the museum objects.*/
    floorObjectList         = Arrays.asList(

        new ObjectMuseum(new Name("FLR_001", "First Floor"                        ), "XXX_XXX", "FLR", AssignRandomTagList(tagObjectList)),
        new ObjectMuseum(new Name("FLR_002", "Second Floor"                       ), "XXX_XXX", "FLR", AssignRandomTagList(tagObjectList))

    );
    roomObjectList          = Arrays.asList(

        new ObjectMuseum(new Name("ROM_AFK", "Room Afrika"                        ), "FLR_001", "ROM", AssignRandomTagList(tagObjectList)),
        new ObjectMuseum(new Name("ROM_AME", "Room America"                       ), "FLR_001", "ROM", AssignRandomTagList(tagObjectList)),
        new ObjectMuseum(new Name("ROM_ASI", "Room Asia"                          ), "FLR_002", "ROM", AssignRandomTagList(tagObjectList)),
        new ObjectMuseum(new Name("ROM_EUR", "Room Europe"                        ), "FLR_002", "ROM", AssignRandomTagList(tagObjectList))

    );
    exhibitionObjectList    = Arrays.asList(

        new ObjectMuseum(new Name("EXH_CAO", "Exhibition Cameroon"                ), "ROM_AFK", "EXH", AssignRandomTagList(tagObjectList)),
        new ObjectMuseum(new Name("EXH_EGY", "Exhibition Egypt"                   ), "ROM_AFK", "EXH", AssignRandomTagList(tagObjectList)),
        new ObjectMuseum(new Name("EXH_ETH", "Exhibition Ethiopia"                ), "ROM_AFK", "EXH", AssignRandomTagList(tagObjectList)),
        new ObjectMuseum(new Name("EXH_NIG", "Exhibition Nigeria"                 ), "ROM_AFK", "EXH", AssignRandomTagList(tagObjectList)),
        new ObjectMuseum(new Name("EXH_BRA", "Exhibition Brazil"                  ), "ROM_AME", "EXH", AssignRandomTagList(tagObjectList)),
        new ObjectMuseum(new Name("EXH_CAN", "Exhibition Canada"                  ), "ROM_AME", "EXH", AssignRandomTagList(tagObjectList)),
        new ObjectMuseum(new Name("EXH_MEX", "Exhibition Mexico"                  ), "ROM_AME", "EXH", AssignRandomTagList(tagObjectList)),
        new ObjectMuseum(new Name("EXH_USA", "Exhibition United States Of America"), "ROM_AME", "EXH", AssignRandomTagList(tagObjectList)),
        new ObjectMuseum(new Name("EXH_CAM", "Exhibition Cambodia"                ), "ROM_ASI", "EXH", AssignRandomTagList(tagObjectList)),
        new ObjectMuseum(new Name("EXH_IND", "Exhibition India"                   ), "ROM_ASI", "EXH", AssignRandomTagList(tagObjectList)),
        new ObjectMuseum(new Name("EXH_JAP", "Exhibition Japan"                   ), "ROM_ASI", "EXH", AssignRandomTagList(tagObjectList)),
        new ObjectMuseum(new Name("EXH_SIN", "Exhibition Singapore"               ), "ROM_ASI", "EXH", AssignRandomTagList(tagObjectList)),
        new ObjectMuseum(new Name("EXH_BEL", "Exhibition Belgium"                 ), "ROM_EUR", "EXH", AssignRandomTagList(tagObjectList)),
        new ObjectMuseum(new Name("EXH_FRA", "Exhibition France"                  ), "ROM_EUR", "EXH", AssignRandomTagList(tagObjectList)),
        new ObjectMuseum(new Name("EXH_GER", "Exhibition Germany"                 ), "ROM_EUR", "EXH", AssignRandomTagList(tagObjectList)),
        new ObjectMuseum(new Name("EXH_NED", "Exhibition The Netherlands"         ), "ROM_EUR", "EXH", AssignRandomTagList(tagObjectList))

    );

    /*Copy the List to itself so it changed from static List into dynamic List.*/
    tagObjectList           = new ArrayList<Tag>            (tagObjectList          );
    floorObjectList         = new ArrayList<ObjectMuseum>   (floorObjectList        );
    roomObjectList          = new ArrayList<ObjectMuseum>   (roomObjectList         );
    exhibitionObjectList    = new ArrayList<ObjectMuseum>   (exhibitionObjectList   );

    /*Initiate object parents and children for all object museum.*/
    for(int i = 0; i < floorObjectList.size()           ; i ++) { floorObjectList.get(i).SetChildObjectList  (roomObjectList); }
    for(int i = 0; i < roomObjectList.size()            ; i ++) {

        roomObjectList              .get(i).SetInitialParentObject  (floorObjectList);
        roomObjectList              .get(i).SetChildObjectList      (exhibitionObjectList);

    }
    for(int i = 0; i < exhibitionObjectList.size()      ; i ++) { exhibitionObjectList.get(i)   .SetInitialParentObject(roomObjectList); }

    /*Determine index for all museum object.*/
    for(int i = 0; i < floorObjectList.size()           ; i ++) { floorObjectList.get(i)        .SetIndexInsideVoid(); }
    for(int i = 0; i < roomObjectList.size()            ; i ++) { roomObjectList.get(i)         .SetIndexInsideVoid(); }
    for(int i = 0; i < exhibitionObjectList.size()      ; i ++) { exhibitionObjectList.get(i)   .SetIndexInsideVoid(); }

    /*Initiate all players.*/
    for(int i = 0; i < playerAmountInt; i ++)                   {

        ObjectPlayer objectPlayer   = new ObjectPlayer((i + 1), exhibitionObjectList.get((int)(Math.floor((Math.random()*exhibitionObjectList.size()) + 0))).nameAltString);

    }

    /*Populate String list.*/
    for(int i = 0; i < floorObjectList.size()       ; i ++){ floorStringList        .add(     floorObjectList       .get(i).nameAltString ); }
    for(int i = 0; i < roomObjectList.size()        ; i ++){ roomStringList         .add(     roomObjectList        .get(i).nameAltString ); }
    for(int i = 0; i < exhibitionObjectList.size()  ; i ++){ exhibitionStringList   .add(     exhibitionObjectList  .get(i).nameAltString ); }
    for(int i = 0; i < playerObjectList.size()      ; i ++){ playerStringList       .add("" + playerObjectList      .get(i).playerIndexInt); }

    cp5Object                           = new ControlP5(this);

    int buttonSizeInt                   = (width > height) ? ((width*15)/512) : ((height*15)/512);  /*Button size temporary variable.*/
    buttonOpenCloseMuseumObject         = new ButtonOpenClose(buttonSizeInt);                       /*Initiates button open close with size depends on the screen size.*/
    buttonOpenClosePlayerObject         = new ButtonOpenClose(buttonSizeInt);                       /*Initiates button open close with size depends on the screen size.*/

    int dropdownObjectWidthInt          = (width/3);
    int dropdownObjectHeightInt         = (height - ((guiOffsetInt + (buttonSizeInt/2))*2));
    int itemHeightInt                   = (dropdownObjectHeightInt/20);

    /*Add the museum object GUI.*/
    addMuseumGUIObject                  = new AddMuseumGUIObject(

        (width - guiOffsetInt - (buttonSizeInt/2) - dropdownObjectWidthInt) ,
        (        guiOffsetInt + (buttonSizeInt/2)                         ) ,
        dropdownObjectWidthInt                                              ,
        250                                                                 ,
        buttonSizeInt                                                       ,
        dropdownObjectWidthInt

    );

    /*Create museum object dropdown menu.*/
    cp5Object
        .addScrollableList              ("ExhibitionSList")
        .setPosition                    (

            (width -  guiOffsetInt      - (buttonSizeInt/2) - dropdownObjectWidthInt                ),
            (        (guiOffsetInt*1.5f) + (buttonSizeInt/2) + addMuseumGUIObject.groupAddHeightInt  )

        )
        .setSize                        (dropdownObjectWidthInt, dropdownObjectHeightInt)
        .setBarHeight                   (itemHeightInt)
        .setItemHeight                  (itemHeightInt)
        .setType                        (ControlP5.LIST)
        .setLabel                       ("Exhibitions:")
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

    museumStringList                    = floorStringList;                                  /*Set the initial item for this scrollable list.*/
    cp5Object                           .get(ScrollableList.class, "ExhibitionSList")
                                        .setItems(floorStringList);
    /*
    cp5Object                           .get(ScrollableList.class, "VisitorSList")
                                        .setItems();
    */

}

public void draw()                                     {

    /*PROTOTYPE.*/
    test ++;
    if(test == 50 && testBoolean == true){
        AddObjectMuseum("FLR_TES", "Floor Test", "XXX_XXX", "FLR");
        AddObjectMuseum("ROM_TES", "Room Test", "FLR_TES", "ROM");
        AddObjectMuseum("EXH_TES", "Exhibition Test", "ROM_TES", "EXH");
        testBoolean = false;
    }


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

    dropdownMObjectAlphaFloat               = ScrollableDrawFloat(dropdownMObjectAlphaFloat   , (width - guiOffsetInt)   , guiOffsetInt     , buttonOpenCloseMuseumObject   , "ExhibitionSList" );
    dropdownPlayerAlphaFloat                = ScrollableDrawFloat(dropdownPlayerAlphaFloat    , guiOffsetInt             , guiOffsetInt     , buttonOpenClosePlayerObject   , "VisitorSList"    );
    /*Update the museum object GUI.*/
    addMuseumGUIObject                      .DrawVoid(dropdownMObjectAlphaFloat);

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

/*A function to check whether an object of museum is hovered by mouse pointer.*/
public void CheckMuseumObjectHoverVoid(

    int _indexInt                           , 
    List<ObjectMuseum> _targetObjectList

){

    /*This is to check which museum/player object is hovered, then create panel based on that object position.*/
    if(_targetObjectList.get(_indexInt).SetHoverBoolean() == true && panelCardChangeBoolean == true){

        xPanelCardInt           = _targetObjectList.get(_indexInt).panelObject.xPanelInt + (_targetObjectList.get(_indexInt).panelObject.widthPanelInt /2 );
        yPanelCardInt           = _targetObjectList.get(_indexInt).panelObject.yPanelInt + (_targetObjectList.get(_indexInt).panelObject.heightPanelInt/2);
        selectedMuseumObject    = _targetObjectList.get(_indexInt);

        panelCardChangeBoolean  = false;

    }

}

/*A function to check whether an object of player is hovered by mouse pointer.*/
public void CheckPlayerObjectHoverVoid(int _indexInt)  {

    /*This is to check which museum/player object is hovered, then create panel based on that object position.*/
    if(playerObjectList.get(_indexInt).SetHoverBoolean() == true && panelCardChangeBoolean == true){

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

    if(_captionString.equals("ExhibitionSList")){

        for(int i = 0; i < museumStringList.size(); i ++){

            String  itemScrollableString    = cp5Object        .get(ScrollableList.class, _captionString).getItem(i).get("text").toString();
            String  temporaryTypeString     = itemScrollableString.substring(0, Math.min(itemScrollableString.length(), 3));

            if      (temporaryTypeString.equals("FLR")){ cp5Object        .get(ScrollableList.class, _captionString).getItem(i).put("color", _floorCColorObject);        }
            else if (temporaryTypeString.equals("ROM")){ cp5Object        .get(ScrollableList.class, _captionString).getItem(i).put("color", _roomCColorObject);         }
            else if (temporaryTypeString.equals("EXH")){ cp5Object        .get(ScrollableList.class, _captionString).getItem(i).put("color", _exhibitionCColorObject);   }

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

                "FLR_CUR = " + exhibitionCurrentObject.nameAltString                                        + "\n" +
                "ROM_CUR = " + roomCurrentObject.nameAltString                                              + "\n" +
                "EXH_CUR = " + exhibitionCurrentObject.nameAltString                                        + "\n" +
                "EXH_TAR = " + selectedPlayerObject.exhibitionTargetStringList .get(0)                      + "\n" +
                "EXH_TAR = " + selectedPlayerObject.exhibitionTargetStringList .get(1)                      + "\n" +
                "EXH_TAR = " + selectedPlayerObject.exhibitionTargetStringList .get(2)                      + "\n" +
                "EXH_TAG = " + selectedPlayerObject.exhibitionTagCounterList   .get(0).GetTagNameString()   + "\n" +
                "EXH_TAG = " + selectedPlayerObject.exhibitionTagCounterList   .get(1).GetTagNameString()   + "\n" +
                "EXH_TAG = " + selectedPlayerObject.exhibitionTagCounterList   .get(2).GetTagNameString()

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

/*This function is to control what will happen when mouse pointer clicked above the active element of scrollable button.*/
public void ExhibitionSList(int _indexInt)             {

    List<ObjectMuseum>                  selectedMuseumObjectList            = new ArrayList<ObjectMuseum>();                                                                            /*This is a list to hold the selected object list. For example FLR_001 is selected, then this variable will be filled with floorObjectList.*/
    ObjectMuseum                        selectedMuseumObject                = null;                                                                                                     /*This is the selected museum object. From here this application will try to modify the selected museum object;s values.*/
    String                              itemScrollableString                = cp5Object        .get(ScrollableList.class, "ExhibitionSList").getItem(_indexInt).get("text").toString();      /*This String is for holding the name of the selected button.*/
    String                              temporaryTypeString                 = itemScrollableString.substring(0, Math.min(itemScrollableString.length(), 3));                            /*Take the first three characters so that this application can know which can of object is selected. Alternatively you can search over selected object type String.*/
    int                                 selectedMuseumIndexInt              = -1;                                                                                                       /*The selected index of the selected object in its object list.*/

    /*We assign the selected museum object list according to the temporary type String.*/
    if     (temporaryTypeString.equals("FLR")){ selectedMuseumObjectList    = floorObjectList;          }
    else if(temporaryTypeString.equals("ROM")){ selectedMuseumObjectList    = roomObjectList;           }
    else if(temporaryTypeString.equals("EXH")){ selectedMuseumObjectList    = exhibitionObjectList;     }

    /*The for loop below is for assigning which museum object is actually selected*/
    for(int i = 0; i < museumStringList.size(); i ++){

        /*Compare every possible String in the museum String list with the selected scrollable String.*/
        if(museumStringList.get(i)                                          == itemScrollableString){

            /*If the String match we will the index of name of the object inside the museum String list.*/
            for(int j = 0; j < selectedMuseumObjectList.size(); j ++)       {

                /*Iterate once more to to find the named object inside its object list.
                After this done, we get access to the object local and public variables and functions.*/
                if(selectedMuseumObjectList.get(j).nameAltString            == museumStringList.get(i)){ selectedMuseumObject= selectedMuseumObjectList.get(j); }

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

        ){ museumStringList.add(selectedMuseumIndexInt, selectedMuseumObject.childObjectList.get(i).nameAltString); }
        /*Set the items into the scrollable list.*/
        cp5Object        .get(ScrollableList.class, "ExhibitionSList")           .setItems(museumStringList);

    }
    /*If the selected museum object active boolean is false then remove all of its children from the museum String list and the scrollable list.*/
    else if(selectedMuseumObject.activeBoolean == false){

        /*If close the floor we must carefully close the inner most button, in this case it is the exhibition buttons.
        We need to close the room buttons and then loop again to close the exhibition buttons.*/
        if(temporaryTypeString.equals("FLR")){

            for(int i = 0; i < selectedMuseumObject.childObjectList.size(); i ++){

                for(int j = 0; j < selectedMuseumObject.childObjectList.get(i).childObjectList.size(); j ++){

                    for(int k = 0; k < museumStringList.size(); k ++){

                        if(museumStringList.get(k).equals(selectedMuseumObject.childObjectList.get(i).childObjectList.get(j).nameAltString)){

                            selectedMuseumObject.childObjectList.get(i).childObjectList.get(j).activeBoolean = false;
                            cp5Object        .get(ScrollableList.class, "ExhibitionSList").removeItem(selectedMuseumObject.childObjectList.get(i).childObjectList.get(j).nameAltString);
                            museumStringList.remove(k);
                            k --;

                        }

                    }

                }

                for(int j = 0; j < museumStringList.size(); j ++){

                    if(museumStringList.get(j).equals(selectedMuseumObject.childObjectList.get(i).nameAltString)){

                        selectedMuseumObject.childObjectList.get(i).activeBoolean = false;
                        cp5Object        .get(ScrollableList.class, "ExhibitionSList").removeItem(selectedMuseumObject.childObjectList.get(i).nameAltString);
                        museumStringList.remove(j);
                        j --;

                    }

                }

            }

        }
        /*If the button is not a floor button then we do not need to iterate deeper.*/
        else{

            for(int i = 0; i < selectedMuseumObject.childObjectList.size(); i ++){

                for(int j = 0; j < museumStringList.size(); j ++){

                    if(museumStringList.get(j).equals(selectedMuseumObject.childObjectList.get(i).nameAltString)){

                        selectedMuseumObject.childObjectList.get(i).activeBoolean = false;
                        cp5Object        .get(ScrollableList.class, "ExhibitionSList").removeItem(selectedMuseumObject.childObjectList.get(i).nameAltString);
                        museumStringList.remove(j);
                        j --;

                    }

                }

            }

        /*God bless these curly braces.*/

        }

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

/*Neat function to calculate text height.*/
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

    String _targetString                    ,
    List<ObjectMuseum> _targetObjectList

){

    for(int i = 0; i < _targetObjectList.size(); i ++){

        if(_targetObjectList.get(i).nameAltString.equals(_targetString)){ return i; }

    }
    return -1;

}

/*Create a function to add museum object.
PENDING: Later I need to add additional arguments so that the tags will also be added.*/
public ObjectMuseum AddObjectMuseum(

    String _nameAltString       ,
    String _nameFullString      ,
    String _parentNameAltString ,
    String _typeString

){

    /*Create temporary list for object that we want to make, its list, and its parent list.*/
    List<ObjectMuseum>  museumObjectList        = new ArrayList<ObjectMuseum>();
    List<ObjectMuseum>  parentMuseumObjectList  = new ArrayList<ObjectMuseum>();
    List<String>        museumStringList        = new ArrayList<String>();
    ObjectMuseum        museumObject            = new ObjectMuseum(new Name(_nameAltString, _nameFullString), _parentNameAltString, _typeString, AssignRandomTagList(tagObjectList));

    /*If statement to determine which List we should put in.*/
    if      (_typeString.equals("FLR")){

        museumObjectList            = floorObjectList;
        museumStringList            = floorStringList;

    }
    else if (_typeString.equals("ROM")){

        museumObjectList            = roomObjectList;
        parentMuseumObjectList      = floorObjectList;
        museumStringList            = roomStringList;

    }
    else if (_typeString.equals("EXH")){

        museumObjectList            = exhibitionObjectList;
        parentMuseumObjectList      = roomObjectList;
        museumStringList            = exhibitionStringList;

    }

    /*Assign the object into the object List and the String List.*/
    museumObjectList.add(museumObject);
    museumStringList.add(museumObject.nameAltString);

    /*If other than floor object we also need to determine the parent object.*/
    if      (!_typeString.equals("FLR")){

        parentMuseumObjectList  .get(FindObjectMuseumIndexInt(_parentNameAltString, parentMuseumObjectList)).SetChildObjectList(museumObjectList);
        museumObject            .SetInitialParentObject(parentMuseumObjectList);

    }

    /*Re - adjust all the index of this object that we just created.*/
    museumObject                .SetIndexInsideVoid();

    /*Reset the display of the exhibition scrollable list.*/
    museumStringList            = floorStringList;
    cp5Object                   .get(ScrollableList.class, "ExhibitionSList").setItems(museumStringList);

    return                      museumObject;

}

/*A function to return an array of object tag to be put in the museum object, randomly.*/
public Tag[] AssignRandomTagList(List<Tag> _tagObjectList) {

    /*Temporary tag object list to be returned later on this function.*/
    List<Tag> assignTagObjectList                   = new ArrayList<Tag>();
    
    /*This function need to be atleast gives three tags to a museum object.
    After three tags is inside the List then we can randomly add another tag with a chance.
    The thing is that every tag added the chance of another tag will be added/pushed
        is lower.*/
    float randomChanceFloat                         = 1f;
    while(

        (assignTagObjectList.size() <= 3) ||
        (Math.random() < randomChanceFloat)

    ){

        /*Need to make sure the inputted random tag is not something that is already in the museum object
        Create a temporary tag object to hold.*/
        int randomIndexInt  = (int)((Math.random()*_tagObjectList.size()) + 0);
        Tag tagObject       = _tagObjectList.get(randomIndexInt);
        
        /*Keep looping over and over until the random index is not a tag that is already in the list.*/
        for(int i = 0; i < assignTagObjectList.size(); i ++){

            /*If the random tag is already inside the museum object then we need to iterate again to get new random tag
                generated.*/
            while(assignTagObjectList.get(i) == tagObject){
                
                randomIndexInt  = (int)((Math.random()*_tagObjectList.size()) + 0);
                tagObject       = _tagObjectList.get(randomIndexInt);
                
            }

        }
        
        /*If the assignTagObjectList has three or more elements then we need to start reducing the changce.*/
        if(assignTagObjectList.size() > 3){ randomChanceFloat -= 0.2f; }
        
        /*Add/push a tag object into the temporary list.*/
        assignTagObjectList.add(tagObject);

    }
    
    /*Before returning the value, the object here is still in List, hence we need to convert it to array.
    Thus, it can be used in params.*/
    Tag[] assignTagObjectArray                      = new Tag[assignTagObjectList.size()];
    for(int i = 0; i < assignTagObjectArray.length; i ++){ assignTagObjectArray[i] = assignTagObjectList.get(i); }
    
    return assignTagObjectArray;

}

/*Control functions for the AddMuseumGUIObject.pde.
This function below is for to know what kind of object the class will have to make.*/
public void TypeObjectMuseumSList      (int _indexInt)                                 { addMuseumGUIObject.typeObjectMuseumString = cp5Object.get(ScrollableList.class, "TypeObjectMuseumSList").getItem(_indexInt).get("text").toString(); }
/*These three functions is used to convert the scrollable list into scrollable checklist.*/
public void SelectTagSubjectSList      (int _indexInt)                                 { ScrollableChecklistVoid("SelectTagSubjectSList"   , _indexInt); }
public void SelectTagVerbSList         (int _indexInt)                                 { ScrollableChecklistVoid("SelectTagVerbSList"      , _indexInt); }
public void SelectTagNounSList         (int _indexInt)                                 { ScrollableChecklistVoid("SelectTagNounSList"      , _indexInt); }
/*This function below is used to "convert" scrollable list into scrollable checklist.
The arguments are the name of the controller and the index of which the controller's item is selected.*/
public void ScrollableChecklistVoid    (String _scrollableNameString, int _indexInt)   {

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
    int             groupLayoutOffsetInt                = 10;                       /*This object layout offset.*/
    int             groupLabelHeightInt                 ;                           /*Make the header of the group to be exactly as the same as layout offset.*/
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

    /*Constructor.*/
    AddMuseumGUIObject(

        int     _groupXInt                      ,
        int     _groupYInt                      ,
        int     _groupAddWidthInt               ,
        int     _groupAddHeightInt              ,
        int     _parentButtonSizeInt            ,
        int     _parentDropdownObjectWidthInt

    ){

        groupXInt                               = _groupXInt;
        groupYInt                               = _groupYInt + groupLayoutOffsetInt;
        groupAddWidthInt                        = _groupAddWidthInt;
        groupAddHeightInt                       = _groupAddHeightInt;
        parentButtonSizeInt                     = _parentButtonSizeInt;
        parentDropdownObjectWidthInt            = _parentDropdownObjectWidthInt;

        groupLabelHeightInt                     = groupLayoutOffsetInt;
        scrollableWidthInt                      = ((groupAddWidthInt - groupLayoutOffsetInt*4)/3);          /*Create the scrollable list width to accomodate three scrollable list in a row.*/
        scrollableHeightInt                     = ((6*groupLabelHeightInt) + (5*scrollableOffsetInt));      /*Create the scrollable list height to accomodate five items + header in.*/
        oneLineComponentWidthInt                = ((groupAddWidthInt - groupLayoutOffsetInt*3)/2);          /*Create the one line object width to accomodate two similar object in a row.*/
        oneLineComponentHeightInt               = groupLabelHeightInt;                                      /*This need to be at the same height as the layout offset or the label height.*/

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
                                                .setSize                (scrollableWidthInt, scrollableHeightInt)
                                                .setGroup               (AddMuseumGroupObject)
                                                .addItems               (defaultStringList)
                                                .setType                (ControlP5.LIST)
                                                .setColor               (otherCColor)
                                                .setLabel               ("Parent Object:");

                cp5Object                       .addScrollableList      ("SelectTagSubjectSList")
                                                .setPosition            (groupLayoutOffsetInt, ((groupLayoutOffsetInt*2) + scrollableHeightInt))
                                                .setSize                (scrollableWidthInt, scrollableHeightInt)
                                                .setGroup               (AddMuseumGroupObject)
                                                .addItems               (subjectTagStringList)
                                                .setType                (ControlP5.LIST)
                                                .setColor               (sChecklistFalseCColor)
                                                .setLabel               ("Subject Tag:");

                cp5Object                       .addScrollableList      ("SelectTagVerbSList")
                                                .setPosition            (((groupLayoutOffsetInt*2) + scrollableWidthInt), ((groupLayoutOffsetInt*2) + scrollableHeightInt))
                                                .setSize                (scrollableWidthInt, scrollableHeightInt)
                                                .setGroup               (AddMuseumGroupObject)
                                                .addItems               (verbTagStringList)
                                                .setType                (ControlP5.LIST)
                                                .setColor               (sChecklistFalseCColor)
                                                .setLabel               ("Verb Tag:");

                cp5Object                       .addScrollableList      ("SelectTagNounSList")
                                                .setPosition            (((groupLayoutOffsetInt*3) + (scrollableWidthInt*2)), ((groupLayoutOffsetInt*2) + scrollableHeightInt))
                                                .setSize                (scrollableWidthInt, scrollableHeightInt)
                                                .setGroup               (AddMuseumGroupObject)
                                                .addItems               (nounTagStringList)
                                                .setType                (ControlP5.LIST)
                                                .setColor               (sChecklistFalseCColor)
                                                .setColor               (otherCColor)
                                                .setLabel               ("Noun Tag:");

                cp5Object                       .addTextlabel           ("CanAddMultipleTagsTextlabel")
                                                .setPosition            (groupLayoutOffsetInt, ((groupLayoutOffsetInt*3) + (scrollableHeightInt*2)))
                                                .setGroup               (AddMuseumGroupObject)
                                                .setColor               (otherCColor)
                                                .setColorValue          (255)
                                                .setText                ("*You can add multiple tags,\nbut minimum one tag in each category.");

                cp5Object                       .addTextfield           ("NameFullTextfield")
                                                .setPosition            (groupLayoutOffsetInt, ((groupLayoutOffsetInt*6) + (scrollableHeightInt*2)))
                                                .setSize                (oneLineComponentWidthInt, (oneLineComponentHeightInt*2))
                                                .setGroup               (AddMuseumGroupObject)
                                                .setColor               (otherCColor)
                                                .setLabel               ("Name Full:");

                cp5Object                       .addTextfield           ("NameAltTextfield")
                                                .setPosition            (((groupLayoutOffsetInt*2) + oneLineComponentWidthInt), ((groupLayoutOffsetInt*6) + (scrollableHeightInt*2)))
                                                .setSize                (oneLineComponentWidthInt, (oneLineComponentHeightInt*2))
                                                .setGroup               (AddMuseumGroupObject)
                                                .setColor               (otherCColor)
                                                .setLabel               ("Name Alternative:");

                cp5Object                       .addButton              ("SubmitButton")
                                                .setPosition            (groupLayoutOffsetInt, ((groupLayoutOffsetInt*9) + (scrollableHeightInt*2) + oneLineComponentHeightInt))
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

    public void DrawVoid(float _alphaFloat){

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

        /*Especially for group controller you need to adjust four methods instead of just one.*/
        cp5Object.get(Group         .class  , "AddMuseumGroupObject"            ).setBackgroundColor    (groupBackgroundColor);
        cp5Object.get(Group         .class  , "AddMuseumGroupObject"            ).setColor              (otherCColor);
        cp5Object.get(Group         .class  , "AddMuseumGroupObject"            ).setColorBackground    (groupColorBackgroundColor);
        cp5Object.get(Group         .class  , "AddMuseumGroupObject"            ).setColorLabel         (groupColorLabelColor);

        cp5Object.get(ScrollableList.class  , "TypeObjectMuseumSList"           ).setColor              (otherCColor);
        cp5Object.get(ScrollableList.class  , "SelectParentObjectMuseumSList"   ).setColor              (otherCColor);
        cp5Object.get(ScrollableList.class  , "SelectTagSubjectSList"           ).setColor              (otherCColor);
        cp5Object.get(ScrollableList.class  , "SelectTagVerbSList"              ).setColor              (otherCColor);
        cp5Object.get(ScrollableList.class  , "SelectTagNounSList"              ).setColor              (otherCColor);
        cp5Object.get(Textlabel     .class  , "CanAddMultipleTagsTextlabel"     ).setColor              (otherCColor);
        cp5Object.get(Textfield     .class  , "NameFullTextfield"               ).setColor              (otherCColor);
        cp5Object.get(Textfield     .class  , "NameAltTextfield"                ).setColor              (otherCColor);
        cp5Object.get(Button        .class  , "SubmitButton"                    ).setColor              (otherCColor);

        /*This to re - set SelectParentObjectMuseumSList so that it display options according to the TypeObjectMuseumSList selection.*/
        if      (typeObjectMuseumString.equals("Floor"      )){ cp5Object.get(ScrollableList.class, "SelectParentObjectMuseumSList").setItems(defaultStringList  ); typeObjectMuseumString = ""; }
        else if (typeObjectMuseumString.equals("Room"       )){ cp5Object.get(ScrollableList.class, "SelectParentObjectMuseumSList").setItems(floorStringList    ); typeObjectMuseumString = ""; }
        else if (typeObjectMuseumString.equals("Exhibition" )){ cp5Object.get(ScrollableList.class, "SelectParentObjectMuseumSList").setItems(roomStringList     ); typeObjectMuseumString = ""; }

        /*This code below is for controlling controllers outside of this class.
        These two if statements is for controlling the position of the other object in the same open close button.*/
        if      (cp5Object.get(Group.class, "AddMuseumGroupObject").isOpen() == true ){

                 cp5Object.get(ScrollableList.class, "ExhibitionSList").setPosition(

                    (width -  guiOffsetInt      - (parentButtonSizeInt/2) - parentDropdownObjectWidthInt    ),
                    (        (guiOffsetInt*1.5f) + (parentButtonSizeInt/2) + groupAddHeightInt               )

                );
                
        }
        else if (cp5Object.get(Group.class, "AddMuseumGroupObject").isOpen() == false){

                 cp5Object.get(ScrollableList.class, "ExhibitionSList").setPosition(

                    (width -  guiOffsetInt - (parentButtonSizeInt/2) - parentDropdownObjectWidthInt ),
                    (         guiOffsetInt + (parentButtonSizeInt/2) + groupLabelHeightInt          )

                );

        }

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
    List<String>        tagMuseumNameAltStringList  = new ArrayList<String>();          /*The tags for whit museum object.*/

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
        for(int i = 0; i < tagMuseumObjectList.size(); i ++)
                                                    { tagMuseumNameAltStringList.add(tagMuseumObjectList.get(i).nameAltString); }

        /*Create panel.*/
        panelObject                                 = new Panel();

    }

    /*A function to update this object museum variables over time.*/
    public void DrawVoid()                                                                     {

        SetFullBoolean  ();
        SetHoverBoolean ();
        PanelDrawVoid   ();

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
    List<Integer>   tagCounterIntList   = new ArrayList<Integer>();
    String          tagNameString       = "";
    int             tagCounterInt       = -1;

    TagCounter(){}

    /*Getter and setter function for counting tha tags.*/
    public void    SetTagNameStringVoid    (String _tagNameString) { tagNameString = _tagNameString; }
    public void    SetTagCounterIntVoid    (int    _tagCounterInt) {

        /*I create an array becuse comparator will not working on primitive data type.
        Hence, I put the value in one element List.*/
        tagCounterInt       = _tagCounterInt;
        tagCounterIntList   = new ArrayList<Integer>();
        tagCounterIntList   .add(tagCounterInt);

    }
    public int     GetTagCounterInt        (){ return tagCounterInt; }
    public String  GetTagNameString        (){ return tagNameString; }

}

/*A class of player object.
The player object will be the class that can be either played by the user (somekind like simulation)
    or being automated.*/
class ObjectPlayer{

    String              exhibitionCurrentString     = "";                               /*Current exhibition in String.*/
    List<String>        exhibitionTargetStringList  = new ArrayList<String>();          /*Target exhibition that will be given to the player*/
    List<String>        exhibitionVisitedStringList = new ArrayList<String>();          /*Amount of exhibition that have just visited by the player.*/
    List<TagCounter>    exhibitionTagCounterList    = new ArrayList<TagCounter>();      /*The amount of tag that have been collected by this player.*/

    int                 playerIndexInt              = 0;                                /*Unique identifier for each player object, can be changed later to name.*/

    List<ObjectPlayer>  playerSiblingObjectList     = new ArrayList<ObjectPlayer>();    /*How many player object are in the same exhibition.*/
    int                 playerSiblingIndexInt       = -1;                               /*The index of this object within the List of object player sibling.*/

    float               timeCurrentExhibitionFloat  = 0f;                               /*How many frame/tick this player already stay in an exhibition.*/

    /*Panel variable.*/
    boolean hoverBoolean                            = false;
    int   panelUnfinishedColor                    = color(217, 160, 102);
    int   panelFinishedColor                      = color(223, 113, 38 );
    int     widthPanelInt                           = 0;
    int     heightPanelInt                          = 0;
    int     xPanelInt                               = 0;
    int     yPanelInt                               = 0;
    Panel   panelObject                             = null;

    /*Constructor.*/
    ObjectPlayer(

        int     _playerIndexInt            ,
        String  _exhibitionStartString

    ){

        playerIndexInt      = _playerIndexInt;
        playerObjectList    .add(this);
        panelObject         = new Panel();
        ExhibitionMoveObject(_exhibitionStartString);

    }

    /*A function to either add the tag or increase the tag value in this player.*/
    public void AddTagCounterVoid(

        ObjectMuseum _exhibitionCurrentObject

    ){

        for(int i = 0; i < _exhibitionCurrentObject.tagMuseumNameAltStringList.size(); i ++){

            /*Create new tag counter to count how many tags are in the user preference.*/
            TagCounter  tagCounter      = new TagCounter();
                        tagCounter      .SetTagNameStringVoid(_exhibitionCurrentObject.tagMuseumNameAltStringList.get(i));

            boolean     newBool         = true;     /*Whether the tag is new to the array or there is already existing one.*/
            int         indexInt        = -1;       /*If there is the corresponding tag already in the array return its index with this variable, otherwise it keeps -1.*/

            /*Iterate through all tag those already gathered to find if there any tag that
                is already registered in this player.*/
            for(int j = 0; j < exhibitionTagCounterList.size(); j ++){

                if(

                    exhibitionTagCounterList.get(j).GetTagNameString().equals(

                        tagCounter.GetTagNameString()

                    )

                ){

                    newBool             = false;
                    indexInt            = j;

                }

            }

            /*If the tag received is new then set the initial tag value to 1 and
                add the tag to the tag counter.*/
            if      (newBool == true ){

                tagCounter                  .SetTagCounterIntVoid(1);
                exhibitionTagCounterList    .add(tagCounter);

            }
            /*If the tag received is alredy filled in before then increase the tag counter.*/
            else if (newBool == false){

                exhibitionTagCounterList.get(indexInt).SetTagCounterIntVoid(exhibitionTagCounterList.get(indexInt).GetTagCounterInt() + 1);

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
        if(exhibitionObjectList.size()                      > exhibitionVisitedStringList.size()){

            /*Increase the amount of time of this player in the current exhibition the visitor visits.
            The more time this player spent time in the exhibition the more chance the visitor will move to the
                new exhibition.
            PENDING: Change the time increment per second add and per frame.*/
            float   randomFloat                             = (float)(Math.random());
                    timeCurrentExhibitionFloat              += 0.01f;

            if(randomFloat > (1f - timeCurrentExhibitionFloat)){

                /*Move player to the new exhibition.*/
                int randomIndexInt          = (int)(Math.floor((Math.random()*exhibitionTargetStringList.size()) + 0));
                ExhibitionMoveObject        (exhibitionTargetStringList.get(randomIndexInt));
                timeCurrentExhibitionFloat    = 0;                                                                            /*Reset timer.*/

            }

        }

    }

    /*A function to update this player variables over time.*/
    public void DrawVoid()                                                                     {

        AIAutoVoid      ();
        SetHoverBoolean ();
        PanelDrawVoid   ();

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
    public List<String> SetExhibitionTargetStringList()      {

        exhibitionTargetStringList  = new ArrayList<String>();

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

                exhibitionTargetStringList.add(

                    exhibitionObjectList.get(i).nameAltString

                );

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
                exhibitionTargetStringList                      .remove(exhibitionObjectList.get(i).nameAltString);
                if(exhibitionTargetStringList.size() == 3)      { return exhibitionTargetStringList; }

            }

        }

        /*Stage three sort.
        Stage three sort is to make the exhibition that has been visited before has 90% chance to make into target exhibition.
        For example the visitor is now in the Exhibition C as he/she used to visits Exhibition A and Exhibition B before,
            the system now will let Exhibition A and Exhibition B to have 10% chance to be not removed from the target
            exhibition array.*/
        for(int i = 0; i < exhibitionVisitedStringList.size(); i ++){

            for(int j = 0; j < exhibitionTargetStringList.size(); j ++){

                /*Compare the target exhibitions with all visited exhibition.
                If it matches then the corresponding exhibition has 90% chance to be deleted
                    from target exhibition array.*/
                if(exhibitionTargetStringList.get(j).equals(exhibitionVisitedStringList.get(i))){

                    if(Math.random() < 0.90f){

                        exhibitionTargetStringList.remove(exhibitionTargetStringList.get(j));
                        j --;

                    }

                    /*After each remove make sure to have the exhibition target length to be 3.
                    If not 3 elements in the target exhibition array, then return the last 3 elements
                        of target exhibition array ever exist.*/
                    if(exhibitionTargetStringList.size() == 3)  { return exhibitionTargetStringList; }

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
        for(int i = 0; i < tempTagStringArray.length            ; i ++){ tempTagStringArray[i] = exhibitionTagCounterList.get(i).GetTagNameString(); }
        for(int i = 0; i < exhibitionTargetStringList.size()    ; i ++){

            ObjectMuseum    exhibitionTargetObject  = FindObject(exhibitionObjectList, exhibitionTargetStringList.get(i));
            int             tagSameCountInt         = 0;

            for(int j = 0; j < exhibitionTargetObject.tagMuseumNameAltStringList.size(); j ++){

                for(int k = 0; k < tempTagStringArray.length; k ++){

                    if(exhibitionTargetObject.tagMuseumNameAltStringList.get(j) == tempTagStringArray[k]){ tagSameCountInt ++; }

                }

            }
            
            if      (tagSameCountInt == 0)          {                            exhibitionTargetStringList.remove(exhibitionTargetStringList.get(i)); i --; }
            else if (tagSameCountInt == 1)          { if(Math.random() < 0.66f){ exhibitionTargetStringList.remove(exhibitionTargetStringList.get(i)); i --; } }
            else if (tagSameCountInt == 2)          { if(Math.random() < 0.33f){ exhibitionTargetStringList.remove(exhibitionTargetStringList.get(i)); i --; } }
            else if (tagSameCountInt == 3)          {  }

            /*After each remove make sure to have the exhibition target length to be 3.
            If not 3 elements in the target exhibition array, then return the last 3 elements
                of target exhibition array ever exist.*/
            if(exhibitionTargetStringList.size() == 3)  { return exhibitionTargetStringList; }

        }

        ObjectMuseum    exhibitionCurrentObject     = FindObject(exhibitionObjectList, exhibitionCurrentString);
        String          roomCurrentString           = exhibitionCurrentObject.parentNameAltString;
        ObjectMuseum    roomCurrentObject           = FindObject(roomObjectList, roomCurrentString);
        String          floorCurrentString          = roomCurrentObject.parentNameAltString;
        ObjectMuseum    floorCurrentObject          = FindObject(floorObjectList, floorCurrentString);

        /*Stage five sort.
        The fourth sort is to make the exhibition target that are not in the same floor or room of which player's
            current exhibition to have 50% chance of stay.*/
        for(int i = 0; i < exhibitionTargetStringList.size(); i ++){

            ObjectMuseum    exhibitionTargetObject  = FindObject(exhibitionObjectList, exhibitionTargetStringList.get(i));
            String          roomTargetString        = exhibitionTargetObject.parentNameAltString;
            ObjectMuseum    roomTargetObject        = FindObject(roomObjectList, roomTargetString);
            String          floorTargetString       = roomTargetObject.parentNameAltString;
            ObjectMuseum    floorTargetObject       = FindObject(floorObjectList, floorTargetString);

            if(roomCurrentString    != roomTargetString ){

                if(Math.random() < 0.20f){ exhibitionTargetStringList.remove(exhibitionTargetStringList.get(i)); i --; }
                else{

                    if(floorCurrentString != floorTargetString){ if(Math.random() < 0.50f){ exhibitionTargetStringList.remove(exhibitionTargetStringList.get(i)); i --; } }

                }

            }
            
            /*After each remove make sure to have the exhibition target length to be 3.
            If not 3 elements in the target exhibition array, then return the last 3 elements
                of target exhibition array ever exist.*/
            if(exhibitionTargetStringList.size() == 3)  { return exhibitionTargetStringList; }

        }

        /*Make sure to only have three exhibition target at the end of this function.*/
        if(exhibitionTargetStringList.size() > 3){

            int listIndexInt = exhibitionTargetStringList.size() - 1;

            while(exhibitionTargetStringList.size() > 3){

                exhibitionTargetStringList  .remove(listIndexInt);
                listIndexInt                --;

            }

        }
        return                      exhibitionTargetStringList;

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
            AddRemoveChildVoid(false);

            exhibitionCurrentObject     = FindObject(exhibitionObjectList   , exhibitionCurrentString                           );
            roomCurrentObject           = FindObject(roomObjectList         , exhibitionCurrentObject   .parentNameAltString    );
            floorCurrentObject          = FindObject(floorObjectList        , roomCurrentObject         .parentNameAltString    );
            exhibitionCurrentObject     .visitorCurrentInt --;
            roomCurrentObject           .visitorCurrentInt --;
            floorCurrentObject          .visitorCurrentInt --;

        }

        exhibitionCurrentString         = _targetNameAltString;             /*Chanhe the String for current exhibition.*/
        exhibitionVisitedStringList     .add(exhibitionCurrentString);      /*Add the current exhibition to visited exhibition list.*/
        
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

        AddTagCounterVoid               (exhibitionCurrentObject);
        AddRemoveChildVoid              (true);
        
        SetExhibitionTargetStringList   ();
        SetSiblingObjectList            ();

        /*For everytime a player move to another exhibition iterate through all player to re - add the siblings.*/
        for(int i = 0; i < playerObjectList.size(); i ++){

            playerObjectList.get(i).SetExhibitionTargetStringList   ();
            playerObjectList.get(i).SetSiblingObjectList            ();

        }

        return exhibitionCurrentObject;

    }

    /*A function to find an object from an array.*/
    public ObjectMuseum FindObject(

        List<ObjectMuseum>  _targetObjectList       ,
        String              _targetNameAltString

    ){

        ObjectMuseum objectMuseum = null;
        for(int i = 0; i < _targetObjectList.size(); i ++){

            if(_targetObjectList.get(i).nameAltString.equals(_targetNameAltString)){

                objectMuseum = _targetObjectList.get(i);

            }

        }

        return objectMuseum;

    }
    
    /*A function to draw panel.*/
    public Panel PanelDrawVoid()                                                                 {

        SetPanelVariableInsideVoid  ();

        /*Here we determine the color based whether this player/visitor has visited total amount exhibition or not.*/
        int   usedColor;
        if      (exhibitionVisitedStringList.size() == exhibitionObjectList.size()) { usedColor = panelFinishedColor;   }
        else                                                                        { usedColor = panelUnfinishedColor; }

        panelObject                 .DrawVoid(

            usedColor               ,
            widthPanelInt           ,
            heightPanelInt          ,
            xPanelInt               ,
            yPanelInt               ,
            ("" + playerIndexInt)

        );

        return panelObject;

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
