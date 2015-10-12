import controlP5.*;
import java.util.*;

ControlP5   cp5Object;
List        sampleListChar      = Arrays.asList("a", "b", "c", "d", "e", "f", "g", "h");

/*The plan here is to make exhibition class with params of tags.
I guess, so far this is enough to satisfy my needs, let see what will happened next.*/
class   Exhibition{

    Name            nameObject      = null;
    String          nameAltString   = "";
    String          nameFullString  = "";
    List<String> tagStringList      = new ArrayList<String>();

    Exhibition                      (

        Name                        _nameObject,
        String...                   _tagStringList

    ){

        nameObject                  = _nameObject;
        nameAltString               = nameObject.nameAltString;
        nameFullString              = nameObject.nameFullString;

        for(String tagString : _tagStringList){ tagStringList.add(tagString); }

    }

};

class   Name{

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

    /*
    <<Prototyping the Exhibition class.
    I will try to create an exhibition and then add random tags here.>>
    Exhibition testExhibitionObject = new Exhibition("Cute", "Enschede", "China", "Indonesia");
    <<I can successfully retrieve the value.
    Next thing to be done is to assign the value of tags randomly using while statement.>>
    println(testExhibitionObject.tagStringList.get(0));
    */

    /*Next prototype is to make several exhibitions then put the tags there with a while loop.
    The more tag put into the exhibition the more chance that the exhibition will go out/break
        from the while loop.*/
    List<Exhibition>    exhibitionListObject    = new ArrayList<Exhibition>();
    Exhibition          testExhibition1Object   = new Exhibition(new Name("EXH_AUS", "Exhibition Australia"), "Agressive", "Brave", "Cute");
    Exhibition          textExhibition2Object   = new Exhibition(new Name("EXH_BRA", "Exhibition Brazil"   ), "Cool", "Legendary");
    /*I think I still need to make Name class for this application.
    After this I need to create a List that is filled with Name object that will
        later be filled in to exhibitionListObject.*/


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

