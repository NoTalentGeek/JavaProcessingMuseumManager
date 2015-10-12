import controlP5.*;
import java.util.*;

ControlP5   cp5Object;
List        sampleListChar      = Arrays.asList("a", "b", "c", "d", "e", "f", "g", "h");

/*The plan here is to make exhibition class with params of tags.
I guess so far this is enough to satisfy my needs, let see what will happened next.*/
class   Exhibition{

    List<String> tagStringList  = new ArrayList<String>();
    Exhibition(String... _tagStringList){

        for(String tagString : _tagStringList){ tagStringList.add(tagString); }

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

    /*Prototyping the Exhibition class.
    I will try to create an exhibition and then add random tags here.*/
    Exhibition testExhibitionObject = new Exhibition("Cute", "Enschede", "China", "Indonesia");
    /*I can successfully retrieve the value.
    Next thing to be done is to assign the value of tags randomly using while statement.*/
    println(testExhibitionObject.tagStringList.get(0));

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
