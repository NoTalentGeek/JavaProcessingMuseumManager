import java.util.*;
import controlP5.*;

class AddTagGroupGUIObject extends GroupGUIObject{

    ControlP5       addTagGroupControllerP5Object                               ;

    String          tempSelectedTagTypeNameFullString                           = "";

    /*ControlP5 related graphical user interface controller variables.*/
    Group           addTagGroupObject                                           ;
    ScrollableList  addTagGroupTagTypeNameFullScrollableListObject              ;
    Textfield       addTagGroupTagNameAltTextfieldObject                        ;
    Textfield       addTagGroupTagNameFullTextfieldObject                       ;
    Textfield       addTagGroupTagSubjectTextfieldObject                        ;
    Textfield       addTagGroupTagSubjectPossesionTextfieldObject               ;
    Textfield       addTagGroupTagIntransitiveVerb1TextfieldObject              ;
    Textfield       addTagGroupTagIntransitiveVerb2TextfieldObject              ;
    Textfield       addTagGroupTagIntransitiveVerb3TextfieldObject              ;
    Textfield       addTagGroupTagIntransitiveVerbIngTextfieldObject            ;
    Textfield       addTagGroupTagIntransitiveVerbSTextfieldObject              ;
    Textfield       addTagGroupTagNegativeIntransitiveVerb1TextfieldObject      ;
    Textfield       addTagGroupTagNegativeIntransitiveVerb2TextfieldObject      ;
    Textfield       addTagGroupTagNegativeIntransitiveVerb3TextfieldObject      ;
    Textfield       addTagGroupTagNegativeIntransitiveVerbIngTextfieldObject    ;
    Textfield       addTagGroupTagNegativeIntransitiveVerbSTextfieldObject      ;
    Textfield       addTagGroupTagTransitiveVerb1TextfieldObject                ;
    Textfield       addTagGroupTagTransitiveVerb2TextfieldObject                ;
    Textfield       addTagGroupTagTransitiveVerb3TextfieldObject                ;
    Textfield       addTagGroupTagTransitiveVerbIngTextfieldObject              ;
    Textfield       addTagGroupTagTransitiveVerbSTextfieldObject                ;
    Textfield       addTagGroupTagNegativeTransitiveVerb1TextfieldObject        ;
    Textfield       addTagGroupTagNegativeTransitiveVerb2TextfieldObject        ;
    Textfield       addTagGroupTagNegativeTransitiveVerb3TextfieldObject        ;
    Textfield       addTagGroupTagNegativeTransitiveVerbIngTextfieldObject      ;
    Textfield       addTagGroupTagNegativeTransitiveVerbSTextfieldObject        ;
    Textfield       addTagGroupTagNounAbstractTextfieldObject                   ;
    Textfield       addTagGroupTagNounAbstractSTextfieldObject                  ;
    Textfield       addTagGroupTagNounTextfieldObject                           ;
    Textfield       addTagGroupTagNounSTextfieldObject                          ;
    Textfield       addTagGroupTagAdjectiveTextfieldObject                      ;
    Textfield       addTagGroupTagNegativeAdjectiveTextfieldObject              ;
    Textfield       addTagGroupTagAdverbTextfieldObject                         ;
    Textfield       addTagGroupTagNegativeAdverbTextfieldObject                 ;
    Button          addTagGroupTagAddButtonObject                               ;

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
                                            .addItems               (Arrays.asList("SUBJECT", "INTRANSITIVE VERB", "NEGATIVE INTRANSITIVE VERB", "TRANSITIVE VERB", "NEGATIVE TRANSITIVE VERB", "NOUN", "NOUN ABSTRACT", "ADJECTIVE", "NEGATIVE ADJECTIVE", "ADVERB", "NEGATIVE ADVERB"))
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("SELECT TAG TYPE:")
                                            .setPosition            (guiElement1ColumnFirstColumnXInt, guiLayoutOffsetInt)
                                            .setSize                (guiElement1ColumnWidth, guiScrollableList4RowHeightInt)
                                            .setType                (ControlP5.LIST);



