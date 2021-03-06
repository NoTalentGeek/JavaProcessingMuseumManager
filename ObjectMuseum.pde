import java.util.*;

/*A class for museum object.
The museum objects within this application are things that can interract with visitor.
For example floor, room, and exhibition.*/
class   ObjectMuseum                                                                    {

    boolean             activeBoolean               = false;                            /*Variable to control ControlP5 GUI element.                                                                            */
    boolean             fullBoolean                 = false;                            /*Whether this museum object is full or not.                                                                            */
    int                 indexGlobalInt              = -1;                               /*This is an index number of the location of this object in its respective list.                                        */
    int                 indexLocalInt               = -1;                               /*This is an index number of the location of this object within its parent child object list.                           */
    int                 visitorCurrentInt           = 0;                                /*This museum object current visitor.                                                                                   */
    int                 visitorTotalInt             = 0;                                /*This museum objecy total visitor.                                                                                     */
    Name                nameObject                  = null;                             /*Name object that contains the alternative name and the full name of this object.                                      */
    ObjectMuseum        parentObject                = null;                             /*The object parent of this object, which means this object should be inside the parent object's child object list.     */
    String              nameAltString               = "";                               /*This variable is intended solely to store the alternative name of this object.                                        */
    String              nameFullString              = "";                               /*This variable is intended solely to store the full name of this object.                                               */
    String              parentNameAltString         = "";                               /*The alternative name of the parent object.                                                                            */
    String              typeString                  = "";                               /*The type of this object (the only possible values are "FLR", "ROM", and "EXH").                                       */
    /*Variables of panel graphical user interfaces.*/
    boolean             hoverBoolean                = false;
    color               exhibitionPanelColor        = color(143, 86, 59);
    color               floorPanelColor             = color(69 , 40, 60);
    color               roomPanelColor              = color(102, 57, 49);
    int                 widthPanelInt               = 0;
    int                 heightPanelInt              = 0;
    int                 xPanelInt                   = 0;
    int                 yPanelInt                   = 0;
    Panel               panelObject                 = null;

    List<ObjectMuseum>  childObjectList             = new ArrayList<ObjectMuseum>();    /*This list contains all possible exhibition object.    */
    List<ObjectPlayer>  childPlayerObjectList       = new ArrayList<ObjectPlayer>(); 
    List<String>        tagMuseumNameAltStringList  = new ArrayList<String>();          /*The tags for this museum object.                      */
    List<String>        tagMuseumNameFullStringList = new ArrayList<String>();          /*The tags for this museum object.                      */
    List<Tag>           tagMuseumObjectList         = new ArrayList<Tag>();             /*Object tag list.                                      */
    String[]            explanationStringArray      = new String[4];

    ObjectMuseum                                    (

        Name                                        _nameObject             ,
        String                                      _parentNameAltString    ,
        String                                      _typeString             ,
        String[]                                    _explanationStringArray ,
        Tag...                                      _tagObjectArray

    ){

        /*We put in the name object from the first argument of this class.
        The name object is an object that contains only two variables,
            the alternative name of an object and the full name of an object
        For processing within this whoel application we used the alternative name.*/
        nameObject                                  = _nameObject;
        nameAltString                               = nameObject.nameAltString;
        nameFullString                              = nameObject.nameFullString;

        /*We put the alternative name of the parent here.
        For example the anternative name of an exhibition object must be
            an object with type string of "ROM" which mean the parent object
            is an room object.*/
        parentNameAltString                         = _parentNameAltString;

        /*This is the type of this object.
        The only possible input will be,
            "FLR" if this object is a room object,
            "ROM" if this object is a room object,
            "EXH" if this object is an exhibition object.*/
        typeString                                  = _typeString;

        /*Assign the added tags and then convert it from array to List.*/
        tagMuseumObjectList                         = Arrays.asList(_tagObjectArray);
        for(int i = 0; i < tagMuseumObjectList.size(); i ++){

            tagMuseumNameAltStringList  .add(tagMuseumObjectList.get(i).tagNameAltString );
            tagMuseumNameFullStringList .add(tagMuseumObjectList.get(i).tagNameFullString);

        }

        for(int i = 0; i < 4; i ++){ explanationStringArray[i] = nameFullString + " " + _explanationStringArray[i]; }

        /*Create panel.*/
        panelObject                                 = new Panel();

    }

    /*A function to update this object museum variables over time.*/
    void DrawVoid()                                                                     {

        SetFullBoolean  ();
        SetHoverBoolean ();
        PanelDrawVoid   ();

    }

