/*A class for creating GUI object for editing player movement around the museum.*/
import java.util.*;
import controlP5.*;
class EditPlayerGUIObject{

    int groupLayoutOffsetInt                    = 10;
    //int playerGroupWidthInt                   = (width/3);
    int playerGroupWidthInt                     ;
    //int playerGroupHeightInt                  = (367 + 2);    /*Additional 2 to fix layouting error in the radio buttons.*/
    int playerGroupHeightInt                    ;
    int playerGroupXInt                         ;
    int playerGroupYInt                         ;
    int playerScrollableListHeightInt           = 62;
    int playerScrollableListHeight3Int          = 50;

    /*Constructor.*/
    EditPlayerGUIObject(

        int _playerGroupWidthInt    ,
        int _playerGroupHeightInt   ,
        int _playerGroupXInt        ,
        int _playerGroupYInt

    ){

        /*Fill the argument in.*/
        int playerGroupWidthInt                 = _playerGroupWidthInt;
        int playerGroupHeightInt                = _playerGroupHeightInt;
        int playerGroupXInt                     = _playerGroupXInt;
        int playerGroupYInt                     = _playerGroupYInt;

        Group   EditPlayerGroupObject           = 
                cp5Object   .addGroup               ("EditPlayerGroupObject")
                            //.setPosition          (((width/2) - (playerGroupWidthInt/2)), ((height/2) - (playerGroupHeightInt/2)))
                            .setPosition            (playerGroupXInt, playerGroupYInt)
                            .setWidth               (playerGroupWidthInt)
                            .setBackgroundHeight    (playerGroupHeightInt)
                            /*PENDING: Set colors later on.*/
                            .setBackgroundColor     (color(50, 60, 57))
                            //.setColor             (otherCColor)
                            //.setColorBackground   (groupColorBackgroundColor)
                            //.setColorLabel        (groupColorLabelColor)
                            .setLabel               ("Edit Player Object:");

                /*PENDING - DONE: Create the text panel. Many text panel!!!*/
                cp5Object   .addTextlabel           ("PlayerIndexTextlabel")
                            .setPosition            (groupLayoutOffsetInt, (groupLayoutOffsetInt*1))
                            .setGroup               (EditPlayerGroupObject)
                            /*PENDING: Please set the color after done with prototyping.*/
                            //.setColor             (otherCColor)
                            //.setColorValue        (255)
                            .setText                ("Player Index:");

                cp5Object   .addTextlabel           ("PlayerIndexValueTextLabel")
                            .setPosition            (((playerGroupWidthInt/2) + (groupLayoutOffsetInt/2)), (groupLayoutOffsetInt*1))
                            .setGroup               (EditPlayerGroupObject)
                            /*PENDING: Please set the color after done with prototyping.*/
                            //.setColor             (otherCColor)
                            //.setColorValue        (255)
                            /*PENDING: Set the text label based on the selected player.*/
                            .setText                ("1");

                cp5Object   .addTextlabel           ("PlayerExhibitionCurrentTextlabel")
                            .setPosition            (groupLayoutOffsetInt, (groupLayoutOffsetInt*2))
                            .setGroup               (EditPlayerGroupObject)
                            /*PENDING: Please set the color after done with prototyping.*/
                            //.setColor             (otherCColor)
                            //.setColorValue        (255)
                            .setText                ("Player Current Exhibition:");

                cp5Object   .addTextlabel           ("PlayerExhibitionCurrentvalueTextLabel")
                            .setPosition            (((playerGroupWidthInt/2) + (groupLayoutOffsetInt/2)), (groupLayoutOffsetInt*2))
                            .setGroup               (EditPlayerGroupObject)
                            /*PENDING: Please set the color after done with prototyping.*/
                            //.setColor             (otherCColor)
                            //.setColorValue        (255)
                            .setText                ("EXH_CAO");

                /*PENDING: Please make this unselectable.*/
                cp5Object   .addScrollableList      ("PlayerExhibitionTargetSList")
                            .setPosition            (groupLayoutOffsetInt,  (groupLayoutOffsetInt*4))
                            .setSize                ((playerGroupWidthInt - (groupLayoutOffsetInt*2)), playerScrollableListHeight3Int)
                            .setGroup               (EditPlayerGroupObject)
                            .addItems               (Arrays.asList("Exhibition Test 1", "Exhibition Test 2", "Exhibition Test 3"))
                            .setType                (ControlP5.LIST)
                            /*PENDING: Please select the color later on.*/
                            //.setColor             (otherCColor)
                            .setLabel               ("Player Target Exhibitions:");

                /*PENDING: Please make this unselectable.*/
                cp5Object   .addScrollableList      ("PlayerExhibitionVisitedSList")
                            .setPosition            (groupLayoutOffsetInt,  (groupLayoutOffsetInt*5) + playerScrollableListHeight3Int)
                            .setSize                ((playerGroupWidthInt - (groupLayoutOffsetInt*2)), playerScrollableListHeightInt)
                            .setGroup               (EditPlayerGroupObject)
                            .addItems               (Arrays.asList("Exhibition Test 1", "Exhibition Test 2", "Exhibition Test 3", "Exhibition Test 4", "Exhibition Test 5"))
                            .setType                (ControlP5.LIST)
                            /*PENDING: Please select the color later on.*/
                            //.setColor             (otherCColor)
                            .setLabel               ("Player Visited Exhibitions:");

                cp5Object   .addScrollableList      ("PlayerTagSList")
                            .setPosition            (groupLayoutOffsetInt,  (groupLayoutOffsetInt*6) + playerScrollableListHeight3Int + playerScrollableListHeightInt)
                            .setSize                ((playerGroupWidthInt - (groupLayoutOffsetInt*2)), playerScrollableListHeightInt)
                            .setGroup               (EditPlayerGroupObject)
                            .addItems               (Arrays.asList("Tag Test 1 - 123123", "Tag Test 2 - 123123", "Tag Test 3 - 123123", "Tag Test 4 - 123123", "Tag Test 5 - 123123"))
                            .setType                (ControlP5.LIST)
                            /*PENDING: Please select the color later on.*/
                            //.setColor             (otherCColor)
                            .setLabel               ("Player Collected Tags:");

                cp5Object   .addTextlabel           ("ModeTextlabel")
                            .setPosition            (groupLayoutOffsetInt, ((groupLayoutOffsetInt*7) + playerScrollableListHeight3Int + (playerScrollableListHeightInt*2)))
                            .setGroup               (EditPlayerGroupObject)
                            /*PENDING: Please set the color after done with prototyping.*/
                            //.setColor             (otherCColor)
                            //.setColorValue        (255)
                            .setText                ("Modes:");

                /*PENDING: Adding radion buttons to select mode on how player should be moved.*/
                cp5Object   .addRadioButton         ("ModeRadioButton")
                            .setPosition            (groupLayoutOffsetInt, ((groupLayoutOffsetInt*8) + playerScrollableListHeight3Int + (playerScrollableListHeightInt*2)))
                            .setSize                (groupLayoutOffsetInt, groupLayoutOffsetInt)
                            .setGroup               (EditPlayerGroupObject)
                            .addItem                ("Software - Auto"  , 1)
                            .addItem                ("Software - Manual", 2)
                            .addItem                ("hardware - Manual", 3);

                cp5Object   .addScrollableList      ("PleaseSelectNextExhibitionSList")
                            .setPosition            (groupLayoutOffsetInt, ((groupLayoutOffsetInt*12) + playerScrollableListHeight3Int + (playerScrollableListHeightInt*2) + 2))    /*Additional 2 to fix layouting error in the radio buttons.*/
                            .setSize                ((playerGroupWidthInt - (groupLayoutOffsetInt*2 )), 64)
                            .setGroup               (EditPlayerGroupObject)
                            .addItems               (Arrays.asList("Exhibition Test 1", "Exhibition Test 2", "Exhibition Test 3", "Exhibition Test 4", "Exhibition Test 5"))
                            .setType                (ControlP5.LIST)
                            /*PENDING: Please select the color later on.*/
                            //.setColor             (otherCColor)
                            .setLabel               ("Please Select Next Exhibition:");

    }

}