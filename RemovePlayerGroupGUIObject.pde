import java.util.*;
import controlP5.*;

class RemovePlayerGroupGUIObject extends GroupGUIObject{

    ControlP5       removePlayerGroupControlP5Object                            ;

    ObjectPlayer    tempPlayerToRemoveObject                                    ;

    /*ControlP5 related graphical user interface controller variables.*/
    Group           removePlayerGroupObject                                     ;
    ScrollableList  removePlayerGroupSelectPlayerToRemoveScrollableListObject   ;
    Button          removePlayerGroupRemoveButtonObject                         ;

    RemovePlayerGroupGUIObject                                        (

        int             _guiXInt                        ,
        int             _guiYInt                        ,
        int             _guiWidthInt                    ,
        int             _guiHeightInt                   ,
        PApplet         _pAppletObject

    ){

        super                                   (_guiXInt, _guiYInt, _guiWidthInt, _guiHeightInt, _pAppletObject);
        removePlayerGroupControlP5Object        = new ControlP5(pAppletObject);



        removePlayerGroupObject                                         =
            removePlayerGroupControlP5Object    .addGroup               ("RemovePlayerGroupObject")
                                                .close                  ()
                                                .setBackgroundColor     (groupBackgroundColor)
                                                .setBackgroundHeight    (guiHeightInt)
                                                .setColor               (defaultCColor)
                                                .setColorBackground     (groupColorBackgroundColor)
                                                .setColorLabel          (groupColorLabelColor)
                                                .setLabel               ("REMOVE VISITOR:")
                                                .setPosition            (guiXInt, guiYInt)
                                                .setWidth               (guiWidthInt);



        removePlayerGroupSelectPlayerToRemoveScrollableListObject       =
            removePlayerGroupControlP5Object    .addScrollableList      ("RemovePlayerGroupSelectPlayerToRemoveScrollableListObject")
                                                .addItems               (playerStringList)
                                                .setColor               (defaultCColor)
                                                .setGroup               (removePlayerGroupObject)
                                                .setLabel               ("PICK VISITOR YOU WANT TO REMOVE:")
                                                .setPosition            (guiElement1ColumnFirstColumnXInt, guiLayoutOffsetInt)
                                                .setSize                (guiElement1ColumnWidth, guiScrollableList5RowHeightInt)
                                                .setType                (ControlP5.LIST);



        removePlayerGroupRemoveButtonObject                             =
            removePlayerGroupControlP5Object    .addButton              ("RemovePlayerGroupRemoveButtonObject")
                                                .setColor               (defaultCColor)
                                                .setGroup               (removePlayerGroupObject)
                                                .setLabel               ("REMOVE VISITOR")
                                                .setPosition            (guiElement1ColumnFirstColumnXInt, ((guiLayoutOffsetInt*2) + guiScrollableList5RowHeightInt))
                                                .setSize                (guiElement1ColumnWidth, guiLayoutOffsetInt);



    }

    void DrawVoid(float _alphaFloat){

        super.DrawVoid(_alphaFloat, removePlayerGroupObject);

    }

}