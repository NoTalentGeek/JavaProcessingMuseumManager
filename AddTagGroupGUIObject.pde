import java.util.*;
import controlP5.*;

class AddTagGroupGUIObject extends GroupGUIObject{

    ControlP5       addTagGroupControllerP5Object                       ;

    String          tempSelectedTagTypeNameFullString                   = "";

    /*ControlP5 related graphical user interface controller variables.*/
    Group           addTagGroupObject                                   ;
    ScrollableList  addTagGroupTagTypeNameFullScrollableListObject      ;
    Textfield       addTagGroupTagNameAltTextfieldObject                ;
    Textfield       addTagGroupTagNameFullTextfieldObject               ;
    Textfield       addTagGroupTagSubjectTextfieldObject                ;
    Textfield       addTagGroupTagVerb1TextfieldObject                  ;
    Textfield       addTagGroupTagVerb2TextfieldObject                  ;
    Textfield       addTagGroupTagVerb3TextfieldObject                  ;
    Textfield       addTagGroupTagVerbIngTextfieldObject                ;
    Textfield       addTagGroupTagVerbSTextfieldObject                  ;
    Textfield       addTagGroupTagNegativeVerb1TextfieldObject          ;
    Textfield       addTagGroupTagNegativeVerb2TextfieldObject          ;
    Textfield       addTagGroupTagNegativeVerb3TextfieldObject          ;
    Textfield       addTagGroupTagNegativeVerbIngTextfieldObject        ;
    Textfield       addTagGroupTagNegativeVerbSTextfieldObject          ;
    Textfield       addTagGroupTagNounTextfieldObject                   ;
    Textfield       addTagGroupTagNounSTextfieldObject                  ;
    Textfield       addTagGroupTagAdjectiveTextfieldObject              ;
    Textfield       addTagGroupTagNegativeAdjectiveTextfieldObject      ;
    Textfield       addTagGroupTagAdverbTextfieldObject                 ;
    Textfield       addTagGroupTagNegativeAdverbTextfieldObject         ;
    Button          addTagGroupTagAddButtonObject                       ;

