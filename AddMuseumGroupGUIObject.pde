import java.util.*;
import controlP5.*;

class AddMuseumGroupGUIObject extends GroupGUIObject{

    ControlP5       addMuseumGroupControlP5Object                                               ;                           /*ControlP5 object to control all graphical user interface controller.              */

    Group           addTagGroupObject                                                           ;

    String          tempSelectedParentNameAltString                                             = "";                       /*Selected object museum parent name alt  string.                                   */
    String          tempSelectedParentNameFullString                                            = "";                       /*Selected object museum parent name full string.                                   */
    String          tempSelectedTypeObjectMuseumNameAltString                                   = "";                       /*Selected object museum type   name alt  string ("FLR"  , "ROM" , "EXH"       ).   */
    String          tempSelectedTypeObjectMuseumNameFullString                                  = "";                       /*Selected object museum type   name full string ("Floor", "Room", "Exhibition").   */
    List<String>    tempSelectedTagNameFullStringList                                           = new ArrayList<String>();  /*Selected object museum tag    name full string.                                   */

    /*ControlP5 related graphical user interface controller variables.*/
    Group           addMuseumGroupObject                                                        ;
    ScrollableList  addMuseumGroupSelectTypeMuseumObjectScrollableListObject                    ;
    ScrollableList  addMuseumGroupSelectParentMuseumObjectScrollableListObject                  ;
    Textlabel       addMuseumGroupCanAddMultipleTagTextlabelObject                              ;
    ScrollableList  addMuseumGroupSelectSubjectTagMuseumObjectScrollableListObject              ;
    ScrollableList  addMuseumGroupSelectVerbTagMuseumObjectScrollableListObject                 ;
    ScrollableList  addMuseumGroupSelectNegativeVerbTagMuseumObjectScrollableListObject         ;
    ScrollableList  addMuseumGroupSelectNounTagMuseumObjectScrollableListObject                 ;
    ScrollableList  addMuseumGroupSelectAdjectiveTagMuseumObjectScrollableListObject            ;
    ScrollableList  addMuseumGroupSelectNegativeAdjectiveTagMuseumObjectScrollableListObject    ;
    ScrollableList  addMuseumGroupSelectAdverbTagMuseumObjectScrollableListObject               ;
    ScrollableList  addMuseumGroupSelectNegativeAdverbTagMuseumObjectScrollableListObject       ;
    Textfield       addMuseumGroupNameFullMuseumObjectTextfieldObject                           ;
    Textfield       addMuseumGroupNameAltMuseumObjectTextfieldObject                            ;
    Button          addMuseumGroupAddMuseumObjectButtonObject                                   ;

