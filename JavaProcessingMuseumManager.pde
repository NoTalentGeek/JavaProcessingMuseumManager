import controlP5.*;
import java.util.*;

ControlP5               cp5DropdownObject;
ButtonOpenClose         buttonOpenCloseMuseumObject;
ButtonOpenClose         buttonOpenClosePlayerObject;
List<ObjectMuseum>      floorObjectList                 = new ArrayList<ObjectMuseum>();    /*This list contains all possible floor object.*/
List<ObjectMuseum>      roomObjectList                  = new ArrayList<ObjectMuseum>();    /*This list contains all possible room object.*/
List<ObjectMuseum>      exhibitionObjectList            = new ArrayList<ObjectMuseum>();    /*This list contains all possible exhibition object.*/
List<String>            floorStringList                 = new ArrayList<String>();
List<String>            roomStringList                  = new ArrayList<String>();
List<String>            exhibitionStringList            = new ArrayList<String>();
List<String>            museumStringList                = new ArrayList<String>();
List<String>            playerStringList                = new ArrayList<String>();

float                   dropdownMObjectAlphaFloat       = 0;
float                   dropdownPlayerAlphaFloat        = 0;                                /*The opacity number for dropdown player P5 component.*/
int                     offsetInt                       = 20;                               /*Offset for layouting the graphical user interface.*/

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

/*This function is to control what will happen when mouse pointer clicked above the active element of scrollable button.*/
void Exhibition                         (int _indexInt){

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

        /*CODE OF SHAME CODE OF SHAME CODE OF SHAME CODE OF SHAME CODE OF SHAME CODE OF SHAME CODE OF SHAME CODE OF SHAME CODE OF SHAME CODE OF SHAME
          CODE OF SHAME CODE OF SHAME CODE OF SHAME CODE OF SHAME CODE OF SHAME CODE OF SHAME CODE OF SHAME CODE OF SHAME CODE OF SHAME CODE OF SHAME
        Of you close the FLR you need to iterate through its children and set all children active boolean to false.
        This is trouble some for me because I do not knwo how to do depth - sort.
        Hence, I did this manually.
        PENDING: Using depth - sort to carefully set active boolean to false.*/
        if(temporaryTypeString.equals("FLR")){

            int indexChildInt = 0;
            /*Iterate through room.*/
            while(indexChildInt < (selectedMuseumObject.childObjectList.size() - 1)){

                ObjectMuseum selectedMuseumChildObject                  = selectedMuseumObject.childObjectList.get(indexChildInt);
                             selectedMuseumChildObject.activeBoolean    = false;

                for(int i = 0; i < museumStringList.size(); i ++)                   {

                    /*Iterate through exhibitions.*/
                    for(

                        int j   = 0; 
                        j       < selectedMuseumChildObject.childObjectList.size(); 
                        j       ++

                    ){

                        selectedMuseumChildObject.childObjectList.get(j).activeBoolean = false;

                        /*
                        for(

                            int k   = 0; 
                            k       < selectedMuseumChildObject.childObjectList.get(j).childObjectList.size(); 
                            k       ++

                        ){ selectedMuseumChildObject.childObjectList.get(j).childObjectList.get(k).activeBoolean = false; }
                        */

                        if(museumStringList.get(i)  == selectedMuseumChildObject.childObjectList.get(j).nameAltString){

                            museumStringList        .remove(i);                                                             /*Remove the element from the museum String list.*/
                            i                       --;                                                                     /*Do not forget to reduce the loop counter by one for everytime you remove an element from the list.*/

                        }

                    }

                }

                /*Remove the children of inactive parent into the the scrollable object.*/
                for(int i = 0; i < selectedMuseumChildObject.childObjectList.size(); i ++)   {

                    cp5DropdownObject.get(ScrollableList.class, "Exhibition").removeItem(selectedMuseumChildObject.childObjectList.get(i).nameAltString);

                }

                indexChildInt ++;

            }

        }

        /*Iterate through the museum String list and delete all the children from incative parent.*/
        for(int i = 0; i < museumStringList.size(); i ++)                   {

            /*Iterate through all the selected object children.*/
            for(

                int j   = 0; 
                j       < selectedMuseumObject.childObjectList.size(); 
                j       ++

            ){

                if(museumStringList.get(i) == selectedMuseumObject.childObjectList.get(j).nameAltString){

                    museumStringList        .remove(i);                                                             /*Remove the element from the museum String list.*/
                    i                       --;                                                                     /*Do not forget to reduce the loop counter by one for everytime you remove an element from the list.*/

                }

            }

        }

        /*Remove the children of inactive parent into the the scrollable object.*/
        for(int i = 0; i < selectedMuseumObject.childObjectList.size(); i ++)   {

            cp5DropdownObject.get(ScrollableList.class, "Exhibition").removeItem(selectedMuseumObject.childObjectList.get(i).nameAltString);

        }

        /*END
          CODE OF SHAME CODE OF SHAME CODE OF SHAME CODE OF SHAME CODE OF SHAME CODE OF SHAME CODE OF SHAME CODE OF SHAME CODE OF SHAME CODE OF SHAME
          CODE OF SHAME CODE OF SHAME CODE OF SHAME CODE OF SHAME CODE OF SHAME CODE OF SHAME CODE OF SHAME CODE OF SHAME CODE OF SHAME CODE OF SHAME*/

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

    /*PENDING: Optimization here, you can put all methods into the same for loop. Right now I want to see object required more for loops.
    These lists is for putting list into the corresponding String list, so that it can be easier to be put in the scrollable list.*/
    for(int i = 0; i < floorObjectList      .size() ; i ++){ floorStringList        .add(floorObjectList        .get(i).nameAltString); }
    for(int i = 0; i < roomObjectList       .size() ; i ++){ roomStringList         .add(roomObjectList         .get(i).nameAltString); }
    for(int i = 0; i < exhibitionObjectList .size() ; i ++){ exhibitionStringList   .add(exhibitionObjectList   .get(i).nameAltString); }

    /*These list is to assign children object for each museum object.*/
    for(int i = 0; i < floorObjectList      .size() ; i ++){ floorObjectList.get(i).childObjectList = floorObjectList   .get(i).SetChildObjectList(roomObjectList);         }
    for(int i = 0; i < roomObjectList       .size() ; i ++){ roomObjectList .get(i).childObjectList = roomObjectList    .get(i).SetChildObjectList(exhibitionObjectList);   }

    /*These list is to assign parent object for each museum object.*/
    for(int i = 0; i < roomObjectList               .size() ; i ++){ roomObjectList         .get(i).parentObject    = roomObjectList        .get(i).SetParentObject(floorObjectList);   }
    for(int i = 0; i < exhibitionObjectList         .size() ; i ++){ exhibitionObjectList   .get(i).parentObject    = exhibitionObjectList  .get(i).SetParentObject(roomObjectList);    }

}

