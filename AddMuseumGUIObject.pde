/*A class to creating a GUI object on adding museum object.*/
import java.util.*;
import controlP5.*;
class AddMuseumGUIObject{

	/*Some variables :).*/
	color           groupBackgroundColor        = color(255, 50);			/*The color of group panel background.*/
	float 			alphaFloat 					= 0; 						/*The opacity of this object.*/
	int 			groupLayoutOffsetInt		= 10;						/*This object layout offset.*/
	int             groupLabelHeightInt         ;                           /*Make the header of the group to be exactly as the same as layout offset.*/
	int 			groupXInt					;							/*X position of this GUI object in the main class.*/
	int 			groupYInt					;							/*Y position of this GUI object in the main class.*/
	int             groupAddWidthInt            ;                           /*Width of the group, dependent on screen size.*/
	int             groupAddHeightInt           ;                      		/*Fixed height of the group, you need to carefully arrange the height of this variable using pixel ruler..*/
	int             scrollableOffsetInt         = 1;                        /*Fixed offset of scrollable list.*/
	int             scrollableWidthInt          ;                           /*Width of every scrollable list component, dependent on group size.*/
	int             scrollableHeightInt         ;                           /*Height of every scrollable list component, dependent group label height.*/
	int             oneLineComponentWidthInt    ;                           /*Width for every one line component like button or text field, dependent on scrollable component size.*/
	int             oneLineComponentHeightInt   ;                           /*Height for every one line component like button or text field, dependent on scrollable component size.*/
	CColor          trueCColor                  = new CColor();				/*The color of the item when an item in scroll checklist is selected.*/
	CColor          falseCColor                 = new CColor();				/*The color of the item when an item in scroll checklist is not selected.*/
	String          typeObjectMuseumString      = "";						/*The type of the object that will be added, it will be either floor, room, or exhibition object.*/

