import java.util.*;
import controlP5.*;

class EditPlayerGroupGUIObject extends GroupGUIObject{

    ControlP5       editPlayerGroupControlP5Object                              ;                           /*ControlP5 object to control all graphical user interface controller.                              */

    ScrollableList  selectPlayerScrollableListObject                            ;

    ObjectPlayer    selectedPlayerObject                                        ;                           /*Selected player object.*/

    int             tempSelectedPlayerMovementModeInt                           = 2;                        /*Movement mode of selected player object.                                                          */
    String          tempSelectedPlayerSentenceString                            = "";                       /*Temporary variable that contains selected player object sentence                           String.*/
    String          tempSelectedPlayerFinishedString                            = "";                       /*Temporary variable that contains selected player object finished                           String.*/
    List<String>    tempSelectedPlayerExhibitionTargetNameFullStringList        = new ArrayList<String>();  /*Temporary variable that contains selected player object target   exhibition list full name String.*/
    List<String>    tempSelectedPlayerExhibitionVisitedNameFullStringList       = new ArrayList<String>();  /*Temporary variable that contains selected player object visited  exhibition list full name String.*/
    List<String>    tempSelectedPlayerTagNameFullStringList                     = new ArrayList<String>();  /*Temporary variable that contains selected player object tag                 list full name String.*/

    /*ControlP5 related graphical user interface controller variables.*/
    Group           editPlayerGroupObject                                       ;
    Textlabel       editPlayerGroupPlayerIndexTextlabelObject                   ;
    Textlabel       editPlayerGroupPlayerIndexValueTextlabelObject              ;
    Textfield       editPlayerGroupPlayerNameTextfieldObject                    ;
    Button          editPlayerGroupPlayerNameChangeButtonObject                 ;
    Textlabel       editPlayerGroupPlayerFinishedTextlabelObject                ;
    Textlabel       editPlayerGroupPlayerFinishedValueTextlabelObject           ;
    Textlabel       editPlayerGroupPlayerScoreTextlabelObject                   ;
    Textlabel       editPlayerGroupPlayerScoreValueTextlabelObject              ;
    Textlabel       editPlayerGroupPlayerExhibitionCurrentTextlabelObject       ;
    Textlabel       editPlayerGroupPlayerExhibitionCurrentValueTextlabelObject  ;
    ScrollableList  editPlayerGroupPlayerExhibitionTargetScrollableListObject   ;
    ScrollableList  editPlayerGroupPlayerExhibitionVisitedScrollableListObject  ;
    Textlabel       editPlayerGroupPlayerSentenceTextlabelObject                ;
    Textarea        editPlayerGroupPlayerSentenceValueTextareaObject            ;
    Textlabel       editPlayerGroupPlayerExplanationTextlabelObject             ;
    Textarea        editPlayerGroupPlayerExaplanationValueTextareaObject        ;
    ScrollableList  editPlayerGroupPlayerTagScrollableListObject                ;
    Textlabel       editPlayerGroupPlayerModeTextlabelObject                    ;
    RadioButton     editPlayerGroupPlayerModeValueRadioButtonObject             ;
    ScrollableList  editPlayerGroupPlayerExhibitionNextScrollableListObject     ;
    Button          editPlayerGroupPlayerResetButtonObject                      ;
    Button          editPlayerGroupPlayerGeneratePatternButtonObject            ;