float DropdownDrawFloat                     (

    float           _alphaFloat, 
    int             _xInt, 
    int             _yInt, 
    ButtonOpenClose _buttonOpenCloseObject, 
    String          _captionString

){

    /*Create simple fade in and fade out animation.*/
    CColor fadeCColorObject             = new CColor();
           fadeCColorObject
                .setActive              (color(0    , 45    , 90 ,    _alphaFloat))
                .setBackground          (color(0    , 45    , 90 ,    _alphaFloat))
                .setCaptionLabel        (color(255  , 255   , 255,    _alphaFloat))
                .setForeground          (color(0    , 116   , 217,    _alphaFloat))
                .setValueLabel          (color(255  , 255   , 255,    _alphaFloat));

    CColor fadeCColorFloorObject          = new CColor();
           fadeCColorFloorObject
                .setActive              (color(0    , 45    , 90 ,    _alphaFloat))
                .setBackground          (color(0    , 45    , 90 ,    _alphaFloat))
                .setForeground          (color(0    , 45    , 90 ,    _alphaFloat));

    CColor fadeCColorRoomObject          = new CColor();
           fadeCColorRoomObject
                .setActive              (color(0    , 95    , 140,    _alphaFloat))
                .setBackground          (color(0    , 95    , 140,    _alphaFloat))
                .setForeground          (color(0    , 126   , 227,    _alphaFloat));

    CColor fadeCColorExhibitionObject   = new CColor();
           fadeCColorExhibitionObject
                .setActive              (color(0    , 145   , 190,    _alphaFloat))
                .setBackground          (color(0    , 145   , 190,    _alphaFloat))
                .setForeground          (color(0    , 136   , 237,    _alphaFloat));

    /*This is the time step necessary for fade in and fade out animation.
    The 255f is the floating number of the maximum opacity.
    While the 45f is the tick necessary to finish the rotating animation of
        button open close.*/
    float   animationStepFloat              = (255f/45f);

    int     museumSizeInt                   = museumStringList.size();

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

            for(int i = 0; i < museumStringList.size(); i ++){

                String  itemScrollableString    = cp5DropdownObject.get(ScrollableList.class, "Exhibition").getItem(i).get("text").toString();
                String  temporaryTypeString     = itemScrollableString.substring(0, Math.min(itemScrollableString.length(), 3));

                if      (temporaryTypeString.equals("FLR")){ cp5DropdownObject.get(ScrollableList.class, "Exhibition").getItem(i).put("color", fadeCColorFloorObject);        }
                else if (temporaryTypeString.equals("ROM")){ cp5DropdownObject.get(ScrollableList.class, "Exhibition").getItem(i).put("color", fadeCColorRoomObject);         }
                else if (temporaryTypeString.equals("EXH")){ cp5DropdownObject.get(ScrollableList.class, "Exhibition").getItem(i).put("color", fadeCColorExhibitionObject);   }

            }

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

        /*For closing animation.*/
        if                                  (tempBoolean == true ){
            
            cp5DropdownObject
                .get                        (ScrollableList.class, _captionString)
                .setColor                   (fadeCColorObject)
                .show                       ();

            /*
            String  itemScrollableString    = cp5DropdownObject.get(ScrollableList.class, "Exhibition").getItem(2).get("text").toString();
            String  temporaryTypeString     = itemScrollableString.substring(0, Math.min(itemScrollableString.length(), 3));
            if(temporaryTypeString.equals("FLR")){ cp5DropdownObject.get(ScrollableList.class, "Exhibition").getItem(2).put("color", fadeCColorFloorObject); }
            else if(temporaryTypeString.equals("ROM")){ cp5DropdownObject.get(ScrollableList.class, "Exhibition").getItem(2).put("color", fadeCColorRoomObject); }
            else if(temporaryTypeString.equals("EXH")){ cp5DropdownObject.get(ScrollableList.class, "Exhibition").getItem(2).put("color", fadeCColorExhibitionObject); }
            */
            for(int i = 0; i < museumStringList.size(); i ++){

                String  itemScrollableString    = cp5DropdownObject.get(ScrollableList.class, "Exhibition").getItem(i).get("text").toString();
                String  temporaryTypeString     = itemScrollableString.substring(0, Math.min(itemScrollableString.length(), 3));

                if      (temporaryTypeString.equals("FLR")){ cp5DropdownObject.get(ScrollableList.class, "Exhibition").getItem(i).put("color", fadeCColorFloorObject);        }
                else if (temporaryTypeString.equals("ROM")){ cp5DropdownObject.get(ScrollableList.class, "Exhibition").getItem(i).put("color", fadeCColorRoomObject);         }
                else if (temporaryTypeString.equals("EXH")){ cp5DropdownObject.get(ScrollableList.class, "Exhibition").getItem(i).put("color", fadeCColorExhibitionObject);   }

            }

            _alphaFloat                     -= (255f/45f);

        }
        /*For opening animation.*/
        else if                             (tempBoolean == false){
            
            cp5DropdownObject
                .get                        (ScrollableList.class, _captionString)
                .setColor                   (fadeCColorObject)
                .show                       ();

            /*
            String  itemScrollableString    = cp5DropdownObject.get(ScrollableList.class, "Exhibition").getItem(2).get("text").toString();
            String  temporaryTypeString     = itemScrollableString.substring(0, Math.min(itemScrollableString.length(), 3));
            if(temporaryTypeString.equals("FLR")){ cp5DropdownObject.get(ScrollableList.class, "Exhibition").getItem(2).put("color", fadeCColorFloorObject); }
            else if(temporaryTypeString.equals("ROM")){ cp5DropdownObject.get(ScrollableList.class, "Exhibition").getItem(2).put("color", fadeCColorRoomObject); }
            else if(temporaryTypeString.equals("EXH")){ cp5DropdownObject.get(ScrollableList.class, "Exhibition").getItem(2).put("color", fadeCColorExhibitionObject); }
            */
            for(int i = 0; i < museumStringList.size(); i ++){

                String  itemScrollableString    = cp5DropdownObject.get(ScrollableList.class, "Exhibition").getItem(i).get("text").toString();
                String  temporaryTypeString     = itemScrollableString.substring(0, Math.min(itemScrollableString.length(), 3));

                if      (temporaryTypeString.equals("FLR")){ cp5DropdownObject.get(ScrollableList.class, "Exhibition").getItem(i).put("color", fadeCColorFloorObject);        }
                else if (temporaryTypeString.equals("ROM")){ cp5DropdownObject.get(ScrollableList.class, "Exhibition").getItem(i).put("color", fadeCColorRoomObject);         }
                else if (temporaryTypeString.equals("EXH")){ cp5DropdownObject.get(ScrollableList.class, "Exhibition").getItem(i).put("color", fadeCColorExhibitionObject);   }

            }

            _alphaFloat                     += (255f/45f);

        }

    }

    return                                  _alphaFloat;

}