import controlP5.*;
import java.util.*;

boolean                 buttonOpenCloseBoolean          = false ;
ControlP5               cp5DropdownObject                       ;
ButtonOpenClose         buttonOpenCloseMuseumObject             ;
ButtonOpenClose         buttonOpenClosePlayerObject             ;

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

void setup()                                    {

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

    cp5DropdownObject                   = new ControlP5(this);

    int buttonSizeInt                   = (width > height) ? ((width*15)/512) : ((height*15)/512);  /*Button size temporary variable.*/
    buttonOpenCloseMuseumObject         = new ButtonOpenClose(buttonSizeInt);                       /*Initiates button open close with size of 30 pixels. PENDING: Adjust later based on application resolution.*/
    buttonOpenClosePlayerObject         = new ButtonOpenClose(buttonSizeInt);                       /*Initiates button open close with size of 30 pixels. PENDING: Adjust later based on application resolution.*/

    int dropdownObjectWidthInt          = (width/3);
    int dropdownObjectHeightInt         = (height - ((guiOffsetInt + (buttonSizeInt/2))*2));
    int itemHeightInt                   = (dropdownObjectHeightInt/20);

    /*Create player dropdown menu.*/
    cp5DropdownObject
        .addScrollableList              ("Exhibition")
        .setPosition                    (

            ((width - ((guiOffsetInt/2)*2) - (buttonSizeInt/2)) - dropdownObjectWidthInt),
            (guiOffsetInt + (buttonSizeInt/2))

        )
        .setSize                        (dropdownObjectWidthInt, dropdownObjectHeightInt)
        .setBarHeight                   (itemHeightInt)
        .setItemHeight                  (itemHeightInt)
        .setType                        (ControlP5.LIST)
        .show                           ();

    /*Create player dropdown menu.*/
    cp5DropdownObject
        .addScrollableList              ("Visitor")
        .setPosition                    (

            ((guiOffsetInt/2)*2) + (buttonSizeInt/2),
            (guiOffsetInt + (buttonSizeInt/2))

        )
        .setSize                        (dropdownObjectWidthInt, dropdownObjectHeightInt)
        .setBarHeight                   (itemHeightInt)
        .setItemHeight                  (itemHeightInt)
        .setType                        (ControlP5.LIST)
        .hide                           ();

    museumStringList                    = floorStringList;                                  /*Set the initial item for this scrollable list.*/
    cp5DropdownObject                   .get(ScrollableList.class, "Exhibition")
                                        .setItems(floorStringList);
    /*
    cp5DropdownObject                   .get(ScrollableList.class, "Visitor")
                                        .setItems();
    */

}

