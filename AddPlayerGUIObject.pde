import java.util.*;
import controlP5.*;

class AddPlayerGUIObject{

	/*Add three color for the background color.*/
	color 		groupBackgroundColor			;					/*The color of group panel group background.*/
    color 		groupColorBackgroundColor 		;					/*The title background color of panel group.*/
    color 		groupColorLabelColor 			; 					/*The title font colot of the panel group.*/
    /*Add transparency variable.*/
    float		alphaFloat 						= 255;				/*The opacity for this object.*/
	int			groupXInt						;					/*The x position of this graphical user interface.*/
    int			groupYInt						;					/*The x position of this graphical user interface.*/
    int			groupLayoutOffsetInt			= 10;				/*This object offset.*/
    int			groupWidthInt					;					/*This object width.*/
	int			groupHeightInt					;					/*This object height.*/
    int			parentButtonSizeInt				;					/*A variable for layout taken from the main class.*/
    int			parentDropdownObjectWidthInt	;					/*A variable for layout taken from the main class.*/
    int			parentDropdownObjectHeightInt	;					/*A variable for layout taken from the main class.*/
    int			scrollableWidthInt				;
	int			scrollableHeightInt				= 62;
	CColor 		otherCColor						= new CColor();		/*The color for other component than the scrollableChecklist.*/

	AddPlayerGUIObject(

		int     _groupXInt                      ,
        int     _groupYInt                      ,
        int     _groupWidthInt               	,
        int     _groupHeightInt              	,
        int     _parentButtonSizeInt            ,
        int     _parentDropdownObjectWidthInt   ,
        int     _parentDropdownObjwctHeightInt

	){

		groupXInt 						= _groupXInt;
		groupYInt 						= _groupYInt + groupLayoutOffsetInt;
		groupWidthInt 					= _groupWidthInt;
		groupHeightInt 					= _groupHeightInt;
		parentButtonSizeInt 			= _parentButtonSizeInt;
		parentDropdownObjectWidthInt 	= _parentDropdownObjectWidthInt;
		parentDropdownObjectHeightInt 	= _parentDropdownObjwctHeightInt;

		scrollableWidthInt				= (groupWidthInt - (groupLayoutOffsetInt*2));      		/*Create the scrollable list width to accomodate three scrollable list in a row.*/

		/*Set the colors, however most of controller's color will be updated every tick in the DrawVoid() function.*/
        groupBackgroundColor			= color(50  , 60    , 57    , alphaFloat);
        groupColorBackgroundColor		= color(2   , 45    , 89    , alphaFloat);
        groupColorLabelColor			= color(255 , 255   , 255   , alphaFloat);
		otherCColor						.setActive          (color(0    , 170   , 255   , alphaFloat))
                                        .setBackground      (color(0    , 45    , 90    , alphaFloat))
                                        .setCaptionLabel    (color(255  , 255   , 255   , alphaFloat))
                                        .setForeground      (color(0    , 116   , 217   , alphaFloat))
                                        .setValueLabel      (color(255  , 255   , 255   , alphaFloat));

		if(useNameAltBoolean        == true ){



		}
		else if(useNameAltBoolean   == false){



		}

		Group   AddPlayerGroupObject				=
                cp5Object	.addGroup               ("AddPlayerGUIObjectAddPlayerGroupObject")
							.setPosition            (groupXInt, groupYInt)
                            .setWidth               (groupWidthInt)
                            .setBackgroundHeight    (groupHeightInt)
                            .setBackgroundColor     (groupBackgroundColor)
                            .setColor               (otherCColor)
                            .setColorBackground     (groupColorBackgroundColor)
                            .setColorLabel          (groupColorLabelColor)
                            .setLabel               ("Add Visitor:");

	            cp5Object	.addTextlabel           ("AddPlayerGUIObjectPlayerIndexTextlabel")
							.setPosition            (groupLayoutOffsetInt, groupLayoutOffsetInt)
							.setGroup               (AddPlayerGroupObject)
							.setColor               (otherCColor)
							.setColorValue          (255)
							.setText                ("Player Index:");

                cp5Object	.addTextlabel           ("AddPlayerGUIObjectPlayerIndexValueTextlabel")
							.setPosition            (((groupHeightInt/2) + (groupLayoutOffsetInt*2)), groupLayoutOffsetInt)
							.setGroup               (AddPlayerGroupObject)
							.setColor               (otherCColor)
							.setColorValue          (255)
							.setText                ("1");

				cp5Object	.addScrollableList      ("AddPlayerGUIObjectPickStartingExhibitionSList")
                            .setPosition            (groupLayoutOffsetInt, (groupLayoutOffsetInt*3))
                            .setSize                (scrollableWidthInt, scrollableHeightInt)
                            .setGroup               (AddPlayerGroupObject)
                            .addItems               (exhibitionNameFullStringList)
                            .setType                (ControlP5.LIST)
                            .setColor               (otherCColor)
                            .setLabel               ("Pick Starting Exhibition:");

                cp5Object	.addTextfield           ("AddPlayerGUIObjectVisitorNameTextfield")
                            .setPosition            (groupLayoutOffsetInt, ((groupLayoutOffsetInt*4) + scrollableHeightInt))
                            .setSize                (scrollableWidthInt  ,  (groupLayoutOffsetInt*2))
                            .setGroup               (AddPlayerGroupObject)
                            .setColor               (otherCColor)
                            .setLabel               ("Visitor Name:");

	            cp5Object	.addButton              ("AddPlayerGUIObjectSubmitButton")
							.setPosition            (groupLayoutOffsetInt, ((groupLayoutOffsetInt*6) + scrollableHeightInt + (groupLayoutOffsetInt*2)))
							.setSize                (scrollableWidthInt, groupLayoutOffsetInt)
							.setGroup               (AddPlayerGroupObject)
							.setColor               (otherCColor)
							.setLabel               ("Submit");

	}

