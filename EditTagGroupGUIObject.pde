import java.util.*;
import controlP5.*;

class EditTagGroupGUIObject extends GroupGUIObject{

    ControlP5       editTagGroupControlP5Object                                 ;

    String          tempSelectedTagTypeString                                   = "";
    String          tempSelectedTagNameAltString                                = "";
    String          tempSelectedTagNameFullString                               = "";
    String          tempSelectedTagSubjectString                                = "";
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
    Textfield       addTagGroupTagNegativeAdverbTextfieldObject                 ;
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



         editTagGroupTagSubjectTextfieldObject                      =
            editTagGroupControllerP5Object   .editTextfield         ("EditTagGroupTagSubjectTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("SUBJECT:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagSubjectPossesionTextfieldObject              =
            editTagGroupControllerP5Object   .editTextfield         ("EditTagGroupTagSubjectPossesionTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("SUBJECT POSSESION:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagIntransitiveVerb1TextfieldObject             =
            editTagGroupControllerP5Object   .editTextfield         ("EditTagGroupTagIntransitiveVerb1TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("INTRANSITIVE VERB 1:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);


 
        editTagGroupTagIntransitiveVerb2TextfieldObject             =
            editTagGroupControllerP5Object   .editTextfield         ("EditTagGroupTagIntransitiveVerb2TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("INTRANSITIVE VERB 2:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagIntransitiveVerb3TextfieldObject             =
            editTagGroupControllerP5Object   .editTextfield         ("EditTagGroupTagIntransitiveVerb3TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("INTRANSITIVE VERB 3:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*10) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagIntransitiveVerbIngTextfieldObject           =
            editTagGroupControllerP5Object   .editTextfield         ("EditTagGroupTagIntransitiveVerbIngTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("INTRANSITIVE VERB + ING:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*10) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagIntransitiveVerbSTextfieldObject             =
            editTagGroupControllerP5Object   .editTextfield         ("EditTagGroupTagIntransitiveVerbSTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("INTRANSITIVE VERB + S:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*14) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNegativeIntransitiveVerb1TextfieldObject     =
            editTagGroupControllerP5Object   .editTextfield         ("EditTagGroupTagNegativeIntransitiveVerb1TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NEGATIVE INTRANSITIVE VERB 1:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNegativeIntransitiveVerb2TextfieldObject     =
            editTagGroupControllerP5Object   .editTextfield         ("EditTagGroupTagNegativeIntransitiveVerb2TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NEGATIVE INTRANSITIVE VERB 2:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNegativeIntransitiveVerb3TextfieldObject     =
            editTagGroupControllerP5Object   .editTextfield         ("EditTagGroupTagNegativeIntransitiveVerb3TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NEGATIVE INTRANSITIVE VERB 3:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*10) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNegativeIntransitiveVerbIngTextfieldObject   =
            editTagGroupControllerP5Object   .editTextfield         ("EditTagGroupTagNegativeIntransitiveVerbIngTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NEGATIVE INTRANSITIVE VERB + ING:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*10) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNegativeIntransitiveVerbSTextfieldObject     =
            editTagGroupControllerP5Object   .editTextfield         ("EditTagGroupTagNegativeIntransitiveVerbSTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NEGATIVE INTRANSITIVE VERB + S:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*14) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagTransitiveVerb1TextfieldObject               =
            editTagGroupControllerP5Object   .editTextfield         ("EditTagGroupTagTransitiveVerb1TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("TRANSITIVE VERB 1:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagTransitiveVerb2TextfieldObject               =
            editTagGroupControllerP5Object   .editTextfield         ("EditTagGroupTagTransitiveVerb2TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("TRANSITIVE VERB 2:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagTransitiveVerb3TextfieldObject               =
            editTagGroupControllerP5Object   .editTextfield         ("EditTagGroupTagTransitiveVerb3TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("TRANSITIVE VERB 3:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*10) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagTransitiveVerbIngTextfieldObject             =
            editTagGroupControllerP5Object   .editTextfield         ("EditTagGroupTagTransitiveVerbIngTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("TRANSITIVE VERB + ING:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*10) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagTransitiveVerbSTextfieldObject               =
            editTagGroupControllerP5Object   .editTextfield         ("EditTagGroupTagTransitiveVerbSTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("TRANSITIVE VERB + S:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*14) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNegativeTransitiveVerb1TextfieldObject       =
            editTagGroupControllerP5Object   .editTextfield         ("EditTagGroupTagNegativeTransitiveVerb1TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NEGATIVE TRANSITIVE VERB 1:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNegativeTransitiveVerb2TextfieldObject       =
            editTagGroupControllerP5Object   .editTextfield         ("EditTagGroupTagNegativeTransitiveVerb2TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NEGATIVE TRANSITIVE VERB 2:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNegativeTransitiveVerb3TextfieldObject       =
            editTagGroupControllerP5Object   .editTextfield         ("EditTagGroupTagNegativeTransitiveVerb3TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NEGATIVE TRANSITIVE VERB 3:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*10) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNegativeTransitiveVerbIngTextfieldObject     =
            editTagGroupControllerP5Object   .editTextfield         ("EditTagGroupTagNegativeTransitiveVerbIngTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NEGATIVE TRANSITIVE VERB + ING:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*10) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNegativeTransitiveVerbSTextfieldObject       =
            editTagGroupControllerP5Object   .editTextfield         ("EditTagGroupTagNegativeTransitiveVerbSTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NEGATIVE TRANSITIVE VERB + S:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*14) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNounAbstractTextfieldObject                  =
            editTagGroupControllerP5Object   .editTextfield         ("EditTagGroupTagNounAbstractTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NOUN ABSTRACT:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNounAbstractSTextfieldObject                 =
            editTagGroupControllerP5Object   .editTextfield         ("EditTagGroupTagNounAbstractSTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NOUN ABSTRACT + S:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNounTextfieldObject                          =
            editTagGroupControllerP5Object   .editTextfield         ("EditTagGroupTagNounTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NOUN:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNounSTextfieldObject                         =
            editTagGroupControllerP5Object   .editTextfield         ("EditTagGroupTagNounSTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NOUN + S:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagAdjectiveTextfieldObject                     =
            editTagGroupControllerP5Object   .editTextfield         ("EditTagGroupTagAdjectiveTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("ADJECTIVE:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNegativeAdjectiveTextfieldObject             =
            editTagGroupControllerP5Object   .editTextfield         ("EditTagGroupTagNegativeAdjectiveTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("NEGATIVE ADJECTIVE:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagAdverbTextfieldObject                        =
            editTagGroupControllerP5Object   .editTextfield         ("EditTagGroupTagAdverbTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (editTagGroupObject)
                                            .setLabel               ("ADVERB:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList4RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        editTagGroupTagNegativeAdverbTextfieldObject                =
            editTagGroupControllerP5Object   .editTextfield         ("EditTagGroupTagNegativeAdverbTextfieldObject")
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
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*14) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



    }

    void DrawVoid(float   _alphaFloat){

        super.DrawVoid(_alphaFloat, editTagGroupObject);

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

    void GenerateAllTagNameFullVoid(){

        tempTagNameFullStringList.addAll(adjectiveTagNameFullStringList                 );
        tempTagNameFullStringList.addAll(adverbTagNameFullStringList                    );
        tempTagNameFullStringList.addAll(intransitiveverbTagNameFullStringList          );
        tempTagNameFullStringList.addAll(negativeAdjectiveTagNameFullStringList         );
        tempTagNameFullStringList.addAll(negativeAdverbTagNameFullStringList            );
        tempTagNameFullStringList.addAll(negativeIntransitiveVerbTagNameFullStringList  );
        tempTagNameFullStringList.addAll(negativeTransitiveVerbTagNameFullStringList    );
        tempTagNameFullStringList.addAll(nounAbstractTagNameFullStringList              );
        tempTagNameFullStringList.addAll(nounTagNameFullStringList                      );
        tempTagNameFullStringList.addAll(subjectTagNameFullStringList                   );
        tempTagNameFullStringList.addAll(transitiveverbTagNameFullStringList            );

    }

}