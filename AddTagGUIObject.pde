import java.util.*;
import controlP5.*;

class AddTagGUIObject{

    /*Add three color for the background color.*/
    color       groupBackgroundColor            ;                   /*The color of group panel group background.*/
    color       groupColorBackgroundColor       ;                   /*The title background color of panel group.*/
    color       groupColorLabelColor            ;                   /*The title font colot of the panel group.*/
    /*Add transparency variable.*/
    float       alphaFloat                      = 255;              /*The opacity for this object.*/
    int         groupXInt                       ;                   /*The x position of this graphical user interface.*/
    int         groupYInt                       ;                   /*The x position of this graphical user interface.*/
    int         groupLayoutOffsetInt            = 10;               /*This object offset.*/
    int         groupWidthInt                   ;                   /*This object width.*/
    int         groupHeightInt                  ;                   /*This object height.*/
    int         parentButtonSizeInt             ;                   /*A variable for layout taken from the main class.*/
    int         parentDropdownObjectWidthInt    ;                   /*A variable for layout taken from the main class.*/
    int         parentDropdownObjectHeightInt   ;                   /*A variable for layout taken from the main class.*/
    int         scrollableWidthInt              ;
    int         scrollableHeightInt             = 62;
    CColor      otherCColor                     = new CColor();     /*The color for other component than the scrollableChecklist.*/

    String      selectedTagTypeString           = "";

