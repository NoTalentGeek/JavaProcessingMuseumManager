import java.util.*;
import controlP5.*;

class EditPlayerGUIObject{

    /*Parent variables.*/
    color           groupBackgroundColor                                        ;                           /*The color of group main  panel background color.*/
    color           groupColorBackgroundColor                                   ;                           /*The color of group title panel background color.*/
    color           groupColorLabelColor                                        ;                           /*The color of group title panel text       color.*/

    float           alphaFloat                                                  = 255;                      /*The opacity of all controllers in group object. */

    int             guiXInt                                                     ;                           /*The x position  of group object.*/
    int             guiYInt                                                     ;                           /*The y position  of group object.*/
    int             guiWidthInt                                                 ;                           /*The height size of group object.*/
    int             guiHeightInt                                                ;                           /*The width  size of group object.*/

    int             guiLayoutOffsetInt                                          = 10;                       /*The offset used to space each controllers in group object.*/

    int             guiElement2CollumnFirstCollumnXInt                          ;                           /*The x position of first  controller in 2 collumns row.*/
    int             guiElement2CollumnSecondCollumnXInt                         ;                           /*The x position of second controller in 2 collumns row.*/
    int             guiElement3CollumnFirstCollumnXInt                          ;                           /*The x position of first  controller in 3 collumns row.*/
    int             guiElement3CollumnSecondCollumnXInt                         ;                           /*The x position of second controller in 3 collumns row.*/
    int             guiElement3CollumnThirdCollumnXInt                          ;                           /*The x position of third  controller in 3 collumns row.*/

    int             guiElement2CollumnWidth                                     ;                           /*The width of any controller in 2 collumns row.*/
    int             guiElement3CollumnWidth                                     ;                           /*The width of any controller in 3 collumns row.*/

    int             guiElement1LineHeight                                       = 10;                       /*The height of any element that only one line height.
                                                                                                            For example, button, text label.*/
    int             guiElement2LineHeight                                       = 20;                       /*The height of any element that only one line height.
                                                                                                            For example, text field.*/

    int             guiScrollableList5RowHeightInt                              = 62;                       /*The height of scrollable list controller that contains four  elements with additional one element of controller's title panel.*/
    int             guiScrollableList4RowHeightInt                              = 50;                       /*The height of scrollable list controller that contains three elements with additional one element of controller's title panel.*/

    CColor          defaultCColor                                               = new CColor();             /*This is controller color for default                object.*/
    CColor          staticScrollableListCColor                                  = new CColor();             /*This is controller color for static scrollable list object.*/

    ControlP5       cp5Object                                                   ;                           /*This object local graphical user interface main controller.*/
    PApplet         pAppletObject                                               ;                           /*Refer this object back to main PApplet object.*/

    /*Object specific variables.*/
    int             movementPlayerModeInt                                       = 2;                        /*Movement mode of selected player object.*/
    String          tempSelectedPlayerSentenceString                            = "";                       /*Temporary variable that contains selected player object sentence                           String.*/
    String          tempSelectedPlayerFinishedString                            = "";                       /*Temporary variable that contains selected player object finished                           String.*/
    List<String>    tempSelectedPlayerExhibitionTargetNameFullStringList        = new ArrayList<String>();  /*Temporary variable that contains selected player object target   exhibition list full name String.*/
    List<String>    tempSelectedPlayerExhibitionVisitedNameFullStringList       = new ArrayList<String>();  /*Temporary variable that contains selected player object visited  exhibition list full name String.*/
    List<String>    tempSelectedPlayerTagNameFullStringList                     = new ArrayList<String>();  /*Temporary variable that contains selected player object tag                 list full name String.*/
    ObjectPlayer    selectedPlayerObject                                        ;                           /*Selected player object.*/

