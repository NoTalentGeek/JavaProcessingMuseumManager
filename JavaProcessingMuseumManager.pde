import controlP5.*;
import java.util.*;

ControlP5               cp5Object;
MuseumObject            testObject;
List<String>            sampleListChar              = Arrays.asList("a", "b", "c", "d", "e", "f", "g", "h");
List<MuseumObject>      floorObjectList             = new ArrayList<MuseumObject>();    /*This list contains all possible floor object.*/
List<MuseumObject>      roomObjectList              = new ArrayList<MuseumObject>();    /*This list contains all possible room object.*/
List<MuseumObject>      exhibitionObjectList        = new ArrayList<MuseumObject>();    /*This list contains all possible exhibition object.*/

/*This is pending, I should not use this object of an array.
Instead put everything into the object directly.*/
Name[]                  floorNameObjectArray        = new Name[4];
Name[]                  roomNameObjectArray         = new Name[4];
Name[]                  exhibitionNameObjectArray   = new Name[16];

void    setup                           (){

    size                                (320, 240, P2D);
    cp5Object                           = new ControlP5(this);
    int dropdownWidth                   = 200;
    int dropdownHeight                  = 100;
    cp5Object.addScrollableList         ("Dropdown")
        .setPosition                    ((width/2) - (dropdownWidth/2), (height/2) - (dropdownHeight/2))
        .setSize                        (dropdownWidth, dropdownHeight)
        .setBarHeight                   (20)
        .setItemHeight                  (20)
        .addItems                       (sampleListChar);

    MuseumObjectInit1Void               ();

}

/*Adding temporary function to initialize museum object array of object.*/
void MuseumObjectInit1Void           (){

    floorNameObjectArray[0]         = new Name("FLR_001", "First Floor" );
    floorNameObjectArray[1]         = new Name("FLR_002", "Second Floor");
    floorNameObjectArray[2]         = new Name("FLR_003", "Third Floor" );
    floorNameObjectArray[3]         = new Name("FLR_004", "Fourth Floor");
    roomNameObjectArray[0]          = new Name("ROM_AFK", "Room Afrika" );
    roomNameObjectArray[1]          = new Name("ROM_AME", "Room America");
    roomNameObjectArray[2]          = new Name("ROM_ASI", "Room Asia"   );
    roomNameObjectArray[3]          = new Name("ROM_EUR", "Room Europe" );
    exhibitionNameObjectArray[0]    = new Name("EXH_CAM", "Exhibition Cameroon"                );
    exhibitionNameObjectArray[1]    = new Name("EXH_EGY", "Exhibition Egypt"                   );
    exhibitionNameObjectArray[2]    = new Name("EXH_ETH", "Exhibition Ethiopia"                );
    exhibitionNameObjectArray[3]    = new Name("EXH_NIG", "Exhibition Nigeria"                 );
    exhibitionNameObjectArray[4]    = new Name("EXH_BRA", "Exhibition Brazil"                  );
    exhibitionNameObjectArray[5]    = new Name("EXH_CAN", "Exhibition Canada"                  );
    exhibitionNameObjectArray[6]    = new Name("EXH_MEX", "Exhibition Mexico"                  );
    exhibitionNameObjectArray[7]    = new Name("EXH_USA", "Exhibition United States Of America");
    exhibitionNameObjectArray[8]    = new Name("EXH_CAM", "Exhibition Cambodia"                );
    exhibitionNameObjectArray[9]    = new Name("EXH_IND", "Exhibition India"                   );
    exhibitionNameObjectArray[10]   = new Name("EXH_JAP", "Exhibition Japan"                   );
    exhibitionNameObjectArray[11]   = new Name("EXH_SIN", "Exhibition Singapore"               );
    exhibitionNameObjectArray[12]   = new Name("EXH_BEL", "Exhibition Belgium"                 );
    exhibitionNameObjectArray[13]   = new Name("EXH_FRA", "Exhibition France"                  );
    exhibitionNameObjectArray[14]   = new Name("EXH_GER", "Exhibition Germany"                 );
    exhibitionNameObjectArray[15]   = new Name("EXH_NED", "Exhibition The Netherlands"         );

    MuseumObjectInit2Void("FLR", floorNameObjectArray      , "XXX_XXX", floorObjectList     );
    MuseumObjectInit2Void("ROM", roomNameObjectArray       , "XXX_XXX", roomObjectList      );
    MuseumObjectInit2Void("EXH", exhibitionNameObjectArray , "XXX_XXX", exhibitionObjectList);

}

