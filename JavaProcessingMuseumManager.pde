import controlP5.*;
import java.util.*;

ControlP5               cp5Object;
ButtonOpenClose         buttonOpenCloseMuseumObject;
List<String>            sampleListChar              = Arrays.asList("a", "b", "c", "d", "e", "f", "g", "h");
List<ObjectMuseum>      floorObjectList             = new ArrayList<ObjectMuseum>();    /*This list contains all possible floor object.*/
List<ObjectMuseum>      roomObjectList              = new ArrayList<ObjectMuseum>();    /*This list contains all possible room object.*/
List<ObjectMuseum>      exhibitionObjectList        = new ArrayList<ObjectMuseum>();    /*This list contains all possible exhibition object.*/

ObjectMuseum[]          floorObjectArray            = new ObjectMuseum[4];              /*Temporary museum object array for initialization.*/
ObjectMuseum[]          roomObjectArray             = new ObjectMuseum[4];              /*Temporary museum object array for initialization.*/
ObjectMuseum[]          exhibitionObjectArray       = new ObjectMuseum[16];             /*Temporary museum object array for initialization.*/

int                     dropdownPlayerAlphaInt      = 0;                                /*The opacity number for dropdown player P5 component..*/

void    setup                           (){

    size                                (320, 240, P2D);
    cp5Object                           = new ControlP5(this);      /*Initiates ControlP5 object.*/
    
    buttonOpenCloseMuseumObject         = new ButtonOpenClose(30);  /*Initiates button open close with size of 30 pixels. PENDING: Adjust later based on application resolution.*/
    
    int dropdownPlayerWidth             = 200;                      /*The width of player dropdown menu. PENDING: Adjust later based on application resolution.*/
    int dropdownPlayerHeight            = 100;                      /*The height of player dropdown menu. PENDING: Adjust later based on application resolution.*/


    /*Create player dropdown menu.
    PENDING: Adjust the size of this dropdown menu according to the application resolution.*/
    cp5Object.addScrollableList         ("DropdownPlayer")
        .setPosition                    (

            ((width/2) - (dropdownPlayerWidth/2)),
            ((height/2) - (dropdownPlayerHeight/2))

        )
        .setSize                        (dropdownPlayerWidth, dropdownPlayerHeight)
        .setBarHeight                   (20)
        .setItemHeight                  (20)
        .hide                           ()
        .addItems                       (sampleListChar);

    /*Prototype function to init museum object.
    Later on please init everything from the .csv file.*/
    MuseumObjectInitVoid                ();

}

/*Prototype function to init all basic museum manager.*/
void MuseumObjectInitVoid           (){

    /*Create all initial museum objects and assign its tags and parent object.*/
    floorObjectArray[0]             = new ObjectMuseum(new Name("FLR_001", "First Floor"                        ), "XXX_XXX", "FLR", "TAG_XXX");
    floorObjectArray[1]             = new ObjectMuseum(new Name("FLR_002", "Second Floor"                       ), "XXX_XXX", "FLR", "TAG_XXX");
    floorObjectArray[2]             = new ObjectMuseum(new Name("FLR_003", "Third Floor"                        ), "XXX_XXX", "FLR", "TAG_XXX");
    floorObjectArray[3]             = new ObjectMuseum(new Name("FLR_004", "Fourth Floor"                       ), "XXX_XXX", "FLR", "TAG_XXX");
    roomObjectArray[0]              = new ObjectMuseum(new Name("ROM_AFK", "Room Afrika"                        ), "FLR_001", "ROM", "TAG_XXX");
    roomObjectArray[1]              = new ObjectMuseum(new Name("ROM_AME", "Room America"                       ), "FLR_001", "ROM", "TAG_XXX");
    roomObjectArray[2]              = new ObjectMuseum(new Name("ROM_ASI", "Room Asia"                          ), "FLR_001", "ROM", "TAG_XXX");
    roomObjectArray[3]              = new ObjectMuseum(new Name("ROM_EUR", "Room Europe"                        ), "FLR_001", "ROM", "TAG_XXX");
    exhibitionObjectArray[0]        = new ObjectMuseum(new Name("EXH_CAM", "Exhibition Cameroon"                ), "ROM_AFK", "EXH", "TAG_XXX");
    exhibitionObjectArray[1]        = new ObjectMuseum(new Name("EXH_EGY", "Exhibition Egypt"                   ), "ROM_AFK", "EXH", "TAG_XXX");
    exhibitionObjectArray[2]        = new ObjectMuseum(new Name("EXH_ETH", "Exhibition Ethiopia"                ), "ROM_AFK", "EXH", "TAG_XXX");
    exhibitionObjectArray[3]        = new ObjectMuseum(new Name("EXH_NIG", "Exhibition Nigeria"                 ), "ROM_AFK", "EXH", "TAG_XXX");
    exhibitionObjectArray[4]        = new ObjectMuseum(new Name("EXH_BRA", "Exhibition Brazil"                  ), "ROM_AME", "EXH", "TAG_XXX");
    exhibitionObjectArray[5]        = new ObjectMuseum(new Name("EXH_CAN", "Exhibition Canada"                  ), "ROM_AME", "EXH", "TAG_XXX");
    exhibitionObjectArray[6]        = new ObjectMuseum(new Name("EXH_MEX", "Exhibition Mexico"                  ), "ROM_AME", "EXH", "TAG_XXX");
    exhibitionObjectArray[7]        = new ObjectMuseum(new Name("EXH_USA", "Exhibition United States Of America"), "ROM_AME", "EXH", "TAG_XXX");
    exhibitionObjectArray[8]        = new ObjectMuseum(new Name("EXH_CAM", "Exhibition Cambodia"                ), "ROM_ASI", "EXH", "TAG_XXX");
    exhibitionObjectArray[9]        = new ObjectMuseum(new Name("EXH_IND", "Exhibition India"                   ), "ROM_ASI", "EXH", "TAG_XXX");
    exhibitionObjectArray[10]       = new ObjectMuseum(new Name("EXH_JAP", "Exhibition Japan"                   ), "ROM_ASI", "EXH", "TAG_XXX");
    exhibitionObjectArray[11]       = new ObjectMuseum(new Name("EXH_SIN", "Exhibition Singapore"               ), "ROM_ASI", "EXH", "TAG_XXX");
    exhibitionObjectArray[12]       = new ObjectMuseum(new Name("EXH_BEL", "Exhibition Belgium"                 ), "ROM_EUR", "EXH", "TAG_XXX");
    exhibitionObjectArray[13]       = new ObjectMuseum(new Name("EXH_FRA", "Exhibition France"                  ), "ROM_EUR", "EXH", "TAG_XXX");
    exhibitionObjectArray[14]       = new ObjectMuseum(new Name("EXH_GER", "Exhibition Germany"                 ), "ROM_EUR", "EXH", "TAG_XXX");
    exhibitionObjectArray[15]       = new ObjectMuseum(new Name("EXH_NED", "Exhibition The Netherlands"         ), "ROM_EUR", "EXH", "TAG_XXX");

    /*Add each objects into corresponding list.*/
    for(int i = 0; i < floorObjectArray         .length; i ++){ floorObjectList         .add(floorObjectArray[i]        ); }
    for(int i = 0; i < roomObjectArray          .length; i ++){ roomObjectList          .add(roomObjectArray[i]         ); }
    for(int i = 0; i < exhibitionObjectArray    .length; i ++){ exhibitionObjectList    .add(exhibitionObjectArray[i]   ); }

}

