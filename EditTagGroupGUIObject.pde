import java.util.*;
import controlP5.*;

class EditTagGroupGUIObject extends GroupGUIObject{

    ControlP5       editTagGroupControlP5Object;

    ScrollableList  selectExhibitionScrollableListObject;

    String          tempSelectedTagTypeString                   = "";
    String          tempSelectedTagNameAltString                        = "";
    String          tempSelectedTagNameFullString                       = "";
    String          tempSelectedTagSubjectString                        = "";
    String          tempSelectedTagVerb1String                          = "";
    String          tempSelectedTagVerb2String                          = "";
    String          tempSelectedTagVerb3String                          = "";
    String          tempSelectedTagVerbIngString                        = "";
    String          tempSelectedTagVerbSString                          = "";
    String          tempSelectedTagNegativeVerb1String                  = "";
    String          tempSelectedTagNegativeVerb2String                  = "";
    String          tempSelectedTagNegativeVerb3String                  = "";
    String          tempSelectedTagNegativeVerbIngString                = "";
    String          tempSelectedTagNegativeVerbSString                  = "";
    String          tempSelectedTagNounString                           = "";
    String          tempSelectedTagNounSString                          = "";
    String          tempSelectedTagAdjectiveString                      = "";
    String          tempSelectedTagNegativeAdjectiveString              = "";
    String          tempSelectedTagAdverbString                         = "";
    String          tempSelectedTagNegativeAdverbString                 = "";
    Tag             tempSelectedTagObject                               = null;
    List<String>    tempTagNameFullStringList                           = new ArrayList<String>();

    Group           editTagGroupObject                                  ;
    ScrollableList  editTagGroupSelectTagScrollableListObject           ;
    Textfield       editTagGroupTagNameAltTextfieldObject               ;
    Textfield       editTagGroupTagNameFullTextfieldObject              ;
    Textfield       editTagGroupTagSubjectTextfieldObject               ;
    Textfield       editTagGroupTagVerb1TextfieldObject                 ;
    Textfield       editTagGroupTagVerb2TextfieldObject                 ;
    Textfield       editTagGroupTagVerb3TextfieldObject                 ;
    Textfield       editTagGroupTagVerbIngTextfieldObject               ;
    Textfield       editTagGroupTagVerbSTextfieldObject                 ;
    Textfield       editTagGroupTagNegativeVerb1TextfieldObject         ;
    Textfield       editTagGroupTagNegativeVerb2TextfieldObject         ;
    Textfield       editTagGroupTagNegativeVerb3TextfieldObject         ;
    Textfield       editTagGroupTagNegativeVerbIngTextfieldObject       ;
    Textfield       editTagGroupTagNegativeVerbSTextfieldObject         ;
    Textfield       editTagGroupTagNounTextfieldObject                  ;
    Textfield       editTagGroupTagNounSTextfieldObject                 ;
    Textfield       editTagGroupTagAdjectiveTextfieldObject             ;
    Textfield       editTagGroupTagNegativeAdjectiveTextfieldObject     ;
    Textfield       editTagGroupTagAdverbTextfieldObject                ;
    Textfield       editTagGroupTagNegativeAdverbTextfieldObject        ;
    Button          editTagGroupTagEditButtonObject                     ;

