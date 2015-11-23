import java.util.*;
import controlP5.*;

class EditPlayerGroupGUIObject extends GroupGUIObject{

    ControlP5       editPlayerGroupControlP5Object                              ;                           /*ControlP5 object to control all graphical user interface controller.                              */

    ObjectPlayer    tempSelectedPlayerObject                                    ;                           /*Selected player object.*/
    int             tempSelectedPlayerMovementModeInt                           = 2;                        /*Movement mode of selected player object.                                                          */
    String          tempSelectedPlayerExplanationString                         = "";
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
    Textarea        editPlayerGroupPlayerExplanationValueTextareaObject         ;
    ScrollableList  editPlayerGroupPlayerTagScrollableListObject                ;
    Textlabel       editPlayerGroupPlayerModeTextlabelObject                    ;
    RadioButton     editPlayerGroupPlayerModeValueRadioButtonObject             ;
    ScrollableList  editPlayerGroupPlayerExhibitionNextScrollableListObject     ;
    Button          editPlayerGroupSetAllModeSoftwareAutoButtonObject           ;
    Button          editPlayerGroupSetAllModeSoftwareManualButtonObject         ;
    Button          editPlayerGroupPlayerResetAllButtonObject                   ;
    Button          editPlayerGroupPlayerResetButtonObject                      ;
    Button          editPlayerGroupPlayerGeneratePatternButtonObject            ;