    EditPlayerGroupGUIObject                                        (

        int             _guiXInt                            ,
        int             _guiYInt                            ,
        int             _guiWidthInt                        ,
        int             _guiHeightInt                       ,
        ScrollableList  _selectPlayerScrollableListObject   ,
        PApplet         _pAppletObject

    ){

        super                                                       (_guiXInt, _guiYInt, _guiWidthInt, _guiHeightInt, _pAppletObject);
        editPlayerGroupControlP5Object                              = new ControlP5(pAppletObject);

        selectPlayerScrollableListObject                            = _selectPlayerScrollableListObject;                                                            /*PENDING.*/

        selectedPlayerObject                                        =  playerObjectList     .get(0);                                                                /*Set the default player object.                                            */
        tempSelectedPlayerFinishedString                            = (selectedPlayerObject .playerFinishedBoolean == true) ? "True" : "False";                     /*Convert boolean value into String type data with sentence case.           */
        for(int i = 0; i < selectedPlayerObject.sentenceStringList.size(); i ++){                                                                                   /*Put all selected player sentences into one paragraph of a String variable.*/

            if(i == 0)  { tempSelectedPlayerSentenceString          =                                           selectedPlayerObject.sentenceStringList.get(i); }
            else        { tempSelectedPlayerSentenceString          = tempSelectedPlayerSentenceString + "\n" + selectedPlayerObject.sentenceStringList.get(i); }

        }



        editPlayerGroupObject                                       =
            editPlayerGroupControlP5Object
                .addGroup                                           ("EditPlayerGroupObject")
                .close                                              ()
                .setBackgroundColor                                 (groupBackgroundColor)
                .setBackgroundHeight                                (guiHeightInt)
                .setColor                                           (defaultCColor)
                .setColorBackground                                 (groupColorBackgroundColor)
                .setColorLabel                                      (groupColorLabelColor)
                .setLabel                                           ("EDIT VISITOR:")
                .setPosition                                        (guiXInt, guiYInt)
                .setWidth                                           (guiWidthInt);



        editPlayerGroupPlayerIndexTextlabelObject                   =
            editPlayerGroupControlP5Object
                .addTextlabel                                       ("EditPlayerGroupPlayerIndexTextlabelObject")
                .setColor                                           (defaultCColor)
                .setColorValue                                      (255)
                .setGroup                                           (editPlayerGroupObject)
                .setPosition                                        (guiElement2CollumnFirstCollumnXInt, guiLayoutOffsetInt)
                .setText                                            ("VISITOR INDEX:");



        editPlayerGroupPlayerIndexValueTextlabelObject              =   
            editPlayerGroupControlP5Object
                .addTextlabel                                       ("EditPlayerGroupPlayerIndexValueTextlabelObject")
                .setColor                                           (defaultCColor)
                .setColorValue                                      (255)
                .setGroup                                           (editPlayerGroupObject)
                .setPosition                                        (guiElement2CollumnSecondCollumnXInt, guiLayoutOffsetInt)
                .setText                                            ("" + selectedPlayerObject.playerIndexInt);



        editPlayerGroupPlayerNameTextfieldObject                    =
            editPlayerGroupControlP5Object
                .addTextfield                                       ("EditPlayerGroupPlayerNameTextfieldObject")
                .setColor                                           (defaultCColor)
                .setGroup                                           (editPlayerGroupObject)
                .setLabel                                           ("VISITOR NAME:")
                .setPosition                                        (guiElement2CollumnFirstCollumnXInt, (guiLayoutOffsetInt*3))
                .setSize                                            (guiElement2CollumnWidth,  guiElement2LineHeight);



        editPlayerGroupPlayerNameChangeButtonObject                 =
            editPlayerGroupControlP5Object
                .addButton                                          ("EditPlayerGroupPlayerNameChangeButtonObject")
                .setColor                                           (defaultCColor)
                .setGroup                                           (editPlayerGroupObject)
                .setLabel                                           ("CHANGE VISITOR NAME")
                .setPosition                                        (guiElement2CollumnSecondCollumnXInt, (guiLayoutOffsetInt*3))
                .setSize                                            (guiElement2CollumnWidth,  guiElement2LineHeight);



        editPlayerGroupPlayerFinishedTextlabelObject                =   
            editPlayerGroupControlP5Object
                .addTextlabel                                       ("EditPlayerGroupPlayerFinishedTextlabelObject")
                .setColor                                           (defaultCColor)
                .setColorValue                                      (255)
                .setGroup                                           (editPlayerGroupObject)
                .setPosition                                        (guiElement2CollumnFirstCollumnXInt, (guiLayoutOffsetInt*7))
                .setText                                            ("VISITOR FINISHED:");



        editPlayerGroupPlayerFinishedValueTextlabelObject           =
                editPlayerGroupControlP5Object
                    .addTextlabel                                   ("EditPlayerGroupPlayerFinishedValueTextlabelObject")
                    .setColor                                       (defaultCColor)
                    .setColorValue                                  (255)
                    .setGroup                                       (editPlayerGroupObject)
                    .setPosition                                    (guiElement2CollumnSecondCollumnXInt, (guiLayoutOffsetInt*7))
                    .setText                                        (tempSelectedPlayerFinishedString);



        editPlayerGroupPlayerScoreTextlabelObject                   =
            editPlayerGroupControlP5Object
                .addTextlabel                                       ("EditPlayerGroupPlayerScoreTextlabelObject")
                .setColor                                           (defaultCColor)
                .setColorValue                                      (255)
                .setGroup                                           (editPlayerGroupObject)
                .setPosition                                        (guiElement2CollumnFirstCollumnXInt, (guiLayoutOffsetInt*8))
                .setText                                            ("VISITOR SCORE:");



        editPlayerGroupPlayerScoreValueTextlabelObject              =
            editPlayerGroupControlP5Object
                .addTextlabel                                       ("EditPlayerGroupPlayerScoreValueTextlabelObject")
                .setColor                                           (defaultCColor)
                .setColorValue                                      (255)
                .setGroup                                           (editPlayerGroupObject)
                .setPosition                                        (guiElement2CollumnSecondCollumnXInt, (guiLayoutOffsetInt*8))
                .setText                                            ("" + selectedPlayerObject.playerScoreInt);



        editPlayerGroupPlayerExhibitionCurrentTextlabelObject       =
            editPlayerGroupControlP5Object
                .addTextlabel                                       ("EditPlayerGroupPlayerExhibitionCurrentTextlabelObject")
                .setColor                                           (defaultCColor)
                .setColorValue                                      (255)
                .setGroup                                           (editPlayerGroupObject)
                .setPosition                                        (guiElement2CollumnFirstCollumnXInt, (guiLayoutOffsetInt*9))
                .setText                                            ("VISITOR CURRENT EXHIBITION:");



        editPlayerGroupPlayerExhibitionCurrentValueTextlabelObject  =
            editPlayerGroupControlP5Object
                .addTextlabel                                       ("EditPlayerGroupPlayerExhibitionCurrentValueTextlabelObject")
                .setColor                                           (defaultCColor)
                .setColorValue                                      (255)
                .setGroup                                           (editPlayerGroupObject)
                .setPosition                                        (guiElement2CollumnSecondCollumnXInt, (guiLayoutOffsetInt*9))
                .setText                                            ("" + selectedPlayerObject.exhibitionCurrentNameFullString);



        editPlayerGroupPlayerExhibitionTargetScrollableListObject   =
            editPlayerGroupControlP5Object
                .addScrollableList                                  ("EditPlayerGroupPlayerExhibitionTargetScrollableListObject")
                .addItems                                           (selectedPlayerObject.exhibitionTagCounterNameFullStringList)
                .setColor                                           (staticScrollableListCColor)
                .setGroup                                           (editPlayerGroupObject)
                .setLabel                                           ("VISITOR TARGET EXHIBITIONS:")
                .setPosition                                        (guiElement2CollumnFirstCollumnXInt,  (guiLayoutOffsetInt*11))
                .setSize                                            (guiElement2CollumnWidth, guiScrollableList4RowHeightInt)
                .setType                                            (ControlP5.LIST);



        editPlayerGroupPlayerExhibitionVisitedScrollableListObject  =
            editPlayerGroupControlP5Object
                .addScrollableList                                  ("EditPlayerGroupPlayerExhibitionVisitedScrollableListObject")
                .addItems                                           (tempSelectedPlayerExhibitionVisitedNameFullStringList)
                .setColor                                           (staticScrollableListCColor)
                .setGroup                                           (editPlayerGroupObject)
                .setLabel                                           ("VISITOR VISITED EXHIBITIONS:")
                .setPosition                                        (guiElement2CollumnSecondCollumnXInt,  (guiLayoutOffsetInt*11))
                .setSize                                            (guiElement2CollumnWidth, guiScrollableList5RowHeightInt)
                .setType                                            (ControlP5.LIST);



        editPlayerGroupPlayerSentenceTextlabelObject                =
            editPlayerGroupControlP5Object
                .addTextlabel                                       ("EditPlayerGroupPlayerSentenceTextlabelObject")
                .setColor                                           (defaultCColor)
                .setColorValue                                      (255)
                .setGroup                                           (editPlayerGroupObject)
                .setPosition                                        (guiElement2CollumnFirstCollumnXInt,  ((guiLayoutOffsetInt*12) + guiScrollableList5RowHeightInt))
                .setText                                            ("VISITOR SENTENCES:");



        editPlayerGroupPlayerSentenceValueTextareaObject            =
            editPlayerGroupControlP5Object
                .addTextarea                                        ("editPlayerGroupPlayerSentenceValueTextareaObject")
                .setColor                                           (defaultCColor)
                .setGroup                                           (editPlayerGroupObject)
                .setPosition                                        (guiElement2CollumnFirstCollumnXInt,  ((guiLayoutOffsetInt*13) + guiScrollableList5RowHeightInt))
                .setSize                                            (guiElement2CollumnWidth, guiScrollableList5RowHeightInt)
                .setText                                            (tempSelectedPlayerSentenceString);

        

        editPlayerGroupPlayerExplanationTextlabelObject             =
            editPlayerGroupControlP5Object
                .addTextlabel                                       ("EditPlayerGroupPlayerExplanationTextlabelObject")
                .setColor                                           (defaultCColor)
                .setColorValue                                      (255)
                .setGroup                                           (editPlayerGroupObject)
                .setPosition                                        (guiElement2CollumnSecondCollumnXInt,  ((guiLayoutOffsetInt*12) + guiScrollableList5RowHeightInt))
                .setText                                            ("VISITOR EXPLANATIONS:");



        editPlayerGroupPlayerExaplanationValueTextareaObject        =
            editPlayerGroupControlP5Object
                .addTextarea                                        ("EditPlayerGroupPlayerExaplanationValueTextareaObject")
                .setColor                                           (defaultCColor)
                .setGroup                                           (editPlayerGroupObject)
                .setPosition                                        (guiElement2CollumnSecondCollumnXInt,  ((guiLayoutOffsetInt*13) + guiScrollableList5RowHeightInt))
                .setSize                                            (guiElement2CollumnWidth , guiScrollableList5RowHeightInt)
                .setText                                            (tempSelectedPlayerSentenceString);



        editPlayerGroupPlayerTagScrollableListObject                =
            editPlayerGroupControlP5Object
                .addScrollableList                                  ("EditPlayerGroupPlayerTagScrollableListObject")
                .addItems                                           (tempSelectedPlayerTagNameFullStringList)
                .setColor                                           (staticScrollableListCColor)
                .setGroup                                           (editPlayerGroupObject)
                .setLabel                                           ("VISITOR COLLECTED TAGS:")
                .setPosition                                        (guiElement2CollumnFirstCollumnXInt,  ((guiLayoutOffsetInt*14) + (guiScrollableList5RowHeightInt*2)))
                .setSize                                            (guiElement1CollumnWidth , guiScrollableList5RowHeightInt)
                .setType                                            (ControlP5.LIST);



        editPlayerGroupPlayerModeTextlabelObject                    =
            editPlayerGroupControlP5Object
                .addTextlabel                                       ("EditPlayerGroupPlayerModeTextlabelObject")
                .setColor                                           (defaultCColor)
                .setColorValue                                      (255)
                .setGroup                                           (editPlayerGroupObject)
                .setPosition                                        (guiElement2CollumnFirstCollumnXInt, ((guiLayoutOffsetInt*15) + (guiScrollableList5RowHeightInt*3)))
                .setText                                            ("MODES:");



        editPlayerGroupPlayerModeValueRadioButtonObject             =
            editPlayerGroupControlP5Object
                .addRadioButton                                     ("EditPlayerGroupPlayerModeValueRadioButtonObject")
                .activate                                           (1)
                .addItem                                            ("SOFTWARE - AUTO"  , 1)
                .addItem                                            ("SOFTWARE - MANUAL", 2)
                .addItem                                            ("HARDWARE - MANUAL", 3)
                .setGroup                                           (editPlayerGroupObject)
                .setPosition                                        (guiElement2CollumnFirstCollumnXInt, ((guiLayoutOffsetInt*16) + (guiScrollableList5RowHeightInt*3)))
                .setSize                                            (guiLayoutOffsetInt, guiLayoutOffsetInt);



        editPlayerGroupPlayerExhibitionNextScrollableListObject     =
            editPlayerGroupControlP5Object
                .addScrollableList                                  ("EditPlayerGroupPlayerExhibitionNextScrollableListObject")
                .addItems                                           (exhibitionNameFullStringList)
                .setColor                                           (defaultCColor)
                .setGroup                                           (editPlayerGroupObject)
                .setLabel                                           ("SELECT VISITOR NEXT EXHIBITION:")
                .setPosition                                        (guiElement2CollumnSecondCollumnXInt, ((guiLayoutOffsetInt*15) + (guiScrollableList5RowHeightInt*3)))
                .setSize                                            (guiElement2CollumnWidth , 64)
                .setType                                            (ControlP5.LIST);



        editPlayerGroupPlayerResetButtonObject                      =
            editPlayerGroupControlP5Object
                .addButton                                          ("EditPlayerGroupPlayerResetButtonObject")
                .setColor                                           (defaultCColor)
                .setGroup                                           (editPlayerGroupObject)
                .setLabel                                           ("RESET VISITOR")
                .setPosition                                        (guiElement2CollumnFirstCollumnXInt, ((guiLayoutOffsetInt*16) + (guiScrollableList5RowHeightInt*4)))
                .setSize                                            (guiElement2CollumnWidth, guiLayoutOffsetInt);



        editPlayerGroupPlayerGeneratePatternButtonObject            =
            editPlayerGroupControlP5Object
                .addButton                                          ("EditPlayerGroupPlayerGeneratePatternButtonObject")
                .setColor                                           (defaultCColor)
                .setGroup                                           (editPlayerGroupObject)
                .setLabel                                           ("GENERATE PATTERN")
                .setPosition                                        (guiElement2CollumnSecondCollumnXInt, ((guiLayoutOffsetInt*16) + (guiScrollableList5RowHeightInt*4)))
                .setSize                                            (guiElement2CollumnWidth, guiLayoutOffsetInt);



    }

