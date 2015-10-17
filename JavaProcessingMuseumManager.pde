import controlP5.*;
import java.util.*;

ControlP5               cp5DropdownMuseumObject;
ControlP5               cp5DropdownPlayerObject;
ButtonOpenClose         buttonOpenCloseMuseumObject;
ButtonOpenClose         buttonOpenClosePlayerObject;
List<String>            sampleListChar              = Arrays.asList("a", "b", "c", "d", "e", "f", "g", "h");
List<ObjectMuseum>      floorObjectList             = new ArrayList<ObjectMuseum>();    /*This list contains all possible floor object.*/
List<ObjectMuseum>      roomObjectList              = new ArrayList<ObjectMuseum>();    /*This list contains all possible room object.*/
List<ObjectMuseum>      exhibitionObjectList        = new ArrayList<ObjectMuseum>();    /*This list contains all possible exhibition object.*/\

int                     dropdownMObjectAlphaFloat   = 35;
int                     dropdownPlayerAlphaFloat    = 35;                               /*The opacity number for dropdown player P5 component.*/
int                     offsetInt                   = 20;                               /*Offset for layouting the graphical user interface.*/

void    setup                           (){

    size                                (512, 288, P2D);
    cp5DropdownMuseumObject             = new ControlP5(this);
    cp5DropdownPlayerObject             = new ControlP5(this);                                      /*Initiates ControlP5 object.*/

    int buttonSizeInt                   = (width > height) ? ((width*15)/512) : ((height*15)/512);  /*Button size temporary variable.*/
    buttonOpenCloseMuseumObject         = new ButtonOpenClose(buttonSizeInt);                       /*Initiates button open close with size of 30 pixels. PENDING: Adjust later based on application resolution.*/
    buttonOpenClosePlayerObject         = new ButtonOpenClose(buttonSizeInt);                       /*Initiates button open close with size of 30 pixels. PENDING: Adjust later based on application resolution.*/

    int dropdownMObjectWidth             = 200;                                                     /*The width of player dropdown menu. PENDING: Adjust later based on application resolution.*/
    int dropdownMObjectHeight            = 100;                                                     /*The height of player dropdown menu. PENDING: Adjust later based on application resolution.*/
    /*Create player dropdown menu.
    PENDING: Adjust the size of this dropdown menu according to the application resolution.*/
    cp5DropdownMuseumObject
        .addScrollableList              ("Exhibition")
        .setPosition                    (

            ((width - ((offsetInt/2)*2) - (buttonSizeInt/2)) - dropdownMObjectWidth),
            ((offsetInt/2)*2) + (buttonSizeInt/2)

        )
        .setSize                        (dropdownMObjectWidth, dropdownMObjectHeight)
        .setBarHeight                   (20)
        .setItemHeight                  (20)
        .show                           ()
        .addItems                       (sampleListChar);


    int dropdownPlayerWidth             = 200;                                                      /*The width of player dropdown menu. PENDING: Adjust later based on application resolution.*/
    int dropdownPlayerHeight            = 100;                                                      /*The height of player dropdown menu. PENDING: Adjust later based on application resolution.*/
    /*Create player dropdown menu.
    PENDING: Adjust the size of this dropdown menu according to the application resolution.*/
    cp5DropdownPlayerObject
        .addScrollableList              ("Visitor")
        .setPosition                    (

            ((offsetInt/2)*2) + (buttonSizeInt/2),
            ((offsetInt/2)*2) + (buttonSizeInt/2)

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

void    draw                            (){

    background                          (240);
    DropdownMObjectDraw                 ();
    DropdownPlayerDraw                  ();

}

/*The mouse pressed override function is for the open and close button.*/
void    mousePressed                    (){

    if(buttonOpenClosePlayerObject.MouseOverBoolean() == true){ buttonOpenClosePlayerObject.isAnimating = true; }
    if(buttonOpenCloseMuseumObject.MouseOverBoolean() == true){ buttonOpenCloseMuseumObject.isAnimating = true; }

}

/*Prototype function to initiate all basic museum objects.*/
void MuseumObjectInitVoid               (){

    floorObjectList                     = Arrays.asList(

        new ObjectMuseum(new Name("FLR_001", "First Floor"                        ), "XXX_XXX", "FLR", "TAG_XXX"),
        new ObjectMuseum(new Name("FLR_002", "Second Floor"                       ), "XXX_XXX", "FLR", "TAG_XXX"),
        new ObjectMuseum(new Name("FLR_003", "Third Floor"                        ), "XXX_XXX", "FLR", "TAG_XXX"),
        new ObjectMuseum(new Name("FLR_004", "Fourth Floor"                       ), "XXX_XXX", "FLR", "TAG_XXX")

    );

    roomObjectList                      = Arrays.asList(

        new ObjectMuseum(new Name("ROM_AFK", "Room Afrika"                        ), "FLR_001", "ROM", "TAG_XXX"),
        new ObjectMuseum(new Name("ROM_AME", "Room America"                       ), "FLR_001", "ROM", "TAG_XXX"),
        new ObjectMuseum(new Name("ROM_ASI", "Room Asia"                          ), "FLR_001", "ROM", "TAG_XXX"),
        new ObjectMuseum(new Name("ROM_EUR", "Room Europe"                        ), "FLR_001", "ROM", "TAG_XXX")

    );

    exhibitionObjectList                = Arrays.asList(

        new ObjectMuseum(new Name("EXH_CAM", "Exhibition Cameroon"                ), "ROM_AFK", "EXH", "TAG_XXX"),
        new ObjectMuseum(new Name("EXH_EGY", "Exhibition Egypt"                   ), "ROM_AFK", "EXH", "TAG_XXX"),
        new ObjectMuseum(new Name("EXH_ETH", "Exhibition Ethiopia"                ), "ROM_AFK", "EXH", "TAG_XXX"),
        new ObjectMuseum(new Name("EXH_NIG", "Exhibition Nigeria"                 ), "ROM_AFK", "EXH", "TAG_XXX"),
        new ObjectMuseum(new Name("EXH_BRA", "Exhibition Brazil"                  ), "ROM_AME", "EXH", "TAG_XXX"),
        new ObjectMuseum(new Name("EXH_CAN", "Exhibition Canada"                  ), "ROM_AME", "EXH", "TAG_XXX"),
        new ObjectMuseum(new Name("EXH_MEX", "Exhibition Mexico"                  ), "ROM_AME", "EXH", "TAG_XXX"),
        new ObjectMuseum(new Name("EXH_USA", "Exhibition United States Of America"), "ROM_AME", "EXH", "TAG_XXX"),
        new ObjectMuseum(new Name("EXH_CAM", "Exhibition Cambodia"                ), "ROM_ASI", "EXH", "TAG_XXX"),
        new ObjectMuseum(new Name("EXH_IND", "Exhibition India"                   ), "ROM_ASI", "EXH", "TAG_XXX"),
        new ObjectMuseum(new Name("EXH_JAP", "Exhibition Japan"                   ), "ROM_ASI", "EXH", "TAG_XXX"),
        new ObjectMuseum(new Name("EXH_SIN", "Exhibition Singapore"               ), "ROM_ASI", "EXH", "TAG_XXX"),
        new ObjectMuseum(new Name("EXH_BEL", "Exhibition Belgium"                 ), "ROM_EUR", "EXH", "TAG_XXX"),
        new ObjectMuseum(new Name("EXH_FRA", "Exhibition France"                  ), "ROM_EUR", "EXH", "TAG_XXX"),
        new ObjectMuseum(new Name("EXH_GER", "Exhibition Germany"                 ), "ROM_EUR", "EXH", "TAG_XXX"),
        new ObjectMuseum(new Name("EXH_NED", "Exhibition The Netherlands"         ), "ROM_EUR", "EXH", "TAG_XXX")

    );

}

void DropdownMObjectDraw                    (){

    /*Update the open and close button.
    The two parameters is the position of the open and close button.*/
    buttonOpenCloseMuseumObject             .DrawVoid((width - offsetInt), offsetInt);

    /*If statements to control event animation of the open close buttons.
    Like here for example I want to hide() and show the dropdown menu based on
        the corresponding open close button.
    The thing to mention here is that the animation need to finished first before another event executed.
    If statment when the animation is finished.*/
    if(buttonOpenCloseMuseumObject.isAnimating == false){

        /*Revert the boolean.*/
        boolean tempBoolean                 = !buttonOpenCloseMuseumObject.isButtonOpenBoolean;

        if                                  (tempBoolean == true ){

            cp5DropdownMuseumObject
                .get                        (ScrollableList.class, "Exhibition")
                .show                       ();
            
            dropdownMObjectAlphaFloat       = 255;

        }
        else if                             (tempBoolean == false){

            cp5DropdownMuseumObject
                .get                        (ScrollableList.class, "Exhibition")
                .hide                       ();

        }

    }
    /*If statement while the animation is playing.*/
    else if(buttonOpenCloseMuseumObject.isAnimating == true){

        /*Revert the boolean.*/
        boolean tempBoolean                 = !buttonOpenCloseMuseumObject.isButtonOpenBoolean;

        /*Create simple fade in and fade out animation.*/
        CColor fadeCColorObject             = new CColor();
               fadeCColorObject
                    .setActive              (color(0    , 170   , 255,    dropdownMObjectAlphaFloat))
                    .setBackground          (color(0    , 45    , 90 ,    dropdownMObjectAlphaFloat))
                    .setCaptionLabel        (color(255  , 255   , 255,    dropdownMObjectAlphaFloat))
                    .setForeground          (color(0    , 116   , 217,    dropdownMObjectAlphaFloat))
                    .setValueLabel          (color(255  , 255   , 255,    dropdownMObjectAlphaFloat));

        if                                  (tempBoolean == true ){

            dropdownMObjectAlphaFloat       -= (255/45);
            
            cp5DropdownMuseumObject
                .get                        (ScrollableList.class, "Exhibition")
                .setColor                   (fadeCColorObject)
                .show                       ();

        }
        else if                             (tempBoolean == false){

            dropdownMObjectAlphaFloat       += (255/45);
            
            cp5DropdownMuseumObject
                .get                        (ScrollableList.class, "Exhibition")
                .setColor                   (fadeCColorObject)
                .show                       ();

        }

    }

}

void DropdownPlayerDraw                 (){

    /*Update the open and close button.
    The two parameters is the position of the open and close button.*/
    buttonOpenClosePlayerObject         .DrawVoid(offsetInt, offsetInt);

    /*If statements to control event animation of the open close buttons.
    Like here for example I want to hide() and show the dropdown menu based on
        the corresponding open close button.
    The thing to mention here is that the animation need to finished first before another event executed.
    If statment when the animation is finished.*/
    if(buttonOpenClosePlayerObject.isAnimating == false){

        /*Revert the boolean.*/
        boolean tempBoolean             = !buttonOpenClosePlayerObject.isButtonOpenBoolean;

        if                              (tempBoolean == true ){

            cp5DropdownPlayerObject
                .get                    (ScrollableList.class, "Visitor")
                .show                   ();
            
            dropdownPlayerAlphaFloat    = 255;

        }
        else if                         (tempBoolean == false){

            cp5DropdownPlayerObject
                .get                    (ScrollableList.class, "Visitor")
                .hide                   ();

        }

    }
    /*If statement while the animation is playing.*/
    else if(buttonOpenClosePlayerObject.isAnimating == true){

        /*Revert the boolean.*/
        boolean tempBoolean                 = !buttonOpenClosePlayerObject.isButtonOpenBoolean;

        /*Create simple fade in and fade out animation.*/
        CColor fadeCColorObject             = new CColor();
               fadeCColorObject
                    .setActive              (color(0    , 170   , 255,    dropdownPlayerAlphaFloat))
                    .setBackground          (color(0    , 45    , 90 ,    dropdownPlayerAlphaFloat))
                    .setCaptionLabel        (color(255  , 255   , 255,    dropdownPlayerAlphaFloat))
                    .setForeground          (color(0    , 116   , 217,    dropdownPlayerAlphaFloat))
                    .setValueLabel          (color(255  , 255   , 255,    dropdownPlayerAlphaFloat));

        if                                  (tempBoolean == true ){

            dropdownPlayerAlphaFloat        -= (255/45);
            
            cp5DropdownPlayerObject
                .get                        (ScrollableList.class, "Visitor")
                .setColor                   (fadeCColorObject)
                .show                       ();

        }
        else if                             (tempBoolean == false){

            dropdownPlayerAlphaFloat        += (255/45);
            
            cp5DropdownPlayerObject
                .get                        (ScrollableList.class, "Visitor")
                .setColor                   (fadeCColorObject)
                .show                       ();

        }

    }

}