void draw()                                                 {

    /*PROTOTYPE.*/
    test ++;
    println(roomObjectList.get(0).childObjectList.size());
    if(test == 500 && testBoolean == true){
        ObjectMuseum testObjectMuseum = new ObjectMuseum(new Name("EXH_TES", "Exhibition Test"), "ROM_AFK", "EXH", AssignRandomTagList(tagObjectList));
        exhibitionObjectList.add(testObjectMuseum);
        exhibitionStringList.add(testObjectMuseum.nameAltString);
        roomObjectList.get(0).SetChildObjectList(exhibitionObjectList);
        testObjectMuseum.SetInitialParentObject(roomObjectList);
        testObjectMuseum.SetIndexInsideVoid();
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

    dropdownMObjectAlphaFloat               = ScrollableDrawFloat(dropdownMObjectAlphaFloat   , (width - guiOffsetInt)   , guiOffsetInt     , buttonOpenCloseMuseumObject   , "Exhibition" );
    dropdownPlayerAlphaFloat                = ScrollableDrawFloat(dropdownPlayerAlphaFloat    , guiOffsetInt             , guiOffsetInt     , buttonOpenClosePlayerObject   , "Visitor"    );

    /*Update buttonOpenCloseBoolean.*/
    SetButtonOpenCloseBoolean   ();
    /*Create the card.*/
    if(buttonOpenCloseBoolean == false){ CreatePanelCardVoid(); }

}

/*The mouse pressed override function is for the open and close button.*/
void mousePressed()                                         {

    if(buttonOpenClosePlayerObject.MouseOverBoolean() == true){ buttonOpenClosePlayerObject.isAnimatingBoolean = true; }
    if(buttonOpenCloseMuseumObject.MouseOverBoolean() == true){ buttonOpenCloseMuseumObject.isAnimatingBoolean = true; }

}
/*A function to check whether an object of museum is hovered by mouse pointer.*/
void CheckMuseumObjectHoverVoid(int _indexInt, List<ObjectMuseum> _targetObjectList){

    /*This is to check which museum/player object is hovered, then create panel based on that object position.*/
    if(_targetObjectList.get(_indexInt).SetHoverBoolean() == true && panelCardChangeBoolean == true){

        xPanelCardInt           = _targetObjectList.get(_indexInt).panelObject.xPanelInt + (_targetObjectList.get(_indexInt).panelObject.widthPanelInt /2 );
        yPanelCardInt           = _targetObjectList.get(_indexInt).panelObject.yPanelInt + (_targetObjectList.get(_indexInt).panelObject.heightPanelInt/2);
        selectedMuseumObject    = _targetObjectList.get(_indexInt);

        panelCardChangeBoolean  = false;

    }

}

/*A function to check whether an object of player is hovered by mouse pointer.*/
void CheckPlayerObjectHoverVoid(int _indexInt){

    /*This is to check which museum/player object is hovered, then create panel based on that object position.*/
    if(playerObjectList.get(_indexInt).SetHoverBoolean() == true && panelCardChangeBoolean == true){

        xPanelCardInt           = playerObjectList.get(_indexInt).panelObject.xPanelInt + (playerObjectList.get(_indexInt).panelObject.widthPanelInt/2 );
        yPanelCardInt           = playerObjectList.get(_indexInt).panelObject.yPanelInt + (playerObjectList.get(_indexInt).panelObject.heightPanelInt/2);
        selectedPlayerObject    = playerObjectList.get(_indexInt);

        panelCardChangeBoolean  = false;

    }

}

/*A function to control color for each possible type of buttons.*/
void ColorControlVoid(

    String  _captionString          ,
    CColor  _floorCColorObject      ,
    CColor  _roomCColorObject       ,
    CColor  _exhibitionCColorObject

){

    if(_captionString.equals("Exhibition")){

        for(int i = 0; i < museumStringList.size(); i ++){

            String  itemScrollableString    = cp5DropdownObject.get(ScrollableList.class, _captionString).getItem(i).get("text").toString();
            String  temporaryTypeString     = itemScrollableString.substring(0, Math.min(itemScrollableString.length(), 3));

            if      (temporaryTypeString.equals("FLR")){ cp5DropdownObject.get(ScrollableList.class, _captionString).getItem(i).put("color", _floorCColorObject);        }
            else if (temporaryTypeString.equals("ROM")){ cp5DropdownObject.get(ScrollableList.class, _captionString).getItem(i).put("color", _roomCColorObject);         }
            else if (temporaryTypeString.equals("EXH")){ cp5DropdownObject.get(ScrollableList.class, _captionString).getItem(i).put("color", _exhibitionCColorObject);   }

        }

    }

}

/*A function to create panel card.*/
void CreatePanelCardVoid()                          {

    if(panelCardChangeBoolean == false){

        fill                (panelCardColor);

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

            if      (selectedMuseumObject.visitorCurrentInt < 10   ){ tempVisitorCurrentString = "______"     + selectedMuseumObject.visitorCurrentInt; }
            else if (selectedMuseumObject.visitorCurrentInt < 100  ){ tempVisitorCurrentString = "_____"     + selectedMuseumObject.visitorCurrentInt; }
            else if (selectedMuseumObject.visitorCurrentInt < 1000 ){ tempVisitorCurrentString = "____"      + selectedMuseumObject.visitorCurrentInt; }
            else if (selectedMuseumObject.visitorCurrentInt < 10000){ tempVisitorCurrentString = "___"       + selectedMuseumObject.visitorCurrentInt; }

            if      (selectedMuseumObject.visitorTotalInt   < 10   ){ tempVisitorTotalString = "______"     + selectedMuseumObject.visitorTotalInt; }
            else if (selectedMuseumObject.visitorTotalInt   < 100  ){ tempVisitorTotalString = "_____"     + selectedMuseumObject.visitorTotalInt; }
            else if (selectedMuseumObject.visitorTotalInt   < 1000 ){ tempVisitorTotalString = "____"      + selectedMuseumObject.visitorTotalInt; }
            else if (selectedMuseumObject.visitorTotalInt   < 10000){ tempVisitorTotalString = "___"       + selectedMuseumObject.visitorTotalInt; }

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
void Exhibition(int _indexInt)                              {

    List<ObjectMuseum>                  selectedMuseumObjectList            = new ArrayList<ObjectMuseum>();                                                                            /*This is a list to hold the selected object list. For example FLR_001 is selected, then this variable will be filled with floorObjectList.*/
    ObjectMuseum                        selectedMuseumObject                = null;                                                                                                     /*This is the selected museum object. From here this application will try to modify the selected museum object;s values.*/
    String                              itemScrollableString                = cp5DropdownObject.get(ScrollableList.class, "Exhibition").getItem(_indexInt).get("text").toString();      /*This String is for holding the name of the selected button.*/
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
        cp5DropdownObject.get(ScrollableList.class, "Exhibition")           .setItems(museumStringList);

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
                            cp5DropdownObject.get(ScrollableList.class, "Exhibition").removeItem(selectedMuseumObject.childObjectList.get(i).childObjectList.get(j).nameAltString);
                            museumStringList.remove(k);
                            k --;

                        }

                    }

                }

                for(int j = 0; j < museumStringList.size(); j ++){

                    if(museumStringList.get(j).equals(selectedMuseumObject.childObjectList.get(i).nameAltString)){

                        selectedMuseumObject.childObjectList.get(i).activeBoolean = false;
                        cp5DropdownObject.get(ScrollableList.class, "Exhibition").removeItem(selectedMuseumObject.childObjectList.get(i).nameAltString);
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
                        cp5DropdownObject.get(ScrollableList.class, "Exhibition").removeItem(selectedMuseumObject.childObjectList.get(i).nameAltString);
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
boolean SetButtonOpenCloseBoolean()                         {

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
            cp5DropdownObject
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
            cp5DropdownObject
                .get            (ScrollableList.class, _captionString)
                .setColor       (_defaultCColorObject)
                .show           ();
            /*Increase the opacity value over time.*/
            _alphaFloat                     += (255f/45f);

        }

    }
    /*When the button is not animating.*/
    else if     (_isAnimatingBoolean == false){

        /*When the button is not animating and the button is close.*/
        if      (_buttonOpenCloseBoolean == true ){

            /*Set the color according to the caption title.*/
            ColorControlVoid(_captionString, _floorCColorObject, _roomCColorObject, _exhibitionCColorObject);
            /*Show the scrollable list.*/
            cp5DropdownObject
                .get            (ScrollableList.class, _captionString)
                .show           ();
            /*Set the alpha value of this scrollable list to one tick before it goes full opacity.*/
            _alphaFloat         = (255f - (255f/45f));

        }
        /*When the button is not animating and the button is open.*/
        else if (_buttonOpenCloseBoolean == false){

            /*Hide the scrollable list.*/
            cp5DropdownObject
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

/*Neat function to calculate text height.*/
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


/*A function to return an array of object tag to be put in the museum object, randomly.*/
Tag[] AssignRandomTagList(List<Tag> _tagObjectList) {

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