    AddTagGroupGUIObject(

        int                 _guiXInt                                ,
        int                 _guiYInt                                ,
        int                 _guiWidthInt                            ,
        int                 _guiHeightInt                           ,
        PApplet             _pAppletObject

    ){


        super(_guiXInt, _guiYInt, _guiWidthInt, _guiHeightInt, _pAppletObject);
        addTagGroupControllerP5Object               = new ControlP5(pAppletObject);



        addTagGroupObject                                           =
            addTagGroupControllerP5Object   .addGroup               ("AddTagGroupObject")
                                            .close                  ()
                                            .setBackgroundColor     (groupBackgroundColor)
                                            .setBackgroundHeight    (guiHeightInt)
                                            .setColor               (defaultCColor)
                                            .setColorBackground     (groupColorBackgroundColor)
                                            .setColorLabel          (groupColorLabelColor)
                                            .setLabel               ("ADD TAG:")
                                            .setPosition            (guiXInt, guiYInt)
                                            .setWidth               (guiWidthInt);



        addTagGroupTagTypeNameFullScrollableListObject              =
            addTagGroupControllerP5Object   .addScrollableList      ("AddTagGroupTagTypeNameFullScrollableListObject")
                                            .addItems               (Arrays.asList("SUBJECT", "VERB", "NEGATIVE VERB", "NOUN", "ADJECTIVE", "NEGATIVE ADJECTIVE", "ADVERB", "NEGATIVE ADVERB"))
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("SELECT TAG TYPE:")
                                            .setPosition            (guiElement1ColumnFirstColumnXInt, guiLayoutOffsetInt)
                                            .setSize                (guiElement1ColumnWidth, guiScrollableList5RowHeightInt)
                                            .setType                (ControlP5.LIST);



        addTagGroupTagNameFullTextfieldObject                       =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNameFullTextfieldObject")
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("TAG NAME FULL:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*2) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagNameAltTextfieldObject                        =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNameAltTextfieldObject")
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("TAG NAME ALT:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*2) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagSubjectTextfieldObject                        =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagSubjectTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("SUBJECT:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagVerb1TextfieldObject                          =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagVerb1TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("VERB 1:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagVerb2TextfieldObject                          =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagVerb2TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("VERB 2:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagVerb3TextfieldObject                          =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagVerb3TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("VERB 3:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*10) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagVerbIngTextfieldObject                        =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagVerbIngTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("VERB + ING:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*10) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagVerbSTextfieldObject                          =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagVerbSTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("VERB + S:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*14) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagNegativeVerb1TextfieldObject                  =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNegativeVerb1TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("NEGATIVE VERB 1:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagNegativeVerb2TextfieldObject                  =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNegativeVerb2TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("NEGATIVE VERB 2:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagNegativeVerb3TextfieldObject                  =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNegativeVerb3TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("NEGATIVE VERB 3:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*10) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagNegativeVerbIngTextfieldObject                =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNegativeVerbIngTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("NEGATIVE VERB + ING:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*10) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagNegativeVerbSTextfieldObject                  =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNegativeVerbSTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("NEGATIVE VERB + S:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*14) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagNounTextfieldObject                           =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNounTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("NOUN:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagNounSTextfieldObject                          =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNounSTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("NOUN + S:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagAdjectiveTextfieldObject                      =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagAdjectiveTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("ADJECTIVE:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagNegativeAdjectiveTextfieldObject              =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNegativeAdjectiveTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("NEGATIVE ADJECTIVE:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagAdverbTextfieldObject                         =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagAdverbTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("ADVERB:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagNegativeAdverbTextfieldObject                 =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNegativeAdverbTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("NEGATIVE ADVERB:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagAddButtonObject                               =
            addTagGroupControllerP5Object   .addButton              ("AddTagGroupTagAddButtonObject")
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("ADD TAG")  
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*14) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



    }

    void DrawVoid(float   _alphaFloat){

        super.DrawVoid(_alphaFloat, addTagGroupObject);

        ControlFormVoid();

        addTagGroupTagNameAltTextfieldObject           .setColorValue(groupColorLabelColor);
        addTagGroupTagNameFullTextfieldObject          .setColorValue(groupColorLabelColor);
        addTagGroupTagSubjectTextfieldObject           .setColorValue(groupColorLabelColor);
        addTagGroupTagVerb1TextfieldObject             .setColorValue(groupColorLabelColor);
        addTagGroupTagVerb2TextfieldObject             .setColorValue(groupColorLabelColor);
        addTagGroupTagVerb3TextfieldObject             .setColorValue(groupColorLabelColor);
        addTagGroupTagVerbIngTextfieldObject           .setColorValue(groupColorLabelColor);
        addTagGroupTagVerbSTextfieldObject             .setColorValue(groupColorLabelColor);
        addTagGroupTagNegativeVerb1TextfieldObject     .setColorValue(groupColorLabelColor);
        addTagGroupTagNegativeVerb2TextfieldObject     .setColorValue(groupColorLabelColor);
        addTagGroupTagNegativeVerb3TextfieldObject     .setColorValue(groupColorLabelColor);
        addTagGroupTagNegativeVerbIngTextfieldObject   .setColorValue(groupColorLabelColor);
        addTagGroupTagNegativeVerbSTextfieldObject     .setColorValue(groupColorLabelColor);
        addTagGroupTagNounTextfieldObject              .setColorValue(groupColorLabelColor);
        addTagGroupTagNounSTextfieldObject             .setColorValue(groupColorLabelColor);
        addTagGroupTagAdjectiveTextfieldObject         .setColorValue(groupColorLabelColor);
        addTagGroupTagNegativeAdjectiveTextfieldObject .setColorValue(groupColorLabelColor);
        addTagGroupTagAdverbTextfieldObject            .setColorValue(groupColorLabelColor);
        addTagGroupTagNegativeAdverbTextfieldObject    .setColorValue(groupColorLabelColor);

    }

    /*Show the necessary text field according to the selected type tag.*/
    void ControlFormVoid(){

        if(tempSelectedTagTypeNameFullString.equals("SUBJECT"))                 {

            addTagGroupTagSubjectTextfieldObject            .show();
            addTagGroupTagVerb1TextfieldObject              .hide();
            addTagGroupTagVerb2TextfieldObject              .hide();
            addTagGroupTagVerb3TextfieldObject              .hide();
            addTagGroupTagVerbIngTextfieldObject            .hide();
            addTagGroupTagVerbSTextfieldObject              .hide();
            addTagGroupTagNegativeVerb1TextfieldObject      .hide();
            addTagGroupTagNegativeVerb2TextfieldObject      .hide();
            addTagGroupTagNegativeVerb3TextfieldObject      .hide();
            addTagGroupTagNegativeVerbIngTextfieldObject    .hide();
            addTagGroupTagNegativeVerbSTextfieldObject      .hide();
            addTagGroupTagNounTextfieldObject               .hide();
            addTagGroupTagNounSTextfieldObject              .hide();
            addTagGroupTagAdjectiveTextfieldObject          .hide();
            addTagGroupTagNegativeAdjectiveTextfieldObject  .hide();
            addTagGroupTagAdverbTextfieldObject             .hide();
            addTagGroupTagNegativeAdverbTextfieldObject     .hide();

        }
        else if(tempSelectedTagTypeNameFullString.equals("VERB"))               {

            addTagGroupTagSubjectTextfieldObject            .hide();
            addTagGroupTagVerb1TextfieldObject              .show();
            addTagGroupTagVerb2TextfieldObject              .show();
            addTagGroupTagVerb3TextfieldObject              .show();
            addTagGroupTagVerbIngTextfieldObject            .show();
            addTagGroupTagVerbSTextfieldObject              .show();
            addTagGroupTagNegativeVerb1TextfieldObject      .hide();
            addTagGroupTagNegativeVerb2TextfieldObject      .hide();
            addTagGroupTagNegativeVerb3TextfieldObject      .hide();
            addTagGroupTagNegativeVerbIngTextfieldObject    .hide();
            addTagGroupTagNegativeVerbSTextfieldObject      .hide();
            addTagGroupTagNounTextfieldObject               .hide();
            addTagGroupTagNounSTextfieldObject              .hide();
            addTagGroupTagAdjectiveTextfieldObject          .hide();
            addTagGroupTagNegativeAdjectiveTextfieldObject  .hide();
            addTagGroupTagAdverbTextfieldObject             .hide();
            addTagGroupTagNegativeAdverbTextfieldObject     .hide();

        }
        else if(tempSelectedTagTypeNameFullString.equals("NEGATIVE VERB"))      {

            addTagGroupTagSubjectTextfieldObject            .hide();
            addTagGroupTagVerb1TextfieldObject              .hide();
            addTagGroupTagVerb2TextfieldObject              .hide();
            addTagGroupTagVerb3TextfieldObject              .hide();
            addTagGroupTagVerbIngTextfieldObject            .hide();
            addTagGroupTagVerbSTextfieldObject              .hide();
            addTagGroupTagNegativeVerb1TextfieldObject      .show();
            addTagGroupTagNegativeVerb2TextfieldObject      .show();
            addTagGroupTagNegativeVerb3TextfieldObject      .show();
            addTagGroupTagNegativeVerbIngTextfieldObject    .show();
            addTagGroupTagNegativeVerbSTextfieldObject      .show();
            addTagGroupTagNounTextfieldObject               .hide();
            addTagGroupTagNounSTextfieldObject              .hide();
            addTagGroupTagAdjectiveTextfieldObject          .hide();
            addTagGroupTagNegativeAdjectiveTextfieldObject  .hide();
            addTagGroupTagAdverbTextfieldObject             .hide();
            addTagGroupTagNegativeAdverbTextfieldObject     .hide();

        }
        else if(tempSelectedTagTypeNameFullString.equals("NOUN"))               {

            addTagGroupTagSubjectTextfieldObject            .hide();
            addTagGroupTagVerb1TextfieldObject              .hide();
            addTagGroupTagVerb2TextfieldObject              .hide();
            addTagGroupTagVerb3TextfieldObject              .hide();
            addTagGroupTagVerbIngTextfieldObject            .hide();
            addTagGroupTagVerbSTextfieldObject              .hide();
            addTagGroupTagNegativeVerb1TextfieldObject      .hide();
            addTagGroupTagNegativeVerb2TextfieldObject      .hide();
            addTagGroupTagNegativeVerb3TextfieldObject      .hide();
            addTagGroupTagNegativeVerbIngTextfieldObject    .hide();
            addTagGroupTagNegativeVerbSTextfieldObject      .hide();
            addTagGroupTagNounTextfieldObject               .show();
            addTagGroupTagNounSTextfieldObject              .show();
            addTagGroupTagAdjectiveTextfieldObject          .hide();
            addTagGroupTagNegativeAdjectiveTextfieldObject  .hide();
            addTagGroupTagAdverbTextfieldObject             .hide();
            addTagGroupTagNegativeAdverbTextfieldObject     .hide();

        }
        else if(tempSelectedTagTypeNameFullString.equals("ADJECTIVE"))          {

            addTagGroupTagSubjectTextfieldObject            .hide();
            addTagGroupTagVerb1TextfieldObject              .hide();
            addTagGroupTagVerb2TextfieldObject              .hide();
            addTagGroupTagVerb3TextfieldObject              .hide();
            addTagGroupTagVerbIngTextfieldObject            .hide();
            addTagGroupTagVerbSTextfieldObject              .hide();
            addTagGroupTagNegativeVerb1TextfieldObject      .hide();
            addTagGroupTagNegativeVerb2TextfieldObject      .hide();
            addTagGroupTagNegativeVerb3TextfieldObject      .hide();
            addTagGroupTagNegativeVerbIngTextfieldObject    .hide();
            addTagGroupTagNegativeVerbSTextfieldObject      .hide();
            addTagGroupTagNounTextfieldObject               .hide();
            addTagGroupTagNounSTextfieldObject              .hide();
            addTagGroupTagAdjectiveTextfieldObject          .show();
            addTagGroupTagNegativeAdjectiveTextfieldObject  .hide();
            addTagGroupTagAdverbTextfieldObject             .hide();
            addTagGroupTagNegativeAdverbTextfieldObject     .hide();

        }
        else if(tempSelectedTagTypeNameFullString.equals("NEGATIVE ADJECTIVE")) {

            addTagGroupTagSubjectTextfieldObject            .hide();
            addTagGroupTagVerb1TextfieldObject              .hide();
            addTagGroupTagVerb2TextfieldObject              .hide();
            addTagGroupTagVerb3TextfieldObject              .hide();
            addTagGroupTagVerbIngTextfieldObject            .hide();
            addTagGroupTagVerbSTextfieldObject              .hide();
            addTagGroupTagNegativeVerb1TextfieldObject      .hide();
            addTagGroupTagNegativeVerb2TextfieldObject      .hide();
            addTagGroupTagNegativeVerb3TextfieldObject      .hide();
            addTagGroupTagNegativeVerbIngTextfieldObject    .hide();
            addTagGroupTagNegativeVerbSTextfieldObject      .hide();
            addTagGroupTagNounTextfieldObject               .hide();
            addTagGroupTagNounSTextfieldObject              .hide();
            addTagGroupTagAdjectiveTextfieldObject          .hide();
            addTagGroupTagNegativeAdjectiveTextfieldObject  .show();
            addTagGroupTagAdverbTextfieldObject             .hide();
            addTagGroupTagNegativeAdverbTextfieldObject     .hide();

        }
        else if(tempSelectedTagTypeNameFullString.equals("ADVERB"))             {

            addTagGroupTagSubjectTextfieldObject            .hide();
            addTagGroupTagVerb1TextfieldObject              .hide();
            addTagGroupTagVerb2TextfieldObject              .hide();
            addTagGroupTagVerb3TextfieldObject              .hide();
            addTagGroupTagVerbIngTextfieldObject            .hide();
            addTagGroupTagVerbSTextfieldObject              .hide();
            addTagGroupTagNegativeVerb1TextfieldObject      .hide();
            addTagGroupTagNegativeVerb2TextfieldObject      .hide();
            addTagGroupTagNegativeVerb3TextfieldObject      .hide();
            addTagGroupTagNegativeVerbIngTextfieldObject    .hide();
            addTagGroupTagNegativeVerbSTextfieldObject      .hide();
            addTagGroupTagNounTextfieldObject               .hide();
            addTagGroupTagNounSTextfieldObject              .hide();
            addTagGroupTagAdjectiveTextfieldObject          .hide();
            addTagGroupTagNegativeAdjectiveTextfieldObject  .hide();
            addTagGroupTagAdverbTextfieldObject             .show();
            addTagGroupTagNegativeAdverbTextfieldObject     .hide();

        }
        else if(tempSelectedTagTypeNameFullString.equals("NEGATIVE ADVERB"))    {

            addTagGroupTagSubjectTextfieldObject            .hide();
            addTagGroupTagVerb1TextfieldObject              .hide();
            addTagGroupTagVerb2TextfieldObject              .hide();
            addTagGroupTagVerb3TextfieldObject              .hide();
            addTagGroupTagVerbIngTextfieldObject            .hide();
            addTagGroupTagVerbSTextfieldObject              .hide();
            addTagGroupTagNegativeVerb1TextfieldObject      .hide();
            addTagGroupTagNegativeVerb2TextfieldObject      .hide();
            addTagGroupTagNegativeVerb3TextfieldObject      .hide();
            addTagGroupTagNegativeVerbIngTextfieldObject    .hide();
            addTagGroupTagNegativeVerbSTextfieldObject      .hide();
            addTagGroupTagNounTextfieldObject               .hide();
            addTagGroupTagNounSTextfieldObject              .hide();
            addTagGroupTagAdjectiveTextfieldObject          .hide();
            addTagGroupTagNegativeAdjectiveTextfieldObject  .hide();
            addTagGroupTagAdverbTextfieldObject             .hide();
            addTagGroupTagNegativeAdverbTextfieldObject     .show();

        }

    }

}