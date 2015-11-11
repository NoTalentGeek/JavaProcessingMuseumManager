/*A class for creating GUI object for editing player movement around the museum.
PENDING: Please do not forget to create default value, so when the system starts this GUI object displays the information of the first player.*/
import java.util.*;
import controlP5.*;
class EditPlayerGUIObject{

    color           groupBackgroundColor                        ;                               /*The color of group panel group background.*/
    color           groupColorBackgroundColor                   ;                               /*The title background color of panel group.*/
    color           groupColorLabelColor                        ;                               /*The title font colot of the panel group.*/
    /*PENDING: alphaFloat is actually unecessary please delete this variable later and just directly refers the value from the arguments.*/
    float           alphaFloat                                  = 255;                          /*The opacity for this object.*/
    int             editPlayerModeInt                           = 2;                            /*Whether the selected player object is controlled by AI, manual control, or hardware control.*/
    int             playerGroupXInt                             ;                               /*The x position of this graphical user interface.*/
    int             playerGroupYInt                             ;                               /*The x position of this graphical user interface.*/
    int             parentButtonSizeInt                         ;                               /*A variable for layout taken from the main class.*/
    int             parentDropdownObjectWidthInt                ;                               /*A variable for layout taken from the main class.*/
    int             parentDropdownObjectHeightInt               ;                               /*A variable for layout taken from the main class.*/
    int             groupLayoutOffsetInt                        = 10;                           /*This object offset.*/
    //int           playerGroupWidthInt                         = (width/3);                    /*This object width.*/
    int             playerGroupWidthInt                         ;                               /*This object width.*/
    //int           playerGroupHeightInt                        = (367 + 2);                    /*Additional 2 to fix layouting error in the radio buttons.*/
    int             playerGroupHeightInt                        ;                               /*This object height.*/
    int             playerScrollableListHeightInt               = 62;                           /*Height of scrollable list controller in this object that has five rows.*/
    int             playerScrollableListHeight3Int              = 50;                           /*Height of scrollable list controller in this object that has three rows.*/
    CColor          otherCColor                                 = new CColor();                 /*The color for other component than the scrollableChecklist.*/
    CColor          sListStaticCColor                           = new CColor();                 /*The color of the scrollable list that has no interaction (User cannot choose the elements).*/
    /*Determine whether to display object name in full name or in alternate name.*/
    String          tempPlayerExhibitionCurrentValueTextlabel   = "";
    List<String>    tempPlayerExhibitionTargetSList             = new ArrayList<String>();
    List<String>    tempPlayerExhibitionVisitedSList            = new ArrayList<String>();
    List<String>    tempPlayerTagSList                          = new ArrayList<String>();
    List<String>    tempPleaseSelectNextExhibitionSList         = new ArrayList<String>();
    ObjectPlayer    selectedPlayerObject                        = null;                     /*Selected object player from this graphical user interface.*/
    //ObjectPlayer  selectedPlayerPrevObject                    = null;                     /*Selected object player from this graphical user interface.*/