    Group           editPlayerGroupObject                                       ;                           /**/
    Textlabel       editPlayerGroupPlayerIndexTextlabelObject                   ;                           /**/
    Textlabel       editPlayerGroupPlayerIndexValueTextlabelObject              ;                           /**/
    Textfield       editPlayerGroupPlayerNameTextfieldObject                    ;                           /**/
    Button          editPlayerGroupPlayerNameChangeButtonObject                 ;                           /**/
    Textlabel       editPlayerGroupPlayerFinishedTextlabelObject                ;                           /**/
    Textlabel       editPlayerGroupPlayerFinishedValueTextlabelObject           ;                           /**/
    Textlabel       editPlayerGroupPlayerScoreTextlabelObject                   ;                           /**/
    Textlabel       editPlayerGroupPlayerScoreValueTextlabelObject              ;                           /**/
    Textlabel       editPlayerGroupPlayerExhibitionCurrentTextlabelObject       ;                           /**/
    Textlabel       editPlayerGroupPlayerExhibitionCurrentValueTextlabelObject  ;                           /**/
    ScrollableList  editPlayerGroupPlayerExhibitionTargetScrollableListObject   ;                           /**/
    ScrollableList  editPlayerGroupPlayerExhibitionVisitedScrollableListObject  ;                           /**/
    Textlabel       editPlayerGroupPlayerSentenceTextlabelObject                ;                           /**/
    Textarea        editPlayerGroupPlayerSentenceValueTextareaObject            ;                           /**/
    Textlabel       editPlayerGroupPlayerExplanationTextlabelObject             ;                           /**/
    Textarea        editPlayerGroupPlayerExaplanationValueTextareaObject        ;                           /**/
    ScrollableList  editPlayerGroupPlayerTagScrollableListObject                ;                           /**/
    Textlabel       editPlayerGroupPlayerModeTextlabelObject                    ;                           /**/
    RadioButton     editPlayerGroupPlayerModeValueRadioButtonObject             ;                           /**/
    ScrollableList  editPlayerGroupPlayerExhibitionNextScrollableListObject     ;                           /**/
    Button          editPlayerGroupPlayerResetButtonObject                      ;                           /**/
    Button          editPlayerGroupPlayerGeneratePatternButtonObject            ;                           /**/

