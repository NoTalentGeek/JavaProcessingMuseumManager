/*A class to creating a GUI object on adding museum object.*/
import java.util.*;
import controlP5.*;
class AddMuseumGUIObject{

    /*Some variables :).*/
    color           groupBackgroundColor                ;                           /*The color of group panel group background.*/
    color           groupColorBackgroundColor           ;                           /*The title background color of panel group.*/
    color           groupColorLabelColor                ;                           /*The title font colot of the panel group.*/
    float           alphaFloat                          = 255;                      /*The opacity of this object.*/
    int             parentButtonSizeInt                 ;                           /*A variable for layout taken from the main class.*/
    int             parentDropdownObjectWidthInt        ;                           /*A variable for layout taken from the main class.*/
    int             groupLayoutOffsetInt                = 10;                       /*This object layout offset.*/
    int             groupLabelHeightInt                 ;                           /*Make the header of the group to be exactly as the same as layout offset.*/
    int             groupXInt                           ;                           /*X position of this GUI object in the main class.*/
    int             groupYInt                           ;                           /*Y position of this GUI object in the main class.*/
    int             groupAddWidthInt                    ;                           /*Width of the group, dependent on screen size.*/
    int             groupAddHeightInt                   ;                           /*Fixed height of the group, you need to carefully arrange the height of this variable using pixel ruler..*/
    int             scrollableOffsetInt                 = 1;                        /*Fixed offset of scrollable list.*/
    int             scrollableWidthInt                  ;                           /*Width of every scrollable list component, dependent on group size.*/
    int             scrollableHeightInt                 ;                           /*Height of every scrollable list component, dependent group label height.*/
    int             oneLineComponentWidthInt            ;                           /*Width for every one line component like button or text field, dependent on scrollable component size.*/
    int             oneLineComponentHeightInt           ;                           /*Height for every one line component like button or text field, dependent on scrollable component size.*/
    CColor          otherCColor                         = new CColor();             /*The color for other component than the scrollableChecklist.*/
    CColor          sChecklistTrueCColor                = new CColor();             /*The color of the item when an item in scroll checklist is selected.*/
    CColor          sChecklistFalseCColor               = new CColor();             /*The color of the item when an item in scroll checklist is not selected.*/
    String          typeObjectMuseumString              = "";                       /*The type of the object that will be added, it will be either floor, room, or exhibition object.*/

