/*A class for toggle open and close button.
This button will be used to open a panel made using
    P5 user interface.*/
class ButtonOpenClose{

    PShape  buttonOpenCloseCircleObject = null; /*This is a child shape of this button, later will be combined together into main shape.*/
    PShape  buttonOpenCloseCross1Object = null; /*This is a child shape of this button, later will be combined together into main shape.*/
    PShape  buttonOpenCloseCross2Object = null; /*This is a child shape of this button, later will be combined together into main shape.*/
    boolean isAnimatingBoolean          = false;
    boolean isButtonOpenBoolean         = false;
    boolean isFunctionTriggerBoolean    = false;
    int     buttonRotationCounterInt    = 0;
    int     buttonSizeInt               = -1;   /*The size of this button.*/
    int     buttonXInt                  = -1;   /*The x position of this button.*/
    int     buttonYInt                  = -1;   /*The y position of this button.*/
    PShape  buttonOpenCloseObject       = null; /*The main shape for this button.*/

    /*This object constructor, the only argument is this button size.*/
    ButtonOpenClose                     (int _buttonSizeInt){

        buttonSizeInt                   = _buttonSizeInt;
        int originXInt                  = -(buttonSizeInt/2);       /*This button origin point is adjusted by substracting a half of button size.*/
        int originYInt                  = -(buttonSizeInt/2);       /*This button origin point is adjusted by substracting a half of button size.*/

        buttonOpenCloseObject           = createShape(GROUP);       /*Create a shape type GROUP, which is an accumulation of other shapes.*/
        
        /*Create the sub shape components.
        The components are the main circle shape and two lines that formed a plus.*/
        fill                            (68, 40, 60);
        noStroke                        ();
        buttonOpenCloseCircleObject     = createShape(

            ELLIPSE, 
            originXInt, 
            originYInt, 
            buttonSizeInt, 
            buttonSizeInt

        );
        stroke                          (223, 113, 38);
        strokeWeight                    (2);
        noFill                          ();
        buttonOpenCloseCross1Object     = createShape(

            LINE, 
            (originXInt + (buttonSizeInt/2)),
            (originYInt + (buttonSizeInt/4)),
            (originXInt + (buttonSizeInt/2)),
            (originYInt + (buttonSizeInt/4)) + (buttonSizeInt/2)
             
        );
        buttonOpenCloseCross2Object     = createShape(

            LINE, 
            (originXInt + (buttonSizeInt/4)),
            (originYInt + (buttonSizeInt/2)),
            (originXInt + (buttonSizeInt/4)) + (buttonSizeInt/2), 
            (originYInt + (buttonSizeInt/2))

        );

        /*Add the three components into the main shape.
        After this is done you can just the main shape as the whole shape,
            and you do not need to set the properties of each shapes one
            by one.*/
        buttonOpenCloseObject.addChild  (buttonOpenCloseCircleObject);
        buttonOpenCloseObject.addChild  (buttonOpenCloseCross1Object);
        buttonOpenCloseObject.addChild  (buttonOpenCloseCross2Object);

        strokeWeight                    (1);
        noFill                          ();
        noStroke                        ();

    }

    /*A function to draw the combined shape.*/
    void DrawVoid                               (int _buttonXInt, int _buttonYInt){

        fill                                    (255);
        stroke                                  (0);
        shapeMode                               (CENTER);                                                   /*Set this button origin point mode as center.*/

        if(isFunctionTriggerBoolean == true)    { isFunctionTriggerBoolean = false; }

        buttonXInt                              = _buttonXInt + (buttonSizeInt/2);                          /*Determine the position of this button axis with additional (buttonSizeInt/2) to fix the position resulted from shapeMode(CENTER).*/
        buttonYInt                              = _buttonYInt + (buttonSizeInt/2);                          /*Determine the position of this button axis with additional (buttonSizeInt/2) to fix the position resulted from shapeMode(CENTER).*/
        shape                                   (buttonOpenCloseObject, buttonXInt, buttonYInt);            /*Draw the main shape with additional last two parameters are the position on screen.*/

        if(isAnimatingBoolean == true)                 {

            if      (isButtonOpenBoolean        == true)  { buttonOpenCloseObject.rotate(-radians(1));  }   /*This button animation based on the current state of this button.*/
            else if (isButtonOpenBoolean        == false) { buttonOpenCloseObject.rotate( radians(1));  }   /*This button animation based on the current state of this button.*/

            buttonRotationCounterInt            ++;                                                         /*The animation is 45 degrees rotation clock wise or anti - clock wise depending on button state.*/

            /*If the animation is finished.*/
            if(buttonRotationCounterInt         >= 45){

                buttonRotationCounterInt        =  0;                                                       /*Reset the animation counter, so that next time the counter start counting from 0 degree.*/
                if      (isButtonOpenBoolean    == true)  { isButtonOpenBoolean = false; }                  /*Change button state, if button is open then change the state to close.*/
                else if (isButtonOpenBoolean    == false) { isButtonOpenBoolean = true;  }                  /*Change button state, if button is close then change the state to open.*/
                isAnimatingBoolean              =  false;                                                   /*The animation trigger boolean.*/
                isFunctionTriggerBoolean        =  true;                                                    /*The function trigger boolean. The function will only happened one tick after state change.*/

            }

        }

        fill                                    (255);
        stroke                                  (0);
        shapeMode                               (CORNER);                   /*Set this button origin point mode as center.*/

    }

    /*A function that will return boolean whether or not mouse pointer is above
        this button or not.*/
    boolean MouseOverBoolean            (){

        /*Local variable to hold the boolean value.
        This variable will return true if the mouse pointer is above this button.
        Will return false if the mouse pointer is everywhere else but above the mouse pointer.*/
        boolean hoverBoolean            = false;

        if(

            /*Setting up boundaries of which this button is belong.*/
            mouseX > (buttonXInt - (buttonSizeInt/2) - (buttonSizeInt/2)) &&
            mouseX < (buttonXInt - (buttonSizeInt/2) + (buttonSizeInt/2)) &&
            mouseY > (buttonYInt - (buttonSizeInt/2) - (buttonSizeInt/2)) &&
            mouseY < (buttonYInt - (buttonSizeInt/2) + (buttonSizeInt/2))

        ){ hoverBoolean                 = true; }

        /*Return the boolean.*/
        return  hoverBoolean;

    } 

};






