import controlP5.*;
import java.util.*;

ControlP5               cp5Object;
List<String>            sampleListChar              = Arrays.asList("a", "b", "c", "d", "e", "f", "g", "h");
List<MuseumObject>      floorObjectList             = new ArrayList<MuseumObject>();    /*This list contains all possible floor object.*/
List<MuseumObject>      roomObjectList              = new ArrayList<MuseumObject>();    /*This list contains all possible room object.*/
List<MuseumObject>      exhibitionObjectList        = new ArrayList<MuseumObject>();    /*This list contains all possible exhibition object.*/

/*This is pending, I should not use this object of an array.
Instead put everything into the object directly.*/
Name[]                  floorNameObjectArray        = new Name[4];
Name[]                  roomNameObjectArray         = new Name[4];
Name[]                  exhibitionNameObjectArray   = new Name[16];

void    setup                       (){

    size                            (320, 240);
    cp5Object                       = new ControlP5(this);
    int dropdownWidth               = 200;
    int dropdownHeight              = 100;
    cp5Object.addScrollableList     ("Dropdown")
        .setPosition                ((width/2) - (dropdownWidth/2), (height/2) - (dropdownHeight/2))
        .setSize                    (dropdownWidth, dropdownHeight)
        .setBarHeight               (20)
        .setItemHeight              (20)
        .addItems                   (sampleListChar);

    MuseumObjectInit1Void           ();

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

    MuseumObjectInit2Void(floorNameObjectArray      , "FLR", "XXX_XXX", floorObjectList     );
    MuseumObjectInit2Void(roomNameObjectArray       , "ROM", "XXX_XXX", roomObjectList      );
    MuseumObjectInit2Void(exhibitionNameObjectArray , "EXH", "XXX_XXX", exhibitionObjectList);

}

void MuseumObjectInit2Void      (

    String              _typeString,
    Name[]              _nameObjectArray,
    String              _tagString,
    List<MuseumObject>  _museumObjectList

){

    if          (_typeString == "FLR"){

        for(int i = 0; i < _nameObjectArray.length; i ++){

            MuseumObject museumObject               = new MuseumObject(_nameObjectArray[i], "XXX_XXX", _parentNameAltString, _typeString, _tagString);
                         _museumObjectList          .add(museumObject);

        }

    }
    else if     (_typeString == "ROM"){

        for(int i = 0; i < _nameObjectArray.length; i ++){

            MuseumObject museumObject               = new MuseumObject(_nameObjectArray[i], "FLR_001", _parentNameAltString, _typeString, _tagString);
                         _museumObjectList          .add(museumObject);

        }
        
    }
    else if     (_typeString == "EXH"){

        for(int i = 0; i < _nameObjectArray.length; i ++){

            if      (i < 4){

                MuseumObject museumObject           = new MuseumObject(_nameObjectArray[i], "ROM_AFK"_parentNameAltString, _typeString, _tagString);
                             _museumObjectList      .add(museumObject);

            }
            else if (i < 8){

                MuseumObject museumObject           = new MuseumObject(_nameObjectArray[i], "ROM_AME"_parentNameAltString, _typeString, _tagString);
                             _museumObjectList      .add(museumObject);

            }
            else if (i < 12){

                MuseumObject museumObject           = new MuseumObject(_nameObjectArray[i], "ROM_ASI"_parentNameAltString, _typeString, _tagString);
                             _museumObjectList      .add(museumObject);

            }
            else if (i < 16){

                MuseumObject museumObject           = new MuseumObject(_nameObjectArray[i], "ROM_EUR"_parentNameAltString, _typeString, _tagString);
                             _museumObjectList      .add(museumObject);

            }

        }
        
    }

}

void    draw                    (){ background(240); }

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