    /*Constructor.*/
    AddMuseumGUIObject(

        int     _groupXInt                      ,
        int     _groupYInt                      ,
        int     _groupAddWidthInt               ,
        int     _groupAddHeightInt              ,
        int     _parentButtonSizeInt            ,
        int     _parentDropdownObjectWidthInt

    ){

        groupXInt                               = _groupXInt;
        groupYInt                               = _groupYInt + groupLayoutOffsetInt;
        groupAddWidthInt                        = _groupAddWidthInt;
        groupAddHeightInt                       = _groupAddHeightInt;
        parentButtonSizeInt                     = _parentButtonSizeInt;
        parentDropdownObjectWidthInt            = _parentDropdownObjectWidthInt;

        groupLabelHeightInt                     = groupLayoutOffsetInt;
        scrollableWidthInt                      = ((groupAddWidthInt - groupLayoutOffsetInt*4)/3);          /*Create the scrollable list width to accomodate three scrollable list in a row.*/
        scrollableHeightInt                     = ((6*groupLabelHeightInt) + (5*scrollableOffsetInt));      /*Create the scrollable list height to accomodate five items + header in.*/
        oneLineComponentWidthInt                = ((groupAddWidthInt - groupLayoutOffsetInt*3)/2);          /*Create the one line object width to accomodate two similar object in a row.*/
        oneLineComponentHeightInt               = groupLabelHeightInt;                                      /*This need to be at the same height as the layout offset or the label height.*/

        /*Set the colors, however most of controller's color will be updated every tick in the DrawVoid() function.*/
        groupBackgroundColor                    = color(50  , 60    , 57    , alphaFloat);
        groupColorBackgroundColor               = color(2   , 45    , 89    , alphaFloat);
        groupColorLabelColor                    = color(255 , 255   , 255   , alphaFloat);
        otherCColor                             .setActive          (color(0    , 170   , 255   , alphaFloat))
                                                .setBackground      (color(0    , 45    , 90    , alphaFloat))
                                                .setCaptionLabel    (color(255  , 255   , 255   , alphaFloat))
                                                .setForeground      (color(0    , 116   , 217   , alphaFloat))
                                                .setValueLabel      (color(255  , 255   , 255   , alphaFloat));
        sChecklistFalseCColor                   .setActive          (color(0    , 45    , 90    , alphaFloat))
                                                .setBackground      (color(0    , 45    , 90    , alphaFloat))
                                                .setCaptionLabel    (color(255  , 255   , 255   , alphaFloat))
                                                .setForeground      (color(0    , 116   , 217   , alphaFloat))
                                                .setValueLabel      (color(255  , 255   , 255   , alphaFloat));
        sChecklistTrueCColor                    .setActive          (color(0    , 116   , 217   , alphaFloat))
                                                .setBackground      (color(0    , 116   , 217   , alphaFloat))
                                                .setCaptionLabel    (color(255  , 255   , 255   , alphaFloat))
                                                .setForeground      (color(0    , 116   , 217   , alphaFloat))
                                                .setValueLabel      (color(255  , 255   , 255   , alphaFloat));

        /*Create the group and all components.*/
        Group   AddMuseumGroupObject            =
                cp5Object                       .addGroup               ("AddMuseumGroupObject")
                                                .setPosition            (groupXInt, groupYInt)
                                                .setWidth               (groupAddWidthInt)
                                                .setBackgroundHeight    (groupAddHeightInt)
                                                .setBackgroundColor     (groupBackgroundColor)
                                                .setColor               (otherCColor)
                                                .setColorBackground     (groupColorBackgroundColor)
                                                .setColorLabel          (groupColorLabelColor)
                                                .setLabel               ("Add Museum Object:");

                cp5Object                       .addScrollableList      ("TypeObjectMuseumSList")
                                                .setPosition            (groupLayoutOffsetInt, groupLayoutOffsetInt)
                                                .setSize                (scrollableWidthInt, scrollableHeightInt)
                                                .setGroup               (AddMuseumGroupObject)
                                                .addItems               (Arrays.asList("Floor", "Room", "Exhibition"))
                                                .setType                (ControlP5.LIST)
                                                .setColor               (otherCColor)
                                                .setLabel               ("Choose Type:");

                cp5Object                       .addScrollableList      ("SelectParentObjectMuseumSList")
                                                .setPosition            (((groupLayoutOffsetInt*2) + scrollableWidthInt), groupLayoutOffsetInt)
                                                .setSize                (scrollableWidthInt, scrollableHeightInt)
                                                .setGroup               (AddMuseumGroupObject)
                                                .addItems               (defaultStringList)
                                                .setType                (ControlP5.LIST)
                                                .setColor               (otherCColor)
                                                .setLabel               ("Parent Object:");

                cp5Object                       .addScrollableList      ("SelectTagSubjectSList")
                                                .setPosition            (groupLayoutOffsetInt, ((groupLayoutOffsetInt*2) + scrollableHeightInt))
                                                .setSize                (scrollableWidthInt, scrollableHeightInt)
                                                .setGroup               (AddMuseumGroupObject)
                                                .addItems               (subjectTagStringList)
                                                .setType                (ControlP5.LIST)
                                                .setColor               (sChecklistFalseCColor)
                                                .setLabel               ("Subject Tag:");

                cp5Object                       .addScrollableList      ("SelectTagVerbSList")
                                                .setPosition            (((groupLayoutOffsetInt*2) + scrollableWidthInt), ((groupLayoutOffsetInt*2) + scrollableHeightInt))
                                                .setSize                (scrollableWidthInt, scrollableHeightInt)
                                                .setGroup               (AddMuseumGroupObject)
                                                .addItems               (verbTagStringList)
                                                .setType                (ControlP5.LIST)
                                                .setColor               (sChecklistFalseCColor)
                                                .setLabel               ("Verb Tag:");

                cp5Object                       .addScrollableList      ("SelectTagNounSList")
                                                .setPosition            (((groupLayoutOffsetInt*3) + (scrollableWidthInt*2)), ((groupLayoutOffsetInt*2) + scrollableHeightInt))
                                                .setSize                (scrollableWidthInt, scrollableHeightInt)
                                                .setGroup               (AddMuseumGroupObject)
                                                .addItems               (nounTagStringList)
                                                .setType                (ControlP5.LIST)
                                                .setColor               (sChecklistFalseCColor)
                                                .setColor               (otherCColor)
                                                .setLabel               ("Noun Tag:");

                cp5Object                       .addTextlabel           ("CanAddMultipleTagsTextlabel")
                                                .setPosition            (groupLayoutOffsetInt, ((groupLayoutOffsetInt*3) + (scrollableHeightInt*2)))
                                                .setGroup               (AddMuseumGroupObject)
                                                .setColor               (otherCColor)
                                                .setColorValue          (255)
                                                .setText                ("*You can add multiple tags,\nbut minimum one tag in each category.");

                cp5Object                       .addTextfield           ("NameFullTextfield")
                                                .setPosition            (groupLayoutOffsetInt, ((groupLayoutOffsetInt*6) + (scrollableHeightInt*2)))
                                                .setSize                (oneLineComponentWidthInt, (oneLineComponentHeightInt*2))
                                                .setGroup               (AddMuseumGroupObject)
                                                .setColor               (otherCColor)
                                                .setLabel               ("Name Full:");

                cp5Object                       .addTextfield           ("NameAltTextfield")
                                                .setPosition            (((groupLayoutOffsetInt*2) + oneLineComponentWidthInt), ((groupLayoutOffsetInt*6) + (scrollableHeightInt*2)))
                                                .setSize                (oneLineComponentWidthInt, (oneLineComponentHeightInt*2))
                                                .setGroup               (AddMuseumGroupObject)
                                                .setColor               (otherCColor)
                                                .setLabel               ("Name Alternative:");

                cp5Object                       .addButton              ("SubmitButton")
                                                .setPosition            (groupLayoutOffsetInt, ((groupLayoutOffsetInt*9) + (scrollableHeightInt*2) + oneLineComponentHeightInt))
                                                .setSize                (((oneLineComponentWidthInt*2) + groupLayoutOffsetInt), oneLineComponentHeightInt)
                                                .setGroup               (AddMuseumGroupObject)
                                                .setColor               (otherCColor)
                                                .setLabel               ("Submit");

        /*DEBUG.*/
        /*
        println("AddMuseumGroupObject\t\t"                              + cp5Object.get(Group.class         , "AddMuseumGroupObject"            ).getColor());
        println("TypeObjectMuseumSList\t\t"                             + cp5Object.get(ScrollableList.class, "TypeObjectMuseumSList"           ).getColor());
        println("SelectParentObjectMuseumSList\t"                       + cp5Object.get(ScrollableList.class, "SelectParentObjectMuseumSList"   ).getColor());
        println("SelectTagSubjectSList\t\t"                             + cp5Object.get(ScrollableList.class, "SelectTagSubjectSList"           ).getColor());
        println("SelectTagVerbSList\t\t"                                + cp5Object.get(ScrollableList.class, "SelectTagVerbSList"              ).getColor());
        println("SelectTagNounSList\t\t"                                + cp5Object.get(ScrollableList.class, "SelectTagNounSList"              ).getColor());
        println("CanAddMultipleTagsTextlabel\t"                         + cp5Object.get(Textlabel.class     , "CanAddMultipleTagsTextlabel"     ).getColor());
        println("NameFullTextfield\t\t"                                 + cp5Object.get(Textfield.class     , "NameFullTextfield"               ).getColor());
        println("NameAltTextfield\t\t"                                  + cp5Object.get(Textfield.class     , "NameAltTextfield"                ).getColor());
        println("SubmitButton\t\t\t"                                    + cp5Object.get(Button.class        , "SubmitButton"                    ).getColor());
        */

    }