    AddTagGUIObject(

        int     _groupXInt                      ,
        int     _groupYInt                      ,
        int     _groupWidthInt                  ,
        int     _groupHeightInt                 ,
        int     _parentButtonSizeInt            ,
        int     _parentDropdownObjectWidthInt   ,
        int     _parentDropdownObjwctHeightInt

    ){

        groupXInt                       = _groupXInt;
        groupYInt                       = _groupYInt + groupLayoutOffsetInt;
        groupWidthInt                   = _groupWidthInt;
        groupHeightInt                  = _groupHeightInt;
        parentButtonSizeInt             = _parentButtonSizeInt;
        parentDropdownObjectWidthInt    = _parentDropdownObjectWidthInt;
        parentDropdownObjectHeightInt   = _parentDropdownObjwctHeightInt;

        scrollableWidthInt              = (groupWidthInt - (groupLayoutOffsetInt*2));           /*Create the scrollable list width to accomodate three scrollable list in a row.*/

        /*Set the colors, however most of controller's color will be updated every tick in the DrawVoid() function.*/
        groupBackgroundColor            = color(50  , 60    , 57    , alphaFloat);
        groupColorBackgroundColor       = color(2   , 45    , 89    , alphaFloat);
        groupColorLabelColor            = color(255 , 255   , 255   , alphaFloat);
        otherCColor                     .setActive          (color(0    , 170   , 255   , alphaFloat))
                                        .setBackground      (color(0    , 45    , 90    , alphaFloat))
                                        .setCaptionLabel    (color(255  , 255   , 255   , alphaFloat))
                                        .setForeground      (color(0    , 116   , 217   , alphaFloat))
                                        .setValueLabel      (color(255  , 255   , 255   , alphaFloat));

        Group   AddTagGroupObject                   =
                cp5Object   .addGroup               ("AddTagGUIObjectAddTagGroupObject")
                            .close                  ()
                            .setPosition            (groupXInt, groupYInt)
                            .setWidth               (groupWidthInt)
                            .setBackgroundHeight    (groupHeightInt)
                            .setBackgroundColor     (groupBackgroundColor)
                            .setColor               (otherCColor)
                            .setColorBackground     (groupColorBackgroundColor)
                            .setColorLabel          (groupColorLabelColor)
                            .setLabel               ("ADD TAG:");

                cp5Object   .addScrollableList      ("AddTagGUIObjectSelectTagTypeSList")
                            .setPosition            (groupLayoutOffsetInt, groupLayoutOffsetInt)
                            .setSize                (scrollableWidthInt, scrollableHeightInt)
                            .setGroup               (AddTagGroupObject)
                            .addItems               (Arrays.asList("SUBJECT", "VERB", "NEGATIVE VERB", "NOUN", "ADJECTIVE", "NEGATIVE ADJECTIVE", "ADVERB", "ADVERB NEGATIVE"))
                            .setType                (ControlP5.LIST)
                            .setColor               (otherCColor)
                            .setLabel               ("SELECT TAG TYPE:");

                cp5Object   .addTextfield           ("AddTagGUIObjectTagNameFullTextfield")
                            .setPosition            (groupLayoutOffsetInt, ((groupLayoutOffsetInt*2) + scrollableHeightInt))
                            .setSize                (scrollableWidthInt  ,  (groupLayoutOffsetInt*2))
                            .setGroup               (AddTagGroupObject)
                            .setColor               (otherCColor)
                            .setLabel               ("TAG NAME FULL:");

                cp5Object   .addTextfield           ("AddTagGUIObjectTagNameAltTextfield")
                            .setPosition            (groupLayoutOffsetInt, ((groupLayoutOffsetInt*6) + scrollableHeightInt))
                            .setSize                (scrollableWidthInt  ,  (groupLayoutOffsetInt*2))
                            .setGroup               (AddTagGroupObject)
                            .setColor               (otherCColor)
                            .setLabel               ("TAG NAME ALT:");

                cp5Object   .addTextfield           ("AddTagGUIObjectSubjectTextfield")
                            .hide                   ()
                            .setPosition            (groupLayoutOffsetInt, ((groupLayoutOffsetInt*10) + scrollableHeightInt))
                            .setSize                (scrollableWidthInt  ,  (groupLayoutOffsetInt*2))
                            .setGroup               (AddTagGroupObject)
                            .setColor               (otherCColor)
                            .setLabel               ("SUBJECT:");

                cp5Object   .addTextfield           ("AddTagGUIObjectVerb1Textfield")
                            .hide                   ()
                            .setPosition            (groupLayoutOffsetInt, ((groupLayoutOffsetInt*10) + scrollableHeightInt))
                            .setSize                (scrollableWidthInt  ,  (groupLayoutOffsetInt*2))
                            .setGroup               (AddTagGroupObject)
                            .setColor               (otherCColor)
                            .setLabel               ("VERB 1:");

                cp5Object   .addTextfield           ("AddTagGUIObjectVerb2Textfield")
                            .hide                   ()
                            .setPosition            (groupLayoutOffsetInt, ((groupLayoutOffsetInt*14) + scrollableHeightInt))
                            .setSize                (scrollableWidthInt  ,  (groupLayoutOffsetInt*2))
                            .setGroup               (AddTagGroupObject)
                            .setColor               (otherCColor)
                            .setLabel               ("VERB 2:");

                cp5Object   .addTextfield           ("AddTagGUIObjectVerb3Textfield")
                            .hide                   ()
                            .setPosition            (groupLayoutOffsetInt, ((groupLayoutOffsetInt*18) + scrollableHeightInt))
                            .setSize                (scrollableWidthInt  ,  (groupLayoutOffsetInt*2))
                            .setGroup               (AddTagGroupObject)
                            .setColor               (otherCColor)
                            .setLabel               ("VERB 3:");

                cp5Object   .addTextfield           ("AddTagGUIObjectVerbIngTextfield")
                            .hide                   ()
                            .setPosition            (groupLayoutOffsetInt, ((groupLayoutOffsetInt*22) + scrollableHeightInt))
                            .setSize                (scrollableWidthInt  ,  (groupLayoutOffsetInt*2))
                            .setGroup               (AddTagGroupObject)
                            .setColor               (otherCColor)
                            .setLabel               ("VERB + ING:");

                cp5Object   .addTextfield           ("AddTagGUIObjectVerbSTextfield")
                            .hide                   ()
                            .setPosition            (groupLayoutOffsetInt, ((groupLayoutOffsetInt*26) + scrollableHeightInt))
                            .setSize                (scrollableWidthInt  ,  (groupLayoutOffsetInt*2))
                            .setGroup               (AddTagGroupObject)
                            .setColor               (otherCColor)
                            .setLabel               ("VERB + S:");

                cp5Object   .addTextfield           ("AddTagGUIObjectNegativeVerb1Textfield")
                            .hide                   ()
                            .setPosition            (groupLayoutOffsetInt, ((groupLayoutOffsetInt*10) + scrollableHeightInt))
                            .setSize                (scrollableWidthInt  ,  (groupLayoutOffsetInt*2))
                            .setGroup               (AddTagGroupObject)
                            .setColor               (otherCColor)
                            .setLabel               ("NEGATIVE VERB 1:");

                cp5Object   .addTextfield           ("AddTagGUIObjectNegativeVerb2Textfield")
                            .hide                   ()
                            .setPosition            (groupLayoutOffsetInt, ((groupLayoutOffsetInt*14) + scrollableHeightInt))
                            .setSize                (scrollableWidthInt  ,  (groupLayoutOffsetInt*2))
                            .setGroup               (AddTagGroupObject)
                            .setColor               (otherCColor)
                            .setLabel               ("NEGATIVE VERB 2:");

                cp5Object   .addTextfield           ("AddTagGUIObjectNegativeVerb3Textfield")
                            .hide                   ()
                            .setPosition            (groupLayoutOffsetInt, ((groupLayoutOffsetInt*18) + scrollableHeightInt))
                            .setSize                (scrollableWidthInt  ,  (groupLayoutOffsetInt*2))
                            .setGroup               (AddTagGroupObject)
                            .setColor               (otherCColor)
                            .setLabel               ("NEGATIVE VERB 3:");

                cp5Object   .addTextfield           ("AddTagGUIObjectNegativeVerbIngTextfield")
                            .hide                   ()
                            .setPosition            (groupLayoutOffsetInt, ((groupLayoutOffsetInt*22) + scrollableHeightInt))
                            .setSize                (scrollableWidthInt  ,  (groupLayoutOffsetInt*2))
                            .setGroup               (AddTagGroupObject)
                            .setColor               (otherCColor)
                            .setLabel               ("NEGATIVE VERB + ING:");

                cp5Object   .addTextfield           ("AddTagGUIObjectNegativeVerbSTextfield")
                            .hide                   ()
                            .setPosition            (groupLayoutOffsetInt, ((groupLayoutOffsetInt*26) + scrollableHeightInt))
                            .setSize                (scrollableWidthInt  ,  (groupLayoutOffsetInt*2))
                            .setGroup               (AddTagGroupObject)
                            .setColor               (otherCColor)
                            .setLabel               ("NEGATIVE VERB + S:");

                cp5Object   .addTextfield           ("AddTagGUIObjectNounTextfield")
                            .hide                   ()
                            .setPosition            (groupLayoutOffsetInt, ((groupLayoutOffsetInt*10) + scrollableHeightInt))
                            .setSize                (scrollableWidthInt  ,  (groupLayoutOffsetInt*2))
                            .setGroup               (AddTagGroupObject)
                            .setColor               (otherCColor)
                            .setLabel               ("NOUN:");

                cp5Object   .addTextfield           ("AddTagGUIObjectNounSTextfield")
                            .hide                   ()
                            .setPosition            (groupLayoutOffsetInt, ((groupLayoutOffsetInt*14) + scrollableHeightInt))
                            .setSize                (scrollableWidthInt  ,  (groupLayoutOffsetInt*2))
                            .setGroup               (AddTagGroupObject)
                            .setColor               (otherCColor)
                            .setLabel               ("NOUN + S:");

                cp5Object   .addTextfield           ("AddTagGUIObjectAdjectiveTextfield")
                            .hide                   ()
                            .setPosition            (groupLayoutOffsetInt, ((groupLayoutOffsetInt*10) + scrollableHeightInt))
                            .setSize                (scrollableWidthInt  ,  (groupLayoutOffsetInt*2))
                            .setGroup               (AddTagGroupObject)
                            .setColor               (otherCColor)
                            .setLabel               ("ADJECTIVE:");

                cp5Object   .addTextfield           ("AddTagGUIObjectNegativeAdjectiveTextfield")
                            .hide                   ()
                            .setPosition            (groupLayoutOffsetInt, ((groupLayoutOffsetInt*14) + scrollableHeightInt))
                            .setSize                (scrollableWidthInt  ,  (groupLayoutOffsetInt*2))
                            .setGroup               (AddTagGroupObject)
                            .setColor               (otherCColor)
                            .setLabel               ("NEGATIVE ADJECTIVE:");

                cp5Object   .addTextfield           ("AddTagGUIObjectAdverbTextfield")
                            .hide                   ()
                            .setPosition            (groupLayoutOffsetInt, ((groupLayoutOffsetInt*10) + scrollableHeightInt))
                            .setSize                (scrollableWidthInt  ,  (groupLayoutOffsetInt*2))
                            .setGroup               (AddTagGroupObject)
                            .setColor               (otherCColor)
                            .setLabel               ("ADVERB:");

                cp5Object   .addTextfield           ("AddTagGUIObjectNagetiveAdverbTextfield")
                            .hide                   ()
                            .setPosition            (groupLayoutOffsetInt, ((groupLayoutOffsetInt*14) + scrollableHeightInt))
                            .setSize                (scrollableWidthInt  ,  (groupLayoutOffsetInt*2))
                            .setGroup               (AddTagGroupObject)
                            .setColor               (otherCColor)
                            .setLabel               ("NEGATIVE ADVERB:");

                cp5Object   .addButton              ("AddTagGUIObjectSubmitButton")
                            .setPosition            (groupLayoutOffsetInt, ((groupLayoutOffsetInt*30) + scrollableHeightInt))
                            .setSize                (scrollableWidthInt, groupLayoutOffsetInt)
                            .setGroup               (AddTagGroupObject)
                            .setColor               (otherCColor)
                            .setLabel               ("SUBMIT");

    }

