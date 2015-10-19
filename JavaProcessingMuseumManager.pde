import controlP5.*;
import java.util.*;

ControlP5               cp5DropdownObject;
ButtonOpenClose         buttonOpenCloseMuseumObject;
ButtonOpenClose         buttonOpenClosePlayerObject;
List<String>            museumStringList            = new ArrayList<String>();
List<String>            playerStringList            = new ArrayList<String>();
/*PENDING: Delete this variable when you are not using this anymore.*/
List<String>            sampleListChar              = Arrays.asList("a", "b", "c", "d", "e", "f", "g", "h", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z");
List<ObjectMuseum>      floorObjectList             = new ArrayList<ObjectMuseum>();    /*This list contains all possible floor object.*/
List<ObjectMuseum>      roomObjectList              = new ArrayList<ObjectMuseum>();    /*This list contains all possible room object.*/
List<ObjectMuseum>      exhibitionObjectList        = new ArrayList<ObjectMuseum>();    /*This list contains all possible exhibition object.*/
List<String>            floorStringList             = new ArrayList<String>();
List<String>            roomStringList              = new ArrayList<String>();
List<String>            exhibitionStringList        = new ArrayList<String>();

float                   dropdownMObjectAlphaFloat   = 0;
float                   dropdownPlayerAlphaFloat    = 0;                               /*The opacity number for dropdown player P5 component.*/
int                     offsetInt                   = 20;                               /*Offset for layouting the graphical user interface.*/

void    setup                           (){

    size                                (1024, 576, P2D);

    /*Prototype function to init museum object.
    Later on please init everything from the .csv file.*/
    MuseumObjectInitVoid                ();

    cp5DropdownObject                   = new ControlP5(this);

    int buttonSizeInt                   = (width > height) ? ((width*15)/512) : ((height*15)/512);  /*Button size temporary variable.*/
    buttonOpenCloseMuseumObject         = new ButtonOpenClose(buttonSizeInt);                       /*Initiates button open close with size of 30 pixels. PENDING: Adjust later based on application resolution.*/
    buttonOpenClosePlayerObject         = new ButtonOpenClose(buttonSizeInt);                       /*Initiates button open close with size of 30 pixels. PENDING: Adjust later based on application resolution.*/

    int dropdownObjectWidthInt          = (width/3);
    int dropdownObjectHeightInt         = (height - ((offsetInt + (buttonSizeInt/2))*2));
    int itemHeightInt                   = (dropdownObjectHeightInt/20);

    /*Create player dropdown menu.*/
    cp5DropdownObject
        .addScrollableList              ("Exhibition")
        .setPosition                    (

            ((width - ((offsetInt/2)*2) - (buttonSizeInt/2)) - dropdownObjectWidthInt),
            (offsetInt + (buttonSizeInt/2))

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

            ((offsetInt/2)*2) + (buttonSizeInt/2),
            (offsetInt + (buttonSizeInt/2))

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

void    draw                            (){

    background                          (240);
    dropdownMObjectAlphaFloat           = DropdownDrawFloat(dropdownMObjectAlphaFloat   , (width - offsetInt)   , offsetInt     , buttonOpenCloseMuseumObject   , "Exhibition" );
    dropdownPlayerAlphaFloat            = DropdownDrawFloat(dropdownPlayerAlphaFloat    , offsetInt             , offsetInt     , buttonOpenClosePlayerObject   , "Visitor"    );

}

/*The mouse pressed override function is for the open and close button.*/
void    mousePressed                    (){

    if(buttonOpenClosePlayerObject.MouseOverBoolean() == true){ buttonOpenClosePlayerObject.isAnimating = true; }
    if(buttonOpenCloseMuseumObject.MouseOverBoolean() == true){ buttonOpenCloseMuseumObject.isAnimating = true; }

}

void Exhibition                         (int _indexInt){

    List<ObjectMuseum>                  selectedMuseumObjectList        = new ArrayList<ObjectMuseum>();
    ObjectMuseum                        selectedMuseumObject            = null;
    String                              itemScrollableListString        = cp5DropdownObject.get(ScrollableList.class, "Exhibition").getItem(_indexInt).get("text").toString();      /*This String is for holding the name of the selected button.*/
    String                              temporaryTypeString             = itemScrollableListString.substring(0, Math.min(itemScrollableListString.length(), 3));
    int                                 selectedMuseumIndexInt          = -1;

    if     (temporaryTypeString.equals("FLR")){ selectedMuseumObjectList     = floorObjectList;          }
    else if(temporaryTypeString.equals("ROM")){ selectedMuseumObjectList     = roomObjectList;           }
    else if(temporaryTypeString.equals("EXH")){ selectedMuseumObjectList     = exhibitionObjectList;     }

    for(int i = 0; i < selectedMuseumObjectList.size(); i ++){

        if(selectedMuseumObjectList.get(i).nameAltString    == itemScrollableListString){

            selectedMuseumObject    = selectedMuseumObjectList .get(i);
            selectedMuseumIndexInt  = i + 1;

        }

    }
    selectedMuseumObject.activeBoolean                                  = !selectedMuseumObject.activeBoolean;

    if     (selectedMuseumObject.activeBoolean == true){

        for(int i = 0; i < selectedMuseumObject.childObjectList.size(); i ++)   { museumStringList.add(selectedMuseumIndexInt, selectedMuseumObject.childObjectList.get(i).nameAltString); }
        cp5DropdownObject.get(ScrollableList.class, "Exhibition").setItems(museumStringList);

    }
    else if(selectedMuseumObject.activeBoolean == false){

        for(int i = 0; i < museumStringList.size(); i ++)                       {

            for(int j = 0; j < selectedMuseumObject.childObjectList.size(); j ++){

                if(museumStringList.get(i) == selectedMuseumObject.childObjectList.get(j).nameAltString){

                    museumStringList        .remove(i);
                    i                       --;

                }

            }

        }
        for(int i = 0; i < selectedMuseumObject.childObjectList.size(); i ++)   {

            cp5DropdownObject.get(ScrollableList.class, "Exhibition").removeItem(selectedMuseumObject.childObjectList.get(i).nameAltString);

        }

    }

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

        new ObjectMuseum(new Name("EXH_CAO", "Exhibition Cameroon"                ), "ROM_AFK", "EXH", "TAG_XXX"),
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

    
    for(int i = 0; i < floorObjectList      .size() ; i ++){ floorStringList.add(floorObjectList.get(i).nameAltString);             }
    for(int i = 0; i < roomObjectList       .size() ; i ++){ roomStringList.add(roomObjectList.get(i).nameAltString);               }
    for(int i = 0; i < exhibitionObjectList .size() ; i ++){ exhibitionStringList.add(exhibitionObjectList.get(i).nameAltString);   }

    for(int i = 0; i < floorObjectList      .size() ; i ++){

        floorObjectList.get(i).childObjectList = floorObjectList.get(i).SetChildObjectList(roomObjectList);

    }
    for(int i = 0; i < roomObjectList       .size() ; i ++){

        roomObjectList.get(i).childObjectList = roomObjectList.get(i).SetChildObjectList(exhibitionObjectList);

    }

}

float DropdownDrawFloat                     (

    float           _alphaFloat, 
    int             _xInt, 
    int             _yInt, 
    ButtonOpenClose _buttonOpenCloseObject, 
    String          _captionString

){

    /*This is the time step necessary for fade in and fade out animation.
    The 255f is the floating number of the maximum opacity.
    While the 45f is the tick necessary to finish the rotating animation of
        button open close.*/
    float animationStepFloat                = (255f/45f);

    /*Update the open and close button.
    The two parameters is the position of the open and close button.*/
    _buttonOpenCloseObject                  .DrawVoid(_xInt, _yInt);

    /*If statements to control event animation of the open close buttons.
    Like here for example I want to hide() and show the dropdown menu based on
        the corresponding open close button.
    The thing to mention here is that the animation need to finished first before another event executed.
    If statment when the animation is finished.*/
    if(_buttonOpenCloseObject.isAnimating   == false){

        /*Revert the boolean.*/
        boolean tempBoolean                 = !_buttonOpenCloseObject.isButtonOpenBoolean;

        if                                  (tempBoolean == true ){

            cp5DropdownObject
                .get                        (ScrollableList.class, _captionString)
                .show                       ();
            
            _alphaFloat                     = (255f - (255f/45f));

        }
        else if                             (tempBoolean == false){

            cp5DropdownObject
                .get                        (ScrollableList.class, _captionString)
                .hide                       ();

            _alphaFloat                     = (255f/45f);

        }

    }
    /*If statement while the animation is playing.*/
    else if(_buttonOpenCloseObject.isAnimating == true){

        /*Revert the boolean.*/
        boolean tempBoolean                 = !_buttonOpenCloseObject.isButtonOpenBoolean;

        /*Create simple fade in and fade out animation.*/
        CColor fadeCColorObject             = new CColor();
               fadeCColorObject
                    .setActive              (color(0    , 45    , 90 ,    _alphaFloat))
                    .setBackground          (color(0    , 45    , 90 ,    _alphaFloat))
                    .setCaptionLabel        (color(255  , 255   , 255,    _alphaFloat))
                    .setForeground          (color(0    , 116   , 217,    _alphaFloat))
                    .setValueLabel          (color(255  , 255   , 255,    _alphaFloat));

        if                                  (tempBoolean == true ){
            
            cp5DropdownObject
                .get                        (ScrollableList.class, _captionString)
                .setColor                   (fadeCColorObject)
                .show                       ();

            _alphaFloat                     -= (255f/45f);

        }
        else if                             (tempBoolean == false){
            
            cp5DropdownObject
                .get                        (ScrollableList.class, _captionString)
                .setColor                   (fadeCColorObject)
                .show                       ();

            _alphaFloat                     += (255f/45f);

        }

    }

    return                                  _alphaFloat;

}