    void DrawVoid(float _alphaFloat){

        /*For ebery tick/frame make sure to sync this object with the value received from the main class.*/
        alphaFloat                  = _alphaFloat;

        /*Show/hide controller based on the alpha value received from the main class.*/
        if                          (alphaFloat >  (255f/45f)){ cp5Object.get(Group         .class  , "AddMuseumGroupObject"            ).show(); }
        else if                     (alphaFloat <= (255f/45f)){ cp5Object.get(Group         .class  , "AddMuseumGroupObject"            ).hide(); }
        groupBackgroundColor        = color             (50         , 60    , 57    , alphaFloat + (255f/45f));
        groupColorBackgroundColor   = color             (2          , 45    , 89    , alphaFloat + (255f/45f));
        groupColorLabelColor        = color             (255        , 255   , 255   , alphaFloat + (255f/45f));
        otherCColor                 .setActive          (color(0    , 170   , 255   , alphaFloat))
                                    .setBackground      (color(0    , 45    , 90    , alphaFloat))
                                    .setCaptionLabel    (color(255  , 255   , 255   , alphaFloat))
                                    .setForeground      (color(0    , 116   , 217   , alphaFloat))
                                    .setValueLabel      (color(255  , 255   , 255   , alphaFloat));

        /*Especially for group controller you need to adjust four methods instead of just one.*/
        cp5Object.get(Group         .class  , "AddMuseumGroupObject"            ).setBackgroundColor    (groupBackgroundColor);
        cp5Object.get(Group         .class  , "AddMuseumGroupObject"            ).setColor              (otherCColor);
        cp5Object.get(Group         .class  , "AddMuseumGroupObject"            ).setColorBackground    (groupColorBackgroundColor);
        cp5Object.get(Group         .class  , "AddMuseumGroupObject"            ).setColorLabel         (groupColorLabelColor);

        cp5Object.get(ScrollableList.class  , "TypeObjectMuseumSList"           ).setColor              (otherCColor);
        cp5Object.get(ScrollableList.class  , "SelectParentObjectMuseumSList"   ).setColor              (otherCColor);
        cp5Object.get(ScrollableList.class  , "SelectTagSubjectSList"           ).setColor              (otherCColor);
        cp5Object.get(ScrollableList.class  , "SelectTagVerbSList"              ).setColor              (otherCColor);
        cp5Object.get(ScrollableList.class  , "SelectTagNounSList"              ).setColor              (otherCColor);
        cp5Object.get(Textlabel     .class  , "CanAddMultipleTagsTextlabel"     ).setColor              (otherCColor);
        cp5Object.get(Textfield     .class  , "NameFullTextfield"               ).setColor              (otherCColor);
        cp5Object.get(Textfield     .class  , "NameAltTextfield"                ).setColor              (otherCColor);
        cp5Object.get(Button        .class  , "SubmitButton"                    ).setColor              (otherCColor);

        /*This to re - set SelectParentObjectMuseumSList so that it display options according to the TypeObjectMuseumSList selection.*/
        if      (typeObjectMuseumString.equals("Floor"      )){ cp5Object.get(ScrollableList.class, "SelectParentObjectMuseumSList").setItems(defaultStringList  ); typeObjectMuseumString = ""; }
        else if (typeObjectMuseumString.equals("Room"       )){ cp5Object.get(ScrollableList.class, "SelectParentObjectMuseumSList").setItems(floorStringList    ); typeObjectMuseumString = ""; }
        else if (typeObjectMuseumString.equals("Exhibition" )){ cp5Object.get(ScrollableList.class, "SelectParentObjectMuseumSList").setItems(roomStringList     ); typeObjectMuseumString = ""; }

        /*This code below is for controlling controllers outside of this class.
        These two if statements is for controlling the position of the other object in the same open close button.*/
        if      (cp5Object.get(Group.class, "AddMuseumGroupObject").isOpen() == true ){

                 cp5Object.get(ScrollableList.class, "ExhibitionSList").setPosition(

                    (width -  guiOffsetInt      - (parentButtonSizeInt/2) - parentDropdownObjectWidthInt    ),
                    (        (guiOffsetInt*1.5) + (parentButtonSizeInt/2) + groupAddHeightInt               )

                );
                
        }
        else if (cp5Object.get(Group.class, "AddMuseumGroupObject").isOpen() == false){

                 cp5Object.get(ScrollableList.class, "ExhibitionSList").setPosition(

                    (width -  guiOffsetInt - (parentButtonSizeInt/2) - parentDropdownObjectWidthInt ),
                    (         guiOffsetInt + (parentButtonSizeInt/2) + groupLabelHeightInt          )

                );

        }

    }

}