    EditPlayerGroupGUIObject                                        (

        int             _guiXInt                            ,
        int             _guiYInt                            ,
        int             _guiWidthInt                        ,
        int             _guiHeightInt                       ,
        PApplet         _pAppletObject

    ){

        super                                                   (_guiXInt, _guiYInt, _guiWidthInt, _guiHeightInt, _pAppletObject);
        editPlayerGroupControlP5Object                          = new ControlP5(pAppletObject);                                                                         /*PENDING.*/

        tempSelectedPlayerObject                                =  playerObjectList.get(0);                                                                        /*Set the default player object.                                            */
        tempSelectedPlayerFinishedString                        = (tempSelectedPlayerObject.playerFinishedBoolean == true) ? "True" : "False";                         /*Convert boolean value into String type data with sentence case.           */
        for(int i = 0; i < tempSelectedPlayerObject.explanationStringList.size(); i ++){                                                                                /*Put all selected player sentences into one paragraph of a String variable.*/

            if(i == 0)  { tempSelectedPlayerExplanationString   =                                                tempSelectedPlayerObject.explanationStringList.get(i); }
            else        { tempSelectedPlayerExplanationString   = tempSelectedPlayerExplanationString + "\n\n" + tempSelectedPlayerObject.explanationStringList.get(i); }

        }
        for(int i = 0; i < tempSelectedPlayerObject.sentenceStringList.size(); i ++){                                                                                   /*Put all selected player sentences into one paragraph of a String variable.*/

            if(i == 0)  { tempSelectedPlayerSentenceString      =                                             tempSelectedPlayerObject.sentenceStringList.get(i); }
            else        { tempSelectedPlayerSentenceString      = tempSelectedPlayerSentenceString + "\n\n" + tempSelectedPlayerObject.sentenceStringList.get(i); }

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
                .setPosition                                        (guiElement2ColumnFirstColumnXInt, guiLayoutOffsetInt)
                .setText                                            ("VISITOR INDEX:");



        editPlayerGroupPlayerIndexValueTextlabelObject              =   
            editPlayerGroupControlP5Object
                .addTextlabel                                       ("EditPlayerGroupPlayerIndexValueTextlabelObject")
                .setColor                                           (defaultCColor)
                .setColorValue                                      (255)
                .setGroup                                           (editPlayerGroupObject)
                .setPosition                                        (guiElement2ColumnSecondColumnXInt, guiLayoutOffsetInt)
                .setText                                            ("" + tempSelectedPlayerObject.playerIndexInt);



        editPlayerGroupPlayerNameTextfieldObject                    =
            editPlayerGroupControlP5Object
                .addTextfield                                       ("EditPlayerGroupPlayerNameTextfieldObject")
                .setColor                                           (defaultCColor)
                .setGroup                                           (editPlayerGroupObject)
                .setLabel                                           ("VISITOR NAME:")
                .setPosition                                        (guiElement2ColumnFirstColumnXInt, (guiLayoutOffsetInt*3))
                .setSize                                            (guiElement2ColumnWidth,  guiElement2LineHeight)
                .setText                                            (tempSelectedPlayerObject.playerNameString);



        editPlayerGroupPlayerNameChangeButtonObject                 =
            editPlayerGroupControlP5Object
                .addButton                                          ("EditPlayerGroupPlayerNameChangeButtonObject")
                .setColor                                           (defaultCColor)
                .setGroup                                           (editPlayerGroupObject)
                .setLabel                                           ("CHANGE VISITOR NAME")
                .setPosition                                        (guiElement2ColumnSecondColumnXInt, (guiLayoutOffsetInt*3))
                .setSize                                            (guiElement2ColumnWidth,  guiElement2LineHeight);



        editPlayerGroupPlayerFinishedTextlabelObject                =   
            editPlayerGroupControlP5Object
                .addTextlabel                                       ("EditPlayerGroupPlayerFinishedTextlabelObject")
                .setColor                                           (defaultCColor)
                .setColorValue                                      (255)
                .setGroup                                           (editPlayerGroupObject)
                .setPosition                                        (guiElement2ColumnFirstColumnXInt, (guiLayoutOffsetInt*7))
                .setText                                            ("VISITOR FINISHED:");



        editPlayerGroupPlayerFinishedValueTextlabelObject           =
                editPlayerGroupControlP5Object
                    .addTextlabel                                   ("EditPlayerGroupPlayerFinishedValueTextlabelObject")
                    .setColor                                       (defaultCColor)
                    .setColorValue                                  (255)
                    .setGroup                                       (editPlayerGroupObject)
                    .setPosition                                    (guiElement2ColumnSecondColumnXInt, (guiLayoutOffsetInt*7))
                    .setText                                        (tempSelectedPlayerFinishedString);



        editPlayerGroupPlayerScoreTextlabelObject                   =
            editPlayerGroupControlP5Object
                .addTextlabel                                       ("EditPlayerGroupPlayerScoreTextlabelObject")
                .setColor                                           (defaultCColor)
                .setColorValue                                      (255)
                .setGroup                                           (editPlayerGroupObject)
                .setPosition                                        (guiElement2ColumnFirstColumnXInt, (guiLayoutOffsetInt*8))
                .setText                                            ("VISITOR SCORE:");



        editPlayerGroupPlayerScoreValueTextlabelObject              =
            editPlayerGroupControlP5Object
                .addTextlabel                                       ("EditPlayerGroupPlayerScoreValueTextlabelObject")
                .setColor                                           (defaultCColor)
                .setColorValue                                      (255)
                .setGroup                                           (editPlayerGroupObject)
                .setPosition                                        (guiElement2ColumnSecondColumnXInt, (guiLayoutOffsetInt*8))
                .setText                                            ("" + tempSelectedPlayerObject.playerScoreInt);



        editPlayerGroupPlayerExhibitionCurrentTextlabelObject       =
            editPlayerGroupControlP5Object
                .addTextlabel                                       ("EditPlayerGroupPlayerExhibitionCurrentTextlabelObject")
                .setColor                                           (defaultCColor)
                .setColorValue                                      (255)
                .setGroup                                           (editPlayerGroupObject)
                .setPosition                                        (guiElement2ColumnFirstColumnXInt, (guiLayoutOffsetInt*9))
                .setText                                            ("VISITOR CURRENT EXHIBITION:");



        editPlayerGroupPlayerExhibitionCurrentValueTextlabelObject  =
            editPlayerGroupControlP5Object
                .addTextlabel                                       ("EditPlayerGroupPlayerExhibitionCurrentValueTextlabelObject")
                .setColor                                           (defaultCColor)
                .setColorValue                                      (255)
                .setGroup                                           (editPlayerGroupObject)
                .setPosition                                        (guiElement2ColumnSecondColumnXInt, (guiLayoutOffsetInt*9))
                .setText                                            ("" + tempSelectedPlayerObject.exhibitionCurrentNameFullString);



        editPlayerGroupPlayerExhibitionTargetScrollableListObject   =
            editPlayerGroupControlP5Object
                .addScrollableList                                  ("EditPlayerGroupPlayerExhibitionTargetScrollableListObject")
                .addItems                                           (tempSelectedPlayerObject.exhibitionTargetNameFullStringList)
                .setColor                                           (staticScrollableListCColor)
                .setGroup                                           (editPlayerGroupObject)
                .setLabel                                           ("VISITOR TARGET EXHIBITIONS:")
                .setPosition                                        (guiElement2ColumnFirstColumnXInt,  (guiLayoutOffsetInt*11))
                .setSize                                            (guiElement2ColumnWidth, guiScrollableList4RowHeightInt)
                .setType                                            (ControlP5.LIST);



        editPlayerGroupPlayerExhibitionVisitedScrollableListObject  =
            editPlayerGroupControlP5Object
                .addScrollableList                                  ("EditPlayerGroupPlayerExhibitionVisitedScrollableListObject")
                .addItems                                           (tempSelectedPlayerObject.exhibitionVisitedNameFullStringList)
                .setColor                                           (staticScrollableListCColor)
                .setGroup                                           (editPlayerGroupObject)
                .setLabel                                           ("VISITOR VISITED EXHIBITIONS:")
                .setPosition                                        (guiElement2ColumnSecondColumnXInt,  (guiLayoutOffsetInt*11))
                .setSize                                            (guiElement2ColumnWidth, guiScrollableList5RowHeightInt)
                .setType                                            (ControlP5.LIST);



        editPlayerGroupPlayerSentenceTextlabelObject                =
            editPlayerGroupControlP5Object
                .addTextlabel                                       ("EditPlayerGroupPlayerSentenceTextlabelObject")
                .setColor                                           (defaultCColor)
                .setColorValue                                      (255)
                .setGroup                                           (editPlayerGroupObject)
                .setPosition                                        (guiElement2ColumnFirstColumnXInt,  ((guiLayoutOffsetInt*12) + guiScrollableList5RowHeightInt))
                .setText                                            ("VISITOR SENTENCES:");



        editPlayerGroupPlayerSentenceValueTextareaObject            =
            editPlayerGroupControlP5Object
                .addTextarea                                        ("editPlayerGroupPlayerSentenceValueTextareaObject")
                .setColor                                           (defaultCColor)
                .setGroup                                           (editPlayerGroupObject)
                .setPosition                                        (guiElement2ColumnFirstColumnXInt,  ((guiLayoutOffsetInt*13) + guiScrollableList5RowHeightInt))
                .setSize                                            (guiElement2ColumnWidth, guiScrollableList5RowHeightInt)
                .setText                                            (tempSelectedPlayerSentenceString);

        

        editPlayerGroupPlayerExplanationTextlabelObject             =
            editPlayerGroupControlP5Object
                .addTextlabel                                       ("EditPlayerGroupPlayerExplanationTextlabelObject")
                .setColor                                           (defaultCColor)
                .setColorValue                                      (255)
                .setGroup                                           (editPlayerGroupObject)
                .setPosition                                        (guiElement2ColumnSecondColumnXInt,  ((guiLayoutOffsetInt*12) + guiScrollableList5RowHeightInt))
                .setText                                            ("VISITOR EXPLANATIONS:");



        editPlayerGroupPlayerExplanationValueTextareaObject         =
            editPlayerGroupControlP5Object
                .addTextarea                                        ("EditPlayerGroupPlayerExaplanationValueTextareaObject")
                .setColor                                           (defaultCColor)
                .setGroup                                           (editPlayerGroupObject)
                .setPosition                                        (guiElement2ColumnSecondColumnXInt,  ((guiLayoutOffsetInt*13) + guiScrollableList5RowHeightInt))
                .setSize                                            (guiElement2ColumnWidth , guiScrollableList5RowHeightInt)
                .setText                                            (tempSelectedPlayerExplanationString);



        editPlayerGroupPlayerTagScrollableListObject                =
            editPlayerGroupControlP5Object
                .addScrollableList                                  ("EditPlayerGroupPlayerTagScrollableListObject")
                .addItems                                           (tempSelectedPlayerObject.exhibitionTagCounterNameFullStringList)
                .setColor                                           (staticScrollableListCColor)
                .setGroup                                           (editPlayerGroupObject)
                .setLabel                                           ("VISITOR COLLECTED TAGS:")
                .setPosition                                        (guiElement2ColumnFirstColumnXInt,  ((guiLayoutOffsetInt*14) + (guiScrollableList5RowHeightInt*2)))
                .setSize                                            (guiElement1ColumnWidth , guiScrollableList5RowHeightInt)
                .setType                                            (ControlP5.LIST);



        editPlayerGroupPlayerModeTextlabelObject                    =
            editPlayerGroupControlP5Object
                .addTextlabel                                       ("EditPlayerGroupPlayerModeTextlabelObject")
                .setColor                                           (defaultCColor)
                .setColorValue                                      (255)
                .setGroup                                           (editPlayerGroupObject)
                .setPosition                                        (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*15) + (guiScrollableList5RowHeightInt*3)))
                .setText                                            ("MODES:");