    EditPlayerGUIObject                                 (

        int     _guiXInt        ,
        int     _guiYInt        ,
        int     _guiWidthInt    ,
        int     _guiHeightInt   ,
        PApplet _pAppletObject

    ){

        /*Parent.*/
        guiXInt                                         =  _guiXInt                         ;
        guiYInt                                         = (_guiYInt + guiLayoutOffsetInt)   ;
        guiWidthInt                                     =  _guiWidthInt                     ;
        guiHeightInt                                    =  _guiHeightInt                    ;
        pAppletObject                                   =  _pAppletObject                   ;

        cp5Object                                       = new ControlP5(pAppletObject)      ;

        guiElement1CollumnWidth                         = ((guiWidthInt - (guiLayoutOffsetInt*2))/1)                ;
        guiElement2CollumnWidth                         = ((guiWidthInt - (guiLayoutOffsetInt*3))/2)                ;
        guiElement3CollumnWidth                         = ((guiWidthInt - (guiLayoutOffsetInt*4))/3)                ;
        guiElement1CollumnFirstCollumnXInt              = ((guiLayoutOffsetInt*1) + (guiElement2CollumnWidth*0))    ;
        guiElement2CollumnFirstCollumnXInt              = ((guiLayoutOffsetInt*1) + (guiElement2CollumnWidth*0))    ;
        guiElement2CollumnSecondCollumnXInt             = ((guiLayoutOffsetInt*2) + (guiElement2CollumnWidth*1))    ;
        guiElement3CollumnFirstCollumnXInt              = ((guiLayoutOffsetInt*1) + (guiElement3CollumnWidth*0))    ;
        guiElement3CollumnSecondCollumnXInt             = ((guiLayoutOffsetInt*2) + (guiElement3CollumnWidth*1))    ;
        guiElement3CollumnThirdCollumnXInt              = ((guiLayoutOffsetInt*3) + (guiElement3CollumnWidth*2))    ;

        groupBackgroundColor                            = color(50 , 60 , 57 , alphaFloat)  ;
        groupColorBackgroundColor                       = color(2  , 45 , 89 , alphaFloat)  ;
        groupColorLabelColor                            = color(255, 255, 255, alphaFloat)  ;

        defaultCColor               .setActive          (color(0  , 170, 255, alphaFloat))                                              /*The color of controller when an element  is clicked by mouse pointer.*/
                                    .setBackground      (color(0  , 45 , 90 , alphaFloat))                                              /*The color of controller         elements background.                 */
                                    .setCaptionLabel    (color(255, 255, 255, alphaFloat))                                              /*The color of controller         elements text.                       */
                                    .setForeground      (color(0  , 116, 217, alphaFloat))                                              /*The color of controller when an element  is hovered by mouse pointer */
                                    .setValueLabel      (color(255, 255, 255, alphaFloat));                                             /*The color of controller         elements text.                       */
        staticScrollableListCColor  .setActive          (color(0  , 45 , 90 , alphaFloat))                                              /*The color of controller when an element  is clicked by mouse pointer.*/
                                    .setBackground      (color(0  , 45 , 90 , alphaFloat))                                              /*The color of controller         elements background.                 */
                                    .setCaptionLabel    (color(255, 255, 255, alphaFloat))                                              /*The color of controller         elements text.                       */
                                    .setForeground      (color(0  , 45 , 90 , alphaFloat))                                              /*The color of controller when an element  is hovered by mouse pointer */
                                    .setValueLabel      (color(255, 255, 255, alphaFloat));                                             /*The color of controller         elements text.                       */

        /*Object specific.*/
        selectedPlayerObject                            =  playerObjectList     .get(0);                                                /*Set the default player object.                                       */
        tempSelectedPlayerFinishedString                = (selectedPlayerObject .playerFinishedBoolean == true) ? "True" : "False";     /*Convert boolean value into String type data with sentence case.      */
        
        /*Put all selected player sentences into one paragraph of a String variable.*/
        for(int i = 0; i < selectedPlayerObject.sentenceStringList.size(); i ++){

            if(i == 0)  { tempSelectedPlayerSentenceString =                                           selectedPlayerObject.sentenceStringList.get(i); }
            else        { tempSelectedPlayerSentenceString = tempSelectedPlayerSentenceString + "\n" + selectedPlayerObject.sentenceStringList.get(i); }

        }



        editPlayerGroupObject                                       =
        cp5Object   .addGroup                                       ("EditPlayerGroupObject")
                    .close                                          ()
                    .setBackgroundColor                             (groupBackgroundColor)
                    .setBackgroundHeight                            (guiHeightInt)
                    .setColor                                       (defaultCColor)
                    .setColorBackground                             (groupColorBackgroundColor)
                    .setColorLabel                                  (groupColorLabelColor)
                    .setLabel                                       ("EDIT VISITOR:")
                    .setPosition                                    (guiXInt, guiYInt)
                    .setWidth                                       (guiWidthInt);



        editPlayerGroupPlayerIndexTextlabelObject                   =
        cp5Object   .addTextlabel                                   ("EditPlayerGroupPlayerIndexTextlabelObject")
                    .setColor                                       (defaultCColor)
                    .setColorValue                                  (255)
                    .setGroup                                       (editPlayerGroupObject)
                    .setPosition                                    (guiElement2CollumnFirstCollumnXInt, guiLayoutOffsetInt)
                    .setText                                        ("PLAYER INDEX:");



        editPlayerGroupPlayerIndexValueTextlabelObject              =
        cp5Object   .addTextlabel                                   ("EditPlayerGroupPlayerIndexValueTextlabelObject")
                    .setColor                                       (defaultCColor)
                    .setColorValue                                  (255)
                    .setGroup                                       (editPlayerGroupObject)
                    .setPosition                                    (guiElement2CollumnSecondCollumnXInt, guiLayoutOffsetInt)
                    .setText                                        ("" + selectedPlayerObject.playerIndexInt);



        editPlayerGroupPlayerNameTextfieldObject                    =
        cp5Object   .addTextfield                                   ("EditPlayerGroupPlayerNameTextfieldObject")
                    .setColor                                       (defaultCColor)
                    .setGroup                                       (editPlayerGroupObject)
                    .setLabel                                       ("PLAYER NAME:")
                    .setPosition                                    (guiElement2CollumnFirstCollumnXInt, (guiLayoutOffsetInt*2))
                    .setSize                                        (guiElement2CollumnWidth,  guiElement2LineHeight);



        editPlayerGroupPlayerNameChangeButtonObject                 =
        cp5Object   .addButton                                      ("EditPlayerGroupPlayerNameChangeButtonObject")
                    .setColor                                       (defaultCColor)
                    .setGroup                                       (editPlayerGroupObject)
                    .setLabel                                       ("CHANGE NAME")
                    .setPosition                                    (guiElement2CollumnSecondCollumnXInt, (guiLayoutOffsetInt*2))
                    .setSize                                        (guiElement2CollumnWidth,  guiElement2LineHeight);



        editPlayerGroupPlayerFinishedTextlabelObject                =
        cp5Object   .addTextlabel                                   ("EditPlayerGroupPlayerFinishedTextlabelObject")
                    .setColor                                       (defaultCColor)
                    .setColorValue                                  (255)
                    .setGroup                                       (editPlayerGroupObject)
                    .setPosition                                    (guiElement2CollumnFirstCollumnXInt, (guiLayoutOffsetInt*6))
                    .setText                                        ("PLAYER FINISHED:");



        editPlayerGroupPlayerFinishedValueTextlabelObject           =
        cp5Object   .addTextlabel                                   ("EditPlayerGroupPlayerFinishedValueTextlabelObject")
                    .setColor                                       (defaultCColor)
                    .setColorValue                                  (255)
                    .setGroup                                       (editPlayerGroupObject)
                    .setPosition                                    (guiElement2CollumnSecondCollumnXInt, (guiLayoutOffsetInt*6))
                    .setText                                        (tempSelectedPlayerFinishedString);;



        editPlayerGroupPlayerScoreTextlabelObject                   =
        cp5Object   .addTextlabel                                   ("EditPlayerGroupPlayerScoreTextlabelObject")
                    .setColor                                       (defaultCColor)
                    .setColorValue                                  (255)
                    .setGroup                                       (editPlayerGroupObject)
                    .setPosition                                    (guiElement2CollumnFirstCollumnXInt, (guiLayoutOffsetInt*7))
                    .setText                                        ("PLAYER SCORE:");



        editPlayerGroupPlayerScoreValueTextlabelObject              =
        cp5Object   .addTextlabel                                   ("EditPlayerGroupPlayerScoreValueTextlabelObject")
                    .setColor                                       (defaultCColor)
                    .setColorValue                                  (255)
                    .setGroup                                       (editPlayerGroupObject)
                    .setPosition                                    (guiElement2CollumnSecondCollumnXInt, (guiLayoutOffsetInt*7))
                    .setText                                        ("" + selectedPlayerObject.playerScoreInt);;



        editPlayerGroupPlayerExhibitionCurrentTextlabelObject       =
        cp5Object   .addTextlabel                                   ("EditPlayerGroupPlayerExhibitionCurrentTextlabelObject")
                    .setColor                                       (defaultCColor)
                    .setColorValue                                  (255)
                    .setGroup                                       (editPlayerGroupObject)
                    .setPosition                                    (guiElement2CollumnFirstCollumnXInt, (guiLayoutOffsetInt*8))
                    .setText                                        ("PLAYER CURRENT EXHIBITION:");



        editPlayerGroupPlayerExhibitionCurrentValueTextlabelObject  =
        cp5Object   .addTextlabel                                   ("EditPlayerGroupPlayerExhibitionCurrentValueTextlabelObject")
                    .setColor                                       (defaultCColor)
                    .setColorValue                                  (255)
                    .setGroup                                       (editPlayerGroupObject)
                    .setPosition                                    (guiElement2CollumnSecondCollumnXInt, (guiLayoutOffsetInt*8))
                    .setText                                        ("" + selectedPlayerObject.exhibitionCurrentNameFullString);



        editPlayerGroupPlayerExhibitionTargetScrollableListObject   =
        cp5Object   .addScrollableList                              ("EditPlayerGroupPlayerExhibitionTargetScrollableListObject")
                    .addItems                                       (tempPlayerExhibitionTargetSList)
                    .setColor                                       (staticScrollableListCColor)
                    .setGroup                                       (editPlayerGroupObject)
                    .setLabel                                       ("PLAYER TARGET EXHIBITIONS:")
                    .setPosition                                    (guiElement2CollumnFirstCollumnXInt,  (guiLayoutOffsetInt*9))
                    .setSize                                        (guiElement2CollumnWidth, guiScrollableList4RowHeightInt)
                    .setType                                        (ControlP5.LIST);



        editPlayerGroupPlayerExhibitionVisitedScrollableListObject  =
        cp5Object   .addScrollableList                              ("EditPlayerGroupPlayerExhibitionVisitedScrollableListObject")
                    .addItems                                       (tempSelectedPlayerExhibitionVisitedNameFullStringList)
                    .setColor                                       (staticScrollableListCColor)
                    .setGroup                                       (editPlayerGroupObject)
                    .setLabel                                       ("PLAYER VISITED EXHIBITIONS:")
                    .setPosition                                    (guiElement2CollumnSecondCollumnXInt,  (guiLayoutOffsetInt*9))
                    .setSize                                        (guiElement2CollumnWidth, guiScrollableList5RowHeightInt)
                    .setType                                        (ControlP5.LIST);



        editPlayerGroupPlayerSentenceTextlabelObject                =
        cp5Object   .addTextlabel                                   ("EditPlayerGroupPlayerSentenceTextlabelObject")
                    .setColor                                       (defaultCColor)
                    .setColorValue                                  (255)
                    .setGroup                                       (editPlayerGroupObject)
                    .setPosition                                    (guiElement2CollumnFirstCollumnXInt,  ((guiLayoutOffsetInt*10) + guiScrollableList5RowHeightInt))
                    .setText                                        ("PLAYER SENTENCES:");



        editPlayerGroupPlayerSentenceValueTextareaObject            =
        cp5Object   .addTextarea                                    ("EditPlayerGroupPlayerSentenceValueTextareaObject")
                    .setColor                                       (defaultCColor)
                    .setGroup                                       (editPlayerGroupObject)
                    .setPosition                                    (guiElement2CollumnFirstCollumnXInt,  ((guiLayoutOffsetInt*11) + guiScrollableList5RowHeightInt))
                    .setSize                                        (guiElement2CollumnWidth, guiScrollableList5RowHeightInt)
                    .setText                                        (tempSelectedPlayerSentenceString);

        

        editPlayerGroupPlayerExplanationTextlabelObject             =
        cp5Object   .addTextlabel                                   ("EditPlayerExplanationTextlabelObject")
                    .setColor                                       (defaultCColor)
                    .setColorValue                                  (255)
                    .setGroup                                       (editPlayerGroupObject)
                    .setPosition                                    (guiElement2CollumnSecondCollumnXInt,  ((guiLayoutOffsetInt*10) + guiScrollableList5RowHeightInt))
                    .setText                                        ("PLAYER EXPLANATIONS:");



        editPlayerGroupPlayerExaplanationValueTextareaObject        =
        cp5Object   .addTextarea                                    ("EditPlayerExaplanationValueTextareaObject")
                    .setColor                                       (defaultCColor)
                    .setGroup                                       (editPlayerGroupObject)
                    .setPosition                                    (guiElement2CollumnSecondCollumnXInt,  ((guiLayoutOffsetInt*11) + guiScrollableList5RowHeightInt))
                    .setSize                                        (guiElement2CollumnWidth , guiScrollableList5RowHeightInt)
                    .setText                                        (tempSelectedPlayerSentenceString);



        editPlayerGroupPlayerTagScrollableListObject                =
        cp5Object   .addScrollableList                              ("EditPlayerTagScrollableListObject")
                    .addItems                                       (tempSelectedPlayerTagNameFullStringList)
                    .setColor                                       (staticScrollableListCColor)
                    .setGroup                                       (editPlayerGroupObject)
                    .setLabel                                       ("PLAYER COLLECTED TAGS:")
                    .setPosition                                    (guiElement2CollumnFirstCollumnXInt,  ((guiLayoutOffsetInt*12) + (guiScrollableList5RowHeightInt*2)))
                    .setSize                                        (guiElement1CollumnWidth , guiScrollableList5RowHeightInt)
                    .setType                                        (ControlP5.LIST);



        editPlayerGroupPlayerModeTextlabelObject                    =
        cp5Object   .addTextlabel                                   ("EditPlayerModeTextlabelObject")
                    .setColor                                       (defaultCColor)
                    .setColorValue                                  (255)
                    .setGroup                                       (editPlayerGroupObject)
                    .setPosition                                    (guiElement2CollumnFirstCollumnXInt, ((guiLayoutOffsetInt*13) + (guiScrollableList5RowHeightInt*3)))
                    .setText                                        ("MODES:");



        editPlayerGroupPlayerModeValueRadioButtonObject             =
        cp5Object   .addRadioButton                                 ("EditPlayerModeValueRadioButtonObject")
                    .activate                                       (1)
                    .addItem                                        ("SOFTWARE - AUTO"  , 1)
                    .addItem                                        ("SOFTWARE - MANUAL", 2)
                    .addItem                                        ("HARDWARE - MANUAL", 3)
                    .setGroup                                       (editPlayerGroupObject)
                    .setPosition                                    (guiElement2CollumnFirstCollumnXInt, ((guiLayoutOffsetInt*14) + (guiScrollableList5RowHeightInt*3)))
                    .setSize                                        (guiLayoutOffsetInt, guiLayoutOffsetInt);



        editPlayerGroupPlayerExhibitionNextScrollableListObject     =
        cp5Object   .addScrollableList                              ("EditPlayerExhibitionNextScrollableListObject")
                    .addItems                                       (tempPleaseSelectNextExhibitionSList)
                    .setColor                                       (defaultCColor)
                    .setGroup                                       (editPlayerGroupObject)
                    .setLabel                                       ("SELECT NEXT EXHIBITION:")
                    .setPosition                                    (guiElement2CollumnSecondCollumnXInt, ((guiLayoutOffsetInt*14) + (guiScrollableList5RowHeightInt*3)))
                    .setSize                                        (guiElement2CollumnWidth , 64)
                    .setType                                        (ControlP5.LIST);



        editPlayerGroupPlayerResetButtonObject                      =
        cp5Object   .addButton                                      ("EditPlayerResetButtonObject")
                    .setColor                                       (defaultCColor)
                    .setGroup                                       (editPlayerGroupObject)
                    .setLabel                                       ("RESET PLAYER")
                    .setPosition                                    (guiElement2CollumnFirstCollumnXInt, ((guiLayoutOffsetInt*15) + (guiScrollableList5RowHeightInt*4)))
                    .setSize                                        (guiElement2CollumnWidth, guiLayoutOffsetInt);



        editPlayerGroupPlayerGeneratePatternButtonObject            =
        cp5Object   .addButton                                      ("EditPlayerGeneratePatternButtonObject")
                    .setColor                                       (defaultCColor)
                    .setGroup                                       (editPlayerGroupObject)
                    .setLabel                                       ("GENERATE PATTERN")
                    .setPosition                                    (guiElement2CollumnSecondCollumnXInt, ((guiLayoutOffsetInt*15) + (guiScrollableList5RowHeightInt*4)))
                    .setSize                                        (guiElement2CollumnWidth, guiLayoutOffsetInt);



    }

