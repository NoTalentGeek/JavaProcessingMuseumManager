import java.util.*;
import controlP5.*;

class RemoveTagGroupGUIObject extends GroupGUIObject{

    ControlP5       removeTagGroupControlP5Object;
    Group           removeTagGroupObject;

    RemoveTagGroupGUIObject(

        int             _guiXInt        ,
        int             _guiYInt        ,
        int             _guiWidthInt    ,
        int             _guiHeightInt   ,
        PApplet         _pAppletObject

    ){

        super                                   (_guiXInt, _guiYInt, _guiWidthInt, _guiHeightInt, _pAppletObject);
        removeTagGroupControlP5Object           = new ControlP5(pAppletObject);



        removeTagGroupObject                                        =
            removeTagGroupControlP5Object   .addGroup               ("RemoveTagGroupObject")
                                            .close                  ()
                                            .setBackgroundColor     (groupBackgroundColor)
                                            .setBackgroundHeight    (guiHeightInt)
                                            .setColor               (defaultCColor)
                                            .setColorBackground     (groupColorBackgroundColor)
                                            .setColorLabel          (groupColorLabelColor)
                                            .setLabel               ("REMOVE TAG:")
                                            .setPosition            (guiXInt, guiYInt)
                                            .setWidth               (guiWidthInt);



    }

    void DrawVoid(float   _alphaFloat){

        super.DrawVoid(_alphaFloat, removeTagGroupObject);

    }

}