        editPlayerGroupPlayerModeValueRadioButtonObject             =
            editPlayerGroupControlP5Object
                .addRadioButton                                     ("EditPlayerGroupPlayerModeValueRadioButtonObject")
                .activate                                           (1)
                .addItem                                            ("SOFTWARE - AUTO"  , 1)
                .addItem                                            ("SOFTWARE - MANUAL", 2)
                .addItem                                            ("HARDWARE - MANUAL", 3)
                .setGroup                                           (editPlayerGroupObject)
                .setNoneSelectedAllowed                             (true)
                .setPosition                                        (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*16) + (guiScrollableList5RowHeightInt*3)))
                .setSize                                            (guiLayoutOffsetInt, guiLayoutOffsetInt);



        editPlayerGroupPlayerExhibitionNextScrollableListObject     =
            editPlayerGroupControlP5Object
                .addScrollableList                                  ("EditPlayerGroupPlayerExhibitionNextScrollableListObject")
                .addItems                                           (exhibitionNameFullStringList)
                .setColor                                           (defaultCColor)
                .setGroup                                           (editPlayerGroupObject)
                .setLabel                                           ("SELECT VISITOR NEXT EXHIBITION:")
                .setPosition                                        (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*15) + (guiScrollableList5RowHeightInt*3)))
                .setSize                                            (guiElement2ColumnWidth , 64)
                .setType                                            (ControlP5.LIST);



        editPlayerGroupSetAllModeSoftwareAutoButtonObject           =
            editPlayerGroupControlP5Object
                .addButton                                          ("EditPlayerGroupSetAllModeSoftwareAutoButtonObject")
                .setColor                                           (defaultCColor)
                .setGroup                                           (editPlayerGroupObject)
                .setLabel                                           ("SET ALL VISITOR SOFTWARE AUTO")
                .setPosition                                        (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*16) + (guiScrollableList5RowHeightInt*4)))
                .setSize                                            (guiElement2ColumnWidth, guiLayoutOffsetInt);



        editPlayerGroupSetAllModeSoftwareManualButtonObject         =
            editPlayerGroupControlP5Object
                .addButton                                          ("EditPlayerGroupSetAllModeSoftwareManualButtonObject")
                .setColor                                           (defaultCColor)
                .setGroup                                           (editPlayerGroupObject)
                .setLabel                                           ("SET ALL VISITOR SOFTWARE MANUAL")
                .setPosition                                        (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*16) + (guiScrollableList5RowHeightInt*4)))
                .setSize                                            (guiElement2ColumnWidth, guiLayoutOffsetInt);



        editPlayerGroupPlayerResetAllButtonObject                   =
            editPlayerGroupControlP5Object
                .addButton                                          ("EditPlayerGroupPlayerResetAllButtonObject")
                .setColor                                           (defaultCColor)
                .setGroup                                           (editPlayerGroupObject)
                .setLabel                                           ("RESET ALL VISITOR")
                .setPosition                                        (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*17) + (guiScrollableList5RowHeightInt*4)))
                .setSize                                            (guiElement2ColumnWidth, guiLayoutOffsetInt);



        editPlayerGroupPlayerResetButtonObject                      =
            editPlayerGroupControlP5Object
                .addButton                                          ("EditPlayerGroupPlayerResetButtonObject")
                .setColor                                           (defaultCColor)
                .setGroup                                           (editPlayerGroupObject)
                .setLabel                                           ("RESET VISITOR")
                .setPosition                                        (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*17) + (guiScrollableList5RowHeightInt*4)))
                .setSize                                            (guiElement2ColumnWidth, guiLayoutOffsetInt);



        editPlayerGroupPlayerGeneratePatternButtonObject            =
            editPlayerGroupControlP5Object
                .addButton                                          ("EditPlayerGroupPlayerGeneratePatternButtonObject")
                .setColor                                           (defaultCColor)
                .setGroup                                           (editPlayerGroupObject)
                .setLabel                                           ("GENERATE PATTERN")
                .setPosition                                        (guiElement1ColumnFirstColumnXInt, ((guiLayoutOffsetInt*18) + (guiScrollableList5RowHeightInt*4)))
                .setSize                                            (guiElement1ColumnWidth, guiLayoutOffsetInt);



    }

    void DrawVoid                                                   (float   _alphaFloat){

        super.DrawVoid(_alphaFloat, editPlayerGroupObject);

        /*Always assign values to the controllers.*/
        if(tempSelectedPlayerObject                                 != null ){

            tempSelectedPlayerFinishedString                        = (tempSelectedPlayerObject .playerFinishedBoolean == true) ? "True" : "False";     /*Convert boolean value into String type data with sentence case.           */
            if(tempSelectedPlayerObject.explanationStringList.size() <= 0)  { tempSelectedPlayerExplanationString = ""; }
            for(int i = 0; i < tempSelectedPlayerObject.explanationStringList.size(); i ++){                                                                                /*Put all selected player sentences into one paragraph of a String variable.*/

                if(i == 0)  { tempSelectedPlayerExplanationString   =                                                tempSelectedPlayerObject.explanationStringList.get(i); }
                else        { tempSelectedPlayerExplanationString   = tempSelectedPlayerExplanationString + "\n\n" + tempSelectedPlayerObject.explanationStringList.get(i); }

            }
            if(tempSelectedPlayerObject.sentenceStringList.size() <= 0)     { tempSelectedPlayerSentenceString = ""; }
            for(int i = 0; i < tempSelectedPlayerObject.sentenceStringList.size(); i ++){                                                                                   /*Put all selected player sentences into one paragraph of a String variable.*/

                if(i == 0)  { tempSelectedPlayerSentenceString      =                                             tempSelectedPlayerObject.sentenceStringList.get(i); }
                else        { tempSelectedPlayerSentenceString      = tempSelectedPlayerSentenceString + "\n\n" + tempSelectedPlayerObject.sentenceStringList.get(i); }

            }

            editPlayerGroupPlayerIndexValueTextlabelObject              .setText (("" + tempSelectedPlayerObject.playerIndexInt                         ));
            //editPlayerGroupPlayerNameTextfieldObject                  .setText ((     tempSelectedPlayerObject.playerNameString                       ));
            editPlayerGroupPlayerFinishedValueTextlabelObject           .setText ((     tempSelectedPlayerFinishedString                                ));
            editPlayerGroupPlayerScoreValueTextlabelObject              .setText (("" + tempSelectedPlayerObject.playerScoreInt                         ));
            editPlayerGroupPlayerExhibitionCurrentValueTextlabelObject  .setText ((     tempSelectedPlayerObject.exhibitionCurrentNameFullString        ));
            editPlayerGroupPlayerExhibitionTargetScrollableListObject   .setItems((     tempSelectedPlayerObject.exhibitionTargetNameFullStringList     ));
            editPlayerGroupPlayerExhibitionVisitedScrollableListObject  .setItems((     tempSelectedPlayerObject.exhibitionVisitedNameFullStringList    ));
            editPlayerGroupPlayerTagScrollableListObject                .setItems((     tempSelectedPlayerObject.exhibitionTagCounterNameFullStringList ));
            editPlayerGroupPlayerSentenceValueTextareaObject            .setText ((     tempSelectedPlayerSentenceString                                ));
            editPlayerGroupPlayerExplanationValueTextareaObject         .setText ((     tempSelectedPlayerExplanationString                             ));
            editPlayerGroupPlayerExhibitionNextScrollableListObject     .setItems((     exhibitionNameFullStringList                                    ));
            editPlayerGroupPlayerModeValueRadioButtonObject             .activate((     (tempSelectedPlayerObject.playerMovementModeInt - 1)            ));

        }

        /*Hide the unecessary controller, for example when movement player mode int is not 2 (software, manual control) then
            we do not need to show scrollable list that show next exhibition to be choose.*/
        if      (tempSelectedPlayerMovementModeInt == 1){ editPlayerGroupPlayerExhibitionNextScrollableListObject.hide(); }
        else if (tempSelectedPlayerMovementModeInt == 2){ editPlayerGroupPlayerExhibitionNextScrollableListObject.show(); }
        else if (tempSelectedPlayerMovementModeInt == 3){ editPlayerGroupPlayerExhibitionNextScrollableListObject.hide(); }
        else                                            { editPlayerGroupPlayerExhibitionNextScrollableListObject.hide(); }

        editPlayerGroupPlayerNameTextfieldObject                .setColorValue(groupColorLabelColor);
        editPlayerGroupPlayerSentenceValueTextareaObject        .setColorValue(groupColorLabelColor);
        editPlayerGroupPlayerExplanationValueTextareaObject     .setColorValue(groupColorLabelColor);

    }

}