    /*Constructor.*/
    EditPlayerGUIObject     (

        int _playerGroupXInt                ,
        int _playerGroupYInt                ,
        int _playerGroupWidthInt            ,
        int _playerGroupHeightInt           ,
        int _parentButtonSizeInt            ,
        int _parentDropdownObjectWidthInt   ,
        int _parentDropdownObjwctHeightInt

    ){

        /*Fill the argument in.*/
        playerGroupXInt                         = _playerGroupXInt;
        playerGroupYInt                         = _playerGroupYInt + groupLayoutOffsetInt;
        playerGroupWidthInt                     = _playerGroupWidthInt;
        playerGroupHeightInt                    = _playerGroupHeightInt;
        parentButtonSizeInt                     = _parentButtonSizeInt;
        parentDropdownObjectWidthInt            = _parentDropdownObjectWidthInt;
        parentDropdownObjectHeightInt           = _parentDropdownObjwctHeightInt;

        /*Set the colors, however most of controller's color will be updated every tick in the DrawVoid() function.*/
        groupBackgroundColor                    = color(50  , 60    , 57    , alphaFloat);
        groupColorBackgroundColor               = color(2   , 45    , 89    , alphaFloat);
        groupColorLabelColor                    = color(255 , 255   , 255   , alphaFloat);
        otherCColor                             .setActive          (color(0    , 170   , 255   , alphaFloat))
                                                .setBackground      (color(0    , 45    , 90    , alphaFloat))
                                                .setCaptionLabel    (color(255  , 255   , 255   , alphaFloat))
                                                .setForeground      (color(0    , 116   , 217   , alphaFloat))
                                                .setValueLabel      (color(255  , 255   , 255   , alphaFloat));
        sListStaticCColor                       .setActive          (color(0    , 45    , 90    , alphaFloat))
                                                .setBackground      (color(0    , 45    , 90    , alphaFloat))
                                                .setCaptionLabel    (color(255  , 255   , 255   , alphaFloat))
                                                .setForeground      (color(0    , 45    , 90    , alphaFloat))
                                                .setValueLabel      (color(255  , 255   , 255   , alphaFloat));

        /*Set the default player object.*/
        selectedPlayerObject                    = playerObjectList.get(0);

        if(useNameAltBoolean        == true ){

            tempPlayerExhibitionCurrentValueTextlabel               = selectedPlayerObject.exhibitionCurrentObject.nameAltString;
            tempPlayerExhibitionTargetSList                         = selectedPlayerObject.exhibitionTargetNameAltStringList;
            tempPlayerExhibitionVisitedSList                        = selectedPlayerObject.exhibitionVisitedNameAltStringList;
            tempPlayerTagSList                                      = selectedPlayerObject.exhibitionTagCounterNameAltStringList;
            tempPleaseSelectNextExhibitionSList                     = exhibitionNameAltStringList;

        }
        else if(useNameAltBoolean   == false){

            tempPlayerExhibitionCurrentValueTextlabel               = selectedPlayerObject.exhibitionCurrentObject.nameFullString;
            tempPlayerExhibitionTargetSList                         = selectedPlayerObject.exhibitionTargetNameFullStringList;
            tempPlayerExhibitionVisitedSList                        = selectedPlayerObject.exhibitionVisitedNameFullStringList;
            tempPlayerTagSList                                      = selectedPlayerObject.exhibitionTagCounterNameFullStringList;
            tempPleaseSelectNextExhibitionSList                     = exhibitionNameFullStringList;

        }

        Group   EditPlayerGroupObject               = 
                cp5Object   .addGroup               ("EditPlayerGroupObject")
                            //.setPosition          (((width/2) - (playerGroupWidthInt/2)), ((height/2) - (playerGroupHeightInt/2)))
                            .setPosition            (playerGroupXInt, playerGroupYInt)
                            .setWidth               (playerGroupWidthInt)
                            .setBackgroundHeight    (playerGroupHeightInt)
                            .setBackgroundColor     (groupBackgroundColor)
                            .setColor               (otherCColor)
                            .setColorBackground     (groupColorBackgroundColor)
                            .setColorLabel          (groupColorLabelColor)
                            .setLabel               ("Edit Player Object:");

                /*PENDING - DONE: Create the text panel. Many text panel!!!*/
                cp5Object   .addTextlabel           ("PlayerIndexTextlabel")
                            .setPosition            (groupLayoutOffsetInt, (groupLayoutOffsetInt*1))
                            .setGroup               (EditPlayerGroupObject)
                            .setColor               (otherCColor)
                            .setColorValue          (255)
                            .setText                ("Player Index:");

                cp5Object   .addTextlabel           ("PlayerIndexValueTextlabel")
                            .setPosition            (((playerGroupWidthInt/2) + (groupLayoutOffsetInt/2)), (groupLayoutOffsetInt*1))
                            .setGroup               (EditPlayerGroupObject)
                            .setColor               (otherCColor)
                            .setColorValue          (255)
                            .setText                ("" + selectedPlayerObject.playerIndexInt);

                cp5Object   .addTextlabel           ("PlayerExhibitionCurrentTextlabel")
                            .setPosition            (groupLayoutOffsetInt, (groupLayoutOffsetInt*2))
                            .setGroup               (EditPlayerGroupObject)
                            .setColor               (otherCColor)
                            .setColorValue          (255)
                            .setText                ("Player Current Exhibition:");

                cp5Object   .addTextlabel           ("PlayerExhibitionCurrentValueTextlabel")
                            .setPosition            (((playerGroupWidthInt/2) + (groupLayoutOffsetInt/2)), (groupLayoutOffsetInt*2))
                            .setGroup               (EditPlayerGroupObject)
                            .setColor               (otherCColor)
                            .setColorValue          (255)
                            .setText                (tempPlayerExhibitionCurrentValueTextlabel);

                /*PENDING - DONE: Please make this unselectable.*/
                cp5Object   .addScrollableList      ("PlayerExhibitionTargetSList")
                            .setPosition            (groupLayoutOffsetInt,  (groupLayoutOffsetInt*4))
                            .setSize                ((playerGroupWidthInt - (groupLayoutOffsetInt*2)), playerScrollableListHeight3Int)
                            .setGroup               (EditPlayerGroupObject)
                            .addItems               (tempPlayerExhibitionTargetSList)
                            .setType                (ControlP5.LIST)
                            .setColor               (sListStaticCColor)
                            .setLabel               ("Player Target Exhibitions:");

                /*PENDING - DONE: Please make this unselectable.*/
                cp5Object   .addScrollableList      ("PlayerExhibitionVisitedSList")
                            .setPosition            (groupLayoutOffsetInt,  (groupLayoutOffsetInt*5) + playerScrollableListHeight3Int)
                            .setSize                ((playerGroupWidthInt - (groupLayoutOffsetInt*2)), playerScrollableListHeightInt)
                            .setGroup               (EditPlayerGroupObject)
                            .addItems               (tempPlayerExhibitionVisitedSList)
                            .setType                (ControlP5.LIST)
                            .setColor               (sListStaticCColor)
                            .setLabel               ("Player Visited Exhibitions:");

                cp5Object   .addScrollableList      ("PlayerTagSList")
                            .setPosition            (groupLayoutOffsetInt,  (groupLayoutOffsetInt*6) + playerScrollableListHeight3Int + playerScrollableListHeightInt)
                            .setSize                ((playerGroupWidthInt - (groupLayoutOffsetInt*2)), playerScrollableListHeightInt)
                            .setGroup               (EditPlayerGroupObject)
                            .addItems               (tempPlayerTagSList)
                            .setType                (ControlP5.LIST)
                            .setColor               (sListStaticCColor)
                            .setLabel               ("Player Collected Tags:");

                cp5Object   .addTextlabel           ("ModeTextlabel")
                            .setPosition            (groupLayoutOffsetInt, ((groupLayoutOffsetInt*7) + playerScrollableListHeight3Int + (playerScrollableListHeightInt*2)))
                            .setGroup               (EditPlayerGroupObject)
                            .setColor               (otherCColor)
                            .setColorValue          (255)
                            .setText                ("Modes:");

                /*PENDING - DONE: Adding radio buttons to select mode on how player should be moved.*/
                cp5Object   .addRadioButton         ("ModeRadioButton")
                            .setPosition            (groupLayoutOffsetInt, ((groupLayoutOffsetInt*8) + playerScrollableListHeight3Int + (playerScrollableListHeightInt*2)))
                            .setSize                (groupLayoutOffsetInt, groupLayoutOffsetInt)
                            .setGroup               (EditPlayerGroupObject)
                            .addItem                ("Software - Auto"  , 1)
                            .addItem                ("Software - Manual", 2)
                            .addItem                ("hardware - Manual", 3)
                            .activate               (1);

                cp5Object   .addScrollableList      ("PleaseSelectNextExhibitionSList")
                            .setPosition            (groupLayoutOffsetInt, ((groupLayoutOffsetInt*12) + playerScrollableListHeight3Int + (playerScrollableListHeightInt*2) + 2))    /*Additional 2 to fix layouting error in the radio buttons.*/
                            .setSize                ((playerGroupWidthInt - (groupLayoutOffsetInt*2 )), 64)
                            .setGroup               (EditPlayerGroupObject)
                            .addItems               (tempPleaseSelectNextExhibitionSList)
                            .setType                (ControlP5.LIST)
                            .setColor               (otherCColor)
                            .setLabel               ("Please Select Next Exhibition:");

    }