        addTagGroupTagNameFullTextfieldObject                       =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNameFullTextfieldObject")
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("TAG NAME FULL:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*2) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagNameAltTextfieldObject                        =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNameAltTextfieldObject")
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("TAG NAME ALT:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*2) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagSubjectTextfieldObject                        =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagSubjectTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("SUBJECT:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagSubjectPossesionTextfieldObject               =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagSubjectPossesionTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("SUBJECT POSSESION:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagIntransitiveVerb1TextfieldObject              =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagIntransitiveVerb1TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("INTRANSITIVE VERB 1:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);


 
        addTagGroupTagIntransitiveVerb2TextfieldObject              =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagIntransitiveVerb2TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("INTRANSITIVE VERB 2:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagIntransitiveVerb3TextfieldObject              =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagIntransitiveVerb3TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("INTRANSITIVE VERB 3:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*10) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagIntransitiveVerbIngTextfieldObject            =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagIntransitiveVerbIngTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("INTRANSITIVE VERB + ING:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*10) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagIntransitiveVerbSTextfieldObject              =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagIntransitiveVerbSTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("INTRANSITIVE VERB + S:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*14) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagNegativeIntransitiveVerb1TextfieldObject      =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNegativeIntransitiveVerb1TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("NEGATIVE INTRANSITIVE VERB 1:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagNegativeIntransitiveVerb2TextfieldObject      =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNegativeIntransitiveVerb2TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("NEGATIVE INTRANSITIVE VERB 2:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagNegativeIntransitiveVerb3TextfieldObject      =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNegativeIntransitiveVerb3TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("NEGATIVE INTRANSITIVE VERB 3:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*10) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagNegativeIntransitiveVerbIngTextfieldObject    =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNegativeIntransitiveVerbIngTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("NEGATIVE INTRANSITIVE VERB + ING:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*10) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagNegativeIntransitiveVerbSTextfieldObject      =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNegativeIntransitiveVerbSTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("NEGATIVE INTRANSITIVE VERB + S:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*14) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagTransitiveVerb1TextfieldObject                =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagTransitiveVerb1TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("TRANSITIVE VERB 1:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagTransitiveVerb2TextfieldObject                =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagTransitiveVerb2TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("TRANSITIVE VERB 2:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagTransitiveVerb3TextfieldObject                =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagTransitiveVerb3TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("TRANSITIVE VERB 3:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*10) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagTransitiveVerbIngTextfieldObject              =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagTransitiveVerbIngTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("TRANSITIVE VERB + ING:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*10) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagTransitiveVerbSTextfieldObject                =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagTransitiveVerbSTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("TRANSITIVE VERB + S:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*14) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagNegativeTransitiveVerb1TextfieldObject        =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNegativeTransitiveVerb1TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("NEGATIVE TRANSITIVE VERB 1:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagNegativeTransitiveVerb2TextfieldObject        =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNegativeTransitiveVerb2TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("NEGATIVE TRANSITIVE VERB 2:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagNegativeTransitiveVerb3TextfieldObject        =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNegativeTransitiveVerb3TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("NEGATIVE TRANSITIVE VERB 3:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*10) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagNegativeTransitiveVerbIngTextfieldObject      =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNegativeTransitiveVerbIngTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("NEGATIVE TRANSITIVE VERB + ING:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*10) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagNegativeTransitiveVerbSTextfieldObject        =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNegativeTransitiveVerbSTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("NEGATIVE TRANSITIVE VERB + S:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*14) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagNounAbstractTextfieldObject                   =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNounAbstractTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("NOUN ABSTRACT:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagNounAbstractSTextfieldObject                  =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNounAbstractSTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("NOUN ABSTRACT + S:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagNounTextfieldObject                           =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNounTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("NOUN:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagNounSTextfieldObject                          =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNounSTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("NOUN + S:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagAdjectiveTextfieldObject                      =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagAdjectiveTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("ADJECTIVE:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagNegativeAdjectiveTextfieldObject              =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNegativeAdjectiveTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("NEGATIVE ADJECTIVE:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagAdverbTextfieldObject                         =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagAdverbTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("ADVERB:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagNegativeAdverbTextfieldObject                 =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNegativeAdverbTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("NEGATIVE ADVERB:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagAddButtonObject                               =
            addTagGroupControllerP5Object   .addButton              ("AddTagGroupTagAddButtonObject")
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("ADD TAG")  
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*14) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



    }

    void DrawVoid(float   _alphaFloat){

        super.DrawVoid(_alphaFloat, addTagGroupObject);

        ControlFormVoid();

        addTagGroupTagNameAltTextfieldObject                        .setColorValue(groupColorLabelColor);
        addTagGroupTagNameFullTextfieldObject                       .setColorValue(groupColorLabelColor);
        addTagGroupTagSubjectTextfieldObject                        .setColorValue(groupColorLabelColor);
        addTagGroupTagSubjectPossesionTextfieldObject               .setColorValue(groupColorLabelColor);
        addTagGroupTagIntransitiveVerb1TextfieldObject              .setColorValue(groupColorLabelColor);
        addTagGroupTagIntransitiveVerb2TextfieldObject              .setColorValue(groupColorLabelColor);
        addTagGroupTagIntransitiveVerb3TextfieldObject              .setColorValue(groupColorLabelColor);
        addTagGroupTagIntransitiveVerbIngTextfieldObject            .setColorValue(groupColorLabelColor);
        addTagGroupTagIntransitiveVerbSTextfieldObject              .setColorValue(groupColorLabelColor);
        addTagGroupTagNegativeIntransitiveVerb1TextfieldObject      .setColorValue(groupColorLabelColor);
        addTagGroupTagNegativeIntransitiveVerb2TextfieldObject      .setColorValue(groupColorLabelColor);
        addTagGroupTagNegativeIntransitiveVerb3TextfieldObject      .setColorValue(groupColorLabelColor);
        addTagGroupTagNegativeIntransitiveVerbIngTextfieldObject    .setColorValue(groupColorLabelColor);
        addTagGroupTagNegativeIntransitiveVerbSTextfieldObject      .setColorValue(groupColorLabelColor);
        addTagGroupTagTransitiveVerb1TextfieldObject                .setColorValue(groupColorLabelColor);
        addTagGroupTagTransitiveVerb2TextfieldObject                .setColorValue(groupColorLabelColor);
        addTagGroupTagTransitiveVerb3TextfieldObject                .setColorValue(groupColorLabelColor);
        addTagGroupTagTransitiveVerbIngTextfieldObject              .setColorValue(groupColorLabelColor);
        addTagGroupTagTransitiveVerbSTextfieldObject                .setColorValue(groupColorLabelColor);
        addTagGroupTagNegativeTransitiveVerb1TextfieldObject        .setColorValue(groupColorLabelColor);
        addTagGroupTagNegativeTransitiveVerb2TextfieldObject        .setColorValue(groupColorLabelColor);
        addTagGroupTagNegativeTransitiveVerb3TextfieldObject        .setColorValue(groupColorLabelColor);
        addTagGroupTagNegativeTransitiveVerbIngTextfieldObject      .setColorValue(groupColorLabelColor);
        addTagGroupTagNegativeTransitiveVerbSTextfieldObject        .setColorValue(groupColorLabelColor);
        addTagGroupTagNounAbstractTextfieldObject                   .setColorValue(groupColorLabelColor);
        addTagGroupTagNounAbstractSTextfieldObject                  .setColorValue(groupColorLabelColor);
        addTagGroupTagNounTextfieldObject                           .setColorValue(groupColorLabelColor);
        addTagGroupTagNounSTextfieldObject                          .setColorValue(groupColorLabelColor);
        addTagGroupTagAdjectiveTextfieldObject                      .setColorValue(groupColorLabelColor);
        addTagGroupTagNegativeAdjectiveTextfieldObject              .setColorValue(groupColorLabelColor);
        addTagGroupTagAdverbTextfieldObject                         .setColorValue(groupColorLabelColor);
        addTagGroupTagNegativeAdverbTextfieldObject                 .setColorValue(groupColorLabelColor);

    }

    /*Show the necessary text field according to the selected type tag.*/
    void ControlFormVoid(){

        if(tempSelectedTagTypeNameFullString.equals("SUBJECT"))                             {

            addTagGroupTagSubjectTextfieldObject                        .show();
            addTagGroupTagSubjectPossesionTextfieldObject               .show();
            addTagGroupTagIntransitiveVerb1TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerb2TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerb3TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerbIngTextfieldObject            .hide();
            addTagGroupTagIntransitiveVerbSTextfieldObject              .hide();
            addTagGroupTagNegativeIntransitiveVerb1TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerb2TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerb3TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerbIngTextfieldObject    .hide();
            addTagGroupTagNegativeIntransitiveVerbSTextfieldObject      .hide();
            addTagGroupTagTransitiveVerb1TextfieldObject                .hide();
            addTagGroupTagTransitiveVerb2TextfieldObject                .hide();
            addTagGroupTagTransitiveVerb3TextfieldObject                .hide();
            addTagGroupTagTransitiveVerbIngTextfieldObject              .hide();
            addTagGroupTagTransitiveVerbSTextfieldObject                .hide();
            addTagGroupTagNegativeTransitiveVerb1TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerb2TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerb3TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerbIngTextfieldObject      .hide();
            addTagGroupTagNegativeTransitiveVerbSTextfieldObject        .hide();
            addTagGroupTagNounAbstractTextfieldObject                   .hide();
            addTagGroupTagNounAbstractSTextfieldObject                  .hide();
            addTagGroupTagNounTextfieldObject                           .hide();
            addTagGroupTagNounSTextfieldObject                          .hide();
            addTagGroupTagAdjectiveTextfieldObject                      .hide();
            addTagGroupTagNegativeAdjectiveTextfieldObject              .hide();
            addTagGroupTagAdverbTextfieldObject                         .hide();
            addTagGroupTagNegativeAdverbTextfieldObject                 .hide();

        }
        else if(tempSelectedTagTypeNameFullString.equals("INTRANSITIVE VERB"))              {

            addTagGroupTagSubjectTextfieldObject                        .hide();
            addTagGroupTagSubjectPossesionTextfieldObject               .hide();
            addTagGroupTagIntransitiveVerb1TextfieldObject              .show();
            addTagGroupTagIntransitiveVerb2TextfieldObject              .show();
            addTagGroupTagIntransitiveVerb3TextfieldObject              .show();
            addTagGroupTagIntransitiveVerbIngTextfieldObject            .show();
            addTagGroupTagIntransitiveVerbSTextfieldObject              .show();
            addTagGroupTagNegativeIntransitiveVerb1TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerb2TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerb3TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerbIngTextfieldObject    .hide();
            addTagGroupTagNegativeIntransitiveVerbSTextfieldObject      .hide();
            addTagGroupTagTransitiveVerb1TextfieldObject                .hide();
            addTagGroupTagTransitiveVerb2TextfieldObject                .hide();
            addTagGroupTagTransitiveVerb3TextfieldObject                .hide();
            addTagGroupTagTransitiveVerbIngTextfieldObject              .hide();
            addTagGroupTagTransitiveVerbSTextfieldObject                .hide();
            addTagGroupTagNegativeTransitiveVerb1TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerb2TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerb3TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerbIngTextfieldObject      .hide();
            addTagGroupTagNegativeTransitiveVerbSTextfieldObject        .hide();
            addTagGroupTagNounAbstractTextfieldObject                   .hide();
            addTagGroupTagNounAbstractSTextfieldObject                  .hide();
            addTagGroupTagNounTextfieldObject                           .hide();
            addTagGroupTagNounSTextfieldObject                          .hide();
            addTagGroupTagAdjectiveTextfieldObject                      .hide();
            addTagGroupTagNegativeAdjectiveTextfieldObject              .hide();
            addTagGroupTagAdverbTextfieldObject                         .hide();
            addTagGroupTagNegativeAdverbTextfieldObject                 .hide();

        }
        else if(tempSelectedTagTypeNameFullString.equals("NEGATIVE INTRANSITIVE VERB"))     {

            addTagGroupTagSubjectTextfieldObject                        .hide();
            addTagGroupTagSubjectPossesionTextfieldObject               .hide();
            addTagGroupTagIntransitiveVerb1TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerb2TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerb3TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerbIngTextfieldObject            .hide();
            addTagGroupTagIntransitiveVerbSTextfieldObject              .hide();
            addTagGroupTagNegativeIntransitiveVerb1TextfieldObject      .show();
            addTagGroupTagNegativeIntransitiveVerb2TextfieldObject      .show();
            addTagGroupTagNegativeIntransitiveVerb3TextfieldObject      .show();
            addTagGroupTagNegativeIntransitiveVerbIngTextfieldObject    .show();
            addTagGroupTagNegativeIntransitiveVerbSTextfieldObject      .show();
            addTagGroupTagTransitiveVerb1TextfieldObject                .hide();
            addTagGroupTagTransitiveVerb2TextfieldObject                .hide();
            addTagGroupTagTransitiveVerb3TextfieldObject                .hide();
            addTagGroupTagTransitiveVerbIngTextfieldObject              .hide();
            addTagGroupTagTransitiveVerbSTextfieldObject                .hide();
            addTagGroupTagNegativeTransitiveVerb1TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerb2TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerb3TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerbIngTextfieldObject      .hide();
            addTagGroupTagNegativeTransitiveVerbSTextfieldObject        .hide();
            addTagGroupTagNounAbstractTextfieldObject                   .hide();
            addTagGroupTagNounAbstractSTextfieldObject                  .hide();
            addTagGroupTagNounTextfieldObject                           .hide();
            addTagGroupTagNounSTextfieldObject                          .hide();
            addTagGroupTagAdjectiveTextfieldObject                      .hide();
            addTagGroupTagNegativeAdjectiveTextfieldObject              .hide();
            addTagGroupTagAdverbTextfieldObject                         .hide();
            addTagGroupTagNegativeAdverbTextfieldObject                 .hide();

        }
        else if(tempSelectedTagTypeNameFullString.equals("TRANSITIVE VERB"))                {

            addTagGroupTagSubjectTextfieldObject                        .hide();
            addTagGroupTagSubjectPossesionTextfieldObject               .hide();
            addTagGroupTagIntransitiveVerb1TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerb2TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerb3TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerbIngTextfieldObject            .hide();
            addTagGroupTagIntransitiveVerbSTextfieldObject              .hide();
            addTagGroupTagNegativeIntransitiveVerb1TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerb2TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerb3TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerbIngTextfieldObject    .hide();
            addTagGroupTagNegativeIntransitiveVerbSTextfieldObject      .hide();
            addTagGroupTagTransitiveVerb1TextfieldObject                .show();
            addTagGroupTagTransitiveVerb2TextfieldObject                .show();
            addTagGroupTagTransitiveVerb3TextfieldObject                .show();
            addTagGroupTagTransitiveVerbIngTextfieldObject              .show();
            addTagGroupTagTransitiveVerbSTextfieldObject                .show();
            addTagGroupTagNegativeTransitiveVerb1TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerb2TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerb3TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerbIngTextfieldObject      .hide();
            addTagGroupTagNegativeTransitiveVerbSTextfieldObject        .hide();
            addTagGroupTagNounAbstractTextfieldObject                   .hide();
            addTagGroupTagNounAbstractSTextfieldObject                  .hide();
            addTagGroupTagNounTextfieldObject                           .hide();
            addTagGroupTagNounSTextfieldObject                          .hide();
            addTagGroupTagAdjectiveTextfieldObject                      .hide();
            addTagGroupTagNegativeAdjectiveTextfieldObject              .hide();
            addTagGroupTagAdverbTextfieldObject                         .hide();
            addTagGroupTagNegativeAdverbTextfieldObject                 .hide();

        }
        else if(tempSelectedTagTypeNameFullString.equals("NEGATIVE TRANSITIVE VERB"))       {

            addTagGroupTagSubjectTextfieldObject                        .hide();
            addTagGroupTagSubjectPossesionTextfieldObject               .hide();
            addTagGroupTagIntransitiveVerb1TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerb2TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerb3TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerbIngTextfieldObject            .hide();
            addTagGroupTagIntransitiveVerbSTextfieldObject              .hide();
            addTagGroupTagNegativeIntransitiveVerb1TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerb2TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerb3TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerbIngTextfieldObject    .hide();
            addTagGroupTagNegativeIntransitiveVerbSTextfieldObject      .hide();
            addTagGroupTagTransitiveVerb1TextfieldObject                .hide();
            addTagGroupTagTransitiveVerb2TextfieldObject                .hide();
            addTagGroupTagTransitiveVerb3TextfieldObject                .hide();
            addTagGroupTagTransitiveVerbIngTextfieldObject              .hide();
            addTagGroupTagTransitiveVerbSTextfieldObject                .hide();
            addTagGroupTagNegativeTransitiveVerb1TextfieldObject        .show();
            addTagGroupTagNegativeTransitiveVerb2TextfieldObject        .show();
            addTagGroupTagNegativeTransitiveVerb3TextfieldObject        .show();
            addTagGroupTagNegativeTransitiveVerbIngTextfieldObject      .show();
            addTagGroupTagNegativeTransitiveVerbSTextfieldObject        .show();
            addTagGroupTagNounAbstractTextfieldObject                   .hide();
            addTagGroupTagNounAbstractSTextfieldObject                  .hide();
            addTagGroupTagNounTextfieldObject                           .hide();
            addTagGroupTagNounSTextfieldObject                          .hide();
            addTagGroupTagAdjectiveTextfieldObject                      .hide();
            addTagGroupTagNegativeAdjectiveTextfieldObject              .hide();
            addTagGroupTagAdverbTextfieldObject                         .hide();
            addTagGroupTagNegativeAdverbTextfieldObject                 .hide();

        }
        else if(tempSelectedTagTypeNameFullString.equals("NOUN ABSTRACT"))                  {

            addTagGroupTagSubjectTextfieldObject                        .hide();
            addTagGroupTagSubjectPossesionTextfieldObject               .hide();
            addTagGroupTagIntransitiveVerb1TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerb2TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerb3TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerbIngTextfieldObject            .hide();
            addTagGroupTagIntransitiveVerbSTextfieldObject              .hide();
            addTagGroupTagNegativeIntransitiveVerb1TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerb2TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerb3TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerbIngTextfieldObject    .hide();
            addTagGroupTagNegativeIntransitiveVerbSTextfieldObject      .hide();
            addTagGroupTagTransitiveVerb1TextfieldObject                .hide();
            addTagGroupTagTransitiveVerb2TextfieldObject                .hide();
            addTagGroupTagTransitiveVerb3TextfieldObject                .hide();
            addTagGroupTagTransitiveVerbIngTextfieldObject              .hide();
            addTagGroupTagTransitiveVerbSTextfieldObject                .hide();
            addTagGroupTagNegativeTransitiveVerb1TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerb2TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerb3TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerbIngTextfieldObject      .hide();
            addTagGroupTagNegativeTransitiveVerbSTextfieldObject        .hide();
            addTagGroupTagNounAbstractTextfieldObject                   .show();
            addTagGroupTagNounAbstractSTextfieldObject                  .show();
            addTagGroupTagNounTextfieldObject                           .hide();
            addTagGroupTagNounSTextfieldObject                          .hide();
            addTagGroupTagAdjectiveTextfieldObject                      .hide();
            addTagGroupTagNegativeAdjectiveTextfieldObject              .hide();
            addTagGroupTagAdverbTextfieldObject                         .hide();
            addTagGroupTagNegativeAdverbTextfieldObject                 .hide();
        }
        else if(tempSelectedTagTypeNameFullString.equals("NOUN"))                           {

            addTagGroupTagSubjectTextfieldObject                        .hide();
            addTagGroupTagSubjectPossesionTextfieldObject               .hide();
            addTagGroupTagIntransitiveVerb1TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerb2TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerb3TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerbIngTextfieldObject            .hide();
            addTagGroupTagIntransitiveVerbSTextfieldObject              .hide();
            addTagGroupTagNegativeIntransitiveVerb1TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerb2TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerb3TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerbIngTextfieldObject    .hide();
            addTagGroupTagNegativeIntransitiveVerbSTextfieldObject      .hide();
            addTagGroupTagTransitiveVerb1TextfieldObject                .hide();
            addTagGroupTagTransitiveVerb2TextfieldObject                .hide();
            addTagGroupTagTransitiveVerb3TextfieldObject                .hide();
            addTagGroupTagTransitiveVerbIngTextfieldObject              .hide();
            addTagGroupTagTransitiveVerbSTextfieldObject                .hide();
            addTagGroupTagNegativeTransitiveVerb1TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerb2TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerb3TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerbIngTextfieldObject      .hide();
            addTagGroupTagNegativeTransitiveVerbSTextfieldObject        .hide();
            addTagGroupTagNounAbstractTextfieldObject                   .hide();
            addTagGroupTagNounAbstractSTextfieldObject                  .hide();
            addTagGroupTagNounTextfieldObject                           .show();
            addTagGroupTagNounSTextfieldObject                          .show();
            addTagGroupTagAdjectiveTextfieldObject                      .hide();
            addTagGroupTagNegativeAdjectiveTextfieldObject              .hide();
            addTagGroupTagAdverbTextfieldObject                         .hide();
            addTagGroupTagNegativeAdverbTextfieldObject                 .hide();

        }
        else if(tempSelectedTagTypeNameFullString.equals("ADJECTIVE"))                      {

            addTagGroupTagSubjectTextfieldObject                        .hide();
            addTagGroupTagSubjectPossesionTextfieldObject               .hide();
            addTagGroupTagIntransitiveVerb1TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerb2TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerb3TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerbIngTextfieldObject            .hide();
            addTagGroupTagIntransitiveVerbSTextfieldObject              .hide();
            addTagGroupTagNegativeIntransitiveVerb1TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerb2TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerb3TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerbIngTextfieldObject    .hide();
            addTagGroupTagNegativeIntransitiveVerbSTextfieldObject      .hide();
            addTagGroupTagTransitiveVerb1TextfieldObject                .hide();
            addTagGroupTagTransitiveVerb2TextfieldObject                .hide();
            addTagGroupTagTransitiveVerb3TextfieldObject                .hide();
            addTagGroupTagTransitiveVerbIngTextfieldObject              .hide();
            addTagGroupTagTransitiveVerbSTextfieldObject                .hide();
            addTagGroupTagNegativeTransitiveVerb1TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerb2TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerb3TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerbIngTextfieldObject      .hide();
            addTagGroupTagNegativeTransitiveVerbSTextfieldObject        .hide();
            addTagGroupTagNounAbstractTextfieldObject                   .hide();
            addTagGroupTagNounAbstractSTextfieldObject                  .hide();
            addTagGroupTagNounTextfieldObject                           .hide();
            addTagGroupTagNounSTextfieldObject                          .hide();
            addTagGroupTagAdjectiveTextfieldObject                      .show();
            addTagGroupTagNegativeAdjectiveTextfieldObject              .hide();
            addTagGroupTagAdverbTextfieldObject                         .hide();
            addTagGroupTagNegativeAdverbTextfieldObject                 .hide();

        }
        else if(tempSelectedTagTypeNameFullString.equals("NEGATIVE ADJECTIVE"))             {

            addTagGroupTagSubjectTextfieldObject                        .hide();
            addTagGroupTagSubjectPossesionTextfieldObject               .hide();
            addTagGroupTagIntransitiveVerb1TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerb2TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerb3TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerbIngTextfieldObject            .hide();
            addTagGroupTagIntransitiveVerbSTextfieldObject              .hide();
            addTagGroupTagNegativeIntransitiveVerb1TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerb2TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerb3TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerbIngTextfieldObject    .hide();
            addTagGroupTagNegativeIntransitiveVerbSTextfieldObject      .hide();
            addTagGroupTagTransitiveVerb1TextfieldObject                .hide();
            addTagGroupTagTransitiveVerb2TextfieldObject                .hide();
            addTagGroupTagTransitiveVerb3TextfieldObject                .hide();
            addTagGroupTagTransitiveVerbIngTextfieldObject              .hide();
            addTagGroupTagTransitiveVerbSTextfieldObject                .hide();
            addTagGroupTagNegativeTransitiveVerb1TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerb2TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerb3TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerbIngTextfieldObject      .hide();
            addTagGroupTagNegativeTransitiveVerbSTextfieldObject        .hide();
            addTagGroupTagNounAbstractTextfieldObject                   .hide();
            addTagGroupTagNounAbstractSTextfieldObject                  .hide();
            addTagGroupTagNounTextfieldObject                           .hide();
            addTagGroupTagNounSTextfieldObject                          .hide();
            addTagGroupTagAdjectiveTextfieldObject                      .hide();
            addTagGroupTagNegativeAdjectiveTextfieldObject              .show();
            addTagGroupTagAdverbTextfieldObject                         .hide();
            addTagGroupTagNegativeAdverbTextfieldObject                 .hide();

        }
        else if(tempSelectedTagTypeNameFullString.equals("ADVERB"))                         {

            addTagGroupTagSubjectTextfieldObject                        .hide();
            addTagGroupTagSubjectPossesionTextfieldObject               .hide();
            addTagGroupTagIntransitiveVerb1TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerb2TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerb3TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerbIngTextfieldObject            .hide();
            addTagGroupTagIntransitiveVerbSTextfieldObject              .hide();
            addTagGroupTagNegativeIntransitiveVerb1TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerb2TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerb3TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerbIngTextfieldObject    .hide();
            addTagGroupTagNegativeIntransitiveVerbSTextfieldObject      .hide();
            addTagGroupTagTransitiveVerb1TextfieldObject                .hide();
            addTagGroupTagTransitiveVerb2TextfieldObject                .hide();
            addTagGroupTagTransitiveVerb3TextfieldObject                .hide();
            addTagGroupTagTransitiveVerbIngTextfieldObject              .hide();
            addTagGroupTagTransitiveVerbSTextfieldObject                .hide();
            addTagGroupTagNegativeTransitiveVerb1TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerb2TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerb3TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerbIngTextfieldObject      .hide();
            addTagGroupTagNegativeTransitiveVerbSTextfieldObject        .hide();
            addTagGroupTagNounAbstractTextfieldObject                   .hide();
            addTagGroupTagNounAbstractSTextfieldObject                  .hide();
            addTagGroupTagNounTextfieldObject                           .hide();
            addTagGroupTagNounSTextfieldObject                          .hide();
            addTagGroupTagAdjectiveTextfieldObject                      .hide();
            addTagGroupTagNegativeAdjectiveTextfieldObject              .hide();
            addTagGroupTagAdverbTextfieldObject                         .show();
            addTagGroupTagNegativeAdverbTextfieldObject                 .hide();

        }
        else if(tempSelectedTagTypeNameFullString.equals("NEGATIVE ADVERB"))                {

            addTagGroupTagSubjectTextfieldObject                        .hide();
            addTagGroupTagSubjectPossesionTextfieldObject               .hide();
            addTagGroupTagIntransitiveVerb1TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerb2TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerb3TextfieldObject              .hide();
            addTagGroupTagIntransitiveVerbIngTextfieldObject            .hide();
            addTagGroupTagIntransitiveVerbSTextfieldObject              .hide();
            addTagGroupTagNegativeIntransitiveVerb1TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerb2TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerb3TextfieldObject      .hide();
            addTagGroupTagNegativeIntransitiveVerbIngTextfieldObject    .hide();
            addTagGroupTagNegativeIntransitiveVerbSTextfieldObject      .hide();
            addTagGroupTagTransitiveVerb1TextfieldObject                .hide();
            addTagGroupTagTransitiveVerb2TextfieldObject                .hide();
            addTagGroupTagTransitiveVerb3TextfieldObject                .hide();
            addTagGroupTagTransitiveVerbIngTextfieldObject              .hide();
            addTagGroupTagTransitiveVerbSTextfieldObject                .hide();
            addTagGroupTagNegativeTransitiveVerb1TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerb2TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerb3TextfieldObject        .hide();
            addTagGroupTagNegativeTransitiveVerbIngTextfieldObject      .hide();
            addTagGroupTagNegativeTransitiveVerbSTextfieldObject        .hide();
            addTagGroupTagNounAbstractTextfieldObject                   .hide();
            addTagGroupTagNounAbstractSTextfieldObject                  .hide();
            addTagGroupTagNounTextfieldObject                           .hide();
            addTagGroupTagNounSTextfieldObject                          .hide();
            addTagGroupTagAdjectiveTextfieldObject                      .hide();
            addTagGroupTagNegativeAdjectiveTextfieldObject              .hide();
            addTagGroupTagAdverbTextfieldObject                         .hide();
            addTagGroupTagNegativeAdverbTextfieldObject                 .show();

        }

    }

}