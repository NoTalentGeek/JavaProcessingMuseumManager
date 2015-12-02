import java.util.*;
import controlP5.*;

class EditMuseumGroupGUIObject extends GroupGUIObject{

    ControlP5       editMuseumGroupControlP5Object              ;
    Group           editMuseumGroupObject                       ;
    Button          editMuseumGroupResetAllMuseumButtonObject   ;

    EditMuseumGroupGUIObject(

        int             _guiXInt        ,
        int             _guiYInt        ,
        int             _guiWidthInt    ,
        int             _guiHeightInt   ,
        PApplet         _pAppletObject

    ){

        super                                   (_guiXInt, _guiYInt, _guiWidthInt, _guiHeightInt, _pAppletObject);
        editMuseumGroupControlP5Object    = new ControlP5(pAppletObject);



        editMuseumGroupObject                                       =
            editMuseumGroupControlP5Object  
                .addGroup                                           ("EditMuseumObjectGroupObject")
                .close                                              ()
                .setBackgroundColor                                 (groupBackgroundColor)
                .setBackgroundHeight                                (guiHeightInt)
                .setColor                                           (defaultCColor)
                .setColorBackground                                 (groupColorBackgroundColor)
                .setColorLabel                                      (groupColorLabelColor)
                .setLabel                                           ("EDIT MUSEUM OBJECT:")
                .setPosition                                        (guiXInt, guiYInt)
                .setWidth                                           (guiWidthInt);



        editMuseumGroupResetAllMuseumButtonObject                   =
            editMuseumGroupControlP5Object
                .addButton                                          ("EditMuseumGroupResetAllMuseumButtonObject")
                .setColor                                           (defaultCColor)
                .setGroup                                           (editMuseumGroupObject)
                .setLabel                                           ("RESET ALL MUSEUM OBJECT")
                .setPosition                                        (guiElement1ColumnFirstColumnXInt, guiLayoutOffsetInt)
                .setSize                                            (guiElement1ColumnWidth, guiLayoutOffsetInt);



    }

    void DrawVoid(float   _alphaFloat){

        super.DrawVoid(_alphaFloat, editMuseumGroupObject);

    }

}