import java.util.*;
import controlP5.*;

class GroupGUIObject{

    color           groupBackgroundColor                                        ;                           /*The color of group main  panel background color.*/
    color           groupColorBackgroundColor                                   ;                           /*The color of group title panel background color.*/
    color           groupColorLabelColor                                        ;                           /*The color of group title panel text       color.*/

    float           alphaFloat                                                  = 255;                      /*The opacity of all controllers in group object. */

    int             guiXInt                                                     ;                           /*The x position  of group object.*/
    int             guiYInt                                                     ;                           /*The y position  of group object.*/
    int             guiWidthInt                                                 ;                           /*The height size of group object.*/
    int             guiHeightInt                                                ;                           /*The width  size of group object.*/

    int             guiLayoutOffsetInt                                          = 10;                       /*The offset used to space each controllers in group object.*/

    int 			guiElement1CollumnFirstCollumnXInt 							;                           /*The x position of first  controller in 1 collumns row.*/
    int             guiElement2CollumnFirstCollumnXInt                          ;                           /*The x position of first  controller in 2 collumns row.*/
    int             guiElement2CollumnSecondCollumnXInt                         ;                           /*The x position of second controller in 2 collumns row.*/
    int             guiElement3CollumnFirstCollumnXInt                          ;                           /*The x position of first  controller in 3 collumns row.*/
    int             guiElement3CollumnSecondCollumnXInt                         ;                           /*The x position of second controller in 3 collumns row.*/
    int             guiElement3CollumnThirdCollumnXInt                          ;                           /*The x position of third  controller in 3 collumns row.*/

    int 			guiElement1CollumnWidth 									; 							/*The width of any controller in 1 collumn  row.*/
    int             guiElement2CollumnWidth                                     ;                           /*The width of any controller in 2 collumns row.*/
    int             guiElement3CollumnWidth                                     ;                           /*The width of any controller in 3 collumns row.*/

    int             guiElement1LineHeight                                       = 10;                       /*The height of any element that only one line height.
                                                                                                            For example, button, text label.*/
    int             guiElement2LineHeight                                       = 20;                       /*The height of any element that only one line height.
                                                                                                            For example, text field.*/

    int             guiScrollableList5RowHeightInt                              = 62;                       /*The height of scrollable list controller that contains four  elements with additional one element of controller's title panel.*/
    int             guiScrollableList4RowHeightInt                              = 50;                       /*The height of scrollable list controller that contains three elements with additional one element of controller's title panel.*/

    CColor          defaultCColor                                               = new CColor();             /*This is controller color for default                object.*/
    CColor          staticScrollableListCColor                                  = new CColor();             /*This is controller color for static scrollable list object.*/

    PApplet         pAppletObject                                               ;                           /*Refer this object back to main PApplet object.*/