    void DrawVoid           (

        boolean _buttonOpenClosePlayerBoolean,
        float   _alphaFloat

    ){

        if(useNameAltBoolean        == true ){

            tempPlayerExhibitionCurrentValueTextlabel               = selectedPlayerObject.exhibitionCurrentObject.nameAltString;
            tempPlayerExhibitionTargetSList                         = selectedPlayerObject.exhibitionTargetNameAltStringList;
            tempPlayerExhibitionVisitedSList                        = selectedPlayerObject.exhibitionVisitedNameAltStringList;
            tempPlayerTagSList                                      = selectedPlayerObject.exhibitionTagCounterNameAltStringList;
            tempPleaseSelectNextExhibitionSList                     = exhibitionNameAltStringList;

        }
        else if(useNameAltBoolean   == false){

            tempPlayerExhibitionCurrentValueTextlabel               = selectedPlayerObject.exhibitionCurrentObject.nameFullString;
            tempPlayerExhibitionTargetSList                         = selectedPlayerObject.exhibitionTargetNameFullStringList;
            tempPlayerExhibitionVisitedSList                        = selectedPlayerObject.exhibitionVisitedNameFullStringList;
            tempPlayerTagSList                                      = selectedPlayerObject.exhibitionTagCounterNameFullStringList;
            tempPleaseSelectNextExhibitionSList                     = exhibitionNameFullStringList;

        }

        /*If there is a button open close for player is close then we need to reset the reference to the selected object.*/
        if(_buttonOpenClosePlayerBoolean    == false){ selectedPlayerObject = playerObjectList.get(0); }
        /*If selected player object is not null than populate the controller using the value of the selected player object.*/
        if(selectedPlayerObject             != null ){

            cp5Object.get(Textlabel         .class, "PlayerIndexValueTextlabel"             )   .setText (("" + selectedPlayerObject.playerIndexInt));
            cp5Object.get(Textlabel         .class, "PlayerExhibitionCurrentValueTextlabel" )   .setText ((     tempPlayerExhibitionCurrentValueTextlabel));
            cp5Object.get(ScrollableList    .class, "PlayerExhibitionTargetSList"           )   .setItems((     tempPlayerExhibitionTargetSList));
            cp5Object.get(ScrollableList    .class, "PlayerExhibitionVisitedSList"          )   .setItems((     tempPlayerExhibitionVisitedSList));
            cp5Object.get(ScrollableList    .class, "PlayerTagSList"                        )   .setItems((     tempPlayerTagSList));
            cp5Object.get(ScrollableList    .class, "PleaseSelectNextExhibitionSList"       )   .setItems((     tempPleaseSelectNextExhibitionSList));

        }

        alphaFloat                  = _alphaFloat;

        /*Show/hide controller based on the alpha value received from the main class.*/
        if                          (alphaFloat >  (255f/45f)){ cp5Object.get(Group   .class  , "EditPlayerGroupObject"            ).show(); }
        else if                     (alphaFloat <= (255f/45f)){ cp5Object.get(Group   .class  , "EditPlayerGroupObject"            ).hide(); }
        groupBackgroundColor        = color             (50         , 60    , 57    , alphaFloat    + (255f/45f));
        groupColorBackgroundColor   = color             (2          , 45    , 89    , alphaFloat    + (255f/45f));
        groupColorLabelColor        = color             (255        , 255   , 255   , alphaFloat    + (255f/45f));
        otherCColor                 .setActive          (color(0    , 170   , 255   , alphaFloat))
                                    .setBackground      (color(0    , 45    , 90    , alphaFloat))
                                    .setCaptionLabel    (color(255  , 255   , 255   , alphaFloat))
                                    .setForeground      (color(0    , 116   , 217   , alphaFloat))
                                    .setValueLabel      (color(255  , 255   , 255   , alphaFloat));
        sListStaticCColor           .setActive          (color(0    , 45    , 90    , alphaFloat))
                                    .setBackground      (color(0    , 45    , 90    , alphaFloat))
                                    .setCaptionLabel    (color(255  , 255   , 255   , alphaFloat))
                                    .setForeground      (color(0    , 45    , 90    , alphaFloat))
                                    .setValueLabel      (color(255  , 255   , 255   , alphaFloat));

        /*Especially for group controller you need to adjust four methods instead of just one methods.*/
        cp5Object.get(Group             .class , "EditPlayerGroupObject"            ).setBackgroundColor    (groupBackgroundColor);
        cp5Object.get(Group             .class , "EditPlayerGroupObject"            ).setColor              (otherCColor);
        cp5Object.get(Group             .class , "EditPlayerGroupObject"            ).setColorBackground    (groupColorBackgroundColor);
        cp5Object.get(Group             .class , "EditPlayerGroupObject"            ).setColorLabel         (groupColorLabelColor);

        /*The rest of the controller you only need to adjust for one method, which is setColor().*/
        cp5Object.get(Textlabel         .class , "PlayerIndexTextlabel"                    ).setColor(otherCColor       );
        cp5Object.get(Textlabel         .class , "PlayerIndexValueTextlabel"               ).setColor(otherCColor       );
        cp5Object.get(Textlabel         .class , "PlayerExhibitionCurrentTextlabel"        ).setColor(otherCColor       );
        cp5Object.get(Textlabel         .class , "PlayerExhibitionCurrentValueTextlabel"   ).setColor(otherCColor       );
        cp5Object.get(ScrollableList    .class , "PlayerExhibitionTargetSList"             ).setColor(sListStaticCColor );
        cp5Object.get(ScrollableList    .class , "PlayerExhibitionVisitedSList"            ).setColor(sListStaticCColor );
        cp5Object.get(ScrollableList    .class , "PlayerTagSList"                          ).setColor(sListStaticCColor );
        cp5Object.get(Textlabel         .class , "ModeTextlabel"                           ).setColor(otherCColor       );
        cp5Object.get(RadioButton       .class , "ModeRadioButton"                         ).setColor(otherCColor       );
        cp5Object.get(ScrollableList    .class , "PleaseSelectNextExhibitionSList"         ).setColor(otherCColor       );


        /*If the user does not need the exhibition list we hide it.
        For example when the player/visitor that user currently inspecting is not in Software - Manual,
            then the scrollable list of exhibitions is not neccessary, hence we hide it.*/
        if      (editPlayerModeInt == 1){ cp5Object.get(ScrollableList.class, "PleaseSelectNextExhibitionSList").hide(); }
        else if (editPlayerModeInt == 2){ cp5Object.get(ScrollableList.class, "PleaseSelectNextExhibitionSList").show(); }
        else if (editPlayerModeInt == 3){ cp5Object.get(ScrollableList.class, "PleaseSelectNextExhibitionSList").hide(); }
        else                            { cp5Object.get(ScrollableList.class, "PleaseSelectNextExhibitionSList").hide(); }

        /*This code below is for controlling controllers outside of this class.
        These two if statements is for controlling the position of the other object in the same open close button.*/
        if      (cp5Object.get(Group.class, "EditPlayerGroupObject").isOpen() == true ){

                /*Change the position when the group object is open.*/
                 cp5Object.get(ScrollableList.class, "VisitorSList").setPosition(

                    ( guiOffsetInt      + (parentButtonSizeInt/2)),
                    ((guiOffsetInt*1.5) + (parentButtonSizeInt/2) + playerGroupHeightInt    )

                );
                /*Change the size when the group object is open.*/
                 cp5Object.get(ScrollableList.class, "VisitorSList").setSize(

                    parentDropdownObjectWidthInt,
                    parentDropdownObjectHeightInt - playerGroupHeightInt

                );
                
        }
        else if (cp5Object.get(Group.class, "EditPlayerGroupObject").isOpen() == false){

                /*Change the position when the group object is close.*/
                 cp5Object.get(ScrollableList.class, "VisitorSList").setPosition(

                    (guiOffsetInt + (parentButtonSizeInt/2)                         ),
                    (guiOffsetInt + (parentButtonSizeInt/2) + groupLayoutOffsetInt  )

                );
                /*Change the size when the group object is close.*/
                 cp5Object.get(ScrollableList.class, "VisitorSList").setSize(

                    parentDropdownObjectWidthInt  ,
                    parentDropdownObjectHeightInt

                );

        }

    }

}