    void ResetVoid(){

        fullBoolean         = false;
        visitorCurrentInt   = 0;
        visitorTotalInt     = 0;

    }

    /*A set of functions to move this object into a new parent object.
    For initial use, use SetInitialParentObject() instead of this function!.*/
    void SetParentVoid(

        List<ObjectMuseum>  _targetObjectList       , 
        String              _parentNameAltString

    ){

        RemoveChildObjectList       (_targetObjectList      );
        SetParentNameAltString      (_parentNameAltString   );
        SetInitialParentObject      (_targetObjectList      );
        SetChildObjectList          (_targetObjectList      );
        SetIndexAllInsideVoid       (                       );

    }

    /*This class function to set both local and global index.*/
    void SetIndexInsideVoid()                                                           {

        indexLocalInt           = SetIndexLocalInt();
        indexGlobalInt          = SetIndexGlobalInsideInt();

    }

    /*This function is to set all index in all possible museum object within this application.*/
    void SetIndexAllInsideVoid()                                                        {

        /*Set the index of all object museum in the application.*/
        for(int i = 0; i < floorObjectList.size()       ; i ++){ floorObjectList        .get(i).SetIndexInsideVoid(); }
        for(int i = 0; i < roomObjectList.size()        ; i ++){ roomObjectList         .get(i).SetIndexInsideVoid(); }
        for(int i = 0; i < exhibitionObjectList.size()  ; i ++){ exhibitionObjectList   .get(i).SetIndexInsideVoid(); }

    }

    void SetPanelVariableInsideVoid()                                                   {

        /*Panel layout calculations.*/
        if          (typeString.equals("FLR")){

            widthPanelInt   = (width - (panelLayoutOffsetSideInt*2) - (panelLayoutOffsetInt*floorObjectList.size()))/floorObjectList.size();
            heightPanelInt  = (height - ((panelLayoutOffsetInt*panelLayoutTotalRowInt) + panelLayoutOffsetInt))/panelLayoutTotalRowInt;
            xPanelInt       = panelLayoutOffsetSideInt + (indexGlobalInt*widthPanelInt) + (indexGlobalInt*panelLayoutOffsetInt);
            yPanelInt       = panelLayoutOffsetInt;

            if      (widthPanelInt <= 10 ){ widthPanelInt = 10;  }
            else if (heightPanelInt <= 10){ heightPanelInt = 10; }

        }

        /*PENDING: Noise error here.*/
        //if(nameAltString.equals("EXH_TES")){ println(parentObject.childObjectList.size()); }

        else if     (typeString.equals("ROM") || typeString.equals("EXH")){

            /*Check whether the parent object has been deleted or not.*/
            if(parentObject == null){
                if      (typeString.equals("ROM")){ parentObject = floorObjectList.get(0); }
                else if (typeString.equals("EXH")){ parentObject = roomObjectList.get(0) ; }
            }

            widthPanelInt   = ((parentObject.widthPanelInt - ((parentObject.childObjectList.size() - 1)*panelLayoutOffsetInt))/parentObject.childObjectList.size());
            heightPanelInt  = parentObject.heightPanelInt;
            xPanelInt       = parentObject.xPanelInt + (indexLocalInt*widthPanelInt) + (indexLocalInt*panelLayoutOffsetInt);
            yPanelInt       = parentObject.yPanelInt + parentObject.heightPanelInt + panelLayoutOffsetInt;

            if      (widthPanelInt <= 10 ){ widthPanelInt = 10;  }
            else if (heightPanelInt <= 10){ heightPanelInt = 10; }

        }
        
    }

    /*A function to set the threshold to determine whether this museum object is full or not.*/
    boolean SetFullBoolean()                                                            {

        if      (museumObjectFullThresholdInt   <= visitorCurrentInt)  { fullBoolean = true;  }
        else if (museumObjectFullThresholdInt   >  visitorCurrentInt)  { fullBoolean = false; }

        return                      fullBoolean;
        
    }

    /*A function to determine whether this object is hovered by mouse or not.*/
    boolean SetHoverBoolean()                                                           {

        if(

            (mouseX < panelObject.xPanelInt + panelObject.widthPanelInt )   &&
            (mouseX > panelObject.xPanelInt                             )   &&
            (mouseY < panelObject.yPanelInt + panelObject.heightPanelInt)   &&
            (mouseY > panelObject.yPanelInt                             )

        )   { hoverBoolean = true ; }
        else{ hoverBoolean = false; }

        return hoverBoolean;

    }