    AddMuseumGroupGUIObject                                         (

        int         _guiXInt            ,
        int         _guiYInt            ,
        int         _guiWidthInt        ,
        int         _guiHeightInt       ,
        Group       _addTagGroupObject  ,
        PApplet     _pAppletObject

    ){

        super                                                                       (_guiXInt, _guiYInt, _guiWidthInt, _guiHeightInt, _pAppletObject);
        addMuseumGroupControlP5Object                                               = new ControlP5(pAppletObject);

        addTagGroupObject                                                           = _addTagGroupObject;                                               /*PENDING.*/



        addMuseumGroupObject                                                        =
            addMuseumGroupControlP5Object   .addGroup                               ("AddMuseumGroupObject")
                                            .close                                  ()
                                            .setBackgroundColor                     (groupBackgroundColor)
                                            .setBackgroundHeight                    (guiHeightInt)
                                            .setColor                               (defaultCColor)
                                            .setColorBackground                     (groupColorBackgroundColor)
                                            .setColorLabel                          (groupColorLabelColor)
                                            .setLabel                               ("ADD MUSEUM OBJECT:")
                                            .setPosition                            (guiXInt, guiYInt)
                                            .setWidth                               (guiWidthInt);



        addMuseumGroupSelectTypeMuseumObjectScrollableListObject                    =
            addMuseumGroupControlP5Object   .addScrollableList                      ("AddMuseumGroupSelectTypeMuseumObjectScrollableListObject")
                                            .addItems                               (Arrays.asList("Floor", "Room", "Exhibition"))
                                            .setColor                               (defaultCColor)
                                            .setGroup                               (addMuseumGroupObject)
                                            .setLabel                               ("CHOOSE TYPE:")
                                            .setPosition                            (guiElement4ColumnFirstColumnXInt, guiLayoutOffsetInt)
                                            .setSize                                (guiElement4ColumnWidth, guiScrollableList4RowHeightInt)
                                            .setType                                (ControlP5.LIST);



        addMuseumGroupSelectParentMuseumObjectScrollableListObject                  =
            addMuseumGroupControlP5Object   .addScrollableList                      ("AddMuseumGroupSelectParentMuseumObjectScrollableListObject")
                                            .addItems                               (defaultStringList)
                                            .setColor                               (defaultCColor)
                                            .setGroup                               (addMuseumGroupObject)
                                            .setLabel                               ("PARENT OBJECT:")
                                            .setPosition                            (guiElement4ColumnSecondColumnXInt, guiLayoutOffsetInt)
                                            .setSize                                (((guiElement4ColumnWidth*3) + (guiLayoutOffsetInt*2)), guiScrollableList5RowHeightInt)
                                            .setType                                (ControlP5.LIST);



        addMuseumGroupCanAddMultipleTagTextlabelObject                              =
            addMuseumGroupControlP5Object   .addTextlabel                           ("AddMuseumGroupCanAddMultipleTagTextlabelObject")
                                            .setColor                               (defaultCColor)
                                            .setColorValue                          (255)
                                            .setGroup                               (addMuseumGroupObject)
                                            .setPosition                            (guiElement1ColumnFirstColumnXInt, ((guiLayoutOffsetInt*2) + guiScrollableList5RowHeightInt))
                                            .setText                                ("*YOU CAN ADD MULTIPLE TAGS\nBUT MINIMUM ONE TAG IN EACH CATEGORY.");



        addMuseumGroupSelectSubjectTagMuseumObjectScrollableListObject              =
            addMuseumGroupControlP5Object   .addScrollableList                      ("AddMuseumGroupSelectSubjectTagMuseumObjectScrollableListObject")
                                            .addItems                               (subjectTagNameFullStringList)
                                            .setColor                               (falseCheckListCColor)
                                            .setGroup                               (addMuseumGroupObject)
                                            .setLabel                               ("SUBJECT TAG:")
                                            .setPosition                            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*5) + guiScrollableList5RowHeightInt))
                                            .setSize                                (guiElement2ColumnWidth, guiScrollableList5RowHeightInt)
                                            .setType                                (ControlP5.LIST);



        addMuseumGroupSelectNounTagMuseumObjectScrollableListObject                 =
            addMuseumGroupControlP5Object   .addScrollableList                      ("AddMuseumGroupSelectNounTagMuseumObjectScrollableListObject")
                                            .addItems                               (nounTagNameFullStringList)
                                            .setColor                               (falseCheckListCColor)
                                            .setGroup                               (addMuseumGroupObject)
                                            .setLabel                               ("NOUN TAG:")
                                            .setPosition                            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*5) + guiScrollableList5RowHeightInt))
                                            .setSize                                (guiElement2ColumnWidth, guiScrollableList5RowHeightInt)
                                            .setType                                (ControlP5.LIST);



        addMuseumGroupSelectVerbTagMuseumObjectScrollableListObject                 =
            addMuseumGroupControlP5Object   .addScrollableList                      ("AddMuseumGroupSelectVerbTagMuseumObjectScrollableListObject")
                                            .addItems                               (verbTagNameFullStringList)
                                            .setColor                               (falseCheckListCColor)
                                            .setLabel                               ("VERB TAG:")
                                            .setGroup                               (addMuseumGroupObject)
                                            .setPosition                            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + (guiScrollableList5RowHeightInt*2)))
                                            .setSize                                (guiElement2ColumnWidth, guiScrollableList5RowHeightInt)
                                            .setType                                (ControlP5.LIST);



        addMuseumGroupSelectNegativeVerbTagMuseumObjectScrollableListObject         =
            addMuseumGroupControlP5Object   .addScrollableList                      ("AddMuseumGroupSelectNegativeVerbTagMuseumObjectScrollableListObject")
                                            .addItems                               (negativeVerbTagNameFullStringList)
                                            .setColor                               (falseCheckListCColor)
                                            .setGroup                               (addMuseumGroupObject)
                                            .setLabel                               ("NEGATIVE VERB TAG:")
                                            .setPosition                            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*6) + (guiScrollableList5RowHeightInt*2)))
                                            .setSize                                (guiElement2ColumnWidth, guiScrollableList5RowHeightInt)
                                            .setType                                (ControlP5.LIST);



        addMuseumGroupSelectAdjectiveTagMuseumObjectScrollableListObject            =
            addMuseumGroupControlP5Object   .addScrollableList                      ("AddMuseumGroupSelectAdjectiveTagMuseumObjectScrollableListObject")
                                            .addItems                               (adjectiveTagNameFullStringList)
                                            .setColor                               (falseCheckListCColor)
                                            .setGroup                               (addMuseumGroupObject)
                                            .setLabel                               ("ADJECTIVE TAG:")
                                            .setPosition                            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*7) + (guiScrollableList5RowHeightInt*3)))
                                            .setSize                                (guiElement2ColumnWidth, guiScrollableList5RowHeightInt)
                                            .setType                                (ControlP5.LIST);



        addMuseumGroupSelectNegativeAdjectiveTagMuseumObjectScrollableListObject    =
            addMuseumGroupControlP5Object   .addScrollableList                      ("AddMuseumGroupSelectNegativeAdjectiveTagMuseumObjectScrollableListObject")
                                            .addItems                               (negativeAdjectiveTagNameFullStringList)
                                            .setColor                               (falseCheckListCColor)
                                            .setGroup                               (addMuseumGroupObject)
                                            .setLabel                               ("NEGATIVE ADJECTIVE TAG:")
                                            .setPosition                            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*7) + (guiScrollableList5RowHeightInt*3)))
                                            .setSize                                (guiElement2ColumnWidth, guiScrollableList5RowHeightInt)
                                            .setType                                (ControlP5.LIST);



        addMuseumGroupSelectAdverbTagMuseumObjectScrollableListObject               =
            addMuseumGroupControlP5Object   .addScrollableList                      ("AddMuseumGroupSelectAdverbTagMuseumObjectScrollableListObject")
                                            .addItems                               (adverbTagNameFullStringList)
                                            .setColor                               (falseCheckListCColor)
                                            .setGroup                               (addMuseumGroupObject)
                                            .setLabel                               ("ADVERB TAG:")
                                            .setPosition                            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*8) + (guiScrollableList5RowHeightInt*4)))
                                            .setSize                                (guiElement2ColumnWidth, guiScrollableList5RowHeightInt)
                                            .setType                                (ControlP5.LIST);



        addMuseumGroupSelectNegativeAdverbTagMuseumObjectScrollableListObject       =
            addMuseumGroupControlP5Object   .addScrollableList                      ("AddMuseumGroupSelectNegativeAdverbTagMuseumObjectScrollableListObject")
                                            .addItems                               (negativeAdverbTagNameFullStringList)
                                            .setColor                               (falseCheckListCColor)
                                            .setGroup                               (addMuseumGroupObject)
                                            .setLabel                               ("NEGATIVE ADVERB TAG:")
                                            .setPosition                            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*8) + (guiScrollableList5RowHeightInt*4)))
                                            .setSize                                (guiElement2ColumnWidth, guiScrollableList5RowHeightInt)
                                            .setType                                (ControlP5.LIST);



        addMuseumGroupNameFullMuseumObjectTextfieldObject                           =
            addMuseumGroupControlP5Object   .addTextfield                           ("AddMuseumGroupNameFullMuseumObjectTextfieldObject")
                                            .setColor                               (defaultCColor)
                                            .setGroup                               (addMuseumGroupObject)
                                            .setLabel                               ("NAME FULL")
                                            .setPosition                            (guiElement3ColumnFirstColumnXInt, ((guiLayoutOffsetInt*9) + (guiScrollableList5RowHeightInt*5)))
                                            .setSize                                (guiElement3ColumnWidth, guiElement2LineHeight);



        addMuseumGroupNameAltMuseumObjectTextfieldObject                            =
            addMuseumGroupControlP5Object   .addTextfield                           ("AddMuseumGroupNameAltMuseumObjectTextfieldObject")
                                            .setColor                               (defaultCColor)
                                            .setGroup                               (addMuseumGroupObject)
                                            .setLabel                               ("NAME ALTERNATIVE")
                                            .setPosition                            (guiElement3ColumnSecondColumnXInt, ((guiLayoutOffsetInt*9) + (guiScrollableList5RowHeightInt*5)))
                                            .setSize                                (guiElement3ColumnWidth, guiElement2LineHeight);



        addMuseumGroupAddMuseumObjectButtonObject                                   =
            addMuseumGroupControlP5Object   .addButton                              ("AddMuseumGroupAddMuseumObjectButtonObject")
                                            .setColor                               (defaultCColor)
                                            .setGroup                               (addMuseumGroupObject)
                                            .setLabel                               ("ADD MUSEUM OBJECT")
                                            .setPosition                            (guiElement3ColumnThirdColumnXInt, ((guiLayoutOffsetInt*9) + (guiScrollableList5RowHeightInt*5)))
                                            .setSize                                (guiElement3ColumnWidth, guiElement2LineHeight);



    }

    void DrawVoid                                                   (float _alphaFloat){

        super.DrawVoid(_alphaFloat, addMuseumGroupObject);

    }

}