import controlP5.*;
import java.util.*;

ControlP5               cp5Object;
ButtonOpenClose         buttonOpenCloseMuseumObject;
List<String>            sampleListChar              = Arrays.asList("a", "b", "c", "d", "e", "f", "g", "h");
List<ObjectMuseum>      floorObjectList             = new ArrayList<ObjectMuseum>();    /*This list contains all possible floor object.*/
List<ObjectMuseum>      roomObjectList              = new ArrayList<ObjectMuseum>();    /*This list contains all possible room object.*/
List<ObjectMuseum>      exhibitionObjectList        = new ArrayList<ObjectMuseum>();    /*This list contains all possible exhibition object.*/

ObjectMuseum[]          floorObjectArray            = new ObjectMuseum[4];
ObjectMuseum[]          roomObjectArray             = new ObjectMuseum[4];
ObjectMuseum[]          exhibitionObjectArray       = new ObjectMuseum[16];

void    setup                           (){

    size                                (320, 240, P2D);
    cp5Object                           = new ControlP5(this);
    
    buttonOpenCloseMuseumObject         = new ButtonOpenClose(30);
    
    int dropdownWidth                   = 200;
    int dropdownHeight                  = 100;
    cp5Object.addScrollableList         ("Dropdown")
        .setPosition                    ((width/2) - (dropdownWidth/2), (height/2) - (dropdownHeight/2))
        .setSize                        (dropdownWidth, dropdownHeight)
        .setBarHeight                   (20)
        .setItemHeight                  (20)
        .hide                           ()
        .addItems                       (sampleListChar);

    MuseumObjectInitVoid                ();

}

void MuseumObjectInitVoid           (){

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

    for(int i = 0; i < floorObjectArray         .length; i ++){ floorObjectList         .add(floorObjectArray[i]        ); }
    for(int i = 0; i < roomObjectArray          .length; i ++){ roomObjectList          .add(roomObjectArray[i]         ); }
    for(int i = 0; i < exhibitionObjectArray    .length; i ++){ exhibitionObjectList    .add(exhibitionObjectArray[i]   ); }

}

void    draw                    (){

    background                  (240);
    buttonOpenCloseMuseumObject .DrawVoid((width/2), 20);

    if(buttonOpenCloseMuseumObject.isAnimating == false){

        boolean tempBoolean         = !buttonOpenCloseMuseumObject.isButtonOpenBoolean;

        if                          (tempBoolean == true ){

            cp5Object
                .get                (ScrollableList.class, "Dropdown")
                .show               ();

        }
        else if                     (tempBoolean == false){

            cp5Object
                .get                (ScrollableList.class, "Dropdown")
                .hide               ();

        }

    }

}

void    Dropdown                (int _indexNum) {

    println(

        _indexNum,
        cp5Object
            .get                (ScrollableList.class, "Dropdown")
            .getItem            (_indexNum)

    );

    CColor colorObject          = new CColor();
           colorObject          .setBackground(color(255, 0, 0));

    cp5Object
        .get                    (ScrollableList.class, "Dropdown")
        .getItem                (_indexNum)
        .put                    ("color", colorObject);

}

void    keyPressed              (){

    switch(key)                 {

        case('1'):

            cp5Object
                .get(ScrollableList.class, "Dropdown")
                .setType(ControlP5.LIST);

        break;
        case('2'):

            cp5Object
                .get(ScrollableList.class, "Dropdown")
                .setType(ControlP5.DROPDOWN);

        break;
        case('3'):

            sampleListChar      = Arrays.asList(

                "a-1",
                "b-1",
                "c-1",
                "d-1",
                "e-1",
                "f-1",
                "g-1",
                "h-1",
                "i-1",
                "j-1",
                "k-1"

            );
            cp5Object
                .get(ScrollableList.class, "Dropdown")
                .setItems(sampleListChar);

        break;
        case('4'):

            cp5Object
                .get(ScrollableList.class, "Dropdown")
                .removeItem("k-1");

        break;
        case('5'):

            cp5Object
                .get(ScrollableList.class, "Dropdown")
                .clear();

        break;

    }

}

void    mousePressed            (){

    if(buttonOpenCloseMuseumObject.MouseOverBoolean() == true){

        buttonOpenCloseMuseumObject.isAnimating = true;

    }

}