    /*A function to find this object index in its array list (not parent nor child object list).*/
    int SetIndexInt(List<ObjectMuseum> _targetObjectList)                              {

        int indexInt            = -1;
        for(int i = 0; i < _targetObjectList.size(); i ++){
            if(_targetObjectList.get(i).nameAltString.equals(nameAltString)){ indexInt = i; break; }
        }

        return indexInt;

    }

    /*A bare function to set global index int of this object in the main global object list.*/
    int SetIndexGlobalInt(List<ObjectMuseum> _targetObjectList)                         {

        indexGlobalInt  = SetIndexInt(_targetObjectList);
        return          indexGlobalInt;

    }

    /*A class specific function to set global index int.*/
    int SetIndexGlobalInsideInt()                                                       {

        if      (typeString.equals("FLR")){ indexGlobalInt = SetIndexGlobalInt(floorObjectList);        }
        else if (typeString.equals("ROM")){ indexGlobalInt = SetIndexGlobalInt(roomObjectList);         }
        else if (typeString.equals("EXH")){ indexGlobalInt = SetIndexGlobalInt(exhibitionObjectList);   }
        return  indexGlobalInt;

    }

    /*A function to set local index int of this object in its parent index.*/
    int SetIndexLocalInt()                                                              {

        if(!typeString.equals("FLR")){ indexLocalInt = SetIndexInt(parentObject.childObjectList); }
        return indexLocalInt;

    }

    /*A function to remove this object from child object of its parent.*/
    List<ObjectMuseum> RemoveChildObjectList(List<ObjectMuseum> _targetObjectList)      {

        for(int i = 0; i < parentObject.childObjectList.size(); i ++){
            if(parentObject.childObjectList.get(i).nameAltString.equals(nameAltString)){ parentObject.childObjectList.remove(i); }
        }
        return _targetObjectList;

    }

    /*A function to set children of this museum object.*/
    List<ObjectMuseum> SetChildObjectList(List<ObjectMuseum> _targetObjectList){

        if(childObjectList.size() > 0){ childObjectList.clear(); }                                                                                                                      /*Clear the child object List and then this function will make a new child object List.                                 */
        for(int i = 0; i < _targetObjectList.size(); i ++){ if(nameAltString.equals(_targetObjectList.get(i).parentNameAltString)){ childObjectList.add(_targetObjectList.get(i)); } }  /*Iterate through _targetObjectList to find any object of which has this object alternate name as its parent object.    */
        return childObjectList;

    }

    /*A function to return object from any object list.*/
    ObjectMuseum FindObject(

        List<ObjectMuseum>  _targetObjectList       , 
        String              _nameAltString

    ){

        ObjectMuseum objectMuseum = null;
        for(int i = 0; i < _targetObjectList.size(); i ++){
            if(_targetObjectList.get(i).nameAltString.equals(_nameAltString)){ objectMuseum = _targetObjectList.get(i); }
        }
        return objectMuseum;

    }

    /*A function to set this object parent object.*/
    ObjectMuseum SetInitialParentObject(List<ObjectMuseum> _targetObjectList){

        /*Iterate through all parent object to find this object parent object.*/
        for(int i = 0; i < _targetObjectList.size(); i ++){
            if(parentNameAltString.equals(_targetObjectList.get(i).nameAltString)){ parentObject = _targetObjectList.get(i); return parentObject; }
        }
        /*If the parent object is not found within the list then move this object into the the first index of _targetObjectList.                                                                        */
        parentObject                = _targetObjectList.get(0)      ; /*Change the object.                                                                                                              */
        parentNameAltString         = parentObject.nameAltString    ; /*Do not forget to change the parent alternate name.                                                                              */
        return                      parentObject                    ; /*Return the parent object. This line of code executed when this object failed to find its parent within the _targetObjectList.   */

    }
    
    /*A function to draw panel.*/
    Panel PanelDrawVoid()                                                                 {

        SetPanelVariableInsideVoid  ();

        /*Adjust the color based on what panel is this object used for.*/
        color   usedColor;
        if      (typeString.equals("FLR"))  { usedColor = floorPanelColor;          }
        else if (typeString.equals("ROM"))  { usedColor = roomPanelColor;           }
        else if (typeString.equals("EXH"))  { usedColor = exhibitionPanelColor;     }
        else                                { usedColor = color(0);                 }

        panelObject             .DrawVoid(

            usedColor           ,
            widthPanelInt       ,
            heightPanelInt      ,
            xPanelInt           ,
            yPanelInt           ,
            nameAltString

        );

        return panelObject;

    }

    /*Set the parent alternative name String.*/
    String SetParentNameAltString(String _parentNameAltString)                          {

        parentNameAltString     = _parentNameAltString;
        return                  parentNameAltString;

    }
    
};
