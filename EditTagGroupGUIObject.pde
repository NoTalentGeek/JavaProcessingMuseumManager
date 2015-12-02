import java.util.*;
import controlP5.*;

class EditTagGroupGUIObject extends GroupGUIObject{

    ControlP5       editTagGroupControlP5Object                                 ;

    String          tempSelectedTagTypeNameAltString                            = "";
    String          tempSelectedTagNameAltString                                = "";
    String          tempSelectedTagNameFullString                               = "";
    String          tempSelectedTagSubjectString                                = "";
    String          tempSelectedTagSubjectPossesionString                       = "";
    String          tempSelectedTagIntransitiveVerb1String                      = "";
    String          tempSelectedTagIntransitiveVerb2String                      = "";
    String          tempSelectedTagIntransitiveVerb3String                      = "";
    String          tempSelectedTagIntransitiveVerbIngString                    = "";
    String          tempSelectedTagIntransitiveVerbSString                      = "";
    String          tempSelectedTagNegativeIntransitiveVerb1String              = "";
    String          tempSelectedTagNegativeIntransitiveVerb2String              = "";
    String          tempSelectedTagNegativeIntransitiveVerb3String              = "";
    String          tempSelectedTagNegativeIntransitiveVerbIngString            = "";
    String          tempSelectedTagNegativeIntransitiveVerbSString              = "";
    String          tempSelectedTagTransitiveVerb1String                        = "";
    String          tempSelectedTagTransitiveVerb2String                        = "";
    String          tempSelectedTagTransitiveVerb3String                        = "";
    String          tempSelectedTagTransitiveVerbIngString                      = "";
    String          tempSelectedTagTransitiveVerbSString                        = "";
    String          tempSelectedTagNegativeTransitiveVerb1String                = "";
    String          tempSelectedTagNegativeTransitiveVerb2String                = "";
    String          tempSelectedTagNegativeTransitiveVerb3String                = "";
    String          tempSelectedTagNegativeTransitiveVerbIngString              = "";
    String          tempSelectedTagNegativeTransitiveVerbSString                = "";
    String          tempSelectedTagNounAbstractString                           = "";
    String          tempSelectedTagNounAbstractSString                          = "";
    String          tempSelectedTagNounString                                   = "";
    String          tempSelectedTagNounSString                                  = "";
    String          tempSelectedTagAdjectiveString                              = "";
    String          tempSelectedTagNegativeAdjectiveString                      = "";
    String          tempSelectedTagAdverbString                                 = "";
    String          tempSelectedTagNegativeAdverbString                         = "";
    Tag             tempSelectedTagObject                                       = null;
    List<String>    tempTagNameFullStringList                                   = new ArrayList<String>();

    Group           editTagGroupObject                                          ;
    ScrollableList  editTagGroupSelectTagScrollableListObject                   ;
    Textfield       editTagGroupTagNameAltTextfieldObject                       ;
    Textfield       editTagGroupTagNameFullTextfieldObject                      ;
    Textfield       editTagGroupTagSubjectTextfieldObject                       ;
    Textfield       editTagGroupTagSubjectPossesionTextfieldObject              ;
    Textfield       editTagGroupTagIntransitiveVerb1TextfieldObject             ;
    Textfield       editTagGroupTagIntransitiveVerb2TextfieldObject             ;
    Textfield       editTagGroupTagIntransitiveVerb3TextfieldObject             ;
    Textfield       editTagGroupTagIntransitiveVerbIngTextfieldObject           ;
    Textfield       editTagGroupTagIntransitiveVerbSTextfieldObject             ;
    Textfield       editTagGroupTagNegativeIntransitiveVerb1TextfieldObject     ;
    Textfield       editTagGroupTagNegativeIntransitiveVerb2TextfieldObject     ;
    Textfield       editTagGroupTagNegativeIntransitiveVerb3TextfieldObject     ;
    Textfield       editTagGroupTagNegativeIntransitiveVerbIngTextfieldObject   ;
    Textfield       editTagGroupTagNegativeIntransitiveVerbSTextfieldObject     ;
    Textfield       editTagGroupTagTransitiveVerb1TextfieldObject               ;
    Textfield       editTagGroupTagTransitiveVerb2TextfieldObject               ;
    Textfield       editTagGroupTagTransitiveVerb3TextfieldObject               ;
    Textfield       editTagGroupTagTransitiveVerbIngTextfieldObject             ;
    Textfield       editTagGroupTagTransitiveVerbSTextfieldObject               ;
    Textfield       editTagGroupTagNegativeTransitiveVerb1TextfieldObject       ;
    Textfield       editTagGroupTagNegativeTransitiveVerb2TextfieldObject       ;
    Textfield       editTagGroupTagNegativeTransitiveVerb3TextfieldObject       ;
    Textfield       editTagGroupTagNegativeTransitiveVerbIngTextfieldObject     ;
    Textfield       editTagGroupTagNegativeTransitiveVerbSTextfieldObject       ;
    Textfield       editTagGroupTagNounAbstractTextfieldObject                  ;
    Textfield       editTagGroupTagNounAbstractSTextfieldObject                 ;
    Textfield       editTagGroupTagNounTextfieldObject                          ;
    Textfield       editTagGroupTagNounSTextfieldObject                         ;
    Textfield       editTagGroupTagAdjectiveTextfieldObject                     ;
    Textfield       editTagGroupTagNegativeAdjectiveTextfieldObject             ;
    Textfield       editTagGroupTagAdverbTextfieldObject                        ;
    Textfield       editTagGroupTagNegativeAdverbTextfieldObject                ;
    Button          editTagGroupTagEditButtonObject                             ;