    void DrawVoid(float   _alphaFloat){

        alphaFloat                      = _alphaFloat;

        /*Show/hide controller based on the alpha value received from the main class.*/
        if                              (alphaFloat >  (255f/45f)){ cp5Object.get(Group   .class  , "AddTagGUIObjectAddTagGroupObject"            ).show(); }
        else if                         (alphaFloat <= (255f/45f)){ cp5Object.get(Group   .class  , "AddTagGUIObjectAddTagGroupObject"            ).hide(); }
        groupBackgroundColor            = color             (50         , 60    , 57    , alphaFloat    + (255f/45f));
        groupColorBackgroundColor       = color             (2          , 45    , 89    , alphaFloat    + (255f/45f));
        groupColorLabelColor            = color             (255        , 255   , 255   , alphaFloat    + (255f/45f));
        otherCColor                     .setActive          (color(0    , 170   , 255   , alphaFloat))
                                        .setBackground      (color(0    , 45    , 90    , alphaFloat))
                                        .setCaptionLabel    (color(255  , 255   , 255   , alphaFloat))
                                        .setForeground      (color(0    , 116   , 217   , alphaFloat))
                                        .setValueLabel      (color(255  , 255   , 255   , alphaFloat));

        /*Especially for group controller you need to adjust four methods instead of just one methods.*/
        cp5Object.get(Group             .class , "AddTagGUIObjectAddTagGroupObject"             ).setBackgroundColor    (groupBackgroundColor);
        cp5Object.get(Group             .class , "AddTagGUIObjectAddTagGroupObject"             ).setColor              (otherCColor);
        cp5Object.get(Group             .class , "AddTagGUIObjectAddTagGroupObject"             ).setColorBackground    (groupColorBackgroundColor);
        cp5Object.get(Group             .class , "AddTagGUIObjectAddTagGroupObject"             ).setColorLabel         (groupColorLabelColor);

        /*The rest of the controller you only need to adjust for one method, which is setColor().*/
        cp5Object.get(ScrollableList    .class , "AddTagGUIObjectSelectTagTypeSList"            ).setColor(otherCColor);
        cp5Object.get(Textfield         .class , "AddTagGUIObjectTagNameFullTextfield"          ).setColor(otherCColor);
        cp5Object.get(Textfield         .class , "AddTagGUIObjectTagNameAltTextfield"           ).setColor(otherCColor);
        cp5Object.get(Textfield         .class , "AddTagGUIObjectSubjectTextfield"              ).setColor(otherCColor);
        cp5Object.get(Textfield         .class , "AddTagGUIObjectVerb1Textfield"                ).setColor(otherCColor);
        cp5Object.get(Textfield         .class , "AddTagGUIObjectVerb2Textfield"                ).setColor(otherCColor);
        cp5Object.get(Textfield         .class , "AddTagGUIObjectVerb3Textfield"                ).setColor(otherCColor);
        cp5Object.get(Textfield         .class , "AddTagGUIObjectVerbIngTextfield"              ).setColor(otherCColor);
        cp5Object.get(Textfield         .class , "AddTagGUIObjectVerbSTextfield"                ).setColor(otherCColor);
        cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeVerb1Textfield"        ).setColor(otherCColor);
        cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeVerb2Textfield"        ).setColor(otherCColor);
        cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeVerb3Textfield"        ).setColor(otherCColor);
        cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeVerbIngTextfield"      ).setColor(otherCColor);
        cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeVerbSTextfield"        ).setColor(otherCColor);
        cp5Object.get(Textfield         .class , "AddTagGUIObjectNounTextfield"                 ).setColor(otherCColor);
        cp5Object.get(Textfield         .class , "AddTagGUIObjectNounSTextfield"                ).setColor(otherCColor);
        cp5Object.get(Textfield         .class , "AddTagGUIObjectAdjectiveTextfield"            ).setColor(otherCColor);
        cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeAdjectiveTextfield"    ).setColor(otherCColor);
        cp5Object.get(Textfield         .class , "AddTagGUIObjectAdverbTextfield"               ).setColor(otherCColor);
        cp5Object.get(Textfield         .class , "AddTagGUIObjectNagetiveAdverbTextfield"       ).setColor(otherCColor);
        cp5Object.get(Button            .class , "AddTagGUIObjectSubmitButton"                  ).setColor(otherCColor);

        /*This code below is for controlling controllers outside of this class.
        These two if statements is for controlling the position of the other object in the same open close button.*/
        if      (cp5Object.get(Group.class, "AddTagGUIObjectAddTagGroupObject").isOpen() == true ){

                /*Change the position when the group object is open.*/
                 cp5Object.get(ScrollableList.class, "ExhibitionSList").setPosition(

                    (width - groupLayoutOffsetInt*2 - (parentButtonSizeInt/2) - parentDropdownObjectWidthInt),
                    (cp5Object.get(Group.class, "AddTagGUIObjectAddTagGroupObject").getPosition()[1] + groupHeightInt)

                );
                
        }
        else if (cp5Object.get(Group.class, "AddTagGUIObjectAddTagGroupObject").isOpen() == false){

                /*Change the position when the group object is close.*/
                 cp5Object.get(ScrollableList.class, "ExhibitionSList").setPosition(

                    (width - groupLayoutOffsetInt*2 - (parentButtonSizeInt/2) - parentDropdownObjectWidthInt),
                    (cp5Object.get(Group.class, "AddTagGUIObjectAddTagGroupObject").getPosition()[1])

                );

        }

        ControlFormVoid();

    }