	void DrawVoid(float   _alphaFloat){

        alphaFloat                  	= _alphaFloat;

        /*Show/hide controller based on the alpha value received from the main class.*/
        if                          	(alphaFloat >  (255f/45f)){ cp5Object.get(Group   .class  , "AddPlayerGUIObjectAddPlayerGroupObject"            ).show(); }
        else if                     	(alphaFloat <= (255f/45f)){ cp5Object.get(Group   .class  , "AddPlayerGUIObjectAddPlayerGroupObject"            ).hide(); }
        groupBackgroundColor        	= color             (50         , 60    , 57    , alphaFloat    + (255f/45f));
        groupColorBackgroundColor   	= color             (2          , 45    , 89    , alphaFloat    + (255f/45f));
        groupColorLabelColor        	= color             (255        , 255   , 255   , alphaFloat    + (255f/45f));
        otherCColor                 	.setActive          (color(0    , 170   , 255   , alphaFloat))
                                    	.setBackground      (color(0    , 45    , 90    , alphaFloat))
                                    	.setCaptionLabel    (color(255  , 255   , 255   , alphaFloat))
                                    	.setForeground      (color(0    , 116   , 217   , alphaFloat))
                                    	.setValueLabel      (color(255  , 255   , 255   , alphaFloat));

        /*Especially for group controller you need to adjust four methods instead of just one methods.*/
        cp5Object.get(Group             .class , "AddPlayerGUIObjectAddPlayerGroupObject"			).setBackgroundColor    (groupBackgroundColor);
        cp5Object.get(Group             .class , "AddPlayerGUIObjectAddPlayerGroupObject"			).setColor              (otherCColor);
        cp5Object.get(Group             .class , "AddPlayerGUIObjectAddPlayerGroupObject"			).setColorBackground    (groupColorBackgroundColor);
        cp5Object.get(Group             .class , "AddPlayerGUIObjectAddPlayerGroupObject"			).setColorLabel         (groupColorLabelColor);

        /*The rest of the controller you only need to adjust for one method, which is setColor().*/
        cp5Object.get(Textlabel         .class , "AddPlayerGUIObjectPlayerIndexTextlabel"			).setColor(otherCColor);
        cp5Object.get(Textlabel         .class , "AddPlayerGUIObjectPlayerIndexValueTextlabel"		).setColor(otherCColor);
        cp5Object.get(ScrollableList	.class , "AddPlayerGUIObjectPickStartingExhibitionSList"	).setColor(otherCColor);
        cp5Object.get(Textfield         .class , "AddPlayerGUIObjectVisitorNameTextfield"			).setColor(otherCColor);
        cp5Object.get(Button    		.class , "AddPlayerGUIObjectSubmitButton"             		).setColor(otherCColor);

        /*This code below is for controlling controllers outside of this class.
        These two if statements is for controlling the position of the other object in the same open close button.*/
        if      (cp5Object.get(Group.class, "AddPlayerGUIObjectAddPlayerGroupObject").isOpen() == true ){

                /*Change the position when the group object is open.*/
                 cp5Object.get(Group.class, "EditPlayerGroupObject").setPosition(

                    (guiOffsetInt + (parentButtonSizeInt/2)),
                    (cp5Object.get(Group.class, "AddPlayerGUIObjectAddPlayerGroupObject").getPosition()[1] + groupLayoutOffsetInt + groupHeightInt)

                );
                
        }
        else if (cp5Object.get(Group.class, "AddPlayerGUIObjectAddPlayerGroupObject").isOpen() == false){

                /*Change the position when the group object is close.*/
                 cp5Object.get(Group.class, "EditPlayerGroupObject").setPosition(

                    (guiOffsetInt + (parentButtonSizeInt/2)),
                    (cp5Object.get(Group.class, "AddPlayerGUIObjectAddPlayerGroupObject").getPosition()[1] + groupLayoutOffsetInt)

                );

        }

	}

}