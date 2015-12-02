import java.util.*;
import controlP5.*;

class RemoveMuseumGroupGUIObject extends GroupGUIObject{

    ControlP5       removeMuseumGroupControlP5Object;
    Group           removeMuseumGroupObject;

    RemoveMuseumGroupGUIObject(

        int             _guiXInt        ,
        int             _guiYInt        ,
        int             _guiWidthInt    ,
        int             _guiHeightInt   ,
        PApplet         _pAppletObject

    ){

        super                                   (_guiXInt, _guiYInt, _guiWidthInt, _guiHeightInt, _pAppletObject);
        removeMuseumGroupControlP5Object        = new ControlP5(pAppletObject);



        removeMuseumGroupObject                                         =
            removeMuseumGroupControlP5Object    .addGroup               ("EditMuseumObjectGroupObject")
                                                .close                  ()
                                                .setBackgroundColor     (groupBackgroundColor)
                                                .setBackgroundHeight    (guiHeightInt)
                                                .setColor               (defaultCColor)
                                                .setColorBackground     (groupColorBackgroundColor)
                                                .setColorLabel          (groupColorLabelColor)
                                                .setLabel               ("REMOVE MUSEUM OBJECT:")
                                                .setPosition            (guiXInt, guiYInt)
                                                .setWidth               (guiWidthInt);



    }

    void DrawVoid(float   _alphaFloat){

        super.DrawVoid(_alphaFloat, removeMuseumGroupObject);

    }

}