    EditTagGroupGUIObject(

        int             _guiXInt                            ,
        int             _guiYInt                            ,
        int             _guiWidthInt                        ,
        int             _guiHeightInt                       ,
        ScrollableList  _selectExhibitionScrollableListObject   ,
        PApplet         _pAppletObject

    ){

        super                                   (_guiXInt, _guiYInt, _guiWidthInt, _guiHeightInt, _pAppletObject);
        editTagGroupControlP5Object             = new ControlP5(pAppletObject);

        selectExhibitionScrollableListObject    = _selectExhibitionScrollableListObject;

        GenerateAllTagNameFullVoid();



        editTagGroupObject                                          =
            editTagGroupControlP5Object     .addGroup               ("EditTagGroupObject")
                                            .close                  ()
                                            .setBackgroundColor     (groupBackgroundColor)
                                            .setBackgroundHeight    (guiHeightInt)
                                            .setColor               (defaultCColor)
                                            .setColorBackground     (groupColorBackgroundColor)
                                            .setColorLabel          (groupColorLabelColor)
                                            .setLabel               ("EDIT TAG:")
                                            .setPosition            (guiXInt, guiYInt)
                                            .setWidth               (guiWidthInt);



        editTagGroupSelectTagScrollableListObject                   =
            editTagGroupControlP5Object     .addScrollableList      ("EditTagGroupSelectTagScrollableListObject")
                                            .addItems               (tempTagNameFullStringList)
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("SELECT TAG:")
                                            .setPosition            (guiElement1ColumnFirstColumnXInt, guiLayoutOffsetInt)
                                            .setSize                (guiElement1ColumnWidth, guiScrollableList5RowHeightInt)
                                            .setType                (ControlP5.LIST);



        editTagGroupTagNameAltTextfieldObject                       =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagNameAltTextfieldObject")
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("TAG NAME FULL:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*2) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNameFullTextfieldObject                      =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagNameFullTextfieldObject")
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("TAG NAME ALT:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*2) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagSubjectTextfieldObject                       =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagSubjectTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("SUBJECT:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagVerb1TextfieldObject                          =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagVerb1TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("VERB 1:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagVerb2TextfieldObject                         =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagVerb2TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("VERB 2:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagVerb3TextfieldObject                         =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagVerb3TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("VERB 3:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*10) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagVerbIngTextfieldObject                       =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagVerbIngTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("VERB + ING:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*10) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagVerbSTextfieldObject                         =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagVerbSTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("VERB + S:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*14) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNegativeVerb1TextfieldObject                 =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagNegativeVerb1TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NEGATIVE VERB 1:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNegativeVerb2TextfieldObject                 =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagNegativeVerb2TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NEGATIVE VERB 2:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNegativeVerb3TextfieldObject                 =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagNegativeVerb3TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NEGATIVE VERB 3:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*10) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNegativeVerbIngTextfieldObject               =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagNegativeVerbIngTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NEGATIVE VERB + ING:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*10) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNegativeVerbSTextfieldObject                 =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagNegativeVerbSTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NEGATIVE VERB + S:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*14) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNounTextfieldObject                          =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagNounTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NOUN:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNounSTextfieldObject                         =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagNounSTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NOUN + S:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagAdjectiveTextfieldObject                     =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagAdjectiveTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("ADJECTIVE:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNegativeAdjectiveTextfieldObject             =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagNegativeAdjectiveTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NEGATIVE ADJECTIVE:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagAdverbTextfieldObject                        =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagAdverbTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("ADVERB:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNegativeAdverbTextfieldObject                =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagNegativeAdverbTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NEGATIVE ADVERB:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagEditButtonObject                             =
            editTagGroupControlP5Object     .addButton              ("EditTagGroupTagEditButtonObject")
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("EDIT TAG")  
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*14) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



    }

    void DrawVoid(float   _alphaFloat){

        //super.DrawVoid(_alphaFloat, addTagGroupObject);

        ControlFormVoid();

    }

    /*Show the necessary text field according to the selected type tag.*/
    void ControlFormVoid(){

        if(tempSelectedTagTypeString.equals("SUB"))         {

            editTagGroupTagSubjectTextfieldObject            .show();
            editTagGroupTagVerb1TextfieldObject              .hide();
            editTagGroupTagVerb2TextfieldObject              .hide();
            editTagGroupTagVerb3TextfieldObject              .hide();
            editTagGroupTagVerbIngTextfieldObject            .hide();
            editTagGroupTagVerbSTextfieldObject              .hide();
            editTagGroupTagNegativeVerb1TextfieldObject      .hide();
            editTagGroupTagNegativeVerb2TextfieldObject      .hide();
            editTagGroupTagNegativeVerb3TextfieldObject      .hide();
            editTagGroupTagNegativeVerbIngTextfieldObject    .hide();
            editTagGroupTagNegativeVerbSTextfieldObject      .hide();
            editTagGroupTagNounTextfieldObject               .hide();
            editTagGroupTagNounSTextfieldObject              .hide();
            editTagGroupTagAdjectiveTextfieldObject          .hide();
            editTagGroupTagNegativeAdjectiveTextfieldObject  .hide();
            editTagGroupTagAdverbTextfieldObject             .hide();
            editTagGroupTagNegativeAdverbTextfieldObject     .hide();

        }
        else if(tempSelectedTagTypeString.equals("VER"))    {

            editTagGroupTagSubjectTextfieldObject            .hide();
            editTagGroupTagVerb1TextfieldObject              .show();
            editTagGroupTagVerb2TextfieldObject              .show();
            editTagGroupTagVerb3TextfieldObject              .show();
            editTagGroupTagVerbIngTextfieldObject            .show();
            editTagGroupTagVerbSTextfieldObject              .show();
            editTagGroupTagNegativeVerb1TextfieldObject      .hide();
            editTagGroupTagNegativeVerb2TextfieldObject      .hide();
            editTagGroupTagNegativeVerb3TextfieldObject      .hide();
            editTagGroupTagNegativeVerbIngTextfieldObject    .hide();
            editTagGroupTagNegativeVerbSTextfieldObject      .hide();
            editTagGroupTagNounTextfieldObject               .hide();
            editTagGroupTagNounSTextfieldObject              .hide();
            editTagGroupTagAdjectiveTextfieldObject          .hide();
            editTagGroupTagNegativeAdjectiveTextfieldObject  .hide();
            editTagGroupTagAdverbTextfieldObject             .hide();
            editTagGroupTagNegativeAdverbTextfieldObject     .hide();

        }
        else if(tempSelectedTagTypeString.equals("NVE"))    {

            editTagGroupTagSubjectTextfieldObject            .hide();
            editTagGroupTagVerb1TextfieldObject              .hide();
            editTagGroupTagVerb2TextfieldObject              .hide();
            editTagGroupTagVerb3TextfieldObject              .hide();
            editTagGroupTagVerbIngTextfieldObject            .hide();
            editTagGroupTagVerbSTextfieldObject              .hide();
            editTagGroupTagNegativeVerb1TextfieldObject      .show();
            editTagGroupTagNegativeVerb2TextfieldObject      .show();
            editTagGroupTagNegativeVerb3TextfieldObject      .show();
            editTagGroupTagNegativeVerbIngTextfieldObject    .show();
            editTagGroupTagNegativeVerbSTextfieldObject      .show();
            editTagGroupTagNounTextfieldObject               .hide();
            editTagGroupTagNounSTextfieldObject              .hide();
            editTagGroupTagAdjectiveTextfieldObject          .hide();
            editTagGroupTagNegativeAdjectiveTextfieldObject  .hide();
            editTagGroupTagAdverbTextfieldObject             .hide();
            editTagGroupTagNegativeAdverbTextfieldObject     .hide();

        }
        else if(tempSelectedTagTypeString.equals("NOU"))    {

            editTagGroupTagSubjectTextfieldObject            .hide();
            editTagGroupTagVerb1TextfieldObject              .hide();
            editTagGroupTagVerb2TextfieldObject              .hide();
            editTagGroupTagVerb3TextfieldObject              .hide();
            editTagGroupTagVerbIngTextfieldObject            .hide();
            editTagGroupTagVerbSTextfieldObject              .hide();
            editTagGroupTagNegativeVerb1TextfieldObject      .hide();
            editTagGroupTagNegativeVerb2TextfieldObject      .hide();
            editTagGroupTagNegativeVerb3TextfieldObject      .hide();
            editTagGroupTagNegativeVerbIngTextfieldObject    .hide();
            editTagGroupTagNegativeVerbSTextfieldObject      .hide();
            editTagGroupTagNounTextfieldObject               .show();
            editTagGroupTagNounSTextfieldObject              .show();
            editTagGroupTagAdjectiveTextfieldObject          .hide();
            editTagGroupTagNegativeAdjectiveTextfieldObject  .hide();
            editTagGroupTagAdverbTextfieldObject             .hide();
            editTagGroupTagNegativeAdverbTextfieldObject     .hide();

        }
        else if(tempSelectedTagTypeString.equals("ADJ"))    {

            editTagGroupTagSubjectTextfieldObject            .hide();
            editTagGroupTagVerb1TextfieldObject              .hide();
            editTagGroupTagVerb2TextfieldObject              .hide();
            editTagGroupTagVerb3TextfieldObject              .hide();
            editTagGroupTagVerbIngTextfieldObject            .hide();
            editTagGroupTagVerbSTextfieldObject              .hide();
            editTagGroupTagNegativeVerb1TextfieldObject      .hide();
            editTagGroupTagNegativeVerb2TextfieldObject      .hide();
            editTagGroupTagNegativeVerb3TextfieldObject      .hide();
            editTagGroupTagNegativeVerbIngTextfieldObject    .hide();
            editTagGroupTagNegativeVerbSTextfieldObject      .hide();
            editTagGroupTagNounTextfieldObject               .hide();
            editTagGroupTagNounSTextfieldObject              .hide();
            editTagGroupTagAdjectiveTextfieldObject          .show();
            editTagGroupTagNegativeAdjectiveTextfieldObject  .hide();
            editTagGroupTagAdverbTextfieldObject             .hide();
            editTagGroupTagNegativeAdverbTextfieldObject     .hide();

        }
        else if(tempSelectedTagTypeString.equals("NDJ"))    {

            editTagGroupTagSubjectTextfieldObject            .hide();
            editTagGroupTagVerb1TextfieldObject              .hide();
            editTagGroupTagVerb2TextfieldObject              .hide();
            editTagGroupTagVerb3TextfieldObject              .hide();
            editTagGroupTagVerbIngTextfieldObject            .hide();
            editTagGroupTagVerbSTextfieldObject              .hide();
            editTagGroupTagNegativeVerb1TextfieldObject      .hide();
            editTagGroupTagNegativeVerb2TextfieldObject      .hide();
            editTagGroupTagNegativeVerb3TextfieldObject      .hide();
            editTagGroupTagNegativeVerbIngTextfieldObject    .hide();
            editTagGroupTagNegativeVerbSTextfieldObject      .hide();
            editTagGroupTagNounTextfieldObject               .hide();
            editTagGroupTagNounSTextfieldObject              .hide();
            editTagGroupTagAdjectiveTextfieldObject          .hide();
            editTagGroupTagNegativeAdjectiveTextfieldObject  .show();
            editTagGroupTagAdverbTextfieldObject             .hide();
            editTagGroupTagNegativeAdverbTextfieldObject     .hide();

        }
        else if(tempSelectedTagTypeString.equals("ADV"))    {

            editTagGroupTagSubjectTextfieldObject            .hide();
            editTagGroupTagVerb1TextfieldObject              .hide();
            editTagGroupTagVerb2TextfieldObject              .hide();
            editTagGroupTagVerb3TextfieldObject              .hide();
            editTagGroupTagVerbIngTextfieldObject            .hide();
            editTagGroupTagVerbSTextfieldObject              .hide();
            editTagGroupTagNegativeVerb1TextfieldObject      .hide();
            editTagGroupTagNegativeVerb2TextfieldObject      .hide();
            editTagGroupTagNegativeVerb3TextfieldObject      .hide();
            editTagGroupTagNegativeVerbIngTextfieldObject    .hide();
            editTagGroupTagNegativeVerbSTextfieldObject      .hide();
            editTagGroupTagNounTextfieldObject               .hide();
            editTagGroupTagNounSTextfieldObject              .hide();
            editTagGroupTagAdjectiveTextfieldObject          .hide();
            editTagGroupTagNegativeAdjectiveTextfieldObject  .hide();
            editTagGroupTagAdverbTextfieldObject             .show();
            editTagGroupTagNegativeAdverbTextfieldObject     .hide();

        }
        else if(tempSelectedTagTypeString.equals("NDV"))    {

            editTagGroupTagSubjectTextfieldObject            .hide();
            editTagGroupTagVerb1TextfieldObject              .hide();
            editTagGroupTagVerb2TextfieldObject              .hide();
            editTagGroupTagVerb3TextfieldObject              .hide();
            editTagGroupTagVerbIngTextfieldObject            .hide();
            editTagGroupTagVerbSTextfieldObject              .hide();
            editTagGroupTagNegativeVerb1TextfieldObject      .hide();
            editTagGroupTagNegativeVerb2TextfieldObject      .hide();
            editTagGroupTagNegativeVerb3TextfieldObject      .hide();
            editTagGroupTagNegativeVerbIngTextfieldObject    .hide();
            editTagGroupTagNegativeVerbSTextfieldObject      .hide();
            editTagGroupTagNounTextfieldObject               .hide();
            editTagGroupTagNounSTextfieldObject              .hide();
            editTagGroupTagAdjectiveTextfieldObject          .hide();
            editTagGroupTagNegativeAdjectiveTextfieldObject  .hide();
            editTagGroupTagAdverbTextfieldObject             .hide();
            editTagGroupTagNegativeAdverbTextfieldObject     .show();

        }

    }

    void GenerateAllTagNameFullVoid(){

        tempTagNameFullStringList.addAll(subjectTagNameFullStringList           );
        tempTagNameFullStringList.addAll(verbTagNameFullStringList              );
        tempTagNameFullStringList.addAll(negativeVerbTagNameFullStringList      );
        tempTagNameFullStringList.addAll(nounTagNameFullStringList              );
        tempTagNameFullStringList.addAll(adjectiveTagNameFullStringList         );
        tempTagNameFullStringList.addAll(negativeAdjectiveTagNameFullStringList );
        tempTagNameFullStringList.addAll(adverbTagNameFullStringList            );
        tempTagNameFullStringList.addAll(negativeAdverbTagNameFullStringList    );

    }

}