    void ControlFormVoid(){

        if(selectedTagTypeString.equals("SUBJECT"))                 {

            cp5Object.get(Textfield         .class , "AddTagGUIObjectSubjectTextfield"              ).show();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectVerb1Textfield"                ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectVerb2Textfield"                ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectVerb3Textfield"                ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectVerbIngTextfield"              ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectVerbSTextfield"                ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeVerb1Textfield"        ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeVerb2Textfield"        ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeVerb3Textfield"        ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeVerbIngTextfield"      ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeVerbSTextfield"        ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNounTextfield"                 ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNounSTextfield"                ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectAdjectiveTextfield"            ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeAdjectiveTextfield"    ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectAdverbTextfield"               ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNagetiveAdverbTextfield"       ).hide();



        }
        else if(selectedTagTypeString.equals("VERB"))               {

            cp5Object.get(Textfield         .class , "AddTagGUIObjectSubjectTextfield"              ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectVerb1Textfield"                ).show();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectVerb2Textfield"                ).show();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectVerb3Textfield"                ).show();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectVerbIngTextfield"              ).show();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectVerbSTextfield"                ).show();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeVerb1Textfield"        ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeVerb2Textfield"        ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeVerb3Textfield"        ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeVerbIngTextfield"      ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeVerbSTextfield"        ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNounTextfield"                 ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNounSTextfield"                ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectAdjectiveTextfield"            ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeAdjectiveTextfield"    ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectAdverbTextfield"               ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNagetiveAdverbTextfield"       ).hide();



        }
        else if(selectedTagTypeString.equals("NEGATIVE VERB"))      {

            cp5Object.get(Textfield         .class , "AddTagGUIObjectSubjectTextfield"              ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectVerb1Textfield"                ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectVerb2Textfield"                ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectVerb3Textfield"                ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectVerbIngTextfield"              ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectVerbSTextfield"                ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeVerb1Textfield"        ).show();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeVerb2Textfield"        ).show();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeVerb3Textfield"        ).show();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeVerbIngTextfield"      ).show();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeVerbSTextfield"        ).show();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNounTextfield"                 ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNounSTextfield"                ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectAdjectiveTextfield"            ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeAdjectiveTextfield"    ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectAdverbTextfield"               ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNagetiveAdverbTextfield"       ).hide();



        }
        else if(selectedTagTypeString.equals("NOUN"))               {

            cp5Object.get(Textfield         .class , "AddTagGUIObjectSubjectTextfield"              ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectVerb1Textfield"                ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectVerb2Textfield"                ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectVerb3Textfield"                ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectVerbIngTextfield"              ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectVerbSTextfield"                ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeVerb1Textfield"        ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeVerb2Textfield"        ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeVerb3Textfield"        ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeVerbIngTextfield"      ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeVerbSTextfield"        ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNounTextfield"                 ).show();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNounSTextfield"                ).show();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectAdjectiveTextfield"            ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeAdjectiveTextfield"    ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectAdverbTextfield"               ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNagetiveAdverbTextfield"       ).hide();



        }
        else if(selectedTagTypeString.equals("ADJECTIVE"))          {

            cp5Object.get(Textfield         .class , "AddTagGUIObjectSubjectTextfield"              ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectVerb1Textfield"                ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectVerb2Textfield"                ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectVerb3Textfield"                ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectVerbIngTextfield"              ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectVerbSTextfield"                ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeVerb1Textfield"        ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeVerb2Textfield"        ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeVerb3Textfield"        ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeVerbIngTextfield"      ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeVerbSTextfield"        ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNounTextfield"                 ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNounSTextfield"                ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectAdjectiveTextfield"            ).show();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeAdjectiveTextfield"    ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectAdverbTextfield"               ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNagetiveAdverbTextfield"       ).hide();



        }
        else if(selectedTagTypeString.equals("NEGATIVE ADJECTIVE")) {

            cp5Object.get(Textfield         .class , "AddTagGUIObjectSubjectTextfield"              ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectVerb1Textfield"                ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectVerb2Textfield"                ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectVerb3Textfield"                ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectVerbIngTextfield"              ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectVerbSTextfield"                ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeVerb1Textfield"        ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeVerb2Textfield"        ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeVerb3Textfield"        ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeVerbIngTextfield"      ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeVerbSTextfield"        ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNounTextfield"                 ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNounSTextfield"                ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectAdjectiveTextfield"            ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeAdjectiveTextfield"    ).show();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectAdverbTextfield"               ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNagetiveAdverbTextfield"       ).hide();



        }
        else if(selectedTagTypeString.equals("ADVERB"))             {

            cp5Object.get(Textfield         .class , "AddTagGUIObjectSubjectTextfield"              ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectVerb1Textfield"                ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectVerb2Textfield"                ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectVerb3Textfield"                ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectVerbIngTextfield"              ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectVerbSTextfield"                ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeVerb1Textfield"        ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeVerb2Textfield"        ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeVerb3Textfield"        ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeVerbIngTextfield"      ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeVerbSTextfield"        ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNounTextfield"                 ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNounSTextfield"                ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectAdjectiveTextfield"            ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeAdjectiveTextfield"    ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectAdverbTextfield"               ).show();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNagetiveAdverbTextfield"       ).hide();



        }
        else if(selectedTagTypeString.equals("NEGATIVE ADVERB"))    {

            cp5Object.get(Textfield         .class , "AddTagGUIObjectSubjectTextfield"              ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectVerb1Textfield"                ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectVerb2Textfield"                ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectVerb3Textfield"                ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectVerbIngTextfield"              ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectVerbSTextfield"                ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeVerb1Textfield"        ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeVerb2Textfield"        ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeVerb3Textfield"        ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeVerbIngTextfield"      ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeVerbSTextfield"        ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNounTextfield"                 ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNounSTextfield"                ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectAdjectiveTextfield"            ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNegativeAdjectiveTextfield"    ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectAdverbTextfield"               ).hide();
            cp5Object.get(Textfield         .class , "AddTagGUIObjectNagetiveAdverbTextfield"       ).show();



        }

    }

}