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
    int             guiElement4CollumnFirstCollumnXInt                          ;                           /*The x position of first  controller in 4 collumns row.*/
    int             guiElement4CollumnSecondCollumnXInt                         ;                           /*The x position of second controller in 4 collumns row.*/
    int             guiElement4CollumnThirdCollumnXInt                          ;                           /*The x position of third  controller in 4 collumns row.*/
    int             guiElement4CollumnFourthCollumnXInt                         ;                           /*The x position of fourth controller in 4 collumns row.*/

    int 			guiElement1CollumnWidth 									; 							/*The width of any controller in 1 collumn  row.*/
    int             guiElement2CollumnWidth                                     ;                           /*The width of any controller in 2 collumns row.*/
    int             guiElement3CollumnWidth                                     ;                           /*The width of any controller in 3 collumns row.*/
    int             guiElement4CollumnWidth                                     ;                           /*The width of any controller in 4 collumns row.*/

    int             guiElement1LineHeight                                       = 10;                       /*The height of any element that only one line height.
                                                                                                            For example, button, text label.*/
    int             guiElement2LineHeight                                       = 20;                       /*The height of any element that only one line height.
                                                                                                            For example, text field.*/

    int             guiScrollableList5RowHeightInt                              = 62;                       /*The height of scrollable list controller that contains four  elements with additional one element of controller's title panel.*/
    int             guiScrollableList4RowHeightInt                              = 50;                       /*The height of scrollable list controller that contains three elements with additional one element of controller's title panel.*/

    CColor          defaultCColor                                               = new CColor();             /*This is controller color for default                            object.*/
    CColor          trueCheckListCColor                							= new CColor();             /*This is controller color for selected checklist scrollable list object.*/
    CColor          falseCheckListCColor               							= new CColor();             /*This is controller color for selected checklist scrollable list object.*/
    CColor          staticScrollableListCColor                                  = new CColor();             /*This is controller color for static             scrollable list object.*/

    PApplet         pAppletObject                                               ;                           /*Refer this object back to main PApplet object.*/

    GroupGUIObject 								(

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
        guiElement4CollumnWidth                         = ((guiWidthInt - (guiLayoutOffsetInt*5))/4)                ;
        guiElement1CollumnFirstCollumnXInt              = ((guiLayoutOffsetInt*1) + (guiElement1CollumnWidth*0))    ;
        guiElement2CollumnFirstCollumnXInt              = ((guiLayoutOffsetInt*1) + (guiElement2CollumnWidth*0))    ;
        guiElement2CollumnSecondCollumnXInt             = ((guiLayoutOffsetInt*2) + (guiElement2CollumnWidth*1))    ;
        guiElement3CollumnFirstCollumnXInt              = ((guiLayoutOffsetInt*1) + (guiElement3CollumnWidth*0))    ;
        guiElement3CollumnSecondCollumnXInt             = ((guiLayoutOffsetInt*2) + (guiElement3CollumnWidth*1))    ;
        guiElement3CollumnThirdCollumnXInt              = ((guiLayoutOffsetInt*3) + (guiElement3CollumnWidth*2))    ;
        guiElement4CollumnFirstCollumnXInt				= ((guiLayoutOffsetInt*1) + (guiElement4CollumnWidth*0))    ;
		guiElement4CollumnSecondCollumnXInt				= ((guiLayoutOffsetInt*2) + (guiElement4CollumnWidth*1))    ;
		guiElement4CollumnThirdCollumnXInt				= ((guiLayoutOffsetInt*3) + (guiElement4CollumnWidth*2))    ;
		guiElement4CollumnFourthCollumnXInt				= ((guiLayoutOffsetInt*4) + (guiElement4CollumnWidth*3))    ;

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
        trueCheckListCColor			.setActive          (color(0  , 116, 217, alphaFloat))						/*The color of controller when an element  is clicked by mouse pointer.*/
                                    .setBackground      (color(0  , 116, 217, alphaFloat))						/*The color of controller         elements background.                 */
                                    .setCaptionLabel    (color(255, 255, 255, alphaFloat))						/*The color of controller         elements text.                       */
                                    .setForeground      (color(0  , 116, 217, alphaFloat))						/*The color of controller when an element  is hovered by mouse pointer */
                                    .setValueLabel      (color(255, 255, 255, alphaFloat));						/*The color of controller         elements text.                       */
        falseCheckListCColor		.setActive          (color(0  , 45 , 90 , alphaFloat))						/*The color of controller when an element  is clicked by mouse pointer.*/
	                                .setBackground      (color(0  , 45 , 90 , alphaFloat))						/*The color of controller         elements background.                 */
	                                .setCaptionLabel    (color(255, 255, 255, alphaFloat))						/*The color of controller         elements text.                       */
	                                .setForeground      (color(0  , 116, 217, alphaFloat))						/*The color of controller when an element  is hovered by mouse pointer */
	                                .setValueLabel      (color(255, 255, 255, alphaFloat));						/*The color of controller         elements text.                       */

    }

    void DrawVoid 								(

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
        trueCheckListCColor			.setActive          (color(0  , 116, 217, alphaFloat))						/*The color of controller when an element  is clicked by mouse pointer.*/
                                    .setBackground      (color(0  , 116, 217, alphaFloat))						/*The color of controller         elements background.                 */
                                    .setCaptionLabel    (color(255, 255, 255, alphaFloat))						/*The color of controller         elements text.                       */
                                    .setForeground      (color(0  , 116, 217, alphaFloat))						/*The color of controller when an element  is hovered by mouse pointer */
                                    .setValueLabel      (color(255, 255, 255, alphaFloat));						/*The color of controller         elements text.                       */
        falseCheckListCColor		.setActive          (color(0  , 45 , 90 , alphaFloat))						/*The color of controller when an element  is clicked by mouse pointer.*/
	                                .setBackground      (color(0  , 45 , 90 , alphaFloat))						/*The color of controller         elements background.                 */
	                                .setCaptionLabel    (color(255, 255, 255, alphaFloat))						/*The color of controller         elements text.                       */
	                                .setForeground      (color(0  , 116, 217, alphaFloat))						/*The color of controller when an element  is hovered by mouse pointer */
	                                .setValueLabel      (color(255, 255, 255, alphaFloat));						/*The color of controller         elements text.                       */

        _mainGroupObject       		.setBackgroundColor (groupBackgroundColor           );
        _mainGroupObject       		.setColor           (defaultCColor                  );
        _mainGroupObject       		.setColorBackground (groupColorBackgroundColor      );
        _mainGroupObject       		.setColorLabel      (groupColorLabelColor           );

    }

	/*This function below is used to "convert" scrollable list into checklist.*/
	void CovertScrollableListIntoCheckListVoid	(int _indexInt, ScrollableList _scrollableListObject)   {

	    /*If there is no property named isSelected in the hashmap than we need to create one.
	    After that assign the isSelected value to true and also assign the color.*/
	    if( _scrollableListObject.getItem(_indexInt).get("isSelected") == null){

	        _scrollableListObject.getItem(_indexInt).put("isSelected" , true				); /*Create a new property called "isSelected" and assign initial value of true.*/
	        _scrollableListObject.getItem(_indexInt).put("color"      , trueCheckListCColor	); /*Change the color of this specific element into trueCheckListColor.         */

	    }
	    /*If there is isSelected property than revert it between true and false everytime we clicked it and set the appropriate color scheme.*/
	    else{

	        boolean  stateBoolean	=   _scrollableListObject.getItem(_indexInt).get("isSelected").toString().equals("true") ? true : false; 	/*Check wheter the currently selected element is used to be selected or not.                         */
	                                    _scrollableListObject.getItem(_indexInt).put("isSelected", !stateBoolean           ); 					/*If the selected element is used to be selected then unselect it, vice versa.                       */
	                 stateBoolean	=   _scrollableListObject.getItem(_indexInt).get("isSelected").toString().equals("true") ? true : false; 	/*Since the returned value of the hash map is in string we need to convert the value back to boolean.*/

	        if      (stateBoolean 	== true ){ _scrollableListObject.getItem(_indexInt).put("color", trueCheckListCColor ); } 					/*Assign the appropriate color whether the newly selected element is not selected or not.            */
	        else if (stateBoolean 	== false){ _scrollableListObject.getItem(_indexInt).put("color", falseCheckListCColor); } 					/*Assign the appropriate color whether the newly selected element is not selected or not.            */

	    }

	}

    /*This function is to put every selected tags into a String List.*/
    List<String> SetSelectedCheckListStringList	(

        List<String>    _scrollableListItemStringList 	,
        List<String> 	_selectedItemStringList			,
        ScrollableList  _scrollableListObject

    ){

        /*Iterate through all the content elements..*/
        for(int i = 0; i < _scrollableListItemStringList.size(); i ++){

            /*Check if there is property in the hash map named "isSelected".*/
            if      (_scrollableListObject.getItem(i).get("isSelected") != null){

            	String selectedItemString = _scrollableListObject.getItem(i).get("text").toString();

                /*If there is a properties called "isSelected" and it is returned true then add the selected "text" properties into the String list if only
                    it is not yet inside the list.
                PENDING: Implementation of HashSet could be more suitable in here instead of using List.*/
                if      (_scrollableListObject 		.getItem(i)	.get("isSelected").toString().equals("true" )){
                    if  (!_selectedItemStringList 	.contains	(selectedItemString)){ _selectedItemStringList.add		(selectedItemString); }
                }
                /*If "isSelected" is false then remove the element from the list.*/
                else if (_scrollableListObject 		.getItem(i)	.get("isSelected").toString().equals("false")){
                   	if  (_selectedItemStringList 	.contains	(selectedItemString)){ _selectedItemStringList.remove	(selectedItemString); }
                }

            }

        }

        return _selectedItemStringList;

    }

}