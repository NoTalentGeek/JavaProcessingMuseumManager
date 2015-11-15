import java.util.*;
import controlP5.*;

class AddPlayerGroupGUIObject extends GroupGUIObject{

    ControlP5       addPlayerGroupControlP5Object                           ;

    Group           removePlayerGroupObject                                 ;

    String          tempExhibitionStartNameAltString                        = "";

    Group           addPlayerGroupObject                                    ;
    Textlabel       addPlayerGroupPlayerIndexTextlabelObject                ;
    Textlabel       addPlayerGroupPlayerIndexValueTextlabelObject           ;
    ScrollableList  addPlayerGroupPickExhibitionStartScrollableListObject   ;
    Textfield       addPlayerGroupPlayerNameTextfieldObject                 ;
    Button          addPlayerGroupPlayerAddButtonObject                     ;

    AddPlayerGroupGUIObject                                         (

        int         _guiXInt                    ,
        int         _guiYInt                    ,
        int         _guiWidthInt                ,
        int         _guiHeightInt               ,
        Group       _removePlayerGroupObject    ,
        PApplet     _pAppletObject

    ){

        super                                                       (_guiXInt, _guiYInt, _guiWidthInt, _guiHeightInt, _pAppletObject);
        addPlayerGroupControlP5Object                               = new ControlP5(pAppletObject);

        removePlayerGroupObject                                     = _removePlayerGroupObject;

        addPlayerGroupObject                                        =
            addPlayerGroupControlP5Object   .addGroup               ("AddPlayerGroupObject")
                                            .close                  ()
                                            .setBackgroundColor     (groupBackgroundColor)
                                            .setBackgroundHeight    (guiHeightInt)
                                            .setColor               (defaultCColor)
                                            .setColorBackground     (groupColorBackgroundColor)
                                            .setColorLabel          (groupColorLabelColor)
                                            .setLabel               ("ADD VISITOR:")
                                            .setPosition            (guiXInt, guiYInt)
                                            .setWidth               (guiWidthInt);



        addPlayerGroupPlayerIndexTextlabelObject                    =
            addPlayerGroupControlP5Object   .addTextlabel           ("AddPlayerGroupPlayerIndexTextlabelObject")
                                            .setColor               (defaultCColor)
                                            .setColorValue          (255)
                                            .setGroup               (addPlayerGroupObject)
                                            .setPosition            (guiElement2CollumnFirstCollumnXInt, guiLayoutOffsetInt)
                                            .setText                ("VISITOR INDEX:");



        addPlayerGroupPlayerIndexValueTextlabelObject               =
            addPlayerGroupControlP5Object   .addTextlabel           ("AdPlayerGroupPlayerIndexValueTextlabelObject")
                                            .setColor               (defaultCColor)
                                            .setColorValue          (255)
                                            .setGroup               (addPlayerGroupObject)
                                            .setPosition            (guiElement2CollumnSecondCollumnXInt, guiLayoutOffsetInt)
                                            .setText                ("" + playerAmountInt);



        addPlayerGroupPickExhibitionStartScrollableListObject       =
            addPlayerGroupControlP5Object   .addScrollableList      ("AddPlayerGroupPickExhibitionStartScrollableListObject")
                                            .addItems               (exhibitionNameFullStringList)
                                            .setColor               (defaultCColor)
                                            .setGroup               (addPlayerGroupObject)
                                            .setLabel               ("PICK STARTING EXHIBITION:")
                                            .setPosition            (guiElement1CollumnFirstCollumnXInt, (guiLayoutOffsetInt*3))
                                            .setSize                (guiElement1CollumnWidth, guiScrollableList5RowHeightInt)
                                            .setType                (ControlP5.LIST);



        addPlayerGroupPlayerNameTextfieldObject                     =
            addPlayerGroupControlP5Object   .addTextfield           ("AddPlayerGroupPlayerNameTextfieldObject")
                                            .setColor               (defaultCColor)
                                            .setGroup               (addPlayerGroupObject)
                                            .setLabel               ("VISITOR NAME:")
                                            .setPosition            (guiElement2CollumnFirstCollumnXInt, ((guiLayoutOffsetInt*4) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2CollumnWidth, guiElement2LineHeight);



        addPlayerGroupPlayerAddButtonObject                         =
            addPlayerGroupControlP5Object   .addButton              ("AddPlayerGroupPlayerAddButtonObject")
                                            .setColor               (defaultCColor)
                                            .setGroup               (addPlayerGroupObject)
                                            .setLabel               ("ADD PLAYER")
                                            .setPosition            (guiElement2CollumnSecondCollumnXInt, ((guiLayoutOffsetInt*4) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2CollumnWidth, guiElement2LineHeight);

    }

    void DrawVoid                                                   (float   _alphaFloat){

        super.DrawVoid(_alphaFloat, addPlayerGroupObject);

        /*Specify the position of another controller below this group controller.*/
        if      (addPlayerGroupObject.isOpen() == true ){

                removePlayerGroupObject.setPosition(
                    addPlayerGroupObject.getPosition()[0],
                    addPlayerGroupObject.getPosition()[1] + guiHeightInt + guiLayoutOffsetInt
                );

        }
        else if (addPlayerGroupObject.isOpen() == false){

                removePlayerGroupObject.setPosition(
                    addPlayerGroupObject.getPosition()[0],
                    addPlayerGroupObject.getPosition()[1] + guiLayoutOffsetInt
                );

        }

    }

}