import controlP5.*;
import java.util.*;

ControlP5   cp5Object;
List        sampleListChar      = Arrays.asList("a", "b", "c", "d", "e", "f", "g", "h");

void setup                      ()      {

    size                        (320, 240);
    cp5Object                   = new ControlP5(this);
    cp5Object.addScrollableList ("dropdown")
        .setPosition            (100, 100)
        .setSize                (200, 100)
        .setBarHeight           (20)
        .setItemHeight          (20)
        .addItems               (sampleListChar);

}

void draw                       ()      { background         (240); }

void dropdown                   (int _index) {

    println(

        _index,
        cp5Object
            .get                (ScrollableList.class, "dropdown")
            .getItem            (_index)

    );

    CColor colorObject          = new CColor();
           colorObject          .setBackground(color(255, 0, 0));

    cp5Object
        .get                    (ScrollableList.class, "dropdown")
        .getItem                (_index)
        .put                    ("color", colorObject);

}

void keyPressed                 ()      {

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