void    draw                        (){

    background                      (240);
    DropdownPlayerUpdate            ();

}

/*Function controller for DropdownPlayer.*/
void    DropdownPlayer          (int _indexNum) {

    println(

        _indexNum,
        cp5Object
            .get                (ScrollableList.class, "DropdownPlayer")
            .getItem            (_indexNum)

    );

    CColor colorObject          = new CColor();
           colorObject          .setBackground(color(255, 0, 0, dropdownPlayerAlphaInt));

    cp5Object
        .get                    (ScrollableList.class, "DropdownPlayer")
        .getItem                (_indexNum)
        .put                    ("color", colorObject);

}

void DropdownPlayerUpdate       (){

    /*Update the open and close button.
    The two parameters is the position of the open and close button.*/
    buttonOpenCloseMuseumObject     .DrawVoid((width/2), 20);

    /*If statements to control event animation of the open close buttons.
    Like here for example I want to hide() and show the dropdown menu based on
        the corresponding open close button.
    The thing to mention here is that the animation need to finished first before another event executed.
    If statment when the animation is finished.*/
    if(buttonOpenCloseMuseumObject.isAnimating == false){

        /*Revert the boolean.*/
        boolean tempBoolean         = !buttonOpenCloseMuseumObject.isButtonOpenBoolean;

        if                          (tempBoolean == true ){

            cp5Object
                .get                (ScrollableList.class, "DropdownPlayer")
                .show               ();

            dropdownPlayerAlphaInt  = 255;

        }
        else if                     (tempBoolean == false){

            cp5Object
                .get                (ScrollableList.class, "DropdownPlayer")
                .hide               ();

        }

    }
    /*If statement while the animation is playing.*/
    else if(buttonOpenCloseMuseumObject.isAnimating == true){

        /*Revert the boolean.*/
        boolean tempBoolean                 = !buttonOpenCloseMuseumObject.isButtonOpenBoolean;

        /*Create simple fade in and fade out animation.*/
        CColor fadeCColorObject             = new CColor();
               fadeCColorObject
                    .setActive              (color(0    , 170   , 255,    dropdownPlayerAlphaInt))
                    .setBackground          (color(0    , 45    , 90 ,    dropdownPlayerAlphaInt))
                    .setCaptionLabel        (color(255  , 255   , 255,    dropdownPlayerAlphaInt))
                    .setForeground          (color(0    , 116   , 217,    dropdownPlayerAlphaInt))
                    .setValueLabel          (color(255  , 255   , 255,    dropdownPlayerAlphaInt));

        if                                  (tempBoolean == true ){

            cp5Object
                .get                        (ScrollableList.class, "DropdownPlayer")
                .setColor                   (fadeCColorObject)
                .show                       ();

            dropdownPlayerAlphaInt          -= (255/45);


        }
        else if                             (tempBoolean == false){

            cp5Object
                .get                        (ScrollableList.class, "DropdownPlayer")
                .setColor                   (fadeCColorObject)
                .show                       ();

            dropdownPlayerAlphaInt          += (255/45);

        }

    }

}

/*The mouse pressed override function is for the open and close button.*/
void    mousePressed            (){

    if(buttonOpenCloseMuseumObject.MouseOverBoolean() == true){

        buttonOpenCloseMuseumObject.isAnimating = true;

    }

}