    void DrawVoid                                       (float _alphaFloat) {

        /*Parent*/
        alphaFloat                  = _alphaFloat;

        if                          (alphaFloat >  (255f/45f)){ cp5Object.get(editPlayerGroupObject.show(); }
        else if                     (alphaFloat <= (255f/45f)){ cp5Object.get(editPlayerGroupObject.hide(); }

        groupBackgroundColor        = color(50 , 60 , 57 , alphaFloat + (255f/45f)) ;
        groupColorBackgroundColor   = color(2  , 45 , 89 , alphaFloat + (255f/45f)) ;
        groupColorLabelColor        = color(255, 255, 255, alphaFloat + (255f/45f)) ;

        defaultCColor               .setActive          (color(0  , 170, 255, alphaFloat))                      /*The color of controller when an element  is clicked by mouse pointer.*/
                                    .setBackground      (color(0  , 45 , 90 , alphaFloat))                      /*The color of controller         elements background.                 */
                                    .setCaptionLabel    (color(255, 255, 255, alphaFloat))                      /*The color of controller         elements text.                       */
                                    .setForeground      (color(0  , 116, 217, alphaFloat))                      /*The color of controller when an element  is hovered by mouse pointer */
                                    .setValueLabel      (color(255, 255, 255, alphaFloat));                     /*The color of controller         elements text.                       */
        staticScrollableListCColor  .setActive          (color(0  , 45 , 90 , alphaFloat))                      /*The color of controller when an element  is clicked by mouse pointer.*/
                                    .setBackground      (color(0  , 45 , 90 , alphaFloat))                      /*The color of controller         elements background.                 */
                                    .setCaptionLabel    (color(255, 255, 255, alphaFloat))                      /*The color of controller         elements text.                       */
                                    .setForeground      (color(0  , 45 , 90 , alphaFloat))                      /*The color of controller when an element  is hovered by mouse pointer */
                                    .setValueLabel      (color(255, 255, 255, alphaFloat));                     /*The color of controller         elements text.                       */

        editPlayerGroupObject       .setBackgroundColor (groupBackgroundColor           );
        editPlayerGroupObject       .setColor           (defaultCColor                  );
        editPlayerGroupObject       .setColorBackground (groupColorBackgroundColor      );
        editPlayerGroupObject       .setColorLabel      (groupColorLabelColor           );


        /*Object specific.
        Specify the position of another controller below this group controller.*/
        if      (editPlayerGroupPlayerExhibitionNextScrollableListObject.isOpen() == true ){

                cp5Object.get(ScrollableList.class, "VisitorSList").setPosition(
                    (guiLayoutOffsetInt                                                         + (buttonSizeInt/2)),
                    editPlayerGroupPlayerExhibitionNextScrollableListObject.getPosition()[1]    + guiHeightInt     )
                );

        }
        else if (editPlayerGroupPlayerExhibitionNextScrollableListObject.isOpen() == false){

                cp5Object.get(ScrollableList.class, "VisitorSList").setPosition(
                    (guiLayoutOffsetInt                                                         + (buttonSizeInt/2)),
                    editPlayerGroupPlayerExhibitionNextScrollableListObject.getPosition()[1]                       )
                );

        }

        /*If button to open this group is in closed state then assign this group controller player selected object back to
            the default player (the first index in the player object lisy).*/
        if(buttonOpenCloseMuseumObject.isButtonOpenBoolean  == false){ selectedPlayerObject = playerObjectList.get(0); }

        /*Always assign values to display in this object controllers.*/
        if(selectedPlayerObject                             != null ){

            tempSelectedPlayerFinishedString                            = (selectedPlayerObject .playerFinishedBoolean == true) ? "True" : "False";     /*Convert boolean value into String type data with sentence case.      */

            editPlayerGroupPlayerIndexValueTextlabelObject              .setText (("" + selectedPlayerObject.playerIndexInt                         ));
            editPlayerGroupPlayerFinishedValueTextlabelObject           .setText ((     tempSelectedPlayerFinishedString                            ));
            editPlayerGroupPlayerScoreValueTextlabelObject              .setText (("" + selectedPlayerObject.playerScoreInt                         ));
            editPlayerGroupPlayerExhibitionCurrentValueTextlabelObject  .setText ((     selectedPlayerObject.exhibitionCurrentNameFullString        ));
            editPlayerGroupPlayerExhibitionTargetScrollableListObject   .setItems((     selectedPlayerObject.exhibitionTargetNameFullStringList     ));
            editPlayerGroupPlayerExhibitionVisitedScrollableListObject  .setItems((     selectedPlayerObject.exhibitionVisitedNameFullStringList    ));
            editPlayerGroupPlayerTagScrollableListObject                .setItems((     selectedPlayerObject.tagNameFullStringList                  ));
            editPlayerGroupPlayerSentenceValueTextareaObject            .setText ((     tempSentenceTextareaString                                  ));
            editPlayerGroupPlayerExaplanationValueTextareaObject        .setText ((     tempSentenceTextareaString                                  ));
            editPlayerGroupPlayerExhibitionNextScrollableListObject     .setItems((     exhibitionNameFullString                                    ));

        }

        /*Hide the unecessary controller, for example when movement player mode int is not 2 (software, manual control) then
            we do not need to show scrollable list that show next exhibition to be choose.*/
        if      (movementPlayerModeInt == 1){ editPlayerGroupPlayerExhibitionNextScrollableListObject.hide(); }
        else if (movementPlayerModeInt == 2){ editPlayerGroupPlayerExhibitionNextScrollableListObject.show(); }
        else if (movementPlayerModeInt == 3){ editPlayerGroupPlayerExhibitionNextScrollableListObject.hide(); }
        else                                { editPlayerGroupPlayerExhibitionNextScrollableListObject.hide(); }

    }
    
    /*Controller's function to control radio button and assign which movement mode to selected player object.*/
    void EditPlayerModeValueRadioButtonObject           (int _intIndex)     {

                             movementPlayerModeInt  = _intIndex; /*Assign a value (1, 2, 3) to this class.              */
        selectedPlayerObject.movementPlayerModeInt  = _intIndex; /*Assign a value (1, 2, 3) to selected player object.  */

    }

    /*Controller's function to move selected player exhibition according to scrollable list that contains all exhibition full name.*/
    void EditPlayerExhibitionNextScrollableListObject   (int _indexInt)     {

        /*If selected player object movement mode is two then user can move the player manually.*/
        if(selectedPlayerObject.movementPlayerModeInt == 2){

            /*Get the full name String of the selected exhibition and then find the object in the all museum object list.*/
            String                  receivedMuseumNameFullString    = editPlayerExhibitionNextScrollableListObject.getItem(_indexInt).get("text").toString();
            ObjectMuseum            receivedMuseumObject            = FindMuseumObject(receivedString);
            
            /*Move the selected player object into the new exhibition that the user choose.*/
            selectedPlayerObject    .ExhibitionMoveObject(receivedMuseumObject.nameAltString);

        }

    }

}