	/*Constructor.*/
	AddMuseumGUIObject(

		int 	_groupXInt			,
		int 	_groupYInt			,
		int 	_groupAddWidthInt	,
		int 	_groupAddHeightInt

	){

		groupXInt 								= _groupXInt;
		groupYInt 								= _groupYInt + groupLayoutOffsetInt;
		groupAddWidthInt 						= _groupAddWidthInt;
		groupAddHeightInt 						= _groupAddHeightInt;

		groupLabelHeightInt                     = groupLayoutOffsetInt;
	    scrollableWidthInt                      = ((groupAddWidthInt - groupLayoutOffsetInt*4)/3);			/*Create the scrollable list width to accomodate three scrollable list in a row.*/
	    scrollableHeightInt                     = ((6*groupLabelHeightInt) + (5*scrollableOffsetInt)); 	/*Create the scrollable list height to accomodate five items + header in.*/
	    oneLineComponentWidthInt                = ((groupAddWidthInt - groupLayoutOffsetInt*3)/2);			/*Create the one line object width to accomodate two similar object in a row.*/
	    oneLineComponentHeightInt               = groupLabelHeightInt;									/*This need to be at the same height as the layout offset or the label height.*/

	    /*Set the color.*/
		falseCColor                             .setActive          (color(0    , 45    , 90    , alphaFloat))
		                                        .setBackground      (color(0    , 45    , 90    , alphaFloat))
		                                        .setCaptionLabel    (color(255  , 255   , 255   , alphaFloat))
		                                        .setForeground      (color(0    , 116   , 217   , alphaFloat))
		                                        .setValueLabel      (color(255  , 255   , 255   , alphaFloat));
		trueCColor                              .setActive          (color(0    , 116   , 217   , alphaFloat))
		                                        .setBackground      (color(0    , 116   , 217   , alphaFloat))
		                                        .setCaptionLabel    (color(255  , 255   , 255   , alphaFloat))
		                                        .setForeground      (color(0    , 116   , 217   , alphaFloat))
		                                        .setValueLabel      (color(255  , 255   , 255   , alphaFloat));

     	/*Create the group and all components.*/
	    Group   AddMuseumGroupObject            =
	            cp5Object                       .addGroup               ("AddMuseumGroupObject")
	                                            .setPosition            (0, groupLabelHeightInt)
	                                            .setWidth               (groupAddWidthInt)
	                                            .setBackgroundHeight    (groupAddHeightInt)
	                                            .setBackgroundColor     (groupBackgroundColor)
	                                            .setLabel               ("Add Museum Object:")
	                                            .hide 					();

	            cp5Object                       .addScrollableList      ("TypeObjectMuseumSList")
	                                            .setPosition            (groupLayoutOffsetInt, groupLayoutOffsetInt)
	                                            .setSize                (scrollableWidthInt, scrollableHeightInt)
	                                            .setGroup               (AddMuseumGroupObject)
	                                            .addItems               (Arrays.asList("Floor", "Room", "Exhibition"))
	                                            .setType                (ControlP5.LIST)
	                                            .setLabel               ("Choose Type:");

	            cp5Object                       .addScrollableList      ("SelectParentObjectMuseumSList")
	                                            .setPosition            (((groupLayoutOffsetInt*2) + scrollableWidthInt), groupLayoutOffsetInt)
	                                            .setSize                (scrollableWidthInt, scrollableHeightInt)
	                                            .setGroup               (AddMuseumGroupObject)
	                                            .addItems               (defaultStringList)
	                                            .setType                (ControlP5.LIST)
	                                            .setLabel               ("Parent Object:");

	            cp5Object                       .addScrollableList      ("SelectTagSubjectSList")
	                                            .setPosition            (groupLayoutOffsetInt, ((groupLayoutOffsetInt*2) + scrollableHeightInt))
	                                            .setSize                (scrollableWidthInt, scrollableHeightInt)
	                                            .setGroup               (AddMuseumGroupObject)
	                                            .addItems               (subjectTagStringList)
	                                            .setType                (ControlP5.LIST)
	                                            //.setColor               (falseCColor)
	                                            .setLabel               ("Subject Tag:");

	            cp5Object                       .addScrollableList      ("SelectTagVerbSList")
	                                            .setPosition            (((groupLayoutOffsetInt*2) + scrollableWidthInt), ((groupLayoutOffsetInt*2) + scrollableHeightInt))
	                                            .setSize                (scrollableWidthInt, scrollableHeightInt)
	                                            .setGroup               (AddMuseumGroupObject)
	                                            .addItems               (verbTagStringList)
	                                            .setType                (ControlP5.LIST)
	                                            //.setColor               (falseCColor)
	                                            .setLabel               ("Verb Tag:");

	            cp5Object                       .addScrollableList      ("SelectTagNounSList")
	                                            .setPosition            (((groupLayoutOffsetInt*3) + (scrollableWidthInt*2)), ((groupLayoutOffsetInt*2) + scrollableHeightInt))
	                                            .setSize                (scrollableWidthInt, scrollableHeightInt)
	                                            .setGroup               (AddMuseumGroupObject)
	                                            .addItems               (nounTagStringList)
	                                            .setType                (ControlP5.LIST)
	                                            //.setColor               (falseCColor)
	                                            .setLabel               ("Noun Tag:");

	            cp5Object                       .addTextlabel           ("CanAddMultipleTagsTextlabel")
	                                            .setPosition            (groupLayoutOffsetInt, ((groupLayoutOffsetInt*3) + (scrollableHeightInt*2)))
	                                            .setGroup               (AddMuseumGroupObject)
	                                            .setColorValue          (255)
	                                            .setText                ("*You can add multiple tags,\nbut minimum one tag in each category.");

	            cp5Object                       .addTextfield           ("NameFullTextfield")
	                                            .setPosition            (groupLayoutOffsetInt, ((groupLayoutOffsetInt*6) + (scrollableHeightInt*2)))
	                                            .setSize                (oneLineComponentWidthInt, (oneLineComponentHeightInt*2))
	                                            .setGroup               (AddMuseumGroupObject)
	                                            .setLabel               ("Name Full:");

	            cp5Object                       .addTextfield           ("NameAltTextfield")
	                                            .setPosition            (((groupLayoutOffsetInt*2) + oneLineComponentWidthInt), ((groupLayoutOffsetInt*6) + (scrollableHeightInt*2)))
	                                            .setSize                (oneLineComponentWidthInt, (oneLineComponentHeightInt*2))
	                                            .setGroup               (AddMuseumGroupObject)
	                                            .setLabel               ("Name Alternative:");

	            cp5Object                       .addButton              ("SubmitButton")
	                                            .setPosition            (groupLayoutOffsetInt, ((groupLayoutOffsetInt*9) + (scrollableHeightInt*2) + oneLineComponentHeightInt))
	                                            .setSize                (((oneLineComponentWidthInt*2) + groupLayoutOffsetInt), oneLineComponentHeightInt)
	                                            .setGroup               (AddMuseumGroupObject)
	                                            .setLabel               ("Submit");

        println("AddMuseumGroupObject \t\t" + cp5Object.get(Group.class, "AddMuseumGroupObject").getColor());
        println("TypeObjectMuseumSList \t\t" + cp5Object.get(ScrollableList.class, "TypeObjectMuseumSList").getColor());
        println("SelectParentObjectMuseumSList \t" + cp5Object.get(ScrollableList.class, "SelectParentObjectMuseumSList").getColor());
        println("SelectTagSubjectSList \t\t" + cp5Object.get(ScrollableList.class, "SelectTagSubjectSList").getColor());
        println("SelectTagVerbSList \t\t" + cp5Object.get(ScrollableList.class, "SelectTagVerbSList").getColor());
        println("SelectTagNounSList \t\t" + cp5Object.get(ScrollableList.class, "SelectTagNounSList").getColor());
        println("CanAddMultipleTagsTextlabel \t" + cp5Object.get(Textlabel.class, "CanAddMultipleTagsTextlabel").getColor());
        println("NameFullTextfield \t\t" + cp5Object.get(Textfield.class, "NameFullTextfield").getColor());
        println("NameAltTextfield \t\t" + cp5Object.get(Textfield.class, "NameAltTextfield").getColor());
        println("SubmitButton \t\t\t" + cp5Object.get(Button.class, "SubmitButton").getColor());

	}

	void DrawVoid(){

		/*This to re - set SelectParentObjectMuseumSList so that it display options according to the TypeObjectMuseumSList selection.*/
		if      (typeObjectMuseumString.equals("Floor"      )){ cp5Object.get(ScrollableList.class, "SelectParentObjectMuseumSList").setItems(defaultStringList  ); typeObjectMuseumString = ""; }
	    else if (typeObjectMuseumString.equals("Room"       )){ cp5Object.get(ScrollableList.class, "SelectParentObjectMuseumSList").setItems(floorStringList    ); typeObjectMuseumString = ""; }
	    else if (typeObjectMuseumString.equals("Exhibition" )){ cp5Object.get(ScrollableList.class, "SelectParentObjectMuseumSList").setItems(roomStringList     ); typeObjectMuseumString = ""; }

	    /*Opacity animation.*/


	}

}