    EditTagGroupGUIObject(

        int             _guiXInt        ,
        int             _guiYInt        ,
        int             _guiWidthInt    ,
        int             _guiHeightInt   ,
        PApplet         _pAppletObject

    ){

        super                                   (_guiXInt, _guiYInt, _guiWidthInt, _guiHeightInt, _pAppletObject);
        editTagGroupControlP5Object             = new ControlP5(pAppletObject);

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
                                            .setSize                (guiElement1ColumnWidth, guiScrollableList4RowHeightInt)
                                            .setType                (ControlP5.LIST);



        editTagGroupTagNameAltTextfieldObject                       =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagNameAltTextfieldObject")
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("TAG NAME FULL:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*2) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNameFullTextfieldObject                      =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagNameFullTextfieldObject")
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("TAG NAME ALT:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*2) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



         editTagGroupTagSubjectTextfieldObject                      =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagSubjectTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("SUBJECT:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagSubjectPossesionTextfieldObject              =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagSubjectPossesionTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("SUBJECT POSSESION:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagIntransitiveVerb1TextfieldObject             =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagIntransitiveVerb1TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("INTRANSITIVE VERB 1:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);


 
        editTagGroupTagIntransitiveVerb2TextfieldObject             =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagIntransitiveVerb2TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("INTRANSITIVE VERB 2:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagIntransitiveVerb3TextfieldObject             =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagIntransitiveVerb3TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("INTRANSITIVE VERB 3:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*10) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagIntransitiveVerbIngTextfieldObject           =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagIntransitiveVerbIngTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("INTRANSITIVE VERB + ING:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*10) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagIntransitiveVerbSTextfieldObject             =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagIntransitiveVerbSTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("INTRANSITIVE VERB + S:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*14) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNegativeIntransitiveVerb1TextfieldObject     =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagNegativeIntransitiveVerb1TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NEGATIVE INTRANSITIVE VERB 1:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNegativeIntransitiveVerb2TextfieldObject     =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagNegativeIntransitiveVerb2TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NEGATIVE INTRANSITIVE VERB 2:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNegativeIntransitiveVerb3TextfieldObject     =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagNegativeIntransitiveVerb3TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NEGATIVE INTRANSITIVE VERB 3:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*10) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNegativeIntransitiveVerbIngTextfieldObject   =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagNegativeIntransitiveVerbIngTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NEGATIVE INTRANSITIVE VERB + ING:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*10) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNegativeIntransitiveVerbSTextfieldObject     =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagNegativeIntransitiveVerbSTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NEGATIVE INTRANSITIVE VERB + S:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*14) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagTransitiveVerb1TextfieldObject               =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagTransitiveVerb1TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("TRANSITIVE VERB 1:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagTransitiveVerb2TextfieldObject               =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagTransitiveVerb2TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("TRANSITIVE VERB 2:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagTransitiveVerb3TextfieldObject               =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagTransitiveVerb3TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("TRANSITIVE VERB 3:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*10) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagTransitiveVerbIngTextfieldObject             =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagTransitiveVerbIngTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("TRANSITIVE VERB + ING:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*10) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagTransitiveVerbSTextfieldObject               =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagTransitiveVerbSTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("TRANSITIVE VERB + S:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*14) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNegativeTransitiveVerb1TextfieldObject       =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagNegativeTransitiveVerb1TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NEGATIVE TRANSITIVE VERB 1:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNegativeTransitiveVerb2TextfieldObject       =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagNegativeTransitiveVerb2TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NEGATIVE TRANSITIVE VERB 2:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNegativeTransitiveVerb3TextfieldObject       =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagNegativeTransitiveVerb3TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NEGATIVE TRANSITIVE VERB 3:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*10) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNegativeTransitiveVerbIngTextfieldObject     =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagNegativeTransitiveVerbIngTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NEGATIVE TRANSITIVE VERB + ING:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*10) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNegativeTransitiveVerbSTextfieldObject       =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagNegativeTransitiveVerbSTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NEGATIVE TRANSITIVE VERB + S:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*14) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNounAbstractTextfieldObject                  =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagNounAbstractTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NOUN ABSTRACT:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNounAbstractSTextfieldObject                 =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagNounAbstractSTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NOUN ABSTRACT + S:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNounTextfieldObject                          =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagNounTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NOUN:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNounSTextfieldObject                         =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagNounSTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NOUN + S:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagAdjectiveTextfieldObject                     =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagAdjectiveTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("ADJECTIVE:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNegativeAdjectiveTextfieldObject             =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagNegativeAdjectiveTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NEGATIVE ADJECTIVE:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagAdverbTextfieldObject                        =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagAdverbTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("ADVERB:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNegativeAdverbTextfieldObject                =
            editTagGroupControlP5Object     .addTextfield           ("EditTagGroupTagNegativeAdverbTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NEGATIVE ADVERB:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);


        editTagGroupTagEditButtonObject                             =
            editTagGroupControlP5Object     .addButton              ("EditTagGroupTagEditButtonObject")
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("EDIT TAG")  
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*14) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



    }

    void DrawVoid(float   _alphaFloat){

        super.DrawVoid(_alphaFloat, editTagGroupObject);

        ControlFormVoid();

        editTagGroupTagNameAltTextfieldObject                        .setColorValue(groupColorLabelColor);
        editTagGroupTagNameFullTextfieldObject                       .setColorValue(groupColorLabelColor);
        editTagGroupTagSubjectTextfieldObject                        .setColorValue(groupColorLabelColor);
        editTagGroupTagSubjectPossesionTextfieldObject               .setColorValue(groupColorLabelColor);
        editTagGroupTagIntransitiveVerb1TextfieldObject              .setColorValue(groupColorLabelColor);
        editTagGroupTagIntransitiveVerb2TextfieldObject              .setColorValue(groupColorLabelColor);
        editTagGroupTagIntransitiveVerb3TextfieldObject              .setColorValue(groupColorLabelColor);
        editTagGroupTagIntransitiveVerbIngTextfieldObject            .setColorValue(groupColorLabelColor);
        editTagGroupTagIntransitiveVerbSTextfieldObject              .setColorValue(groupColorLabelColor);
        editTagGroupTagNegativeIntransitiveVerb1TextfieldObject      .setColorValue(groupColorLabelColor);
        editTagGroupTagNegativeIntransitiveVerb2TextfieldObject      .setColorValue(groupColorLabelColor);
        editTagGroupTagNegativeIntransitiveVerb3TextfieldObject      .setColorValue(groupColorLabelColor);
        editTagGroupTagNegativeIntransitiveVerbIngTextfieldObject    .setColorValue(groupColorLabelColor);
        editTagGroupTagNegativeIntransitiveVerbSTextfieldObject      .setColorValue(groupColorLabelColor);
        editTagGroupTagTransitiveVerb1TextfieldObject                .setColorValue(groupColorLabelColor);
        editTagGroupTagTransitiveVerb2TextfieldObject                .setColorValue(groupColorLabelColor);
        editTagGroupTagTransitiveVerb3TextfieldObject                .setColorValue(groupColorLabelColor);
        editTagGroupTagTransitiveVerbIngTextfieldObject              .setColorValue(groupColorLabelColor);
        editTagGroupTagTransitiveVerbSTextfieldObject                .setColorValue(groupColorLabelColor);
        editTagGroupTagNegativeTransitiveVerb1TextfieldObject        .setColorValue(groupColorLabelColor);
        editTagGroupTagNegativeTransitiveVerb2TextfieldObject        .setColorValue(groupColorLabelColor);
        editTagGroupTagNegativeTransitiveVerb3TextfieldObject        .setColorValue(groupColorLabelColor);
        editTagGroupTagNegativeTransitiveVerbIngTextfieldObject      .setColorValue(groupColorLabelColor);
        editTagGroupTagNegativeTransitiveVerbSTextfieldObject        .setColorValue(groupColorLabelColor);
        editTagGroupTagNounAbstractTextfieldObject                   .setColorValue(groupColorLabelColor);
        editTagGroupTagNounAbstractSTextfieldObject                  .setColorValue(groupColorLabelColor);
        editTagGroupTagNounTextfieldObject                           .setColorValue(groupColorLabelColor);
        editTagGroupTagNounSTextfieldObject                          .setColorValue(groupColorLabelColor);
        editTagGroupTagAdjectiveTextfieldObject                      .setColorValue(groupColorLabelColor);
        editTagGroupTagNegativeAdjectiveTextfieldObject              .setColorValue(groupColorLabelColor);
        editTagGroupTagAdverbTextfieldObject                         .setColorValue(groupColorLabelColor);
        editTagGroupTagNegativeAdverbTextfieldObject                 .setColorValue(groupColorLabelColor);

    }

    /*Show the necessary text field according to the selected type tag.*/
    void ControlFormVoid(){

        if(tempSelectedTagTypeNameAltString.equals("SUB")){

            editTagGroupTagSubjectTextfieldObject                        .show();
            editTagGroupTagSubjectPossesionTextfieldObject               .show();
            editTagGroupTagIntransitiveVerb1TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerb2TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerb3TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerbIngTextfieldObject            .hide();
            editTagGroupTagIntransitiveVerbSTextfieldObject              .hide();
            editTagGroupTagNegativeIntransitiveVerb1TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerb2TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerb3TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerbIngTextfieldObject    .hide();
            editTagGroupTagNegativeIntransitiveVerbSTextfieldObject      .hide();
            editTagGroupTagTransitiveVerb1TextfieldObject                .hide();
            editTagGroupTagTransitiveVerb2TextfieldObject                .hide();
            editTagGroupTagTransitiveVerb3TextfieldObject                .hide();
            editTagGroupTagTransitiveVerbIngTextfieldObject              .hide();
            editTagGroupTagTransitiveVerbSTextfieldObject                .hide();
            editTagGroupTagNegativeTransitiveVerb1TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerb2TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerb3TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerbIngTextfieldObject      .hide();
            editTagGroupTagNegativeTransitiveVerbSTextfieldObject        .hide();
            editTagGroupTagNounAbstractTextfieldObject                   .hide();
            editTagGroupTagNounAbstractSTextfieldObject                  .hide();
            editTagGroupTagNounTextfieldObject                           .hide();
            editTagGroupTagNounSTextfieldObject                          .hide();
            editTagGroupTagAdjectiveTextfieldObject                      .hide();
            editTagGroupTagNegativeAdjectiveTextfieldObject              .hide();
            editTagGroupTagAdverbTextfieldObject                         .hide();
            editTagGroupTagNegativeAdverbTextfieldObject                 .hide();

        }
        else if(tempSelectedTagTypeNameAltString.equals("IVR")){

            editTagGroupTagSubjectTextfieldObject                        .hide();
            editTagGroupTagSubjectPossesionTextfieldObject               .hide();
            editTagGroupTagIntransitiveVerb1TextfieldObject              .show();
            editTagGroupTagIntransitiveVerb2TextfieldObject              .show();
            editTagGroupTagIntransitiveVerb3TextfieldObject              .show();
            editTagGroupTagIntransitiveVerbIngTextfieldObject            .show();
            editTagGroupTagIntransitiveVerbSTextfieldObject              .show();
            editTagGroupTagNegativeIntransitiveVerb1TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerb2TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerb3TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerbIngTextfieldObject    .hide();
            editTagGroupTagNegativeIntransitiveVerbSTextfieldObject      .hide();
            editTagGroupTagTransitiveVerb1TextfieldObject                .hide();
            editTagGroupTagTransitiveVerb2TextfieldObject                .hide();
            editTagGroupTagTransitiveVerb3TextfieldObject                .hide();
            editTagGroupTagTransitiveVerbIngTextfieldObject              .hide();
            editTagGroupTagTransitiveVerbSTextfieldObject                .hide();
            editTagGroupTagNegativeTransitiveVerb1TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerb2TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerb3TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerbIngTextfieldObject      .hide();
            editTagGroupTagNegativeTransitiveVerbSTextfieldObject        .hide();
            editTagGroupTagNounAbstractTextfieldObject                   .hide();
            editTagGroupTagNounAbstractSTextfieldObject                  .hide();
            editTagGroupTagNounTextfieldObject                           .hide();
            editTagGroupTagNounSTextfieldObject                          .hide();
            editTagGroupTagAdjectiveTextfieldObject                      .hide();
            editTagGroupTagNegativeAdjectiveTextfieldObject              .hide();
            editTagGroupTagAdverbTextfieldObject                         .hide();
            editTagGroupTagNegativeAdverbTextfieldObject                 .hide();

        }
        else if(tempSelectedTagTypeNameAltString.equals("NIV")){

            editTagGroupTagSubjectTextfieldObject                        .hide();
            editTagGroupTagSubjectPossesionTextfieldObject               .hide();
            editTagGroupTagIntransitiveVerb1TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerb2TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerb3TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerbIngTextfieldObject            .hide();
            editTagGroupTagIntransitiveVerbSTextfieldObject              .hide();
            editTagGroupTagNegativeIntransitiveVerb1TextfieldObject      .show();
            editTagGroupTagNegativeIntransitiveVerb2TextfieldObject      .show();
            editTagGroupTagNegativeIntransitiveVerb3TextfieldObject      .show();
            editTagGroupTagNegativeIntransitiveVerbIngTextfieldObject    .show();
            editTagGroupTagNegativeIntransitiveVerbSTextfieldObject      .show();
            editTagGroupTagTransitiveVerb1TextfieldObject                .hide();
            editTagGroupTagTransitiveVerb2TextfieldObject                .hide();
            editTagGroupTagTransitiveVerb3TextfieldObject                .hide();
            editTagGroupTagTransitiveVerbIngTextfieldObject              .hide();
            editTagGroupTagTransitiveVerbSTextfieldObject                .hide();
            editTagGroupTagNegativeTransitiveVerb1TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerb2TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerb3TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerbIngTextfieldObject      .hide();
            editTagGroupTagNegativeTransitiveVerbSTextfieldObject        .hide();
            editTagGroupTagNounAbstractTextfieldObject                   .hide();
            editTagGroupTagNounAbstractSTextfieldObject                  .hide();
            editTagGroupTagNounTextfieldObject                           .hide();
            editTagGroupTagNounSTextfieldObject                          .hide();
            editTagGroupTagAdjectiveTextfieldObject                      .hide();
            editTagGroupTagNegativeAdjectiveTextfieldObject              .hide();
            editTagGroupTagAdverbTextfieldObject                         .hide();
            editTagGroupTagNegativeAdverbTextfieldObject                 .hide();

        }
        else if(tempSelectedTagTypeNameAltString.equals("TVR")){

            editTagGroupTagSubjectTextfieldObject                        .hide();
            editTagGroupTagSubjectPossesionTextfieldObject               .hide();
            editTagGroupTagIntransitiveVerb1TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerb2TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerb3TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerbIngTextfieldObject            .hide();
            editTagGroupTagIntransitiveVerbSTextfieldObject              .hide();
            editTagGroupTagNegativeIntransitiveVerb1TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerb2TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerb3TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerbIngTextfieldObject    .hide();
            editTagGroupTagNegativeIntransitiveVerbSTextfieldObject      .hide();
            editTagGroupTagTransitiveVerb1TextfieldObject                .show();
            editTagGroupTagTransitiveVerb2TextfieldObject                .show();
            editTagGroupTagTransitiveVerb3TextfieldObject                .show();
            editTagGroupTagTransitiveVerbIngTextfieldObject              .show();
            editTagGroupTagTransitiveVerbSTextfieldObject                .show();
            editTagGroupTagNegativeTransitiveVerb1TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerb2TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerb3TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerbIngTextfieldObject      .hide();
            editTagGroupTagNegativeTransitiveVerbSTextfieldObject        .hide();
            editTagGroupTagNounAbstractTextfieldObject                   .hide();
            editTagGroupTagNounAbstractSTextfieldObject                  .hide();
            editTagGroupTagNounTextfieldObject                           .hide();
            editTagGroupTagNounSTextfieldObject                          .hide();
            editTagGroupTagAdjectiveTextfieldObject                      .hide();
            editTagGroupTagNegativeAdjectiveTextfieldObject              .hide();
            editTagGroupTagAdverbTextfieldObject                         .hide();
            editTagGroupTagNegativeAdverbTextfieldObject                 .hide();

        }
        else if(tempSelectedTagTypeNameAltString.equals("NTV")){

            editTagGroupTagSubjectTextfieldObject                        .hide();
            editTagGroupTagSubjectPossesionTextfieldObject               .hide();
            editTagGroupTagIntransitiveVerb1TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerb2TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerb3TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerbIngTextfieldObject            .hide();
            editTagGroupTagIntransitiveVerbSTextfieldObject              .hide();
            editTagGroupTagNegativeIntransitiveVerb1TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerb2TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerb3TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerbIngTextfieldObject    .hide();
            editTagGroupTagNegativeIntransitiveVerbSTextfieldObject      .hide();
            editTagGroupTagTransitiveVerb1TextfieldObject                .hide();
            editTagGroupTagTransitiveVerb2TextfieldObject                .hide();
            editTagGroupTagTransitiveVerb3TextfieldObject                .hide();
            editTagGroupTagTransitiveVerbIngTextfieldObject              .hide();
            editTagGroupTagTransitiveVerbSTextfieldObject                .hide();
            editTagGroupTagNegativeTransitiveVerb1TextfieldObject        .show();
            editTagGroupTagNegativeTransitiveVerb2TextfieldObject        .show();
            editTagGroupTagNegativeTransitiveVerb3TextfieldObject        .show();
            editTagGroupTagNegativeTransitiveVerbIngTextfieldObject      .show();
            editTagGroupTagNegativeTransitiveVerbSTextfieldObject        .show();
            editTagGroupTagNounAbstractTextfieldObject                   .hide();
            editTagGroupTagNounAbstractSTextfieldObject                  .hide();
            editTagGroupTagNounTextfieldObject                           .hide();
            editTagGroupTagNounSTextfieldObject                          .hide();
            editTagGroupTagAdjectiveTextfieldObject                      .hide();
            editTagGroupTagNegativeAdjectiveTextfieldObject              .hide();
            editTagGroupTagAdverbTextfieldObject                         .hide();
            editTagGroupTagNegativeAdverbTextfieldObject                 .hide();

        }
        else if(tempSelectedTagTypeNameAltString.equals("NOA")){

            editTagGroupTagSubjectTextfieldObject                        .hide();
            editTagGroupTagSubjectPossesionTextfieldObject               .hide();
            editTagGroupTagIntransitiveVerb1TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerb2TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerb3TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerbIngTextfieldObject            .hide();
            editTagGroupTagIntransitiveVerbSTextfieldObject              .hide();
            editTagGroupTagNegativeIntransitiveVerb1TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerb2TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerb3TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerbIngTextfieldObject    .hide();
            editTagGroupTagNegativeIntransitiveVerbSTextfieldObject      .hide();
            editTagGroupTagTransitiveVerb1TextfieldObject                .hide();
            editTagGroupTagTransitiveVerb2TextfieldObject                .hide();
            editTagGroupTagTransitiveVerb3TextfieldObject                .hide();
            editTagGroupTagTransitiveVerbIngTextfieldObject              .hide();
            editTagGroupTagTransitiveVerbSTextfieldObject                .hide();
            editTagGroupTagNegativeTransitiveVerb1TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerb2TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerb3TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerbIngTextfieldObject      .hide();
            editTagGroupTagNegativeTransitiveVerbSTextfieldObject        .hide();
            editTagGroupTagNounAbstractTextfieldObject                   .show();
            editTagGroupTagNounAbstractSTextfieldObject                  .show();
            editTagGroupTagNounTextfieldObject                           .hide();
            editTagGroupTagNounSTextfieldObject                          .hide();
            editTagGroupTagAdjectiveTextfieldObject                      .hide();
            editTagGroupTagNegativeAdjectiveTextfieldObject              .hide();
            editTagGroupTagAdverbTextfieldObject                         .hide();
            editTagGroupTagNegativeAdverbTextfieldObject                 .hide();
        }
        else if(tempSelectedTagTypeNameAltString.equals("NOU")){

            editTagGroupTagSubjectTextfieldObject                        .hide();
            editTagGroupTagSubjectPossesionTextfieldObject               .hide();
            editTagGroupTagIntransitiveVerb1TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerb2TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerb3TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerbIngTextfieldObject            .hide();
            editTagGroupTagIntransitiveVerbSTextfieldObject              .hide();
            editTagGroupTagNegativeIntransitiveVerb1TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerb2TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerb3TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerbIngTextfieldObject    .hide();
            editTagGroupTagNegativeIntransitiveVerbSTextfieldObject      .hide();
            editTagGroupTagTransitiveVerb1TextfieldObject                .hide();
            editTagGroupTagTransitiveVerb2TextfieldObject                .hide();
            editTagGroupTagTransitiveVerb3TextfieldObject                .hide();
            editTagGroupTagTransitiveVerbIngTextfieldObject              .hide();
            editTagGroupTagTransitiveVerbSTextfieldObject                .hide();
            editTagGroupTagNegativeTransitiveVerb1TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerb2TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerb3TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerbIngTextfieldObject      .hide();
            editTagGroupTagNegativeTransitiveVerbSTextfieldObject        .hide();
            editTagGroupTagNounAbstractTextfieldObject                   .hide();
            editTagGroupTagNounAbstractSTextfieldObject                  .hide();
            editTagGroupTagNounTextfieldObject                           .show();
            editTagGroupTagNounSTextfieldObject                          .show();
            editTagGroupTagAdjectiveTextfieldObject                      .hide();
            editTagGroupTagNegativeAdjectiveTextfieldObject              .hide();
            editTagGroupTagAdverbTextfieldObject                         .hide();
            editTagGroupTagNegativeAdverbTextfieldObject                 .hide();

        }
        else if(tempSelectedTagTypeNameAltString.equals("ADJ")){

            editTagGroupTagSubjectTextfieldObject                        .hide();
            editTagGroupTagSubjectPossesionTextfieldObject               .hide();
            editTagGroupTagIntransitiveVerb1TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerb2TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerb3TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerbIngTextfieldObject            .hide();
            editTagGroupTagIntransitiveVerbSTextfieldObject              .hide();
            editTagGroupTagNegativeIntransitiveVerb1TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerb2TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerb3TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerbIngTextfieldObject    .hide();
            editTagGroupTagNegativeIntransitiveVerbSTextfieldObject      .hide();
            editTagGroupTagTransitiveVerb1TextfieldObject                .hide();
            editTagGroupTagTransitiveVerb2TextfieldObject                .hide();
            editTagGroupTagTransitiveVerb3TextfieldObject                .hide();
            editTagGroupTagTransitiveVerbIngTextfieldObject              .hide();
            editTagGroupTagTransitiveVerbSTextfieldObject                .hide();
            editTagGroupTagNegativeTransitiveVerb1TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerb2TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerb3TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerbIngTextfieldObject      .hide();
            editTagGroupTagNegativeTransitiveVerbSTextfieldObject        .hide();
            editTagGroupTagNounAbstractTextfieldObject                   .hide();
            editTagGroupTagNounAbstractSTextfieldObject                  .hide();
            editTagGroupTagNounTextfieldObject                           .hide();
            editTagGroupTagNounSTextfieldObject                          .hide();
            editTagGroupTagAdjectiveTextfieldObject                      .show();
            editTagGroupTagNegativeAdjectiveTextfieldObject              .hide();
            editTagGroupTagAdverbTextfieldObject                         .hide();
            editTagGroupTagNegativeAdverbTextfieldObject                 .hide();

        }
        else if(tempSelectedTagTypeNameAltString.equals("NDJ")){

            editTagGroupTagSubjectTextfieldObject                        .hide();
            editTagGroupTagSubjectPossesionTextfieldObject               .hide();
            editTagGroupTagIntransitiveVerb1TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerb2TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerb3TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerbIngTextfieldObject            .hide();
            editTagGroupTagIntransitiveVerbSTextfieldObject              .hide();
            editTagGroupTagNegativeIntransitiveVerb1TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerb2TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerb3TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerbIngTextfieldObject    .hide();
            editTagGroupTagNegativeIntransitiveVerbSTextfieldObject      .hide();
            editTagGroupTagTransitiveVerb1TextfieldObject                .hide();
            editTagGroupTagTransitiveVerb2TextfieldObject                .hide();
            editTagGroupTagTransitiveVerb3TextfieldObject                .hide();
            editTagGroupTagTransitiveVerbIngTextfieldObject              .hide();
            editTagGroupTagTransitiveVerbSTextfieldObject                .hide();
            editTagGroupTagNegativeTransitiveVerb1TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerb2TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerb3TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerbIngTextfieldObject      .hide();
            editTagGroupTagNegativeTransitiveVerbSTextfieldObject        .hide();
            editTagGroupTagNounAbstractTextfieldObject                   .hide();
            editTagGroupTagNounAbstractSTextfieldObject                  .hide();
            editTagGroupTagNounTextfieldObject                           .hide();
            editTagGroupTagNounSTextfieldObject                          .hide();
            editTagGroupTagAdjectiveTextfieldObject                      .hide();
            editTagGroupTagNegativeAdjectiveTextfieldObject              .show();
            editTagGroupTagAdverbTextfieldObject                         .hide();
            editTagGroupTagNegativeAdverbTextfieldObject                 .hide();

        }
        else if(tempSelectedTagTypeNameAltString.equals("ADV")){

            editTagGroupTagSubjectTextfieldObject                        .hide();
            editTagGroupTagSubjectPossesionTextfieldObject               .hide();
            editTagGroupTagIntransitiveVerb1TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerb2TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerb3TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerbIngTextfieldObject            .hide();
            editTagGroupTagIntransitiveVerbSTextfieldObject              .hide();
            editTagGroupTagNegativeIntransitiveVerb1TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerb2TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerb3TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerbIngTextfieldObject    .hide();
            editTagGroupTagNegativeIntransitiveVerbSTextfieldObject      .hide();
            editTagGroupTagTransitiveVerb1TextfieldObject                .hide();
            editTagGroupTagTransitiveVerb2TextfieldObject                .hide();
            editTagGroupTagTransitiveVerb3TextfieldObject                .hide();
            editTagGroupTagTransitiveVerbIngTextfieldObject              .hide();
            editTagGroupTagTransitiveVerbSTextfieldObject                .hide();
            editTagGroupTagNegativeTransitiveVerb1TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerb2TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerb3TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerbIngTextfieldObject      .hide();
            editTagGroupTagNegativeTransitiveVerbSTextfieldObject        .hide();
            editTagGroupTagNounAbstractTextfieldObject                   .hide();
            editTagGroupTagNounAbstractSTextfieldObject                  .hide();
            editTagGroupTagNounTextfieldObject                           .hide();
            editTagGroupTagNounSTextfieldObject                          .hide();
            editTagGroupTagAdjectiveTextfieldObject                      .hide();
            editTagGroupTagNegativeAdjectiveTextfieldObject              .hide();
            editTagGroupTagAdverbTextfieldObject                         .show();
            editTagGroupTagNegativeAdverbTextfieldObject                 .hide();

        }
        else if(tempSelectedTagTypeNameAltString.equals("NDV")){

            editTagGroupTagSubjectTextfieldObject                        .hide();
            editTagGroupTagSubjectPossesionTextfieldObject               .hide();
            editTagGroupTagIntransitiveVerb1TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerb2TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerb3TextfieldObject              .hide();
            editTagGroupTagIntransitiveVerbIngTextfieldObject            .hide();
            editTagGroupTagIntransitiveVerbSTextfieldObject              .hide();
            editTagGroupTagNegativeIntransitiveVerb1TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerb2TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerb3TextfieldObject      .hide();
            editTagGroupTagNegativeIntransitiveVerbIngTextfieldObject    .hide();
            editTagGroupTagNegativeIntransitiveVerbSTextfieldObject      .hide();
            editTagGroupTagTransitiveVerb1TextfieldObject                .hide();
            editTagGroupTagTransitiveVerb2TextfieldObject                .hide();
            editTagGroupTagTransitiveVerb3TextfieldObject                .hide();
            editTagGroupTagTransitiveVerbIngTextfieldObject              .hide();
            editTagGroupTagTransitiveVerbSTextfieldObject                .hide();
            editTagGroupTagNegativeTransitiveVerb1TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerb2TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerb3TextfieldObject        .hide();
            editTagGroupTagNegativeTransitiveVerbIngTextfieldObject      .hide();
            editTagGroupTagNegativeTransitiveVerbSTextfieldObject        .hide();
            editTagGroupTagNounAbstractTextfieldObject                   .hide();
            editTagGroupTagNounAbstractSTextfieldObject                  .hide();
            editTagGroupTagNounTextfieldObject                           .hide();
            editTagGroupTagNounSTextfieldObject                          .hide();
            editTagGroupTagAdjectiveTextfieldObject                      .hide();
            editTagGroupTagNegativeAdjectiveTextfieldObject              .hide();
            editTagGroupTagAdverbTextfieldObject                         .hide();
            editTagGroupTagNegativeAdverbTextfieldObject                 .show();

        }

    }

    void GenerateAllTagNameFullVoid(){

        tempTagNameFullStringList.addAll(adjectiveTagNameFullStringList                 );
        tempTagNameFullStringList.addAll(adverbTagNameFullStringList                    );
        tempTagNameFullStringList.addAll(intransitiveVerbTagNameFullStringList          );
        tempTagNameFullStringList.addAll(negativeAdjectiveTagNameFullStringList         );
        tempTagNameFullStringList.addAll(negativeAdverbTagNameFullStringList            );
        tempTagNameFullStringList.addAll(negativeIntransitiveVerbTagNameFullStringList  );
        tempTagNameFullStringList.addAll(negativeTransitiveVerbTagNameFullStringList    );
        tempTagNameFullStringList.addAll(nounAbstractTagNameFullStringList              );
        tempTagNameFullStringList.addAll(nounTagNameFullStringList                      );
        tempTagNameFullStringList.addAll(subjectTagNameFullStringList                   );
        tempTagNameFullStringList.addAll(transitiveVerbTagNameFullStringList            );

    }

}