    void DrawVoid                                                   (float   _alphaFloat){

        super.DrawVoid(_alphaFloat, editPlayerGroupObject);

        /*Specify the position of another controller below this group controller.*/
        if      (editPlayerGroupObject.isOpen() == true ){

                selectPlayerScrollableListObject.setPosition(
                    editPlayerGroupObject.getPosition()[0],
                    editPlayerGroupObject.getPosition()[1] + guiHeightInt
                );

        }
        else if (editPlayerGroupObject.isOpen() == false){

                selectPlayerScrollableListObject.setPosition(
                    editPlayerGroupObject.getPosition()[0],
                    editPlayerGroupObject.getPosition()[1]
                );

        }

        /*Always assign values to the controllers.*/
        if(selectedPlayerObject                             != null ){

            tempSelectedPlayerFinishedString                = (selectedPlayerObject .playerFinishedBoolean == true) ? "True" : "False";     /*Convert boolean value into String type data with sentence case.           */
            for(int i = 0; i < selectedPlayerObject.sentenceStringList.size(); i ++){                                                       /*Put all selected player sentences into one paragraph of a String variable.*/

                if(i == 0)  { tempSelectedPlayerSentenceString =                                           selectedPlayerObject.sentenceStringList.get(i); }
                else        { tempSelectedPlayerSentenceString = tempSelectedPlayerSentenceString + "\n" + selectedPlayerObject.sentenceStringList.get(i); }

            }

            editPlayerGroupPlayerIndexValueTextlabelObject              .setText (("" + selectedPlayerObject.playerIndexInt                         ));
            editPlayerGroupPlayerFinishedValueTextlabelObject           .setText ((     tempSelectedPlayerFinishedString                            ));
            editPlayerGroupPlayerScoreValueTextlabelObject              .setText (("" + selectedPlayerObject.playerScoreInt                         ));
            editPlayerGroupPlayerExhibitionCurrentValueTextlabelObject  .setText ((     selectedPlayerObject.exhibitionCurrentNameFullString        ));
            editPlayerGroupPlayerExhibitionTargetScrollableListObject   .setItems((     selectedPlayerObject.exhibitionTargetNameFullStringList     ));
            editPlayerGroupPlayerExhibitionVisitedScrollableListObject  .setItems((     selectedPlayerObject.exhibitionVisitedNameFullStringList    ));
            editPlayerGroupPlayerTagScrollableListObject                .setItems((     selectedPlayerObject.exhibitionTagCounterNameFullStringList ));
            editPlayerGroupPlayerSentenceValueTextareaObject            .setText ((     tempSelectedPlayerSentenceString                            ));
            editPlayerGroupPlayerExaplanationValueTextareaObject        .setText ((     tempSelectedPlayerSentenceString                            ));
            editPlayerGroupPlayerExhibitionNextScrollableListObject     .setItems((     exhibitionNameFullStringList                                ));
            editPlayerGroupPlayerModeValueRadioButtonObject             .activate((     (selectedPlayerObject.playerMovementModeInt - 1)            ));

        }

        /*Hide the unecessary controller, for example when movement player mode int is not 2 (software, manual control) then
            we do not need to show scrollable list that show next exhibition to be choose.*/
        if      (tempSelectedPlayerMovementModeInt == 1){ editPlayerGroupPlayerExhibitionNextScrollableListObject.hide(); }
        else if (tempSelectedPlayerMovementModeInt == 2){ editPlayerGroupPlayerExhibitionNextScrollableListObject.show(); }
        else if (tempSelectedPlayerMovementModeInt == 3){ editPlayerGroupPlayerExhibitionNextScrollableListObject.hide(); }
        else                                            { editPlayerGroupPlayerExhibitionNextScrollableListObject.hide(); }

    }

}