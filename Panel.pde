/*Creating a Panel class for each object museum.*/
class Panel                                         {

    PFont   layoutPanelPFont        ;   /*Font variable to hold the font style.*/
    color   fillColor               ;   /*The color of the panel.*/
    int     widthPanelInt           ;
    int     heightPanelInt          ;
    int     xPanelInt               ;
    int     yPanelInt               ;
    int     layoutTextSizeInt   = 12;   /*The default font size for the panel.*/

    Panel(){

        layoutPanelPFont        = createFont(panelFontString, layoutTextSizeInt);

    }

    void DrawVoid(

        color   _fillColor      ,
        int     _widthPanelInt  ,
        int     _heightPanelInt ,
        int     _xPanelInt      ,
        int     _yPanelInt      ,
        String  _textString

    ){

        widthPanelInt           = _widthPanelInt    ;
        heightPanelInt          = _heightPanelInt   ;
        xPanelInt               = _xPanelInt        ;
        yPanelInt               = _yPanelInt        ;

        noStroke                ();

    	/*Fill color for the panel.*/
        fill                    (_fillColor);
        rect                    (xPanelInt, yPanelInt, widthPanelInt, heightPanelInt, 10);
        noFill                  ();

        /*Fill white color for the text.*/
        fill                    (255);
        textAlign               (CENTER);
        textFont                (layoutPanelPFont);
        String textTextString   = _textString;

        /*Set the text position.*/
        int xTextInt            = xPanelInt + ( widthPanelInt/2);
        int yTextInt            = yPanelInt + (heightPanelInt/2) + ((layoutTextSizeInt*11)/45);

        /*Display the text.*/
        text                    (textTextString, xTextInt, yTextInt);
        textAlign               (LEFT);
        noFill                  ();

    }


}