void MuseumObjectInit2Void      (

    String              _typeString,
    Name[]              _nameObjectArray,
    String              _tagString,
    List<MuseumObject>  _museumObjectList

){

    if          (_typeString == "FLR"){

        for(int i = 0; i < _nameObjectArray.length; i ++){

            MuseumObject museumObject               = new MuseumObject(_nameObjectArray[i], "XXX_XXX", _typeString, _tagString);
                         _museumObjectList          .add(museumObject);

        }

    }
    else if     (_typeString == "ROM"){

        for(int i = 0; i < _nameObjectArray.length; i ++){

            MuseumObject museumObject               = new MuseumObject(_nameObjectArray[i], "FLR_001", _typeString, _tagString);
                         _museumObjectList          .add(museumObject);

        }
        
    }
    else if     (_typeString == "EXH"){

        for(int i = 0; i < _nameObjectArray.length; i ++){

            if      (i < 4){

                MuseumObject museumObject           = new MuseumObject(_nameObjectArray[i], "ROM_AFK", _typeString, _tagString);
                             _museumObjectList      .add(museumObject);

            }
            else if (i < 8){

                MuseumObject museumObject           = new MuseumObject(_nameObjectArray[i], "ROM_AME", _typeString, _tagString);
                             _museumObjectList      .add(museumObject);

            }
            else if (i < 12){

                MuseumObject museumObject           = new MuseumObject(_nameObjectArray[i], "ROM_ASI", _typeString, _tagString);
                             _museumObjectList      .add(museumObject);

            }
            else if (i < 16){

                MuseumObject museumObject           = new MuseumObject(_nameObjectArray[i], "ROM_EUR", _typeString, _tagString);
                             _museumObjectList      .add(museumObject);

            }

        }
        
    }

}

void    draw                    (){

    background(240);

    /*PROTOTYPING BUTTON.
    The goal here is to make a rotateable button.
    So create the button first and then add the parameter like rotation
        the parameters.
    The thing is that I am not sure if you can rotate a drawing object as a group.
    The first thing is that I need to create a PShape.
    Then create custom PShape.
    Finally, rotate all together within the shape.
    Actually with group everything is easier.*/
    int     buttonXInt                  = 10;
    int     buttonYInt                  = 10;
    int     buttonSizeInt               = 30;
    PShape  buttonOpenCloseObject       = createShape(GROUP);
    PShape  buttonOpenCloseCircleObject = createShape(ELLIPSE, buttonXInt, buttonYInt, buttonSizeInt, buttonSizeInt);
    PShape  buttonOpenCloseCross1Object = createShape(LINE, (buttonXInt + (buttonSizeInt/4)), (buttonYInt + (buttonSizeInt/4)), (buttonXInt + (buttonSizeInt/4)) + (buttonSizeInt/2), (buttonYInt + (buttonSizeInt/4)) + (buttonSizeInt/2));
    PShape  buttonOpenCloseCross2Object = createShape(LINE, (buttonXInt + (buttonSizeInt/4)), (buttonYInt + (buttonSizeInt/4)) + (buttonSizeInt/2), (buttonXInt + (buttonSizeInt/4)) + (buttonSizeInt/2), (buttonYInt + (buttonSizeInt/4)));

            /*
            buttonOpenCloseCross1Object.beginShape();
            buttonOpenCloseCross1Object.fill(102);
            buttonOpenCloseCross1Object.stroke(255);
            buttonOpenCloseCross1Object.strokeWeight(2);
            buttonOpenCloseCross1Object.vertex(0, -50);
            buttonOpenCloseCross1Object.vertex(14, -20);
            buttonOpenCloseCross1Object.vertex(47, -15);
            buttonOpenCloseCross1Object.vertex(23, 7);
            buttonOpenCloseCross1Object.vertex(29, 40);
            buttonOpenCloseCross1Object.vertex(0, 25);
            buttonOpenCloseCross1Object.vertex(-29, 40);
            buttonOpenCloseCross1Object.vertex(-23, 7);
            buttonOpenCloseCross1Object.vertex(-47, -15);
            buttonOpenCloseCross1Object.vertex(-14, -20);
            buttonOpenCloseCross1Object.endShape(CLOSE);

            buttonOpenCloseCross1Object .beginShape();
            buttonOpenCloseCross1Object .fill(102);
            buttonOpenCloseCross1Object .stroke(255);
            buttonOpenCloseCross1Object .strokeWeight(2);
            buttonOpenCloseCross1Object .vertex(0, 0);
            buttonOpenCloseCross1Object .vertex(20, 20);
            buttonOpenCloseCross1Object .endShape(CLOSE);

            buttonOpenCloseCross2Object .beginShape();
            buttonOpenCloseCross2Object .noFill();
            buttonOpenCloseCross2Object .strokeWeight(20);
            buttonOpenCloseCross2Object .vertex(20, 0);
            buttonOpenCloseCross2Object .vertex(0, 20);
            buttonOpenCloseCross2Object .endShape(CLOSE);
            */

            buttonOpenCloseObject       .addChild(buttonOpenCloseCircleObject);
            buttonOpenCloseObject       .addChild(buttonOpenCloseCross1Object);
            buttonOpenCloseObject       .addChild(buttonOpenCloseCross2Object);

            shape                       (buttonOpenCloseObject);

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