    GroupGUIObject 		(

    	int     _guiXInt        ,
        int     _guiYInt        ,
        int     _guiWidthInt    ,
        int     _guiHeightInt   ,
        PApplet _pAppletObject

    ){

        guiXInt                                         =  _guiXInt                         ;
        guiYInt                                         = (_guiYInt + guiLayoutOffsetInt)   ;
        guiWidthInt                                     =  _guiWidthInt                     ;
        guiHeightInt                                    =  _guiHeightInt                    ;
        pAppletObject                                   =  _pAppletObject                   ;

        guiElement1CollumnWidth                         = ((guiWidthInt - (guiLayoutOffsetInt*2))/1)                ;
        guiElement2CollumnWidth                         = ((guiWidthInt - (guiLayoutOffsetInt*3))/2)                ;
        guiElement3CollumnWidth                         = ((guiWidthInt - (guiLayoutOffsetInt*4))/3)                ;
        guiElement1CollumnFirstCollumnXInt              = ((guiLayoutOffsetInt*1) + (guiElement2CollumnWidth*0))    ;
        guiElement2CollumnFirstCollumnXInt              = ((guiLayoutOffsetInt*1) + (guiElement2CollumnWidth*0))    ;
        guiElement2CollumnSecondCollumnXInt             = ((guiLayoutOffsetInt*2) + (guiElement2CollumnWidth*1))    ;
        guiElement3CollumnFirstCollumnXInt              = ((guiLayoutOffsetInt*1) + (guiElement3CollumnWidth*0))    ;
        guiElement3CollumnSecondCollumnXInt             = ((guiLayoutOffsetInt*2) + (guiElement3CollumnWidth*1))    ;
        guiElement3CollumnThirdCollumnXInt              = ((guiLayoutOffsetInt*3) + (guiElement3CollumnWidth*2))    ;

        groupBackgroundColor                            = color(50 , 60 , 57 , alphaFloat)  ;
        groupColorBackgroundColor                       = color(2  , 45 , 89 , alphaFloat)  ;
        groupColorLabelColor                            = color(255, 255, 255, alphaFloat)  ;

        defaultCColor               .setActive          (color(0  , 170, 255, alphaFloat))						/*The color of controller when an element  is clicked by mouse pointer.*/
                                    .setBackground      (color(0  , 45 , 90 , alphaFloat))						/*The color of controller         elements background.                 */
                                    .setCaptionLabel    (color(255, 255, 255, alphaFloat))						/*The color of controller         elements text.                       */
                                    .setForeground      (color(0  , 116, 217, alphaFloat))						/*The color of controller when an element  is hovered by mouse pointer */
                                    .setValueLabel      (color(255, 255, 255, alphaFloat));						/*The color of controller         elements text.                       */
        staticScrollableListCColor  .setActive          (color(0  , 45 , 90 , alphaFloat))						/*The color of controller when an element  is clicked by mouse pointer.*/
                                    .setBackground      (color(0  , 45 , 90 , alphaFloat))						/*The color of controller         elements background.                 */
                                    .setCaptionLabel    (color(255, 255, 255, alphaFloat))						/*The color of controller         elements text.                       */
                                    .setForeground      (color(0  , 45 , 90 , alphaFloat))						/*The color of controller when an element  is hovered by mouse pointer */
                                    .setValueLabel      (color(255, 255, 255, alphaFloat));						/*The color of controller         elements text.                       */

    }

    void DrawVoid 		(

    	float _alphaFloat		,
    	Group _mainGroupObject

    ){

        alphaFloat                  = _alphaFloat;

        /*Codes to create fade in and fade out animation.*/
        if                          (alphaFloat >  (255f/45f)){ _mainGroupObject.show(); }
        else if                     (alphaFloat <= (255f/45f)){ _mainGroupObject.hide(); }

        groupBackgroundColor        = color(50 , 60 , 57 , alphaFloat + (255f/45f)) ;
        groupColorBackgroundColor   = color(2  , 45 , 89 , alphaFloat + (255f/45f)) ;
        groupColorLabelColor        = color(255, 255, 255, alphaFloat + (255f/45f)) ;

        defaultCColor               .setActive          (color(0  , 170, 255, alphaFloat))                      /*The color of controller when an element  is clicked by mouse pointer.*/
                                    .setBackground      (color(0  , 45 , 90 , alphaFloat))                      /*The color of controller         elements background.                 */
                                    .setCaptionLabel    (color(255, 255, 255, alphaFloat))                      /*The color of controller         elements text.                       */
                                    .setForeground      (color(0  , 116, 217, alphaFloat))                      /*The color of controller when an element  is hovered by mouse pointer */
                                    .setValueLabel      (color(255, 255, 255, alphaFloat));                     /*The color of controller         elements text.                       */
        staticScrollableListCColor  .setActive          (color(0  , 45 , 90 , alphaFloat))                      /*The color of controller when an element  is clicked by mouse pointer.*/
                                    .setBackground      (color(0  , 45 , 90 , alphaFloat))                      /*The color of controller         elements background.                 */
                                    .setCaptionLabel    (color(255, 255, 255, alphaFloat))                      /*The color of controller         elements text.                       */
                                    .setForeground      (color(0  , 45 , 90 , alphaFloat))                      /*The color of controller when an element  is hovered by mouse pointer */
                                    .setValueLabel      (color(255, 255, 255, alphaFloat));                     /*The color of controller         elements text.                       */

        _mainGroupObject       		.setBackgroundColor (groupBackgroundColor           );
        _mainGroupObject       		.setColor           (defaultCColor                  );
        _mainGroupObject       		.setColorBackground (groupColorBackgroundColor      );
        _mainGroupObject       		.setColorLabel      (groupColorLabelColor           );

    }

}