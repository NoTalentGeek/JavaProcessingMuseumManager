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
    int             parentDropdownObjectHeightInt       ;                           /*A variable for layout taken from the main class.*/
    int             groupLayoutOffsetInt                = 10;                       /*This object layout offset.*/
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
    List<String>    selectedTagStringList               = new ArrayList<String>();
    List<String>    tempSelectTagSubjectSList           = new ArrayList<String>();
    List<String>    tempSelectTagVerbSList              = new ArrayList<String>();
    List<String>    tempSelectTagNounSList              = new ArrayList<String>();
    List<String>    tempSelectTagAdjectiveSList         = new ArrayList<String>();
    List<String>    tempSelectTagAdverbSList            = new ArrayList<String>();
    String          selectedParentString                = "";                       /*Variable to be used and altered in the main class.*/
    String          selectedTypeObjectString            = "";                       /*Variable to be used and altered in the main class.*/

    /*Constructor.
    PENDING: Move the parent argument into the argument for DrawVoid() method.*/
    AddMuseumGUIObject(

        int     _groupXInt                      ,
        int     _groupYInt                      ,
        int     _groupAddWidthInt               ,
        int     _groupAddHeightInt              ,
        int     _parentButtonSizeInt            ,
        int     _parentDropdownObjectWidthInt   ,
        int     _parentDropdownObjwctHeightInt

    ){

        groupXInt                               = _groupXInt;
        groupYInt                               = _groupYInt + groupLayoutOffsetInt;
        groupAddWidthInt                        = _groupAddWidthInt;
        groupAddHeightInt                       = _groupAddHeightInt;
        parentButtonSizeInt                     = _parentButtonSizeInt;
        parentDropdownObjectWidthInt            = _parentDropdownObjectWidthInt;
        parentDropdownObjectHeightInt           = _parentDropdownObjwctHeightInt;

        scrollableWidthInt                      = ((groupAddWidthInt - groupLayoutOffsetInt*4)/3);      /*Create the scrollable list width to accomodate three scrollable list in a row.*/
        scrollableHeightInt                     = ((6*groupLayoutOffsetInt) + (5*scrollableOffsetInt)); /*Create the scrollable list height to accomodate five items + header in.*/
        oneLineComponentWidthInt                = ((groupAddWidthInt - groupLayoutOffsetInt*3)/2);      /*Create the one line object width to accomodate two similar object in a row.*/
        oneLineComponentHeightInt               = groupLayoutOffsetInt;                                 /*This need to be at the same height as the layout offset or the label height.*/

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

        if(useNameAltBoolean        == true ){

            tempSelectTagSubjectSList           = subjectTagNameAltStringList;
            tempSelectTagVerbSList              = verbTagNameAltStringList;
            tempSelectTagNounSList              = nounTagNameAltStringList;
            tempSelectTagAdjectiveSList         = adjectiveTagNameAltStringList;
            tempSelectTagAdverbSList            = adverbTagNameAltStringList;

        }
        else if(useNameAltBoolean   == false){

            tempSelectTagSubjectSList           = subjectTagNameFullStringList;
            tempSelectTagVerbSList              = verbTagNameFullStringList;
            tempSelectTagNounSList              = nounTagNameFullStringList;
            tempSelectTagAdjectiveSList         = adjectiveTagNameFullStringList;
            tempSelectTagAdverbSList            = adverbTagNameFullStringList;

        }

        /*Create the group and all components.*/
        Group   AddMuseumGroupObject            =
                cp5Object                       .addGroup               ("AddMuseumGroupObject")
                                                .close                  ()
                                                .setPosition            (groupXInt, groupYInt)
                                                .setWidth               (groupAddWidthInt)
                                                .setBackgroundHeight    (groupAddHeightInt)
                                                .setBackgroundColor     (groupBackgroundColor)
                                                .setColor               (otherCColor)
                                                .setColorBackground     (groupColorBackgroundColor)
                                                .setColorLabel          (groupColorLabelColor)
                                                .setLabel               ("ADD MUSEUM OBJECT:");

                cp5Object                       .addScrollableList      ("TypeObjectMuseumSList")
                                                .setPosition            (groupLayoutOffsetInt, groupLayoutOffsetInt)
                                                .setSize                (scrollableWidthInt, scrollableHeightInt)
                                                .setGroup               (AddMuseumGroupObject)
                                                .addItems               (Arrays.asList("Floor", "Room", "Exhibition"))
                                                .setType                (ControlP5.LIST)
                                                .setColor               (otherCColor)
                                                .setLabel               ("CHOOSE TYPE:");

                cp5Object                       .addScrollableList      ("SelectParentObjectMuseumSList")
                                                .setPosition            (((groupLayoutOffsetInt*2) + scrollableWidthInt), groupLayoutOffsetInt)
                                                .setSize                (((scrollableWidthInt*2) + groupLayoutOffsetInt), scrollableHeightInt)
                                                .setGroup               (AddMuseumGroupObject)
                                                .addItems               (defaultStringList)
                                                .setType                (ControlP5.LIST)
                                                .setColor               (otherCColor)
                                                .setLabel               ("PARENT OBJECT:");

                cp5Object                       .addScrollableList      ("SelectTagSubjectSList")
                                                .setPosition            (groupLayoutOffsetInt, ((groupLayoutOffsetInt*2) + scrollableHeightInt))
                                                .setSize                (scrollableWidthInt, scrollableHeightInt)
                                                .setGroup               (AddMuseumGroupObject)
                                                .addItems               (tempSelectTagSubjectSList)
                                                .setType                (ControlP5.LIST)
                                                .setColor               (sChecklistFalseCColor)
                                                .setLabel               ("SUBJECT TAG:");

                cp5Object                       .addScrollableList      ("SelectTagVerbSList")
                                                .setPosition            (((groupLayoutOffsetInt*2) + scrollableWidthInt), ((groupLayoutOffsetInt*2) + scrollableHeightInt))
                                                .setSize                (scrollableWidthInt, scrollableHeightInt)
                                                .setGroup               (AddMuseumGroupObject)
                                                .addItems               (tempSelectTagVerbSList)
                                                .setType                (ControlP5.LIST)
                                                .setColor               (sChecklistFalseCColor)
                                                .setLabel               ("VERB TAG:");

                cp5Object                       .addScrollableList      ("SelectTagNounSList")
                                                .setPosition            (((groupLayoutOffsetInt*3) + (scrollableWidthInt*2)), ((groupLayoutOffsetInt*2) + scrollableHeightInt))
                                                .setSize                (scrollableWidthInt, scrollableHeightInt)
                                                .setGroup               (AddMuseumGroupObject)
                                                .addItems               (tempSelectTagNounSList)
                                                .setType                (ControlP5.LIST)
                                                .setColor               (sChecklistFalseCColor)
                                                .setLabel               ("NOUN TAG:");

                cp5Object                       .addScrollableList      ("SelectTagAdjectiveSList")
                                                .setPosition            (((groupLayoutOffsetInt) + (scrollableWidthInt/2)), ((groupLayoutOffsetInt*3) + (scrollableHeightInt*2)))
                                                .setSize                (scrollableWidthInt, scrollableHeightInt)
                                                .setGroup               (AddMuseumGroupObject)
                                                .addItems               (tempSelectTagAdjectiveSList)
                                                .setType                (ControlP5.LIST)
                                                .setColor               (sChecklistFalseCColor)
                                                .setLabel               ("ADJECTIVE TAG:");

                cp5Object                       .addScrollableList      ("SelectTagAdverbSList")
                                                .setPosition            (((groupLayoutOffsetInt*2) + ((scrollableWidthInt/2)*3)), ((groupLayoutOffsetInt*3) + (scrollableHeightInt*2)))
                                                .setSize                (scrollableWidthInt, scrollableHeightInt)
                                                .setGroup               (AddMuseumGroupObject)
                                                .addItems               (tempSelectTagAdverbSList)
                                                .setType                (ControlP5.LIST)
                                                .setColor               (sChecklistFalseCColor)
                                                .setLabel               ("ADVERB TAG:");

                cp5Object                       .addTextlabel           ("CanAddMultipleTagsTextlabel")
                                                .setPosition            (groupLayoutOffsetInt, ((groupLayoutOffsetInt*4) + (scrollableHeightInt*3)))
                                                .setGroup               (AddMuseumGroupObject)
                                                .setColor               (otherCColor)
                                                .setColorValue          (255)
                                                .setText                ("*YOU CAN ADD MULTIPLE TAGS\nBUT MINIMUM ONE TAG IN EACH CATEGORY.");

                cp5Object                       .addTextfield           ("NameFullTextfield")
                                                .setPosition            (groupLayoutOffsetInt, ((groupLayoutOffsetInt*7) + (scrollableHeightInt*3)))
                                                .setSize                (oneLineComponentWidthInt, (oneLineComponentHeightInt*2))
                                                .setGroup               (AddMuseumGroupObject)
                                                .setColor               (otherCColor)
                                                .setLabel               ("NAME FULL");

                cp5Object                       .addTextfield           ("NameAltTextfield")
                                                .setPosition            (((groupLayoutOffsetInt*2) + oneLineComponentWidthInt), ((groupLayoutOffsetInt*7) + (scrollableHeightInt*3)))
                                                .setSize                (oneLineComponentWidthInt, (oneLineComponentHeightInt*2))
                                                .setGroup               (AddMuseumGroupObject)
                                                .setColor               (otherCColor)
                                                .setLabel               ("NAME ALTERNATIVE");

                cp5Object                       .addButton              ("SubmitButton")
                                                .setPosition            (groupLayoutOffsetInt, ((groupLayoutOffsetInt*10) + (scrollableHeightInt*3) + oneLineComponentHeightInt))
                                                .setSize                (((oneLineComponentWidthInt*2) + groupLayoutOffsetInt), oneLineComponentHeightInt)
                                                .setGroup               (AddMuseumGroupObject)
                                                .setColor               (otherCColor)
                                                .setLabel               ("SUBMIT");

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

    void DrawVoid(float _alphaFloat)        {

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
        sChecklistFalseCColor       .setActive          (color(0    , 45    , 90    , alphaFloat))
                                    .setBackground      (color(0    , 45    , 90    , alphaFloat))
                                    .setCaptionLabel    (color(255  , 255   , 255   , alphaFloat))
                                    .setForeground      (color(0    , 116   , 217   , alphaFloat))
                                    .setValueLabel      (color(255  , 255   , 255   , alphaFloat));
        sChecklistTrueCColor        .setActive          (color(0    , 116   , 217   , alphaFloat))
                                    .setBackground      (color(0    , 116   , 217   , alphaFloat))
                                    .setCaptionLabel    (color(255  , 255   , 255   , alphaFloat))
                                    .setForeground      (color(0    , 116   , 217   , alphaFloat))
                                    .setValueLabel      (color(255  , 255   , 255   , alphaFloat));

        /*Especially for group controller you need to adjust four methods instead of just one methods.*/
        cp5Object.get(Group         .class  , "AddMuseumGroupObject"            ).setBackgroundColor    (groupBackgroundColor);
        cp5Object.get(Group         .class  , "AddMuseumGroupObject"            ).setColor              (otherCColor);
        cp5Object.get(Group         .class  , "AddMuseumGroupObject"            ).setColorBackground    (groupColorBackgroundColor);
        cp5Object.get(Group         .class  , "AddMuseumGroupObject"            ).setColorLabel         (groupColorLabelColor);

        /*The rest of the controller you only need to adjust for one method, which is setColor().*/
        cp5Object.get(ScrollableList.class  , "TypeObjectMuseumSList"           ).setColor              (otherCColor            );
        cp5Object.get(ScrollableList.class  , "SelectParentObjectMuseumSList"   ).setColor              (otherCColor            );
        cp5Object.get(ScrollableList.class  , "SelectTagSubjectSList"           ).setColor              (sChecklistFalseCColor  );
        cp5Object.get(ScrollableList.class  , "SelectTagVerbSList"              ).setColor              (sChecklistFalseCColor  );
        cp5Object.get(ScrollableList.class  , "SelectTagNounSList"              ).setColor              (sChecklistFalseCColor  );
        cp5Object.get(ScrollableList.class  , "SelectTagAdjectiveSList"         ).setColor              (sChecklistFalseCColor  );
        cp5Object.get(ScrollableList.class  , "SelectTagAdverbSList"            ).setColor              (sChecklistFalseCColor  );
        cp5Object.get(Textlabel     .class  , "CanAddMultipleTagsTextlabel"     ).setColor              (otherCColor            );
        cp5Object.get(Textfield     .class  , "NameFullTextfield"               ).setColor              (otherCColor            );
        cp5Object.get(Textfield     .class  , "NameAltTextfield"                ).setColor              (otherCColor            );
        cp5Object.get(Button        .class  , "SubmitButton"                    ).setColor              (otherCColor            );

        /*This to re - set SelectParentObjectMuseumSList so that it display options according to the TypeObjectMuseumSList selection.*/
        if      (useNameAltBoolean == true ){

            if      (typeObjectMuseumString.equals("Floor"      )){ cp5Object.get(ScrollableList.class, "SelectParentObjectMuseumSList").setItems(defaultStringList         ); typeObjectMuseumString = ""; }
            else if (typeObjectMuseumString.equals("Room"       )){ cp5Object.get(ScrollableList.class, "SelectParentObjectMuseumSList").setItems(floorNameAltStringList    ); typeObjectMuseumString = ""; }
            else if (typeObjectMuseumString.equals("Exhibition" )){ cp5Object.get(ScrollableList.class, "SelectParentObjectMuseumSList").setItems(roomNameAltStringList     ); typeObjectMuseumString = ""; }

        }
        else if (useNameAltBoolean == false){

            if      (typeObjectMuseumString.equals("Floor"      )){ cp5Object.get(ScrollableList.class, "SelectParentObjectMuseumSList").setItems(defaultStringList         ); typeObjectMuseumString = ""; }
            else if (typeObjectMuseumString.equals("Room"       )){ cp5Object.get(ScrollableList.class, "SelectParentObjectMuseumSList").setItems(floorNameFullStringList   ); typeObjectMuseumString = ""; }
            else if (typeObjectMuseumString.equals("Exhibition" )){ cp5Object.get(ScrollableList.class, "SelectParentObjectMuseumSList").setItems(roomNameFullStringList    ); typeObjectMuseumString = ""; }

        }


        /*This code below is for controlling controllers outside of this class.
        These two if statements is for controlling the position of the other object in the same open close button.*/
        if      (cp5Object.get(Group.class, "AddMuseumGroupObject").isOpen() == true ){

                /*Change the position when the group object is open.*/
                 cp5Object.get(Group.class, "AddTagGUIObjectAddTagGroupObject").setPosition(

                    (width - groupLayoutOffsetInt*2 - (parentButtonSizeInt/2) - parentDropdownObjectWidthInt),
                    (cp5Object.get(Group.class, "AddMuseumGroupObject").getPosition()[1] + groupLayoutOffsetInt + groupAddHeightInt)

                );
                
        }
        else if (cp5Object.get(Group.class, "AddMuseumGroupObject").isOpen() == false){

                /*Change the position when the group object is close.*/
                 cp5Object.get(Group.class, "AddTagGUIObjectAddTagGroupObject").setPosition(

                    (width - groupLayoutOffsetInt*2 - (parentButtonSizeInt/2) - parentDropdownObjectWidthInt),
                    (cp5Object.get(Group.class, "AddMuseumGroupObject").getPosition()[1] + groupLayoutOffsetInt)

                );

        }

    }

    /*This function is to put every selected tags into a String List.*/
    void SetSelectedTagStringList(

        List<String>    _specificTagStringList ,
        String          _controllerName

    ){

        /*Iterate through all the list elements.*/
        for(int i = 0; i < _specificTagStringList.size(); i ++){

            /*Check if there is property in the hash map named "isSelected".*/
            if      (cp5Object.get(ScrollableList.class, _controllerName).getItem(i).get("isSelected") != null){

                /*If there is a properties called "isSelected" and it is returned true then add the selected "text" properties into the String list if only
                    it is not yet inside the list.
                PENDING: Implementation of HashSet could be more suitable here instead of using List.*/
                if      (cp5Object.get(ScrollableList.class, _controllerName).getItem(i).get("isSelected").toString().equals("true" )){

                    if(!selectedTagStringList.contains(cp5Object.get(ScrollableList.class, _controllerName).getItem(i).get("text").toString())){

                        selectedTagStringList.add(cp5Object.get(ScrollableList.class, _controllerName).getItem(i).get("text").toString());

                    }

                }
                /*If "isSelected" is false then delete the element from the list.*/
                else if (cp5Object.get(ScrollableList.class, _controllerName).getItem(i).get("isSelected").toString().equals("false")){

                    selectedTagStringList.remove(cp5Object.get(ScrollableList.class, _controllerName).getItem(i).get("text").toString()); 

                }

            }

        }

    }

}