import java.util.*;

/*A class for museum object.
The museum objects within this application are things that can interract with visitor.
For example floor, room, and exhibition.*/
class   MuseumObject                            {

    List<MuseumObject>  childObjectList         = new ArrayList<MuseumObject>();    /*This list contains all object that is sub - ordinate of this object..*/

    List<MuseumObject>  floorObjectList         = new ArrayList<MuseumObject>();    /*This list contains all possible floor object.*/
    List<MuseumObject>  roomObjectList          = new ArrayList<MuseumObject>();    /*This list contains all possible room object.*/
    List<MuseumObject>  exhibitionObjectList    = new ArrayList<MuseumObject>();    /*This list contains all possible exhibition object.*/

    int                 indexGlobalInt          = -1;                               /*This is an index number of the location of this object in its respective list.*/
    int                 indexLocalInt           = -1;                               /*This is an index number of the location of this object within its parent child object list.*/

    Name                nameObject              = null;                             /*Name object that contains the alternative name and the full name of this object.*/
    String              nameAltString           = "";                               /*This variable is intended solely to store the alternative name of this object.*/
    String              nameFullString          = "";                               /*This variable is intended solely to store the full name of this object.*/

    MuseumObject        parentObject            = null;                             /*The object parent of this object, which means this object should be inside the parent object's child object list.*/
    String              parentNameAltString     = "";                               /*The alternative name of the parent object.*/
    
    String              typeString              = "";                               /*The type of this object (the only possible values are "FLR", "ROM", and "EXH").*/

    List<String>        tagStringList           = new ArrayList<String>();          /*The tags for whit museum object.*/

    int                 visitorCurrentInt       = 0;                                /*This museum object current visitor.*/
    int                 visitorTotalInt         = 0;                                /*This museum objecy total visitor.*/

    MuseumObject                                (

        Name                                    _nameObject,
        String                                  _typeString,
        String...                               _tagStringList

    ){


        nameObject                              = _nameObject;
        nameAltString                           = nameObject.nameAltString;
        nameFullString                          = nameObject.nameFullString;

        typeString                              = _typeString;

        for(String tagString : _tagStringList){ tagStringList.add(tagString); }

        /*DetermineChildObjectList();*/
        /*DetermineIndexGlobalInt();*/
        /*DetermineIndexLocalInt();*/

    }

};