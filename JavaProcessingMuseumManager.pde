import controlP5.*;
import java.util.*;

ControlP5   cp5Object;

/*A class for museum object.
The museum objects within this application are things that can interract with visitor.
For example floor, room, and exhibition.*/
class   MuseumObject                            {

    List<MuseumObject>  childObjectList         = new ArrayList<MuseumObject>();    /*This list contains all object that is sub - ordinate of this object..*/

    List<MuseumObject>  floorObjectList         = new ArrayList<MuseumObject>();    /*This list contains all possible floor object.*/
    List<MuseumObject>  roomObjectList          = new ArrayList<MuseumObject>();    /*This list contains all possible room object.*/
    List<MuseumObject>  exhibitionObjectList    = new ArrayList<MuseumObject>();    /*This list contains all possible exhibition object.*/

    int                 indexGlobalInt          = null;                             /*This is an index number of the location of this object in its respective list.*/
    int                 indexLocalInt           = null;                             /*This is an index number of the location of this object within its parent child object list.*/

    Name                nameObject              = null;                             /*Name object that contains the alternative name and the full name of this object.*/
    String              nameAltString           = "";                               /*This variable is intended solely to store the alternative name of this object.*/
    String              nameFullString          = "";                               /*This variable is intended solely to store the full name of this object.*/

    MuseumObject        parentObject            = null;                             /*The object parent of this object, which means this object should be inside the parent object's child object list.*/
    String              parentNameAltString     = "";                               /*The alternative name of the parent object.*/
    
    String              typeString              = "";                               /*The type of this object (the only possible values are "FLR", "ROM", and "EXH").*/

    List<String>        tagStringList           = new ArrayList<String>();          /*The tags for whit museum object.*/

    int                 visitorCurrentInt       = 0;                                /*This museum object current visitor.*/
    int                 visitorTotalInt         = 0;                                /*This museum objecy total visitor.*/

    MuseumObject                                (

        Name                                    _nameObject,
        String...                               _tagStringList

    ){


        nameObject                              = _nameObject;
        nameAltString                           = nameObject.nameAltString;
        nameFullString                          = nameObject.nameFullString;

        typeString                              = _typeString;

        for(String tagString : _tagStringList){ tagStringList.add(tagString); }

        /*DetermineChildObjectList();*/
        /*DetermineIndexGlobalInt();*/
        /*DetermineIndexLocalInt();*/

    }

};

class   Name                        {

    String          nameAltString   = "";
    String          nameFullString  = "";
    Name                            (String _nameAltString, String _nameFullString){

        nameAltString               = _nameAltString;
        nameFullString              = _nameFullString;

    }

};

void    setup                   (){

    size                        (320, 240);
    cp5Object                   = new ControlP5(this);
    int dropdownWidth           = 200;
    int dropdownHeight          = 100;
    cp5Object.addScrollableList ("dropdown")
        .setPosition            ((width/2) - (dropdownWidth/2), (height/2) - (dropdownHeight/2))
        .setSize                (dropdownWidth, dropdownHeight)
        .setBarHeight           (20)
        .setItemHeight          (20)
        .addItems               (sampleListChar);


    List<MuseumObject>  exhibitionListObject    = new ArrayList<MuseumObject>();
    MuseumObject        testExhibition1Object   = new MuseumObject(new Name("EXH_AUS", "Exhibition Australia"), "Agressive", "Brave", "Cute");
    MuseumObject        textExhibition2Object   = new MuseumObject(new Name("EXH_BRA", "Exhibition Brazil"   ), "Cool", "Legendary");


}

void    draw                    (){ background(240); }

void    dropdown                (int _indexNum) {

    println(

        _indexNum,
        cp5Object
            .get                (ScrollableList.class, "dropdown")
            .getItem            (_indexNum)

    );

    CColor colorObject          = new CColor();
           colorObject          .setBackground(color(255, 0, 0));

    cp5Object
        .get                    (ScrollableList.class, "dropdown")
        .getItem                (_indexNum)
        .put                    ("color", colorObject);

}

void    keyPressed              (){

    switch(key)                 {

        case('1'):

            cp5Object
                .get(ScrollableList.class, "dropdown")
                .setType(ControlP5.LIST);

        break;
        case('2'):

            cp5Object
                .get(ScrollableList.class, "dropdown")
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
                .get(ScrollableList.class, "dropdown")
                .setItems(sampleListChar);

        break;
        case('4'):

            cp5Object
                .get(ScrollableList.class, "dropdown")
                .removeItem("k-1");

        break;
        case('5'):

            cp5Object
                .get(ScrollableList.class, "dropdown")
                .clear();

        break;

    }

}

