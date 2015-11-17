import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import controlP5.*; 
import java.util.*; 
import java.util.*; 
import controlP5.*; 
import java.util.*; 
import controlP5.*; 
import java.util.*; 
import controlP5.*; 
import java.util.*; 
import controlP5.*; 
import java.util.*; 
import controlP5.*; 
import java.util.*; 
import java.util.*; 
import java.util.*; 
import controlP5.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class JavaProcessingMuseumManager extends PApplet {




/*Database of all important objects in this applications.*/
List<Tag>                   subjectTagObjectList                    = new ArrayList<Tag>            ();
List<Tag>                   verbTagObjectList                       = new ArrayList<Tag>            ();
List<Tag>                   negativeVerbTagObjectList               = new ArrayList<Tag>            ();
List<Tag>                   nounTagObjectList                       = new ArrayList<Tag>            ();
List<Tag>                   adjectiveTagObjectList                  = new ArrayList<Tag>            ();
List<Tag>                   negativeAdjectiveTagObjectList          = new ArrayList<Tag>            ();
List<Tag>                   adverbTagObjectList                     = new ArrayList<Tag>            ();
List<Tag>                   negativeAdverbTagObjectList             = new ArrayList<Tag>            ();
List<String>                subjectTagNameAltStringList             = new ArrayList<String>         ();
List<String>                verbTagNameAltStringList                = new ArrayList<String>         ();
List<String>                negativeVerbTagNameAltStringList        = new ArrayList<String>         ();
List<String>                nounTagNameAltStringList                = new ArrayList<String>         ();
List<String>                adjectiveTagNameAltStringList           = new ArrayList<String>         ();
List<String>                negativeAdjectiveTagNameAltStringList   = new ArrayList<String>         ();
List<String>                adverbTagNameAltStringList              = new ArrayList<String>         ();
List<String>                negativeAdverbTagNameAltStringList      = new ArrayList<String>         ();
List<String>                subjectTagNameFullStringList            = new ArrayList<String>         ();
List<String>                verbTagNameFullStringList               = new ArrayList<String>         ();
List<String>                negativeVerbTagNameFullStringList       = new ArrayList<String>         ();
List<String>                nounTagNameFullStringList               = new ArrayList<String>         ();
List<String>                adjectiveTagNameFullStringList          = new ArrayList<String>         ();
List<String>                negativeAdjectiveTagNameFullStringList  = new ArrayList<String>         ();
List<String>                adverbTagNameFullStringList             = new ArrayList<String>         ();
List<String>                negativeAdverbTagNameFullStringList     = new ArrayList<String>         ();
List<ObjectMuseum>          floorObjectList                         = new ArrayList<ObjectMuseum>   ();
List<ObjectMuseum>          roomObjectList                          = new ArrayList<ObjectMuseum>   ();
List<ObjectMuseum>          exhibitionObjectList                    = new ArrayList<ObjectMuseum>   ();
List<ObjectPlayer>          playerObjectList                        = new ArrayList<ObjectPlayer>   ();
List<String>                museumNameAltStringList                 = new ArrayList<String>         ();
List<String>                floorNameAltStringList                  = new ArrayList<String>         ();
List<String>                roomNameAltStringList                   = new ArrayList<String>         ();
List<String>                exhibitionNameAltStringList             = new ArrayList<String>         ();
List<String>                floorNameFullStringList                 = new ArrayList<String>         ();
List<String>                roomNameFullStringList                  = new ArrayList<String>         ();
List<String>                exhibitionNameFullStringList            = new ArrayList<String>         ();
List<String>                playerStringList                        = new ArrayList<String>         ();
List<String>                museumNameFullStringList                = new ArrayList<String>         ();
List<String>                defaultStringList                       ;
/*Panel card variables.*/
boolean                     panelCardChangeBoolean                  = true                          ;
int                       panelCardColor                          = color(63, 63, 116)            ;
int                         panelLineSpacingInt                     = 5                             ;
int                         rowInt                                  = 0                             ;
int                         textSizePanelInt                        = 16                            ;
int                         xPanelCardInt                           = -1                            ;
int                         yPanelCardInt                           = -1                            ;
int                         heightPanelCardInt                      = 280                           ;
int                         widthPanelCardInt                       = 200                           ;
ObjectMuseum                tempSelectedMuseumObject                = null                          ;
ObjectPlayer                tempSelectedPlayerObject                = null                          ;
PFont                       panelCardPFont                          ;
String                      panelFontString                         = "Monospaced.plain"            ;
String                      panelString                             = ""                            ;   
String                      tempFullString                          ;
String                      tempVisitorCurrentString                ;
String                      tempVisitorTotalString                  ;
/*Animation and universal GUI variables.*/
float                       animationStepFloat                      = (255f/45f)                    ;   /*Animation time step.*/
float                       dropdownMObjectAlphaFloat               = 0                             ;
float                       dropdownPlayerAlphaFloat                = 0                             ;
int                         guiLayoutOffsetInt                      = 20                            ;
int                         panelLayoutOffsetInt                    = 5                             ;
int                         panelLayoutOffsetSideInt                = 50                            ;
int                         panelLayoutTotalRowInt                  ;
/*Controller variables.*/
int                         buttonSizeInt                           ;
int                         menuWidthInt                            ;
int                         menuHeightInt                           ;
int                         leftMenuXInt                            ;
int                         rightMenuXInt                           ;
int                         menuYInt                                ;
int                         addTagGroupHeightInt                    = 244;
int                         addMuseumGroupHeightInt                 = 442;
int                         editPlayerGroupHeightInt                = 427;
int                         removePlayerGroupHeightInt              = 104;
int                         addPlayerGroupHeightInt                 = 144;
ControlP5                   cp5Object                               ;
Accordion                   leftMenuAccordionObject                 ;
Accordion                   rightMenuAccordionObject                ;
ScrollableList              selectMuseumObjectScrollableListObject  ;
ScrollableList              selectPlayerScrollableListObject        ;
ButtonOpenClose             buttonOpenCloseMuseumObject             ;
ButtonOpenClose             buttonOpenClosePlayerObject             ;
AddMuseumGroupGUIObject     addMuseumGroupGUIObject                 ;
AddTagGroupGUIObject        addTagGroupGUIObject                    ;
AddPlayerGroupGUIObject     addPlayerGroupGUIObject                 ;
RemovePlayerGroupGUIObject  removePlayerGroupGUIObject              ;
EditPlayerGroupGUIObject    editPlayerGroupGUIObject                ;
/*Misc variables.*/
boolean                     buttonOpenCloseBoolean                  = false                         ;
int                         biggestPlayerIndexInt                   = 0                             ;
int                         nextBiggestPlayerIndexInt               = 0                             ;
int                         museumObjectFullThresholdInt            = 0                             ;
int                         playerAmountInt                         = 30                            ;

JSONArray                   adjectiveTagSaveJSONArrayObject         = new JSONArray();
JSONArray                   adverbTagSaveJSONArrayObject            = new JSONArray();
JSONArray                   exhibitionSaveJSONArrayObject           = new JSONArray();
JSONArray                   floorSaveJSONArrayObject                = new JSONArray();
JSONArray                   negativeAdjectiveTagSaveJSONArrayObject = new JSONArray();
JSONArray                   negativeAdverbTagSaveJSONArrayObject    = new JSONArray();
JSONArray                   negativeVerbTagSaveJSONArrayObject      = new JSONArray();
JSONArray                   nounTagSaveJSONArrayObject              = new JSONArray();
JSONArray                   playerSaveJSONArrayObject               = new JSONArray();
JSONArray                   roomSaveJSONArrayObject                 = new JSONArray();
JSONArray                   subjectTagSaveJSONArrayObject           = new JSONArray();
JSONArray                   verbTagSaveJSONArrayObject              = new JSONArray();
JSONObject                  adjectiveTagSaveJSONObject              = new JSONObject();
JSONObject                  adverbTagSaveJSONObject                 = new JSONObject();
JSONObject                  exhibitionSaveJSONObject                = new JSONObject();
JSONObject                  floorSaveJSONObject                     = new JSONObject();
JSONObject                  negativeAdjectiveTagSaveJSONObject      = new JSONObject();
JSONObject                  negativeAdverbTagSaveJSONObject         = new JSONObject();
JSONObject                  negativeVerbTagSaveJSONObject           = new JSONObject();
JSONObject                  nounTagSaveJSONObject                   = new JSONObject();
JSONObject                  playerSaveJSONObject                    = new JSONObject();
JSONObject                  roomSaveJSONObject                      = new JSONObject();
JSONObject                  subjectTagSaveJSONObject                = new JSONObject();
JSONObject                  verbTagSaveJSONObject                   = new JSONObject();

/*Name class to manage an object name.*/
class Name                                      {

    String          nameAltString   = "";
    String          nameFullString  = "";
    Name(

        String _nameAltString   , 
        String _nameFullString

    ){

        nameAltString               = _nameAltString;
        nameFullString              = _nameFullString;

    }

};

/*A tag class to manage tag object.
This is not quite necessary because you can use the Name class instead.
I guess I will put it here for the time being :).*/
class Tag                                       {

    Name            tagName                     = null;
    String          nameAltString               = "";
    String          nameFullString              = "";

    String          tagTypeString               = "";

    String          tagSubjectString            = "";
    String          tagVerb1String              = "";
    String          tagVerb2String              = "";
    String          tagVerb3String              = "";
    String          tagVerbSString              = "";
    String          tagVerbIngString            = "";
    String          tagNegativeVerb1String      = "";
    String          tagNegativeVerb2String      = "";
    String          tagNegativeVerb3String      = "";
    String          tagNegativeVerbSString      = "";
    String          tagNegativeVerbIngString    = "";
    String          tagNounString               = "";
    String          tagNounSString              = "";
    String          tagAdjectiveString          = "";
    String          tagNegativeAdjectiveString  = "";
    String          tagAdverbString             = "";
    String          tagNegativeAdverbString     = "";

    Tag(

        Name        _nameObject                 ,
        String      _tagTypeString              ,
        String...   _wordDerivativeStringArray

    ){

        tagName                         = _nameObject;
        nameAltString                   = tagName.nameAltString;
        nameFullString                  = tagName.nameFullString;
        tagTypeString                   = _tagTypeString;

        if      (tagTypeString.equals("SUB")){ tagSubjectString     = _wordDerivativeStringArray[0]; }
        else if (tagTypeString.equals("VER")){

            tagVerb1String              = _wordDerivativeStringArray[0];
            tagVerb2String              = _wordDerivativeStringArray[1];
            tagVerb3String              = _wordDerivativeStringArray[2];
            tagVerbSString              = _wordDerivativeStringArray[3];
            tagVerbIngString            = _wordDerivativeStringArray[4];

        }
        else if (tagTypeString.equals("NVE")){

            tagNegativeVerb1String      = _wordDerivativeStringArray[0];
            tagNegativeVerb2String      = _wordDerivativeStringArray[1];
            tagNegativeVerb3String      = _wordDerivativeStringArray[2];
            tagNegativeVerbSString      = _wordDerivativeStringArray[3];
            tagNegativeVerbIngString    = _wordDerivativeStringArray[4];

        }
        else if (tagTypeString.equals("NOU")){

            tagNounString               = _wordDerivativeStringArray[0];
            tagNounSString              = _wordDerivativeStringArray[1];

        }
        else if (tagTypeString.equals("ADJ")){ tagAdjectiveString           = _wordDerivativeStringArray[0]; }
        else if (tagTypeString.equals("NDJ")){ tagNegativeAdjectiveString   = _wordDerivativeStringArray[0]; }
        else if (tagTypeString.equals("ADV")){ tagAdverbString              = _wordDerivativeStringArray[0]; }
        else if (tagTypeString.equals("NDV")){ tagNegativeAdverbString      = _wordDerivativeStringArray[0]; }
        

    }

}

public void setup()                                    {

    size                                (1024, 576, P2D);
    noStroke                            ();

    /*
    subjectTagObjectList            = Arrays.asList(

        new Tag(new Name("SUB_NAP", "Subject Napoleon"      ), "SUB", "Napoleon"),
        new Tag(new Name("SUB_WAS", "Subject Washington"    ), "SUB", "Washington")

    );

    verbTagObjectList               = Arrays.asList(

        new Tag(new Name("VER_JUM", "Verb Jump"             ), "VER", "jump", "jumped", "jumped", "jumps", "jumping"),
        new Tag(new Name("VER_RUN", "Verb Run"              ), "VER", "run", "ran", "run", "runs", "running")

    );

    negativeVerbTagObjectList       = Arrays.asList(

        new Tag(new Name("NVE_DIE", "Verb Die"              ), "NVE", "die", "died", "died", "dies", "dying"),
        new Tag(new Name("NVE_KIL", "Verb Kill"             ), "NVE", "kill", "killed", "killed", "kills", "killing")

    );

    nounTagObjectList               = Arrays.asList(

        new Tag(new Name("NOU_BAL", "Noun Ball"             ), "NOU", "ball", "balls"),
        new Tag(new Name("NOU_GUN", "Noun Gun"              ), "NOU", "gun", "guns")

    );

    adjectiveTagObjectList          = Arrays.asList(

        new Tag(new Name("ADJ_BAD", "Adjective Excellent"   ), "ADJ", "excellent"),
        new Tag(new Name("ADJ_GOD", "Adjective Good"        ), "ADJ", "good")

    );

    negativeAdjectiveTagObjectList  = Arrays.asList(

        new Tag(new Name("NDJ_AWF", "Adjective Awful"       ), "NDJ", "awful"),
        new Tag(new Name("NDJ_BAD", "Adjective Bad"         ), "NDJ", "bad")

    );

    adverbTagObjectList             = Arrays.asList(

        new Tag(new Name("ADV_PER", "Adverb Perfectly"      ), "ADV", "perfectly"),
        new Tag(new Name("ADV_QUI", "Adverb Quickly"        ), "ADV", "quickly")

    );

    negativeAdverbTagObjectList     = Arrays.asList(

        new Tag(new Name("NDV_DES", "Adverb Desperately"    ), "NDV", "desperately"),
        new Tag(new Name("NDV_SLO", "Adverb Slowly"         ), "NDV", "slowly")

    );
    */
    JSONArray subjectTagLoadJSONArrayObject = loadJSONArray("data/subjectTag.json");
    for(int i = 0; i < subjectTagLoadJSONArrayObject.size(); i ++){

        JSONObject subjectTagLoadJSONObject = subjectTagLoadJSONArrayObject.getJSONObject(i);
        String tempNameAltString = subjectTagLoadJSONObject.getString("nameAltString");
        String tempNameFullString = subjectTagLoadJSONObject.getString("nameFullString");
        String tempTagSubjectString = subjectTagLoadJSONObject.getString("tagSubjectString");
        String tempTagTypeString = subjectTagLoadJSONObject.getString("tagTypeString");
        Tag tempTagObject = new Tag(new Name(tempNameAltString, tempNameFullString), tempTagTypeString, tempTagSubjectString);
        subjectTagObjectList.add(tempTagObject);

    }

    JSONArray verbTagLoadJSONArrayObject = loadJSONArray("data/verbTag.json");
    for(int i = 0; i < verbTagLoadJSONArrayObject.size(); i ++){

        JSONObject verbTagLoadJSONObject = verbTagLoadJSONArrayObject.getJSONObject(i);
        String tempNameAltString = verbTagLoadJSONObject.getString("nameAltString");
        String tempNameFullString = verbTagLoadJSONObject.getString("nameFullString");
        String tempTagTypeString = verbTagLoadJSONObject.getString("tagTypeString");
        String tempTagVerb1String = verbTagLoadJSONObject.getString("tagVerb1String");
        String tempTagVerb2String = verbTagLoadJSONObject.getString("tagVerb2String");
        String tempTagVerb3String = verbTagLoadJSONObject.getString("tagVerb3String");
        String tempTagVerbIngString = verbTagLoadJSONObject.getString("tagVerbIngString");
        String tempTagVerbSString = verbTagLoadJSONObject.getString("tagVerbSString");
        Tag tempTagObject = new Tag(new Name(tempNameAltString, tempNameFullString), tempTagTypeString, tempTagVerb1String, tempTagVerb2String, tempTagVerb3String, tempTagVerbIngString, tempTagVerbSString);
        verbTagObjectList.add(tempTagObject);

    }

    JSONArray negativeVerbTagLoadJSONArrayObject = loadJSONArray("data/negativeVerbTag.json");
    for(int i = 0; i < negativeVerbTagLoadJSONArrayObject.size(); i ++){

        JSONObject negativeVerbTagLoadJSONObject = negativeVerbTagLoadJSONArrayObject.getJSONObject(i);
        String tempNameAltString = negativeVerbTagLoadJSONObject.getString("nameAltString");
        String tempNameFullString = negativeVerbTagLoadJSONObject.getString("nameFullString");
        String tempTagNegativeVerb1String = negativeVerbTagLoadJSONObject.getString("tagNegativeVerb1String");
        String tempTagNegativeVerb2String = negativeVerbTagLoadJSONObject.getString("tagNegativeVerb2String");
        String tempTagNegativeVerb3String = negativeVerbTagLoadJSONObject.getString("tagNegativeVerb3String");
        String tempTagNegativeVerbIngString = negativeVerbTagLoadJSONObject.getString("tagNegativeVerbIngString");
        String tempTagNegativeVerbSString = negativeVerbTagLoadJSONObject.getString("tagNegativeVerbSString");
        String tempTagTypeString = negativeVerbTagLoadJSONObject.getString("tagTypeString");
        Tag tempTagObject = new Tag(new Name(tempNameAltString, tempNameFullString), tempTagTypeString, tempTagNegativeVerb1String, tempTagNegativeVerb2String, tempTagNegativeVerb3String, tempTagNegativeVerbIngString, tempTagNegativeVerbSString);
        negativeVerbTagObjectList.add(tempTagObject);

    }
    JSONArray nounTagLoadJSONArrayObject = loadJSONArray("data/nounTag.json");
    for(int i = 0; i < nounTagLoadJSONArrayObject.size(); i ++){

        JSONObject nounTagLoadJSONObject = nounTagLoadJSONArrayObject.getJSONObject(i);
        String tempNameAltString = nounTagLoadJSONObject.getString("nameAltString");
        String tempNameFullString = nounTagLoadJSONObject.getString("nameFullString");
        String tempTagNounSString = nounTagLoadJSONObject.getString("tagNounSString");
        String tempTagNounString = nounTagLoadJSONObject.getString("tagNounString");
        String tempTagTypeString = nounTagLoadJSONObject.getString("tagTypeString");
        Tag tempTagObject = new Tag(new Name(tempNameAltString, tempNameFullString), tempTagTypeString, tempTagNounString, tempTagNounSString);
        nounTagObjectList.add(tempTagObject);

    }
    JSONArray adjectiveTagLoadJSONArrayObject = loadJSONArray("data/adjectiveTag.json");
    for(int i = 0; i < adjectiveTagLoadJSONArrayObject.size(); i ++){

        JSONObject adjectiveTagLoadJSONObject = adjectiveTagLoadJSONArrayObject.getJSONObject(i);
        String tempNameAltString = adjectiveTagLoadJSONObject.getString("nameAltString");
        String tempNameFullString = adjectiveTagLoadJSONObject.getString("nameFullString");
        String tempTagAdjectiveString = adjectiveTagLoadJSONObject.getString("tagAdjectiveString");
        String tempTagTypeString = adjectiveTagLoadJSONObject.getString("tagTypeString");
        Tag tempTagObject = new Tag(new Name(tempNameAltString, tempNameFullString), tempTagTypeString, tempTagAdjectiveString);
        adjectiveTagObjectList.add(tempTagObject);

    }
    JSONArray negativeAdjectiveTagLoadJSONArrayObject = loadJSONArray("data/negativeAdjectiveTag.json");
    for(int i = 0; i < negativeAdjectiveTagLoadJSONArrayObject.size(); i ++){

        JSONObject negativeAdjectiveTagLoadJSONObject = negativeAdjectiveTagLoadJSONArrayObject.getJSONObject(i);
        String tempNameAltString = negativeAdjectiveTagLoadJSONObject.getString("nameAltString");
        String tempNameFullString = negativeAdjectiveTagLoadJSONObject.getString("nameFullString");
        String tempTagNegativeAdjectiveString = negativeAdjectiveTagLoadJSONObject.getString("tagNegativeAdjectiveString");
        String tempTagTypeString = negativeAdjectiveTagLoadJSONObject.getString("tagTypeString");
        Tag tempTagObject = new Tag(new Name(tempNameAltString, tempNameFullString), tempTagTypeString, tempTagNegativeAdjectiveString);
        negativeAdjectiveTagObjectList.add(tempTagObject);

    }
    JSONArray adverbTagLoadJSONArrayObject = loadJSONArray("data/adverbTag.json");
    for(int i = 0; i < adverbTagLoadJSONArrayObject.size(); i ++){

        JSONObject adverbTagLoadJSONObject = adverbTagLoadJSONArrayObject.getJSONObject(i);
        String tempNameAltString = adverbTagLoadJSONObject.getString("nameAltString");
        String tempNameFullString = adverbTagLoadJSONObject.getString("nameFullString");
        String tempTagAdverbString = adverbTagLoadJSONObject.getString("tagAdverbString");
        String tempTagTypeString = adverbTagLoadJSONObject.getString("tagTypeString");
        Tag tempTagObject = new Tag(new Name(tempNameAltString, tempNameFullString), tempTagTypeString, tempTagAdverbString);
        adverbTagObjectList.add(tempTagObject);

    }
    JSONArray negativeAdverbTagLoadJSONArrayObject = loadJSONArray("data/negativeAdverbTag.json");
    for(int i = 0; i < negativeAdverbTagLoadJSONArrayObject.size(); i ++){

        JSONObject negativeAdverbTagLoadJSONObject = negativeAdverbTagLoadJSONArrayObject.getJSONObject(i);
        String tempNameAltString = negativeAdverbTagLoadJSONObject.getString("nameAltString");
        String tempNameFullString = negativeAdverbTagLoadJSONObject.getString("nameFullString");
        String tempTagNegativeAdverbString = negativeAdverbTagLoadJSONObject.getString("tagNegativeAdverbString");
        String tempTagTypeString = negativeAdverbTagLoadJSONObject.getString("tagTypeString");
        Tag tempTagObject = new Tag(new Name(tempNameAltString, tempNameFullString), tempTagTypeString, tempTagNegativeAdverbString);
        negativeAdverbTagObjectList.add(tempTagObject);

    }
    JSONArray floorLoadJSONArrayObject = loadJSONArray("data/floor.json");
    for(int i = 0; i < floorLoadJSONArrayObject.size(); i ++){

        JSONObject floorLoadJSONObject = floorLoadJSONArrayObject.getJSONObject(i);

        String tempNameAltString = floorLoadJSONObject.getString("nameAltString");
        String tempNameFullString = floorLoadJSONObject.getString("nameFullString");
        String tempParentNameAltString = floorLoadJSONObject.getString("parentNameAltString");
        String tempTypeString = floorLoadJSONObject.getString("typeString");
        int indexCounterInt = 0;
        List<Tag> tempTagObjectList = new ArrayList<Tag>();
        while(floorLoadJSONObject.hasKey("tagMuseumNameAltStringList" + indexCounterInt)){

            String tempTagNameAltString = floorLoadJSONObject.getString("tagMuseumNameAltStringList" + indexCounterInt);
            Tag tempTagObject = FindTagObject(tempTagNameAltString);
            tempTagObjectList.add(tempTagObject);
            indexCounterInt ++;

        }
        Tag[] tempTagObjectArray = new Tag[tempTagObjectList.size()];
        tempTagObjectList.toArray(tempTagObjectArray);
        ObjectMuseum tempMuseumObject = new ObjectMuseum(new Name(tempNameAltString, tempNameFullString), tempParentNameAltString, tempTypeString, tempTagObjectArray);

        indexCounterInt = 0;
        while(floorLoadJSONObject.hasKey("childObjectList" + indexCounterInt)){
            String tempChildObjectNameAltString = floorLoadJSONObject.getString("childObjectList" + indexCounterInt);
            ObjectMuseum tempChildObject = FindMuseumObject(tempChildObjectNameAltString);
            tempMuseumObject.childObjectList.add(tempChildObject);
            indexCounterInt ++;
        }
        indexCounterInt = 0;
        while(floorLoadJSONObject.hasKey("childPlayerObjectList" + indexCounterInt)){
            int tempChildPlayerObjectPlayerIndexInt = floorLoadJSONObject.getInt("childPlayerObjectList" + indexCounterInt);
            ObjectPlayer tempChildPlayerObjectPlayerIndexObject = FindPlayerObject(tempChildPlayerObjectPlayerIndexInt);
            tempMuseumObject.childPlayerObjectList.add(tempChildPlayerObjectPlayerIndexObject);
            indexCounterInt ++;
        }
        indexCounterInt = 0;
        boolean tempFullBoolean = floorLoadJSONObject.getBoolean("fullBoolean"); tempMuseumObject.fullBoolean = tempFullBoolean;
        int tempIndexGlobalInt = floorLoadJSONObject.getInt("indexGlobalInt"); tempMuseumObject.indexGlobalInt = tempIndexGlobalInt;
        int tempIndexLocalInt = floorLoadJSONObject.getInt("indexLocalInt"); tempMuseumObject.indexLocalInt = tempIndexLocalInt;
        int tempVisitorCurrentInt = floorLoadJSONObject.getInt("visitorCurrentInt"); tempMuseumObject.visitorCurrentInt = tempVisitorCurrentInt;
        int tempVisitorTotalInt = floorLoadJSONObject.getInt("visitorTotalInt"); tempMuseumObject.visitorTotalInt = tempVisitorTotalInt;

        floorObjectList.add(tempMuseumObject);

    }

    floorObjectList         = Arrays.asList(

        new ObjectMuseum(new Name("FLR_001", "First Floor"                        ), "XXX_XXX", "FLR", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
        new ObjectMuseum(new Name("FLR_002", "Second Floor"                       ), "XXX_XXX", "FLR", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList))

    );

    roomObjectList          = Arrays.asList(

        new ObjectMuseum(new Name("ROM_AFK", "Room Afrika"                        ), "FLR_001", "ROM", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
        new ObjectMuseum(new Name("ROM_AME", "Room America"                       ), "FLR_001", "ROM", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
        new ObjectMuseum(new Name("ROM_ASI", "Room Asia"                          ), "FLR_002", "ROM", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
        new ObjectMuseum(new Name("ROM_EUR", "Room Europe"                        ), "FLR_002", "ROM", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList))

    );
    exhibitionObjectList    = Arrays.asList(

        new ObjectMuseum(new Name("EXH_CAO", "Exhibition Cameroon"                ), "ROM_AFK", "EXH", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
        new ObjectMuseum(new Name("EXH_EGY", "Exhibition Egypt"                   ), "ROM_AFK", "EXH", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
        new ObjectMuseum(new Name("EXH_ETH", "Exhibition Ethiopia"                ), "ROM_AFK", "EXH", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
        new ObjectMuseum(new Name("EXH_NIG", "Exhibition Nigeria"                 ), "ROM_AFK", "EXH", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
        new ObjectMuseum(new Name("EXH_BRA", "Exhibition Brazil"                  ), "ROM_AME", "EXH", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
        new ObjectMuseum(new Name("EXH_CAN", "Exhibition Canada"                  ), "ROM_AME", "EXH", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
        new ObjectMuseum(new Name("EXH_MEX", "Exhibition Mexico"                  ), "ROM_AME", "EXH", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
        new ObjectMuseum(new Name("EXH_USA", "Exhibition United States Of America"), "ROM_AME", "EXH", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
        new ObjectMuseum(new Name("EXH_CAM", "Exhibition Cambodia"                ), "ROM_ASI", "EXH", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
        new ObjectMuseum(new Name("EXH_IND", "Exhibition India"                   ), "ROM_ASI", "EXH", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
        new ObjectMuseum(new Name("EXH_JAP", "Exhibition Japan"                   ), "ROM_ASI", "EXH", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
        new ObjectMuseum(new Name("EXH_SIN", "Exhibition Singapore"               ), "ROM_ASI", "EXH", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
        new ObjectMuseum(new Name("EXH_BEL", "Exhibition Belgium"                 ), "ROM_EUR", "EXH", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
        new ObjectMuseum(new Name("EXH_FRA", "Exhibition France"                  ), "ROM_EUR", "EXH", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
        new ObjectMuseum(new Name("EXH_GER", "Exhibition Germany"                 ), "ROM_EUR", "EXH", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList)),
        new ObjectMuseum(new Name("EXH_NED", "Exhibition The Netherlands"         ), "ROM_EUR", "EXH", AssignRandomTagArray(subjectTagObjectList, verbTagObjectList, negativeVerbTagObjectList, nounTagObjectList, adjectiveTagObjectList, negativeAdjectiveTagObjectList, adverbTagObjectList, negativeAdverbTagObjectList))

    );

    floorNameAltStringList                  = new ArrayList<String>         (floorNameAltStringList         );
    roomNameAltStringList                   = new ArrayList<String>         (roomNameAltStringList          );
    exhibitionNameAltStringList             = new ArrayList<String>         (exhibitionNameAltStringList    );
    floorNameFullStringList                 = new ArrayList<String>         (floorNameFullStringList        );
    roomNameFullStringList                  = new ArrayList<String>         (roomNameFullStringList         );
    exhibitionNameFullStringList            = new ArrayList<String>         (exhibitionNameFullStringList   );
    playerStringList                        = new ArrayList<String>         (playerStringList               );
    museumNameFullStringList                = new ArrayList<String>         (museumNameFullStringList       );

    /*Initiate all players.*/
    for(int i = 0; i < playerAmountInt; i ++)                   {

        ObjectPlayer objectPlayer = new ObjectPlayer(

            (i + 1),
            "Dummy",
            exhibitionObjectList.get((int)(Math.floor((Math.random()*exhibitionObjectList.size()) + 0))).nameAltString  /*Generate random starting exhibition for the player.*/

        );

    }

    /*Initiate object parents and children for all object museum.*/
    for(int i = 0; i < floorObjectList.size()           ; i ++) { floorObjectList       .get(i).SetChildObjectList      (roomObjectList ); }
    for(int i = 0; i < roomObjectList.size()            ; i ++) { roomObjectList        .get(i).SetInitialParentObject  (floorObjectList); roomObjectList.get(i).SetChildObjectList(exhibitionObjectList); }
    for(int i = 0; i < exhibitionObjectList.size()      ; i ++) { exhibitionObjectList  .get(i).SetInitialParentObject  (roomObjectList ); }
    /*Determine index for all museum object.*/
    for(int i = 0; i < floorObjectList.size()           ; i ++) { floorObjectList.get(i)        .SetIndexInsideVoid(); }
    for(int i = 0; i < roomObjectList.size()            ; i ++) { roomObjectList.get(i)         .SetIndexInsideVoid(); }
    for(int i = 0; i < exhibitionObjectList.size()      ; i ++) { exhibitionObjectList.get(i)   .SetIndexInsideVoid(); }
    /*Populate String list.*/
    for(int i = 0; i < floorObjectList          .size(); i ++){ floorNameAltStringList                  .add(     floorObjectList           .get(i).nameAltString ); floorNameFullStringList                .add(floorObjectList        .get(i).nameFullString); }
    for(int i = 0; i < roomObjectList           .size(); i ++){ roomNameAltStringList                   .add(     roomObjectList            .get(i).nameAltString ); roomNameFullStringList                 .add(roomObjectList         .get(i).nameFullString); }
    for(int i = 0; i < exhibitionObjectList     .size(); i ++){ exhibitionNameAltStringList             .add(     exhibitionObjectList      .get(i).nameAltString ); exhibitionNameFullStringList           .add(exhibitionObjectList   .get(i).nameFullString); }
    for(int i = 0; i < playerObjectList         .size(); i ++){ playerStringList                        .add("" + playerObjectList          .get(i).playerIndexInt); }
    for(int i = 0; i < subjectTagObjectList     .size(); i ++){ subjectTagNameAltStringList             .add(     subjectTagObjectList      .get(i).nameAltString ); subjectTagNameFullStringList           .add(subjectTagObjectList   .get(i).nameFullString); }
    for(int i = 0; i < verbTagObjectList        .size(); i ++){ verbTagNameAltStringList                .add(     verbTagObjectList         .get(i).nameAltString ); verbTagNameFullStringList              .add(verbTagObjectList      .get(i).nameFullString); }
    for(int i = 0; i < verbTagObjectList        .size(); i ++){ negativeVerbTagNameAltStringList        .add(     verbTagObjectList         .get(i).nameAltString ); negativeVerbTagNameFullStringList      .add(verbTagObjectList      .get(i).nameFullString); }
    for(int i = 0; i < nounTagObjectList        .size(); i ++){ nounTagNameAltStringList                .add(     nounTagObjectList         .get(i).nameAltString ); nounTagNameFullStringList              .add(nounTagObjectList      .get(i).nameFullString); }
    for(int i = 0; i < adjectiveTagObjectList   .size(); i ++){ adjectiveTagNameAltStringList           .add(     adjectiveTagObjectList    .get(i).nameAltString ); adjectiveTagNameFullStringList         .add(adjectiveTagObjectList .get(i).nameFullString); }
    for(int i = 0; i < adjectiveTagObjectList   .size(); i ++){ negativeAdjectiveTagNameAltStringList   .add(     adjectiveTagObjectList    .get(i).nameAltString ); negativeAdjectiveTagNameFullStringList .add(adjectiveTagObjectList .get(i).nameFullString); }
    for(int i = 0; i < adverbTagObjectList      .size(); i ++){ adverbTagNameAltStringList              .add(     adverbTagObjectList       .get(i).nameAltString ); adverbTagNameFullStringList            .add(adverbTagObjectList    .get(i).nameFullString); }
    for(int i = 0; i < adverbTagObjectList      .size(); i ++){ negativeAdverbTagNameAltStringList      .add(     adverbTagObjectList       .get(i).nameAltString ); negativeAdverbTagNameFullStringList    .add(adverbTagObjectList    .get(i).nameFullString); }
    /*Create empty list to display if the object created has no parent (for example, floor object will have no parent).*/
    defaultStringList   = Arrays.asList();

    SaveVoid            ();
    SetupGUIVoid        ();

}

public void draw()                                     {

    /*Set the background color for this application.*/
    background                      (34, 32, 52);
    /*Always update the full threshold and layout total row int.*/
    museumObjectFullThresholdInt    = 2 + (int)(Math.ceil(playerObjectList.size()/exhibitionObjectList.size()));
    panelLayoutTotalRowInt          = (int)(Math.ceil(playerObjectList.size()/exhibitionObjectList.size()) + 5)*2;

    /*Update function for all museum objects and player objects.
    Also within these four for loops we need to get which object is hovered.*/
    for(int i = 0; i < floorObjectList      .size(); i ++){ floorObjectList         .get(i).DrawVoid(); CheckMuseumObjectHoverVoid(i, floorObjectList       ); }
    for(int i = 0; i < roomObjectList       .size(); i ++){ roomObjectList          .get(i).DrawVoid(); CheckMuseumObjectHoverVoid(i, roomObjectList        ); }
    for(int i = 0; i < exhibitionObjectList .size(); i ++){ exhibitionObjectList    .get(i).DrawVoid(); CheckMuseumObjectHoverVoid(i, exhibitionObjectList  ); }
    for(int i = 0; i < playerObjectList     .size(); i ++){ playerObjectList        .get(i).DrawVoid(); CheckPlayerObjectHoverVoid(i                        ); }

    /*This one is to check wether we need to replace the current showed card with a new one.*/
    if      (tempSelectedMuseumObject != null){

        if(

            (mouseX > xPanelCardInt + (tempSelectedMuseumObject.panelObject.widthPanelInt /2)) ||
            (mouseX < xPanelCardInt - (tempSelectedMuseumObject.panelObject.widthPanelInt /2)) ||
            (mouseY > yPanelCardInt + (tempSelectedMuseumObject.panelObject.heightPanelInt/2)) ||
            (mouseY < yPanelCardInt - (tempSelectedMuseumObject.panelObject.heightPanelInt/2))

        ){ panelCardChangeBoolean = true; }

    }
    else if (tempSelectedPlayerObject != null){

        if(

            (mouseX > xPanelCardInt + (tempSelectedPlayerObject.panelObject.widthPanelInt /2)) ||
            (mouseX < xPanelCardInt - (tempSelectedPlayerObject.panelObject.widthPanelInt /2)) ||
            (mouseY > yPanelCardInt + (tempSelectedPlayerObject.panelObject.heightPanelInt/2)) ||
            (mouseY < yPanelCardInt - (tempSelectedPlayerObject.panelObject.heightPanelInt/2))

        ){ panelCardChangeBoolean = true; }

    }
    /*In case we need a new card then we reset all card properties.*/
    if(panelCardChangeBoolean   == true){

        xPanelCardInt               = -1    ;
        yPanelCardInt               = -1    ;
        rowInt                      = 0     ;
        tempSelectedMuseumObject    = null  ;
        tempSelectedPlayerObject    = null  ;

    }
    /*Create the card.*/
    if(buttonOpenCloseBoolean == false)     { CreatePanelCardVoid(); }

    SetButtonOpenCloseBoolean   (); /*Update buttonOpenCloseBoolean.*/

    /*Set the biggest player index so everytime new player added it will be the highest index.*/
    biggestPlayerIndexInt       = GetBiggestPlayerIndexInt();
    nextBiggestPlayerIndexInt   = biggestPlayerIndexInt + 1; 
    addPlayerGroupGUIObject     .addPlayerGroupPlayerIndexValueTextlabelObject.setText("" + nextBiggestPlayerIndexInt);

    DrawGUIVoid                 ();

}

/*The mouse pressed override function is for the open and close button.*/
public void mousePressed()                             {

    if(buttonOpenClosePlayerObject.MouseOverBoolean() == true){ buttonOpenClosePlayerObject.isAnimatingBoolean = true; }
    if(buttonOpenCloseMuseumObject.MouseOverBoolean() == true){ buttonOpenCloseMuseumObject.isAnimatingBoolean = true; }

}

public void exit()                                     { println("EXIT"); }

/*Function to assign specific tag into the whole tag of object player.*/
public void AssignRandomTagLoopVoid(

    List<Tag>   _sourceTagObjectList,
    List<Tag>   _targetTagObjectList

){

    /*Counter on how many tag is already in the museum object.*/
    int     counterInt                              = 0;

    /*This function need to be atleast gives three tags to a museum object.
    After three tags is inside the List then we can randomly add another tag with a chance.
    The thing is that every tag added the chance of another tag will be added/pushed
        is lower.*/
    float   randomCounterFloat                      = 1f;
    while(

        (counterInt             <= (_sourceTagObjectList.size()/2)) ||
        (Math.random()          <  randomCounterFloat)

    ){

        /*Need to make sure the inputted random tag is not something that is already in the museum object
        Create a temporary tag object to hold.*/
        boolean insideBoolean   = false;
        int     randomIndexInt  = (int)((Math.random()*_sourceTagObjectList.size()) + 0);
        Tag     tagObject       = _sourceTagObjectList.get(randomIndexInt);
        
        /*Keep looping over and over until the random index is not a tag that is already in the list.*/
        for(int i = 0; i        < _targetTagObjectList.size(); i ++){

            while(_targetTagObjectList.get(i).nameAltString.equals(tagObject.nameAltString)){

                insideBoolean   = true;
                randomIndexInt  = (int)((Math.random()*_sourceTagObjectList.size()) + 0);
                tagObject       = _sourceTagObjectList.get(randomIndexInt);
                
            }

        }
        
        /*If the assignTagObjectList has three or more elements then we need to start reducing the chance.*/
        if(_targetTagObjectList .size() >= (_sourceTagObjectList.size()/2)) { randomCounterFloat -= 0.2f; }
        counterInt                                                          ++;
        /*Add/push a tag object into the temporary list.*/
        if(insideBoolean == false)                                          { _targetTagObjectList.add(tagObject); }

    }

}

/*A function to check whether an object of museum is hovered by mouse pointer.*/
public void CheckMuseumObjectHoverVoid(

    int _indexInt                           , 
    List<ObjectMuseum> _targetObjectList

){

    /*This is to check which museum/player object is hovered, then create panel based on that object position.*/
    if(_targetObjectList.get(_indexInt).SetHoverBoolean() == true && panelCardChangeBoolean == true && buttonOpenCloseBoolean == false){

        xPanelCardInt           = _targetObjectList.get(_indexInt).panelObject.xPanelInt + (_targetObjectList.get(_indexInt).panelObject.widthPanelInt /2 );
        yPanelCardInt           = _targetObjectList.get(_indexInt).panelObject.yPanelInt + (_targetObjectList.get(_indexInt).panelObject.heightPanelInt/2);
        tempSelectedMuseumObject    = _targetObjectList.get(_indexInt);

        panelCardChangeBoolean  = false;

    }

}

/*A function to check whether an object of player is hovered by mouse pointer.*/
public void CheckPlayerObjectHoverVoid(int _indexInt)  {

    /*This is to check which museum/player object is hovered, then create panel based on that object position.*/
    if(playerObjectList.get(_indexInt).SetHoverBoolean() == true && panelCardChangeBoolean == true && buttonOpenCloseBoolean == false){

        xPanelCardInt           = playerObjectList.get(_indexInt).panelObject.xPanelInt + (playerObjectList.get(_indexInt).panelObject.widthPanelInt/2 );
        yPanelCardInt           = playerObjectList.get(_indexInt).panelObject.yPanelInt + (playerObjectList.get(_indexInt).panelObject.heightPanelInt/2);
        tempSelectedPlayerObject    = playerObjectList.get(_indexInt);

        panelCardChangeBoolean  = false;

    }

}

/*A function to control color for each possible type of museum object buttons.*/
public void ColorControlVoid(

    CColor          _floorCColorObject      ,
    CColor          _roomCColorObject       ,
    CColor          _exhibitionCColorObject ,
    ScrollableList  _scrollableList

){

    if(_scrollableList.getName().toString().equals("SelectMuseumObjectScrollableListObject")){

        for(int i = 0; i < museumNameAltStringList.size(); i ++){

            String  itemScrollableString        = _scrollableList.getItem(i).get("text").toString();
            String  tempTypeString              = "";
            if      (FindObjectMuseumIndexInt   (itemScrollableString, floorObjectList)        != -1){ tempTypeString = "FLR";    }
            else if (FindObjectMuseumIndexInt   (itemScrollableString, roomObjectList)         != -1){ tempTypeString = "ROM";    }
            else if (FindObjectMuseumIndexInt   (itemScrollableString, exhibitionObjectList)   != -1){ tempTypeString = "EXH";    }
            if      (tempTypeString             .equals("FLR")){ _scrollableList.getItem(i).put("color", _floorCColorObject);        }
            else if (tempTypeString             .equals("ROM")){ _scrollableList.getItem(i).put("color", _roomCColorObject);         }
            else if (tempTypeString             .equals("EXH")){ _scrollableList.getItem(i).put("color", _exhibitionCColorObject);   }

        }

    }

}

/*A function to create panel card.*/
public void CreatePanelCardVoid(){

    if(panelCardChangeBoolean == false){

        fill                (panelCardColor);
        noStroke            ();

        int tempXPanelInt = xPanelCardInt;
        int tempYPanelInt = yPanelCardInt;
        if((xPanelCardInt + widthPanelCardInt)  > width ){ tempXPanelInt = xPanelCardInt - widthPanelCardInt;  }
        if((yPanelCardInt + heightPanelCardInt) > height){ tempYPanelInt = yPanelCardInt - heightPanelCardInt; }

        rect                (tempXPanelInt, tempYPanelInt, widthPanelCardInt, heightPanelCardInt, 10);
        noFill              ();

        fill                (255);
        textAlign           (CENTER);
        panelCardPFont      = createFont(panelFontString, textSizePanelInt);
        textFont            (panelCardPFont);

        /*String display for the player object.*/
        if          (tempSelectedMuseumObject == null){

            rowInt      = 9;

            ObjectMuseum exhibitionCurrentObject    = tempSelectedPlayerObject.FindObject(exhibitionObjectList  , tempSelectedPlayerObject.exhibitionCurrentString          );
            ObjectMuseum roomCurrentObject          = tempSelectedPlayerObject.FindObject(roomObjectList        , exhibitionCurrentObject   .parentObject.nameAltString );
            ObjectMuseum floorCurrentObject         = tempSelectedPlayerObject.FindObject(floorObjectList       , roomCurrentObject         .parentObject.nameAltString );

            panelString  =

                "FLR_CUR = " + exhibitionCurrentObject  .nameAltString                                                  + "\n" +
                "ROM_CUR = " + roomCurrentObject        .nameAltString                                                  + "\n" +
                "EXH_CUR = " + exhibitionCurrentObject  .nameAltString                                                  + "\n" +
                "EXH_TAR = " + tempSelectedPlayerObject .exhibitionTargetNameAltStringList .get(0)                      + "\n" +
                "EXH_TAR = " + tempSelectedPlayerObject .exhibitionTargetNameAltStringList .get(1)                      + "\n" +
                "EXH_TAR = " + tempSelectedPlayerObject .exhibitionTargetNameAltStringList .get(2)                      + "\n" +
                "EXH_TAG = " + tempSelectedPlayerObject .exhibitionTagCounterList   .get(0).GetTagNameAltString()       + "\n" +
                "EXH_TAG = " + tempSelectedPlayerObject .exhibitionTagCounterList   .get(1).GetTagNameAltString()       + "\n" +
                "EXH_TAG = " + tempSelectedPlayerObject .exhibitionTagCounterList   .get(2).GetTagNameAltString()

            ;

        }
        /*String display for the museum object.*/
        else if     (tempSelectedPlayerObject == null){

            rowInt      = 4;

            if      (tempSelectedMuseumObject.visitorCurrentInt < 10   ){ tempVisitorCurrentString = "______"   + tempSelectedMuseumObject.visitorCurrentInt; }
            else if (tempSelectedMuseumObject.visitorCurrentInt < 100  ){ tempVisitorCurrentString = "_____"    + tempSelectedMuseumObject.visitorCurrentInt; }
            else if (tempSelectedMuseumObject.visitorCurrentInt < 1000 ){ tempVisitorCurrentString = "____"     + tempSelectedMuseumObject.visitorCurrentInt; }
            else if (tempSelectedMuseumObject.visitorCurrentInt < 10000){ tempVisitorCurrentString = "___"      + tempSelectedMuseumObject.visitorCurrentInt; }

            if      (tempSelectedMuseumObject.visitorTotalInt   < 10   ){ tempVisitorTotalString = "______"     + tempSelectedMuseumObject.visitorTotalInt; }
            else if (tempSelectedMuseumObject.visitorTotalInt   < 100  ){ tempVisitorTotalString = "_____"      + tempSelectedMuseumObject.visitorTotalInt; }
            else if (tempSelectedMuseumObject.visitorTotalInt   < 1000 ){ tempVisitorTotalString = "____"       + tempSelectedMuseumObject.visitorTotalInt; }
            else if (tempSelectedMuseumObject.visitorTotalInt   < 10000){ tempVisitorTotalString = "___"        + tempSelectedMuseumObject.visitorTotalInt; }

            if      (tempSelectedMuseumObject.fullBoolean == true ){ tempFullString = "____TRU"; }
            else if (tempSelectedMuseumObject.fullBoolean == false){ tempFullString = "____FAL"; }

            panelString = 

                "NAM_ALT = " + tempSelectedMuseumObject.nameAltString   + "\n" + 
                "VIS_CUR = " + tempVisitorCurrentString             + "\n" + 
                "VIS_TOT = " + tempVisitorTotalString               + "\n" + 
                "_IS_FUL = " + tempFullString

            ;

        }

        text                (panelString, tempXPanelInt + (widthPanelCardInt/2), tempYPanelInt + (textSizePanelInt));
        textAlign           (LEFT);
        noFill              ();

    }

}

public void SaveVoid(){

    adjectiveTagSaveJSONArrayObject         = new JSONArray();
    adverbTagSaveJSONArrayObject            = new JSONArray();
    exhibitionSaveJSONArrayObject           = new JSONArray();
    floorSaveJSONArrayObject                = new JSONArray();
    negativeAdjectiveTagSaveJSONArrayObject = new JSONArray();
    negativeAdverbTagSaveJSONArrayObject    = new JSONArray();
    negativeVerbTagSaveJSONArrayObject      = new JSONArray();
    nounTagSaveJSONArrayObject              = new JSONArray();
    playerSaveJSONArrayObject               = new JSONArray();
    roomSaveJSONArrayObject                 = new JSONArray();
    subjectTagSaveJSONArrayObject           = new JSONArray();
    verbTagSaveJSONArrayObject              = new JSONArray();
    for(int i = 0; i < subjectTagObjectList.size(); i ++){
        subjectTagSaveJSONObject = new JSONObject();
        subjectTagSaveJSONObject.setString("nameAltString", subjectTagObjectList.get(i).nameAltString);
        subjectTagSaveJSONObject.setString("nameFullString", subjectTagObjectList.get(i).nameFullString);
        subjectTagSaveJSONObject.setString("tagTypeString", subjectTagObjectList.get(i).tagTypeString);
        subjectTagSaveJSONObject.setString("tagSubjectString", subjectTagObjectList.get(i).tagSubjectString);
        subjectTagSaveJSONArrayObject.setJSONObject(i, subjectTagSaveJSONObject);
    }
    for(int i = 0; i < verbTagObjectList.size(); i ++){
        verbTagSaveJSONObject = new JSONObject();
        verbTagSaveJSONObject.setString("nameAltString", verbTagObjectList.get(i).nameAltString);
        verbTagSaveJSONObject.setString("nameFullString", verbTagObjectList.get(i).nameFullString);
        verbTagSaveJSONObject.setString("tagTypeString", verbTagObjectList.get(i).tagTypeString);
        verbTagSaveJSONObject.setString("tagVerb1String", verbTagObjectList.get(i).tagVerb1String);
        verbTagSaveJSONObject.setString("tagVerb2String", verbTagObjectList.get(i).tagVerb2String);
        verbTagSaveJSONObject.setString("tagVerb3String", verbTagObjectList.get(i).tagVerb3String);
        verbTagSaveJSONObject.setString("tagVerbSString", verbTagObjectList.get(i).tagVerbSString);
        verbTagSaveJSONObject.setString("tagVerbIngString", verbTagObjectList.get(i).tagVerbIngString);
        verbTagSaveJSONArrayObject.setJSONObject(i, verbTagSaveJSONObject);
    }
    for(int i = 0; i < negativeVerbTagObjectList.size(); i ++){
        negativeVerbTagSaveJSONObject = new JSONObject();
        negativeVerbTagSaveJSONObject.setString("nameAltString", negativeVerbTagObjectList.get(i).nameAltString);
        negativeVerbTagSaveJSONObject.setString("nameFullString", negativeVerbTagObjectList.get(i).nameFullString);
        negativeVerbTagSaveJSONObject.setString("tagTypeString", negativeVerbTagObjectList.get(i).tagTypeString);
        negativeVerbTagSaveJSONObject.setString("tagNegativeVerb1String", negativeVerbTagObjectList.get(i).tagNegativeVerb1String);
        negativeVerbTagSaveJSONObject.setString("tagNegativeVerb2String", negativeVerbTagObjectList.get(i).tagNegativeVerb2String);
        negativeVerbTagSaveJSONObject.setString("tagNegativeVerb3String", negativeVerbTagObjectList.get(i).tagNegativeVerb3String);
        negativeVerbTagSaveJSONObject.setString("tagNegativeVerbSString", negativeVerbTagObjectList.get(i).tagNegativeVerbSString);
        negativeVerbTagSaveJSONObject.setString("tagNegativeVerbIngString", negativeVerbTagObjectList.get(i).tagNegativeVerbIngString);
        negativeVerbTagSaveJSONArrayObject.setJSONObject(i, negativeVerbTagSaveJSONObject);
    }
    for(int i = 0; i < nounTagObjectList.size(); i ++){
        nounTagSaveJSONObject = new JSONObject();
        nounTagSaveJSONObject.setString("nameAltString", nounTagObjectList.get(i).nameAltString);
        nounTagSaveJSONObject.setString("nameFullString", nounTagObjectList.get(i).nameFullString);
        nounTagSaveJSONObject.setString("tagTypeString", nounTagObjectList.get(i).tagTypeString);
        nounTagSaveJSONObject.setString("tagNounString", nounTagObjectList.get(i).tagNounString);
        nounTagSaveJSONObject.setString("tagNounSString", nounTagObjectList.get(i).tagNounSString);
        nounTagSaveJSONArrayObject.setJSONObject(i, nounTagSaveJSONObject);
    }
    for(int i = 0; i < adjectiveTagObjectList.size(); i ++){
        adjectiveTagSaveJSONObject = new JSONObject();
        adjectiveTagSaveJSONObject.setString("nameAltString", adjectiveTagObjectList.get(i).nameAltString);
        adjectiveTagSaveJSONObject.setString("nameFullString", adjectiveTagObjectList.get(i).nameFullString);
        adjectiveTagSaveJSONObject.setString("tagTypeString", adjectiveTagObjectList.get(i).tagTypeString);
        adjectiveTagSaveJSONObject.setString("tagAdjectiveString", adjectiveTagObjectList.get(i).tagAdjectiveString);
        adjectiveTagSaveJSONArrayObject.setJSONObject(i, adjectiveTagSaveJSONObject);
    }
    for(int i = 0; i < negativeAdjectiveTagObjectList.size(); i ++){
        negativeAdjectiveTagSaveJSONObject = new JSONObject();
        negativeAdjectiveTagSaveJSONObject.setString("nameAltString", negativeAdjectiveTagObjectList.get(i).nameAltString);
        negativeAdjectiveTagSaveJSONObject.setString("nameFullString", negativeAdjectiveTagObjectList.get(i).nameFullString);
        negativeAdjectiveTagSaveJSONObject.setString("tagTypeString", negativeAdjectiveTagObjectList.get(i).tagTypeString);
        negativeAdjectiveTagSaveJSONObject.setString("tagNegativeAdjectiveString", negativeAdjectiveTagObjectList.get(i).tagNegativeAdjectiveString);
        negativeAdjectiveTagSaveJSONArrayObject.setJSONObject(i, negativeAdjectiveTagSaveJSONObject);
    }
    for(int i = 0; i < adverbTagObjectList.size(); i ++){
        adverbTagSaveJSONObject = new JSONObject();
        adverbTagSaveJSONObject.setString("nameAltString", adverbTagObjectList.get(i).nameAltString);
        adverbTagSaveJSONObject.setString("nameFullString", adverbTagObjectList.get(i).nameFullString);
        adverbTagSaveJSONObject.setString("tagTypeString", adverbTagObjectList.get(i).tagTypeString);
        adverbTagSaveJSONObject.setString("tagAdverbString", adverbTagObjectList.get(i).tagAdverbString);
        adverbTagSaveJSONArrayObject.setJSONObject(i, adverbTagSaveJSONObject);
    }
    for(int i = 0; i < negativeAdverbTagObjectList.size(); i ++){
        negativeAdverbTagSaveJSONObject = new JSONObject();
        negativeAdverbTagSaveJSONObject.setString("nameAltString", negativeAdverbTagObjectList.get(i).nameAltString);
        negativeAdverbTagSaveJSONObject.setString("nameFullString", negativeAdverbTagObjectList.get(i).nameFullString);
        negativeAdverbTagSaveJSONObject.setString("tagTypeString", negativeAdverbTagObjectList.get(i).tagTypeString);
        negativeAdverbTagSaveJSONObject.setString("tagNegativeAdverbString", negativeAdverbTagObjectList.get(i).tagNegativeAdverbString);
        negativeAdverbTagSaveJSONArrayObject.setJSONObject(i, negativeAdverbTagSaveJSONObject);
    }
    for(int i = 0; i < floorObjectList.size(); i ++){
        floorSaveJSONObject = new JSONObject();
        floorSaveJSONObject.setBoolean("fullBoolean", floorObjectList.get(i).fullBoolean);
        floorSaveJSONObject.setInt("indexGlobalInt", floorObjectList.get(i).indexGlobalInt);
        floorSaveJSONObject.setInt("indexLocalInt", floorObjectList.get(i).indexLocalInt);
        floorSaveJSONObject.setInt("visitorCurrentInt", floorObjectList.get(i).visitorCurrentInt);
        floorSaveJSONObject.setInt("visitorTotalInt", floorObjectList.get(i).visitorTotalInt);
        floorSaveJSONObject.setString("nameAltString", floorObjectList.get(i).nameAltString);
        floorSaveJSONObject.setString("nameFullString", floorObjectList.get(i).nameFullString);
        floorSaveJSONObject.setString("parentNameAltString", floorObjectList.get(i).parentNameAltString);
        floorSaveJSONObject.setString("typeString", floorObjectList.get(i).typeString);
        for(int j = 0; j < floorObjectList.get(i).childObjectList.size(); j ++){ floorSaveJSONObject.setString("childObjectList" + j, floorObjectList.get(i).childObjectList.get(j).nameAltString); }
        for(int j = 0; j < floorObjectList.get(i).childPlayerObjectList.size(); j ++){ floorSaveJSONObject.setInt("childPlayerObjectList" + j, floorObjectList.get(i).childPlayerObjectList.get(j).playerIndexInt); }
        for(int j = 0; j < floorObjectList.get(i).tagMuseumNameAltStringList.size(); j ++){ floorSaveJSONObject.setString("tagMuseumNameAltStringList" + j, floorObjectList.get(i).tagMuseumNameAltStringList.get(j)); }
        floorSaveJSONArrayObject.setJSONObject(i, floorSaveJSONObject);
    }
    for(int i = 0; i < roomObjectList.size(); i ++){
        roomSaveJSONObject = new JSONObject();
        for(int j = 0; j < roomObjectList.get(i).childObjectList.size(); j ++){ roomSaveJSONObject.setString("childObjectList" + j, roomObjectList.get(i).childObjectList.get(j).nameAltString); }
        for(int j = 0; j < roomObjectList.get(i).childPlayerObjectList.size(); j ++){ roomSaveJSONObject.setInt("childPlayerObjectList" + j, roomObjectList.get(i).childPlayerObjectList.get(j).playerIndexInt); }
        for(int j = 0; j < roomObjectList.get(i).tagMuseumNameAltStringList.size(); j ++){ roomSaveJSONObject.setString("tagMuseumNameAltStringList" + j, roomObjectList.get(i).tagMuseumNameAltStringList.get(j)); }
        roomSaveJSONObject.setBoolean("fullBoolean", roomObjectList.get(i).fullBoolean);
        roomSaveJSONObject.setInt("indexGlobalInt", roomObjectList.get(i).indexGlobalInt);
        roomSaveJSONObject.setInt("indexLocalInt", roomObjectList.get(i).indexLocalInt);
        roomSaveJSONObject.setInt("visitorCurrentInt", roomObjectList.get(i).visitorCurrentInt);
        roomSaveJSONObject.setInt("visitorTotalInt", roomObjectList.get(i).visitorTotalInt);
        roomSaveJSONObject.setString("nameAltString", roomObjectList.get(i).nameAltString);
        roomSaveJSONObject.setString("nameFullString", roomObjectList.get(i).nameFullString);
        roomSaveJSONObject.setString("parentNameAltString", roomObjectList.get(i).parentNameAltString);
        roomSaveJSONObject.setString("typeString", roomObjectList.get(i).typeString);
        roomSaveJSONArrayObject.setJSONObject(i, roomSaveJSONObject);
    }
    for(int i = 0; i < exhibitionObjectList.size(); i ++){
        exhibitionSaveJSONObject = new JSONObject();
        exhibitionSaveJSONObject.setBoolean("fullBoolean", exhibitionObjectList.get(i).fullBoolean);
        exhibitionSaveJSONObject.setInt("indexGlobalInt", exhibitionObjectList.get(i).indexGlobalInt);
        exhibitionSaveJSONObject.setInt("indexLocalInt", exhibitionObjectList.get(i).indexLocalInt);
        exhibitionSaveJSONObject.setInt("visitorCurrentInt", exhibitionObjectList.get(i).visitorCurrentInt);
        exhibitionSaveJSONObject.setInt("visitorTotalInt", exhibitionObjectList.get(i).visitorTotalInt);
        exhibitionSaveJSONObject.setString("nameAltString", exhibitionObjectList.get(i).nameAltString);
        exhibitionSaveJSONObject.setString("nameFullString", exhibitionObjectList.get(i).nameFullString);
        exhibitionSaveJSONObject.setString("parentNameAltString", exhibitionObjectList.get(i).parentNameAltString);
        exhibitionSaveJSONObject.setString("typeString", exhibitionObjectList.get(i).typeString);
        for(int j = 0; j < exhibitionObjectList.get(i).childObjectList.size(); j ++){ exhibitionSaveJSONObject.setString("childObjectList" + j, exhibitionObjectList.get(i).childObjectList.get(j).nameAltString); }
        for(int j = 0; j < exhibitionObjectList.get(i).childPlayerObjectList.size(); j ++){ exhibitionSaveJSONObject.setInt("childPlayerObjectList" + j, exhibitionObjectList.get(i).childPlayerObjectList.get(j).playerIndexInt); }
        for(int j = 0; j < exhibitionObjectList.get(i).tagMuseumNameAltStringList.size(); j ++){ exhibitionSaveJSONObject.setString("tagMuseumNameAltStringList" + j, exhibitionObjectList.get(i).tagMuseumNameAltStringList.get(j)); }
        exhibitionSaveJSONArrayObject.setJSONObject(i, exhibitionSaveJSONObject);
    }
    for(int i = 0; i < playerObjectList.size(); i ++){
        playerSaveJSONObject = new JSONObject();
        for(int j = 0; j < playerObjectList.get(i).adjectiveCurrentPrevTagStringList.size(); j ++){ playerSaveJSONObject.setString("adjectiveCurrentPrevTagStringList" + j, playerObjectList.get(i).adjectiveCurrentPrevTagStringList.get(j)); }
        for(int j = 0; j < playerObjectList.get(i).adverbCurrentPrevTagStringList.size(); j ++){ playerSaveJSONObject.setString("adverbCurrentPrevTagStringList" + j, playerObjectList.get(i).adverbCurrentPrevTagStringList.get(j)); }
        for(int j = 0; j < playerObjectList.get(i).exhibitionTargetNameAltStringList.size(); j ++){ playerSaveJSONObject.setString("exhibitionTargetNameAltStringList" + j, playerObjectList.get(i).exhibitionTargetNameAltStringList.get(j)); }
        for(int j = 0; j < playerObjectList.get(i).exhibitionVisitedNameAltStringList.size(); j ++){ playerSaveJSONObject.setString("exhibitionVisitedNameAltStringList" + j, playerObjectList.get(i).exhibitionVisitedNameAltStringList.get(j)); }
        for(int j = 0; j < playerObjectList.get(i).negativeAdjectiveCurrentPrevTagStringList.size(); j ++){ playerSaveJSONObject.setString("negativeAdjectiveCurrentPrevTagStringList" + j, playerObjectList.get(i).negativeAdjectiveCurrentPrevTagStringList.get(j)); }
        for(int j = 0; j < playerObjectList.get(i).negativeAdverbCurrentPrevTagStringList.size(); j ++){ playerSaveJSONObject.setString("negativeAdverbCurrentPrevTagStringList" + j, playerObjectList.get(i).negativeAdverbCurrentPrevTagStringList.get(j)); }
        for(int j = 0; j < playerObjectList.get(i).negativeVerb1CurrentPrevTagStringList.size(); j ++){ playerSaveJSONObject.setString("negativeVerb1CurrentPrevTagStringList" + j, playerObjectList.get(i).negativeVerb1CurrentPrevTagStringList.get(j)); }
        for(int j = 0; j < playerObjectList.get(i).negativeVerb2CurrentPrevTagStringList.size(); j ++){ playerSaveJSONObject.setString("negativeVerb2CurrentPrevTagStringList" + j, playerObjectList.get(i).negativeVerb2CurrentPrevTagStringList.get(j)); }
        for(int j = 0; j < playerObjectList.get(i).negativeVerb3CurrentPrevTagStringList.size(); j ++){ playerSaveJSONObject.setString("negativeVerb3CurrentPrevTagStringList" + j, playerObjectList.get(i).negativeVerb3CurrentPrevTagStringList.get(j)); }
        for(int j = 0; j < playerObjectList.get(i).negativeVerbIngCurrentPrevTagStringList.size(); j ++){ playerSaveJSONObject.setString("negativeVerbIngCurrentPrevTagStringList" + j, playerObjectList.get(i).negativeVerbIngCurrentPrevTagStringList.get(j)); }
        for(int j = 0; j < playerObjectList.get(i).negativeVerbSCurrentPrevTagStringList.size(); j ++){ playerSaveJSONObject.setString("negativeVerbSCurrentPrevTagStringList" + j, playerObjectList.get(i).negativeVerbSCurrentPrevTagStringList.get(j)); }
        for(int j = 0; j < playerObjectList.get(i).nounCurrentPrevTagStringList.size(); j ++){ playerSaveJSONObject.setString("nounCurrentPrevTagStringList" + j, playerObjectList.get(i).nounCurrentPrevTagStringList.get(j)); }
        for(int j = 0; j < playerObjectList.get(i).nounSCurrentPrevTagStringList.size(); j ++){ playerSaveJSONObject.setString("nounSCurrentPrevTagStringList" + j, playerObjectList.get(i).nounSCurrentPrevTagStringList.get(j)); }
        for(int j = 0; j < playerObjectList.get(i).playerSiblingObjectList.size(); j ++){ playerSaveJSONObject.setInt("playerSiblingObjectList" + j, playerObjectList.get(i).playerSiblingObjectList.get(j).playerIndexInt); }
        for(int j = 0; j < playerObjectList.get(i).sentenceStringList.size(); j ++){ playerSaveJSONObject.setString("sentenceStringList" + j, playerObjectList.get(i).sentenceStringList.get(j)); }
        for(int j = 0; j < playerObjectList.get(i).subjectCurrentPrevTagStringList.size(); j ++){ playerSaveJSONObject.setString("subjectCurrentPrevTagStringList" + j, playerObjectList.get(i).subjectCurrentPrevTagStringList.get(j)); }
        for(int j = 0; j < playerObjectList.get(i).verb1CurrentPrevTagStringList.size(); j ++){ playerSaveJSONObject.setString("verb1CurrentPrevTagStringList" + j, playerObjectList.get(i).verb1CurrentPrevTagStringList.get(j)); }
        for(int j = 0; j < playerObjectList.get(i).verb2CurrentPrevTagStringList.size(); j ++){ playerSaveJSONObject.setString("verb2CurrentPrevTagStringList" + j, playerObjectList.get(i).verb2CurrentPrevTagStringList.get(j)); }
        for(int j = 0; j < playerObjectList.get(i).verb3CurrentPrevTagStringList.size(); j ++){ playerSaveJSONObject.setString("verb3CurrentPrevTagStringList" + j, playerObjectList.get(i).verb3CurrentPrevTagStringList.get(j)); }
        for(int j = 0; j < playerObjectList.get(i).verbIngCurrentPrevTagStringList.size(); j ++){ playerSaveJSONObject.setString("verbIngCurrentPrevTagStringList" + j, playerObjectList.get(i).verbIngCurrentPrevTagStringList.get(j)); }
        for(int j = 0; j < playerObjectList.get(i).verbSCurrentPrevTagStringList.size(); j ++){ playerSaveJSONObject.setString("verbSCurrentPrevTagStringList" + j, playerObjectList.get(i).verbSCurrentPrevTagStringList.get(j)); }
        playerSaveJSONObject.setBoolean("playerFinishedBoolean", playerObjectList.get(i).playerFinishedBoolean);
        playerSaveJSONObject.setBoolean("playerVisitCorrectExhibitionBoolean", playerObjectList.get(i).playerVisitCorrectExhibitionBoolean);
        playerSaveJSONObject.setInt("playerIndexInt", playerObjectList.get(i).playerIndexInt);
        playerSaveJSONObject.setInt("playerMovementModeInt", playerObjectList.get(i).playerMovementModeInt);
        playerSaveJSONObject.setInt("playerScoreInt", playerObjectList.get(i).playerScoreInt);
        playerSaveJSONObject.setInt("playerSiblingIndexInt", playerObjectList.get(i).playerSiblingIndexInt);
        playerSaveJSONObject.setString("exhibitionCurrentString", playerObjectList.get(i).exhibitionCurrentString);
        playerSaveJSONObject.setString("playerNameString", playerObjectList.get(i).playerNameString);
        playerSaveJSONArrayObject.setJSONObject(i, playerSaveJSONObject);
    }
    saveJSONArray(adjectiveTagSaveJSONArrayObject, "data/adjectiveTag.json");
    saveJSONArray(adverbTagSaveJSONArrayObject, "data/adverbTag.json");
    saveJSONArray(exhibitionSaveJSONArrayObject, "data/exhibition.json");
    saveJSONArray(floorSaveJSONArrayObject, "data/floor.json");
    saveJSONArray(negativeAdjectiveTagSaveJSONArrayObject, "data/negativeAdjectiveTag.json");
    saveJSONArray(negativeAdverbTagSaveJSONArrayObject, "data/negativeAdverbTag.json");
    saveJSONArray(negativeVerbTagSaveJSONArrayObject, "data/negativeVerbTag.json");
    saveJSONArray(nounTagSaveJSONArrayObject, "data/nounTag.json");
    saveJSONArray(playerSaveJSONArrayObject, "data/player.json");
    saveJSONArray(roomSaveJSONArrayObject, "data/room.json");
    saveJSONArray(subjectTagSaveJSONArrayObject, "data/subjectTag.json");
    saveJSONArray(verbTagSaveJSONArrayObject, "data/verbTag.json");

}

/*A function to set if there is at least one button in open state.*/
public boolean SetButtonOpenCloseBoolean(){

    if(buttonOpenCloseMuseumObject.isButtonOpenBoolean == true || buttonOpenClosePlayerObject.isButtonOpenBoolean == true)  { buttonOpenCloseBoolean = true ; }
    else                                                                                                                    { buttonOpenCloseBoolean = false; }
    return buttonOpenCloseBoolean;

}

public float ButtonOpenCloseAnimatingFloat(

    boolean         _buttonOpenCloseBoolean ,
    boolean         _isAnimatingBoolean     ,
    float           _alphaFloat             ,
    CColor          _defaultCColorObject    ,
    CColor          _floorCColorObject      ,
    CColor          _roomCColorObject       ,
    CColor          _exhibitionCColorObject ,
    ScrollableList  _scrollableList

){

    /*Invert the state of when button is open or close.
    I am not really sure why I need to invert the boolean while it is supposed
        to work even without inverting the value.
    So when the buttonOpenCloseObject.isButtonOpenBoolean is true the button is actually closed.
    And when the buttonOpenCloseObject.isButtonOpenBoolean is false the button is actually open.*/
    /*When the button is animating (fade in - fade out).*/
    if(_isAnimatingBoolean == true ){

        /*For closing animation.*/
        if(_buttonOpenCloseBoolean == true ){
            
            /*Set the color according to the caption title.*/
            ColorControlVoid(_floorCColorObject, _roomCColorObject, _exhibitionCColorObject, _scrollableList);
            /*Show the scrollable list.*/
            _scrollableList.setColor(_defaultCColorObject).show();
            /*Decrease the opacity value over time.*/
            _alphaFloat -= (255f/45f);

        }
        /*For opening animation.*/
        else if(_buttonOpenCloseBoolean == false){
            
            /*Set the color according to the caption title.*/
            ColorControlVoid(_floorCColorObject, _roomCColorObject, _exhibitionCColorObject, _scrollableList);
            /*Show the scrollable list.*/
            _scrollableList.setColor(_defaultCColorObject).show();
            /*Increase the opacity value over time.*/
            _alphaFloat += (255f/45f);

        }

    }
    /*When the button is not animating.*/
    else if(_isAnimatingBoolean == false){

        /*When the button is not animating and the button is close.*/
        if(_buttonOpenCloseBoolean == true ){

            /*Set the color according to the caption title.*/
            ColorControlVoid(_floorCColorObject, _roomCColorObject, _exhibitionCColorObject, _scrollableList);
            /*Show the scrollable list.*/
            _scrollableList     .show();
            /*Set the alpha value of this scrollable list to one tick before it goes full opacity.*/
            _alphaFloat         = (255f - (255f/45f));

        }
        /*When the button is not animating and the button is open.*/
        else if(_buttonOpenCloseBoolean == false){

            /*Hide the scrollable list.*/
            _scrollableList     .hide();
            /*Set the alpha value of this scrollable list to one tick before it goes invisible.*/
            _alphaFloat         = (255f/45f);

        }

    }

    return _alphaFloat;

}

public float ScrollableDrawFloat(

    float           _alphaFloat             ,
    int             _xInt                   ,
    int             _yInt                   ,
    ButtonOpenClose _buttonOpenCloseObject  ,
    ScrollableList  _scrollableList

){


    /*Determine color for each possible buttons.*/
    CColor  defaultCColorObject             = new CColor();                     /*Color for default ubuttons scrollable list.*/
    CColor  floorCColorObject               = new CColor();                     /*Color for floor buttons scrollable list.*/
    CColor  roomCColorObject                = new CColor();                     /*Color for room buttons scrollable list.*/
    CColor  exhibitionCColorObject          = new CColor();                     /*Color for exhibition buttons scrollable list.*/
            defaultCColorObject
                .setActive                  (color(0    , 116   , 217   , _alphaFloat))
                .setBackground              (color(0    , 45    , 90    , _alphaFloat))
                .setCaptionLabel            (color(255  , 255   , 255   , _alphaFloat))
                .setForeground              (color(0    , 116   , 217   , _alphaFloat))
                .setValueLabel              (color(255  , 255   , 255   , _alphaFloat));
            floorCColorObject
                .setActive                  (color(0    , 45    , 90    , _alphaFloat))
                .setBackground              (color(0    , 45    , 90    , _alphaFloat))
                .setForeground              (color(0    , 116   , 217   , _alphaFloat));
            roomCColorObject
                .setActive                  (color(0    , 95    , 140   , _alphaFloat))
                .setBackground              (color(0    , 95    , 140   , _alphaFloat))
                .setForeground              (color(0    , 126   , 227   , _alphaFloat));
            exhibitionCColorObject
                .setActive                  (color(0    , 145   , 190   , _alphaFloat))
                .setBackground              (color(0    , 145   , 190   , _alphaFloat))
                .setForeground              (color(0    , 136   , 237   , _alphaFloat));
/*Update the open and close button.
    The two parameters is the position of the open and close button.*/
    _buttonOpenCloseObject          .DrawVoid(_xInt, _yInt);
    /*If statements to control animation event of the open close buttons.
    Like here, for example I want to hide() and show the dropdown menu based on
        the corresponding open close button.
    The thing to mention here is that the animation need to finished first before another event executed.
    If statment while the animation is still going.*/
    if(_buttonOpenCloseObject.isAnimatingBoolean == true ){

        _alphaFloat = ButtonOpenCloseAnimatingFloat(

            _buttonOpenCloseObject.isButtonOpenBoolean  ,
            _buttonOpenCloseObject.isAnimatingBoolean   ,
            _alphaFloat                                 ,
            defaultCColorObject                         ,
            floorCColorObject                           ,
            roomCColorObject                            ,
            exhibitionCColorObject                      ,
            _scrollableList

        );

    }
    /*If statement when the animation is stopped playing.*/
    else if(_buttonOpenCloseObject.isAnimatingBoolean == false){

        _alphaFloat = ButtonOpenCloseAnimatingFloat(

            _buttonOpenCloseObject.isButtonOpenBoolean  ,
            _buttonOpenCloseObject.isAnimatingBoolean   ,
            _alphaFloat                                 ,
            defaultCColorObject                         ,
            floorCColorObject                           ,
            roomCColorObject                            ,
            exhibitionCColorObject                      ,
            _scrollableList

        );

    }

    return _alphaFloat;

}

/*Neat function to calculate text height.
PENDING: This function has no use anymore.*/
public int CalculateTextHeightInt(

    String  _contentString      ,
    int     _specificWidthInt   ,
    int     _lineSpacingInt

){

    float       textHeightFloat         ;
    int         numLineInt          = 0 ;
    String[]    wordStringArray         ;
    String      tempString          = ""; 

    wordStringArray                 = split(_contentString, " ");

    for(int i = 0; i < wordStringArray.length; i ++){

        if  (textWidth(tempString + wordStringArray[i]) < _specificWidthInt)    { tempString += wordStringArray    + " "; }
        else                                                                    { tempString  = wordStringArray[i] + " "; numLineInt ++;}

    }

    numLineInt        ++;
   
    textHeightFloat   = numLineInt * (textDescent() + textAscent() + _lineSpacingInt);
    return            (round(textHeightFloat));

}

/*Simple function to return an index number of museum object within their own list.*/
public int FindObjectMuseumIndexInt(

    String              _targetString                    ,
    List<ObjectMuseum>  _targetObjectList

){

    for(int i = 0; i < _targetObjectList.size(); i ++){

        if(_targetObjectList.get(i).nameAltString .equals(_targetString)){ return i; }
        if(_targetObjectList.get(i).nameFullString.equals(_targetString)){ return i; }

    }
    return -1;

}

public int GetBiggestPlayerIndexInt(){

    int tempBiggestIndexInt = 0;
    for(int i = 0; i < playerObjectList.size(); i ++){

        if(playerObjectList.get(i).playerIndexInt > tempBiggestIndexInt){ tempBiggestIndexInt = playerObjectList.get(i).playerIndexInt; }

    }
    return tempBiggestIndexInt;

}

/*Create a function to add museum object.*/
public ObjectMuseum AddMuseumObject(

    String  _nameAltString       ,
    String  _nameFullString      ,
    String  _parentNameAltString ,
    String  _typeString         ,
    Tag[]   _tagObjectArray

){

    /*Create temporary list for object that we want to make, its list, and its parent list.*/
    List<ObjectMuseum>  museumObjectList            = new ArrayList<ObjectMuseum>();
    List<ObjectMuseum>  parentMuseumObjectList      = new ArrayList<ObjectMuseum>();
    ObjectMuseum        museumObject                = new ObjectMuseum(new Name(_nameAltString, _nameFullString), _parentNameAltString, _typeString, _tagObjectArray);

    /*If statement to determine which List we should put in.*/
    if      (_typeString.equals("FLR")){

        museumObjectList                = floorObjectList;
        floorNameAltStringList          .add(museumObject.nameAltString );
        floorNameFullStringList         .add(museumObject.nameFullString);

    }
    else if (_typeString.equals("ROM")){

        museumObjectList                = roomObjectList;
        parentMuseumObjectList          = floorObjectList;
        roomNameAltStringList           .add(museumObject.nameAltString );
        roomNameFullStringList          .add(museumObject.nameFullString);

    }
    else if (_typeString.equals("EXH")){

        museumObjectList                = exhibitionObjectList;
        parentMuseumObjectList          = roomObjectList;
        exhibitionNameAltStringList     .add(museumObject.nameAltString );
        exhibitionNameFullStringList    .add(museumObject.nameFullString);

    }


    /*Assign the object into the object List and the String List.*/
    museumObjectList                    .add(museumObject);
    
    /*If other than floor object we also need to determine the parent object.*/
    if      (!_typeString.equals("FLR")){

        parentMuseumObjectList  .get(FindObjectMuseumIndexInt(_parentNameAltString, parentMuseumObjectList)).SetChildObjectList(museumObjectList);
        museumObject            .SetInitialParentObject(parentMuseumObjectList);

    }

    /*Re - adjust all the index of this object that we just created.*/
    museumObject                .SetIndexInsideVoid();
    /*Reset the display of the exhibition scrollable list.*/
    museumNameAltStringList     = new ArrayList<String>(floorNameAltStringList );
    museumNameFullStringList    = new ArrayList<String>(floorNameFullStringList);
    selectMuseumObjectScrollableListObject.setItems(museumNameFullStringList);

    return                      museumObject;

}

public ObjectMuseum FindMuseumObject(String _objectNameString){

    ObjectMuseum tempMuseumObject = null;

    for(int i = 0; i < floorObjectList.size(); i ++){

        if(floorObjectList.get(i).nameAltString     .equals(_objectNameString)){ tempMuseumObject = floorObjectList.get(i); }
        if(floorObjectList.get(i).nameFullString    .equals(_objectNameString)){ tempMuseumObject = floorObjectList.get(i); }

    }
    for(int i = 0; i < roomObjectList.size(); i ++){

        if(roomObjectList.get(i).nameAltString     .equals(_objectNameString)){ tempMuseumObject = roomObjectList.get(i); }
        if(roomObjectList.get(i).nameFullString    .equals(_objectNameString)){ tempMuseumObject = roomObjectList.get(i); }

    }
    for(int i = 0; i < exhibitionObjectList.size(); i ++){

        if(exhibitionObjectList.get(i).nameAltString     .equals(_objectNameString)){ tempMuseumObject = exhibitionObjectList.get(i); }
        if(exhibitionObjectList.get(i).nameFullString    .equals(_objectNameString)){ tempMuseumObject = exhibitionObjectList.get(i); }

    }

    return tempMuseumObject;

}

public ObjectPlayer FindPlayerObject(int _playerIndexInt){

    ObjectPlayer tempPlayerObject = null;
    for(int i = 0; i < playerObjectList.size(); i ++){

        if(playerObjectList.get(i).playerIndexInt == _playerIndexInt){ tempPlayerObject = playerObjectList.get(i); }

    }

    return tempPlayerObject;

}
    
public Tag FindTagObject(String _tagName){

    Tag tempTagObject = null;
    for(int i = 0; i < subjectTagObjectList.size(); i ++){

        if(subjectTagObjectList.get(i).nameAltString     .equals(_tagName)){ tempTagObject = subjectTagObjectList.get(i); }
        if(subjectTagObjectList.get(i).nameFullString    .equals(_tagName)){ tempTagObject = subjectTagObjectList.get(i); }

    }
    for(int i = 0; i < verbTagObjectList.size(); i ++){

        if(verbTagObjectList.get(i).nameAltString     .equals(_tagName)){ tempTagObject = verbTagObjectList.get(i); }
        if(verbTagObjectList.get(i).nameFullString    .equals(_tagName)){ tempTagObject = verbTagObjectList.get(i); }

    }
    for(int i = 0; i < negativeVerbTagObjectList.size(); i ++){

        if(negativeVerbTagObjectList.get(i).nameAltString     .equals(_tagName)){ tempTagObject = negativeVerbTagObjectList.get(i); }
        if(negativeVerbTagObjectList.get(i).nameFullString    .equals(_tagName)){ tempTagObject = negativeVerbTagObjectList.get(i); }

    }
    for(int i = 0; i < nounTagObjectList.size(); i ++){

        if(nounTagObjectList.get(i).nameAltString     .equals(_tagName)){ tempTagObject = nounTagObjectList.get(i); }
        if(nounTagObjectList.get(i).nameFullString    .equals(_tagName)){ tempTagObject = nounTagObjectList.get(i); }

    }
    for(int i = 0; i < adjectiveTagObjectList.size(); i ++){

        if(adjectiveTagObjectList.get(i).nameAltString     .equals(_tagName)){ tempTagObject = adjectiveTagObjectList.get(i); }
        if(adjectiveTagObjectList.get(i).nameFullString    .equals(_tagName)){ tempTagObject = adjectiveTagObjectList.get(i); }

    }
    for(int i = 0; i < negativeAdjectiveTagObjectList.size(); i ++){

        if(negativeAdjectiveTagObjectList.get(i).nameAltString     .equals(_tagName)){ tempTagObject = negativeAdjectiveTagObjectList.get(i); }
        if(negativeAdjectiveTagObjectList.get(i).nameFullString    .equals(_tagName)){ tempTagObject = negativeAdjectiveTagObjectList.get(i); }

    }
    for(int i = 0; i < adverbTagObjectList.size(); i ++){

        if(adverbTagObjectList.get(i).nameAltString     .equals(_tagName)){ tempTagObject = adverbTagObjectList.get(i); }
        if(adverbTagObjectList.get(i).nameFullString    .equals(_tagName)){ tempTagObject = adverbTagObjectList.get(i); }

    }
    for(int i = 0; i < negativeAdverbTagObjectList.size(); i ++){

        if(negativeAdverbTagObjectList.get(i).nameAltString     .equals(_tagName)){ tempTagObject = negativeAdverbTagObjectList.get(i); }
        if(negativeAdverbTagObjectList.get(i).nameFullString    .equals(_tagName)){ tempTagObject = negativeAdverbTagObjectList.get(i); }

    }

    return tempTagObject;

}

/*
<<A function to return an array of object tag to be put in the museum object, randomly.>>
Tag[] AssignRandomTagArray(List<Tag> _tagObjectList){

    <<Temporary tag object list to be returned later on this function.>>
    List<Tag> assignTagObjectList                   = new ArrayList<Tag>();
    
    <<This function need to be atleast gives three tags to a museum object.
    After three tags is inside the List then we can randomly add another tag with a chance.
    The thing is that every tag added the chance of another tag will be added/pushed
        is lower.>>
    float randomChanceFloat                         = 1f;
    while(

        (assignTagObjectList.size() <= 3) ||
        (Math.random() < randomChanceFloat)

    ){

        <<Need to make sure the inputted random tag is not something that is already in the museum object
        Create a temporary tag object to hold.>>
        int randomIndexInt  = (int)((Math.random()*_tagObjectList.size()) + 0);
        Tag tagObject       = _tagObjectList.get(randomIndexInt);
        
        <<Keep looping over and over until the random index is not a tag that is already in the list.>>
        for(int i = 0; i < assignTagObjectList.size(); i ++){

            <<If the random tag is already inside the museum object then we need to iterate again to get new random tag
                generated.>>
            while(assignTagObjectList.get(i) == tagObject){
                
                randomIndexInt  = (int)((Math.random()*_tagObjectList.size()) + 0);
                tagObject       = _tagObjectList.get(randomIndexInt);
                
            }

        }
        
        <<If the assignTagObjectList has three or more elements then we need to start reducing the changce.>>
        if(assignTagObjectList.size() > 3){ randomChanceFloat -= 0.2f; }
        
        <<Add/push a tag object into the temporary list.>>
        assignTagObjectList.add(tagObject);

    }
    
    <<Before returning the value, the object here is still in List, hence we need to convert it to array.
    Thus, it can be used in params.>>
    Tag[] assignTagObjectArray                      = new Tag[assignTagObjectList.size()];
    for(int i = 0; i < assignTagObjectArray.length; i ++){ assignTagObjectArray[i] = assignTagObjectList.get(i); }
    
    return assignTagObjectArray;

}*/
/*A function to return an array of object tag to be put in the museum object, randomly.*/
public Tag[] AssignRandomTagArray(

    List<Tag> _subjectTagObjectList             ,
    List<Tag> _verbTagObjectList                ,
    List<Tag> _negativeVerbTagObjectList        ,
    List<Tag> _nounTagObjectList                ,
    List<Tag> _adjectiveTagObjectList           ,
    List<Tag> _negativeAdjectiveTagObjectList   ,
    List<Tag> _adverbTagObjectList              ,
    List<Tag> _negativeAdverbTagObjectList

){

    /*Temporary tag object list to be returned later on this function.*/
    List<Tag> assignTagObjectList                           = new ArrayList<Tag>();
    
    AssignRandomTagLoopVoid(_subjectTagObjectList           , assignTagObjectList);
    AssignRandomTagLoopVoid(_verbTagObjectList              , assignTagObjectList);
    AssignRandomTagLoopVoid(_negativeVerbTagObjectList      , assignTagObjectList);
    AssignRandomTagLoopVoid(_nounTagObjectList              , assignTagObjectList);
    AssignRandomTagLoopVoid(_adjectiveTagObjectList         , assignTagObjectList);
    AssignRandomTagLoopVoid(_negativeAdjectiveTagObjectList , assignTagObjectList);
    AssignRandomTagLoopVoid(_adverbTagObjectList            , assignTagObjectList);
    AssignRandomTagLoopVoid(_negativeAdverbTagObjectList    , assignTagObjectList);

    /*Before returning the value, the object here is still in List, hence we need to convert it to array.
    Thus, it can be used in params.*/
    Tag[] assignTagObjectArray                              = new Tag[assignTagObjectList.size()];
    for(int i = 0; i < assignTagObjectArray.length; i ++)   { assignTagObjectArray[i] = assignTagObjectList.get(i); }
    
    return assignTagObjectArray;

}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//START//Controller's Related Functions.////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



public void SetupGUIVoid(){

    cp5Object       = new ControlP5(this);
    buttonSizeInt   = ((width > height) ? ((width*15)/512) : ((height*15)/512)                  );
    menuWidthInt    = ((width/3)                                                                );
    menuHeightInt   = ( height  - (guiLayoutOffsetInt*2) - ((buttonSizeInt/2)*2)                      );
    leftMenuXInt    = (            guiLayoutOffsetInt    +  (buttonSizeInt/2)                         );
    rightMenuXInt   = ( width   -  guiLayoutOffsetInt    -  (buttonSizeInt/2)        - menuWidthInt   );
    menuYInt        = (            guiLayoutOffsetInt    +  (buttonSizeInt/2)                         );

    museumNameAltStringList                     = new ArrayList<String>(floorNameAltStringList );                                                           /*PENDING: This variable is actually has no use anymore, delete this and everything related when you have time.*/
    museumNameFullStringList                    = new ArrayList<String>(floorNameFullStringList);                                                           /*Set the initial items for scrollable list of museum object.                                                  */

    selectMuseumObjectScrollableListObject      =
        cp5Object   .addScrollableList          ("SelectMuseumObjectScrollableListObject")
                    .hide                       ()
                    .setLabel                   ("SELECT MUSEUM OBJECT:")
                    .setItems                   (museumNameFullStringList)
                    .setPosition                (rightMenuXInt, menuYInt)
                    .setSize                    (menuWidthInt, menuHeightInt)
                    .setType                    (ControlP5.LIST);

    selectPlayerScrollableListObject            = 
        cp5Object   .addScrollableList          ("SelectPlayerScrollableListObject")
                    .hide                       ()
                    .setLabel                   ("SELECT VISITOR:")
                    .setItems                   (playerStringList)
                    .setPosition                (leftMenuXInt, menuYInt)
                    .setSize                    (menuWidthInt, menuHeightInt)
                    .setType                    (ControlP5.LIST);

    addTagGroupGUIObject                        = new AddTagGroupGUIObject          (rightMenuXInt, menuYInt, menuWidthInt, addTagGroupHeightInt        , selectMuseumObjectScrollableListObject                , this);
    addMuseumGroupGUIObject                     = new AddMuseumGroupGUIObject       (rightMenuXInt, menuYInt, menuWidthInt, addMuseumGroupHeightInt     , addTagGroupGUIObject       .addTagGroupObject         , this);
    editPlayerGroupGUIObject                    = new EditPlayerGroupGUIObject      (leftMenuXInt , menuYInt, menuWidthInt, editPlayerGroupHeightInt    , selectPlayerScrollableListObject                      , this);
    removePlayerGroupGUIObject                  = new RemovePlayerGroupGUIObject    (leftMenuXInt , menuYInt, menuWidthInt, removePlayerGroupHeightInt  , editPlayerGroupGUIObject   .editPlayerGroupObject     , this);
    addPlayerGroupGUIObject                     = new AddPlayerGroupGUIObject       (leftMenuXInt , menuYInt, menuWidthInt, addPlayerGroupHeightInt     , removePlayerGroupGUIObject .removePlayerGroupObject   , this);
    
    rightMenuAccordionObject                    =
        cp5Object   .addAccordion               ("RightMenuAccordionObject")
                    .addItem                    (addMuseumGroupGUIObject.addMuseumGroupObject)
                    .addItem                    (addTagGroupGUIObject.addTagGroupObject)
                    .setCollapseMode            (Accordion.SINGLE)
                    .setPosition                (rightMenuXInt, menuYInt)
                    .setWidth                   (menuWidthInt);
    leftMenuAccordionObject                     =
        cp5Object   .addAccordion               ("LeftMenuAccordionObject")
                    .addItem                    (addPlayerGroupGUIObject.addPlayerGroupObject)
                    .addItem                    (editPlayerGroupGUIObject.editPlayerGroupObject)
                    .addItem                    (removePlayerGroupGUIObject.removePlayerGroupObject)
                    .setCollapseMode            (Accordion.SINGLE)
                    .setPosition                (leftMenuXInt, menuYInt)
                    .setWidth                   (menuWidthInt);

    buttonOpenCloseMuseumObject                 = new ButtonOpenClose(buttonSizeInt);                                                                       /*Initiates button open close with size depends on the screen size.                                            */
    buttonOpenClosePlayerObject                 = new ButtonOpenClose(buttonSizeInt);                                                                       /*Initiates button open close with size depends on the screen size.                                            */

}

public void DrawGUIVoid(){

    dropdownMObjectAlphaFloat               = ScrollableDrawFloat(dropdownMObjectAlphaFloat , (width - guiLayoutOffsetInt), guiLayoutOffsetInt, buttonOpenCloseMuseumObject, selectMuseumObjectScrollableListObject );
    dropdownPlayerAlphaFloat                = ScrollableDrawFloat(dropdownPlayerAlphaFloat  , guiLayoutOffsetInt          , guiLayoutOffsetInt, buttonOpenClosePlayerObject, selectPlayerScrollableListObject       );
    addMuseumGroupGUIObject                 .DrawVoid(dropdownMObjectAlphaFloat);
    addTagGroupGUIObject                    .DrawVoid(dropdownMObjectAlphaFloat);
    addPlayerGroupGUIObject                 .DrawVoid(dropdownPlayerAlphaFloat) ;
    removePlayerGroupGUIObject              .DrawVoid(dropdownPlayerAlphaFloat) ;
    editPlayerGroupGUIObject                .DrawVoid(dropdownPlayerAlphaFloat) ;

    if      (addMuseumGroupGUIObject        .addMuseumGroupObject   .isOpen() == true)  { selectMuseumObjectScrollableListObject  .setPosition(rightMenuXInt, menuYInt + 1 + 461); selectMuseumObjectScrollableListObject   .setHeight(height - (buttonSizeInt*2) - 1 - 461); }
    else if (addTagGroupGUIObject           .addTagGroupObject      .isOpen() == true)  { selectMuseumObjectScrollableListObject  .setPosition(rightMenuXInt, menuYInt + 1 + 263); selectMuseumObjectScrollableListObject   .setHeight(height - (buttonSizeInt*2) - 1 - 263); }
    else                                                                                { selectMuseumObjectScrollableListObject  .setPosition(rightMenuXInt, menuYInt + 1 + 19 ); selectMuseumObjectScrollableListObject   .setHeight(height - (buttonSizeInt*2) - 1 - 19 ); }

    if      (addPlayerGroupGUIObject        .addPlayerGroupObject   .isOpen() == true)  { selectPlayerScrollableListObject        .setPosition(leftMenuXInt , menuYInt + 1 + 173); selectPlayerScrollableListObject         .setHeight(height - (buttonSizeInt*2) - 1 - 173); }
    else if (editPlayerGroupGUIObject       .editPlayerGroupObject  .isOpen() == true)  { selectPlayerScrollableListObject        .setPosition(leftMenuXInt , menuYInt + 1 + 456); selectPlayerScrollableListObject         .setHeight(height - (buttonSizeInt*2) - 1 - 456); }
    else if (removePlayerGroupGUIObject     .removePlayerGroupObject.isOpen() == true)  { selectPlayerScrollableListObject        .setPosition(leftMenuXInt , menuYInt + 1 + 133); selectPlayerScrollableListObject         .setHeight(height - (buttonSizeInt*2) - 1 - 133); }
    else                                                                                { selectPlayerScrollableListObject        .setPosition(leftMenuXInt , menuYInt + 1 + 29 ); selectPlayerScrollableListObject         .setHeight(height - (buttonSizeInt*2) - 1 - 29 ); }
    
    

}



//////////////////////////////////////////////////////////////////////////////////////////////////// 
//START//SelectMuseumObject Controller's Functions./////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
/*This function is to control what will happen when mouse pointer clicked above the active element of scrollable button.*/
public void SelectMuseumObjectScrollableListObject (int _indexInt){

    List<ObjectMuseum>                  tempSelectedMuseumObjectList        = new ArrayList<ObjectMuseum>();                                                                    /*This is a list to hold the selected object list. For example FLR_001 is selected, then this variable will be filled with floorObjectList.                         */
    List<String>                        museumStringList                    = new ArrayList<String>();
    ObjectMuseum                        tempSelectedMuseumObject            = null;                                                                                             /*This is the selected museum object. From here this application will try to modify the selected museum objects values.                                             */
    String                              itemScrollableString                = selectMuseumObjectScrollableListObject.getItem(_indexInt).get("text").toString();                       /*This String is for holding the name of the selected button.                                                                                                       */
    String                              tempTypeString                      = "";                                                                                               /*Take the first three characters so that this application can know which can of object is selected. Alternatively you can search over selected object type String. */
    if                                  (FindObjectMuseumIndexInt           (itemScrollableString, floorObjectList)        != -1){ tempTypeString = "FLR";    }
    else if                             (FindObjectMuseumIndexInt           (itemScrollableString, roomObjectList)         != -1){ tempTypeString = "ROM";    }
    else if                             (FindObjectMuseumIndexInt           (itemScrollableString, exhibitionObjectList)   != -1){ tempTypeString = "EXH";    }
    int                                 selectedMuseumIndexInt              = -1;                                                                                               /*The selected index of the selected object in its object list.*/

    museumStringList                    = museumNameFullStringList;

    /*We assign the selected museum object list according to the temporary type String.*/
    if     (tempTypeString.equals("FLR")){ tempSelectedMuseumObjectList         = floorObjectList;          }
    else if(tempTypeString.equals("ROM")){ tempSelectedMuseumObjectList         = roomObjectList;           }
    else if(tempTypeString.equals("EXH")){ tempSelectedMuseumObjectList         = exhibitionObjectList;     }

    /*The for loop below is for assigning which museum object is actually selected*/
    for(int i = 0; i < museumStringList.size(); i ++){

        /*Compare every possible String in the museum String list with the selected scrollable String.*/
        if(museumStringList.get(i)                                          == itemScrollableString){

            /*If the String match we will take the index of name of the object inside the museum String list.*/
            for(int j = 0; j < tempSelectedMuseumObjectList.size(); j ++)       {

                /*Iterate once more to to find the named object inside its object list.
                After this done, we get access to the object local and public variables and functions.*/
                if(tempSelectedMuseumObjectList.get(j).nameFullString           == museumStringList.get(i)){ tempSelectedMuseumObject = tempSelectedMuseumObjectList.get(j); }

            }

            /*Return the object index inside the museum String list.
            This variable is for determining the layout later on within the scrollable dropdown list.*/
            selectedMuseumIndexInt                                          = i + 1;

        }

    }
    /*After we get the "selected object" object.
    We will revert its active boolean variable.
    We will keep reverting this for everytime the selected object is clicked.*/
    tempSelectedMuseumObject.activeBoolean                                      = !tempSelectedMuseumObject.activeBoolean;

    /*If the selected museum object active boolean is true then add all of its children (if any) to the scrollable drop list.*/
    if     (tempSelectedMuseumObject.activeBoolean == true){

        /*Iterate all children objects and add all of it to the museum String list.
        We need to set (delete the previous ones and initiate the new ones) the children to the museum String list according to the index
            position of the parent in the museum String list.*/
        for(

           int i    = tempSelectedMuseumObject.childObjectList.size() - 1;
           i        >= 0;
           i        --

        ){

            museumNameAltStringList .add(selectedMuseumIndexInt, tempSelectedMuseumObject.childObjectList.get(i).nameAltString );
            museumNameFullStringList.add(selectedMuseumIndexInt, tempSelectedMuseumObject.childObjectList.get(i).nameFullString);

        }
        /*Set the items into the scrollable list.*/
        selectMuseumObjectScrollableListObject.setItems(museumStringList);

    }
    /*If the selected museum object active boolean is false then remove all of its children from the museum String List and the scrollable list.*/
    else if(tempSelectedMuseumObject.activeBoolean == false){

        /*If close the floor we must carefully close the inner most button, in this case it is the exhibition buttons.
        We need to close the room buttons and then loop again to close the exhibition buttons.*/
        if(tempTypeString.equals("FLR")){

            for(int i = 0; i < tempSelectedMuseumObject.childObjectList.size(); i ++){

                for(int j = 0; j < tempSelectedMuseumObject.childObjectList.get(i).childObjectList.size(); j ++){

                    for(int k = 0; k < museumStringList.size(); k ++){

                        boolean tempBoolean = true;
                                tempBoolean = museumStringList.get(k).equals(tempSelectedMuseumObject.childObjectList.get(i).childObjectList.get(j).nameFullString);
                        if(tempBoolean){

                            tempSelectedMuseumObject.childObjectList.get(i).childObjectList.get(j).activeBoolean = false;
                            selectMuseumObjectScrollableListObject.removeItem(tempSelectedMuseumObject.childObjectList.get(i).childObjectList.get(j).nameFullString);
                            museumNameAltStringList .remove(k);
                            museumNameFullStringList.remove(k);
                            k --;

                        }

                    }

                }

                for(int j = 0; j < museumStringList.size(); j ++){

                    boolean tempBoolean = true;  
                            tempBoolean = museumStringList.get(j).equals(tempSelectedMuseumObject.childObjectList.get(i).nameFullString);
                    if(tempBoolean){

                        tempSelectedMuseumObject.childObjectList.get(i).activeBoolean = false;
                        selectMuseumObjectScrollableListObject.removeItem(tempSelectedMuseumObject.childObjectList.get(i).nameFullString);
                        museumNameAltStringList .remove(j);
                        museumNameFullStringList.remove(j);
                        j --;

                    }

                }

            }

        }
        /*If the button is not a floor button then we do not need to iterate deeper.*/
        else{

            for(int i = 0; i < tempSelectedMuseumObject.childObjectList.size(); i ++){

                for(int j = 0; j < museumStringList.size(); j ++){

                    boolean tempBoolean = true;  
                            tempBoolean = museumStringList.get(j).equals(tempSelectedMuseumObject.childObjectList.get(i).nameFullString);
                    if(tempBoolean){

                        tempSelectedMuseumObject.childObjectList.get(i).activeBoolean = false;
                        selectMuseumObjectScrollableListObject.removeItem(tempSelectedMuseumObject.childObjectList.get(i).nameFullString);
                        museumNameAltStringList .remove(j);
                        museumNameFullStringList.remove(j);
                        j --;

                    }

                }

            }

        /*God bless these curly braces.*/

        }

    }

}
////////////////////////////////////////////////////////////////////////////////////////////////////
//END//SelectMuseumObject Controller's Functions.///////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////




//////////////////////////////////////////////////////////////////////////////////////////////////// 
//START//SelectPlayerScrollableList Controller's Functions./////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
/*This function is to control player scrollable list.*/
public void SelectPlayerScrollableListObject       (int _indexInt){

    editPlayerGroupGUIObject.tempSelectedPlayerObject                           = playerObjectList.get(_indexInt);                                                          /*Assign the selected player.                               */
    editPlayerGroupGUIObject.editPlayerGroupPlayerModeValueRadioButtonObject    .activate((editPlayerGroupGUIObject.tempSelectedPlayerObject.playerMovementModeInt - 1));   /*Assign the mode of selected player into the radio button. */

}
//////////////////////////////////////////////////////////////////////////////////////////////////// 
//END//SelectPlayerScrollableList Controller's Functions.///////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////



//////////////////////////////////////////////////////////////////////////////////////////////////// 
//START//AddMuseumGroupGUIObject.pde Controller's Functions.////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
/*Set what kind of museum object the user will make.*/
public void AddMuseumGroupSelectTypeMuseumObjectScrollableListObject                   (int _indexInt) {

    addMuseumGroupGUIObject.tempSelectedTypeObjectMuseumNameFullString                                  = addMuseumGroupGUIObject.addMuseumGroupSelectTypeMuseumObjectScrollableListObject.getItem(_indexInt).get("text").toString();   /*Take the full name type of object museum that the user will make.*/
    /*Convert the object museum type name full into object museum type name alternate name.*/
    if      (addMuseumGroupGUIObject.tempSelectedTypeObjectMuseumNameFullString.equals("Floor"      ))  {
        addMuseumGroupGUIObject.tempSelectedTypeObjectMuseumNameAltString                   = "FLR";
        addMuseumGroupGUIObject.addMuseumGroupSelectParentMuseumObjectScrollableListObject  .setItems(defaultStringList);
    }
    else if (addMuseumGroupGUIObject.tempSelectedTypeObjectMuseumNameFullString.equals("Room"       ))  {
        addMuseumGroupGUIObject.tempSelectedTypeObjectMuseumNameAltString                   = "ROM";
        addMuseumGroupGUIObject.addMuseumGroupSelectParentMuseumObjectScrollableListObject  .setItems(floorNameFullStringList);
    }
    else if (addMuseumGroupGUIObject.tempSelectedTypeObjectMuseumNameFullString.equals("Exhibition" ))  {
        addMuseumGroupGUIObject.tempSelectedTypeObjectMuseumNameAltString                   = "EXH";
        addMuseumGroupGUIObject.addMuseumGroupSelectParentMuseumObjectScrollableListObject  .setItems(roomNameFullStringList);
    }

}
/*These functions is for assigning tags into museum object that the user will add.*/
public void AddMuseumGroupSelectSubjectTagMuseumObjectScrollableListObject             (int _indexInt) { addMuseumGroupGUIObject.CovertScrollableListIntoCheckListVoid(_indexInt, addMuseumGroupGUIObject.addMuseumGroupSelectSubjectTagMuseumObjectScrollableListObject           ); addMuseumGroupGUIObject.tempSelectedTagNameFullStringList    = addMuseumGroupGUIObject.SetSelectedCheckListStringList(subjectTagNameFullStringList               , addMuseumGroupGUIObject.tempSelectedTagNameFullStringList  , addMuseumGroupGUIObject.addMuseumGroupSelectSubjectTagMuseumObjectScrollableListObject            ); }
public void AddMuseumGroupSelectVerbTagMuseumObjectScrollableListObject                (int _indexInt) { addMuseumGroupGUIObject.CovertScrollableListIntoCheckListVoid(_indexInt, addMuseumGroupGUIObject.addMuseumGroupSelectVerbTagMuseumObjectScrollableListObject              ); addMuseumGroupGUIObject.tempSelectedTagNameFullStringList    = addMuseumGroupGUIObject.SetSelectedCheckListStringList(verbTagNameFullStringList                  , addMuseumGroupGUIObject.tempSelectedTagNameFullStringList  , addMuseumGroupGUIObject.addMuseumGroupSelectVerbTagMuseumObjectScrollableListObject               ); }
public void AddMuseumGroupSelectNegativeVerbTagMuseumObjectScrollableListObject        (int _indexInt) { addMuseumGroupGUIObject.CovertScrollableListIntoCheckListVoid(_indexInt, addMuseumGroupGUIObject.addMuseumGroupSelectNegativeVerbTagMuseumObjectScrollableListObject      ); addMuseumGroupGUIObject.tempSelectedTagNameFullStringList    = addMuseumGroupGUIObject.SetSelectedCheckListStringList(negativeVerbTagNameFullStringList          , addMuseumGroupGUIObject.tempSelectedTagNameFullStringList  , addMuseumGroupGUIObject.addMuseumGroupSelectNegativeVerbTagMuseumObjectScrollableListObject       ); }
public void AddMuseumGroupSelectNounTagMuseumObjectScrollableListObject                (int _indexInt) { addMuseumGroupGUIObject.CovertScrollableListIntoCheckListVoid(_indexInt, addMuseumGroupGUIObject.addMuseumGroupSelectNounTagMuseumObjectScrollableListObject              ); addMuseumGroupGUIObject.tempSelectedTagNameFullStringList    = addMuseumGroupGUIObject.SetSelectedCheckListStringList(nounTagNameFullStringList                  , addMuseumGroupGUIObject.tempSelectedTagNameFullStringList  , addMuseumGroupGUIObject.addMuseumGroupSelectNounTagMuseumObjectScrollableListObject               ); }
public void AddMuseumGroupSelectAdjectiveTagMuseumObjectScrollableListObject           (int _indexInt) { addMuseumGroupGUIObject.CovertScrollableListIntoCheckListVoid(_indexInt, addMuseumGroupGUIObject.addMuseumGroupSelectAdjectiveTagMuseumObjectScrollableListObject         ); addMuseumGroupGUIObject.tempSelectedTagNameFullStringList    = addMuseumGroupGUIObject.SetSelectedCheckListStringList(adjectiveTagNameFullStringList             , addMuseumGroupGUIObject.tempSelectedTagNameFullStringList  , addMuseumGroupGUIObject.addMuseumGroupSelectAdjectiveTagMuseumObjectScrollableListObject          ); }
public void AddMuseumGroupSelectNegativeAdjectiveTagMuseumObjectScrollableListObject   (int _indexInt) { addMuseumGroupGUIObject.CovertScrollableListIntoCheckListVoid(_indexInt, addMuseumGroupGUIObject.addMuseumGroupSelectNegativeAdjectiveTagMuseumObjectScrollableListObject ); addMuseumGroupGUIObject.tempSelectedTagNameFullStringList    = addMuseumGroupGUIObject.SetSelectedCheckListStringList(negativeAdjectiveTagNameFullStringList     , addMuseumGroupGUIObject.tempSelectedTagNameFullStringList  , addMuseumGroupGUIObject.addMuseumGroupSelectNegativeAdjectiveTagMuseumObjectScrollableListObject  ); }
public void AddMuseumGroupSelectAdverbTagMuseumObjectScrollableListObject              (int _indexInt) { addMuseumGroupGUIObject.CovertScrollableListIntoCheckListVoid(_indexInt, addMuseumGroupGUIObject.addMuseumGroupSelectAdverbTagMuseumObjectScrollableListObject            ); addMuseumGroupGUIObject.tempSelectedTagNameFullStringList    = addMuseumGroupGUIObject.SetSelectedCheckListStringList(adverbTagNameFullStringList                , addMuseumGroupGUIObject.tempSelectedTagNameFullStringList  , addMuseumGroupGUIObject.addMuseumGroupSelectAdverbTagMuseumObjectScrollableListObject             ); }
public void AddMuseumGroupSelectNegativeAdverbTagMuseumObjectScrollableListObject      (int _indexInt) { addMuseumGroupGUIObject.CovertScrollableListIntoCheckListVoid(_indexInt, addMuseumGroupGUIObject.addMuseumGroupSelectNegativeAdverbTagMuseumObjectScrollableListObject    ); addMuseumGroupGUIObject.tempSelectedTagNameFullStringList     = addMuseumGroupGUIObject.SetSelectedCheckListStringList(negativeAdverbTagNameFullStringList        , addMuseumGroupGUIObject.tempSelectedTagNameFullStringList  , addMuseumGroupGUIObject.addMuseumGroupSelectNegativeAdverbTagMuseumObjectScrollableListObject     ); }
/*A function to set the full name of parent object.*/
public void AddMuseumGroupSelectParentMuseumObjectScrollableListObject                 (int _indexInt) {

    addMuseumGroupGUIObject.tempSelectedParentNameFullString        = addMuseumGroupGUIObject.addMuseumGroupSelectParentMuseumObjectScrollableListObject.getItem(_indexInt).get("text").toString();
    addMuseumGroupGUIObject.tempSelectedParentNameAltString         = FindMuseumObject(addMuseumGroupGUIObject.tempSelectedParentNameFullString).nameAltString;

}
/*Add new museum object with all collected property values.*/
public void AddMuseumGroupAddMuseumObjectButtonObject                                  (int _indexInt) {

    String          tempNameAltString                   = addMuseumGroupGUIObject.addMuseumGroupNameAltMuseumObjectTextfieldObject .getText();                          /*Get the alternate  name for the new museum object that the user will add.     */
    String          tempNameFullString                  = addMuseumGroupGUIObject.addMuseumGroupNameFullMuseumObjectTextfieldObject.getText();                          /*Get the full       name for the new museum object that the user will add.     */
    String          tempParentNameAltString             = addMuseumGroupGUIObject.tempSelectedParentNameAltString;                                                      /*Parent  alr        name for the new museum object that the user will add.     */
    String          tempTypeObjectMuseumNameAltString   = addMuseumGroupGUIObject.tempSelectedTypeObjectMuseumNameAltString;                                            /*Type    alternate  name for the new museum object that the user will add.     */
    List<String>    tempSelectedTagNameFullStringList   = addMuseumGroupGUIObject.tempSelectedTagNameFullStringList;                                                    /*Tags    full       name for the new museum object that the user will add.     */
    Tag[]           tempSelectedTagObjectArray          = new Tag[tempSelectedTagNameFullStringList.size()];                                                            /*Converted full name String List of Tag full name into an array of Tag object. */
    
    for(int i = 0; i < tempSelectedTagNameFullStringList.size(); i ++){ tempSelectedTagObjectArray[i] = FindTagObject(tempSelectedTagNameFullStringList.get(i)); }      /*Convert   full name String List of Tag full name into an array of Tag object. */
    if( tempTypeObjectMuseumNameAltString.equals("FLR")){ tempParentNameAltString = "XXX_XXX"; }                                                                        /*If the object that will be added is a floor object, then set the  alternate parent name into XXX_XXX.*/

    AddMuseumObject(tempNameAltString, tempNameFullString, tempParentNameAltString, tempTypeObjectMuseumNameAltString, tempSelectedTagObjectArray);
    
    /*After getting all processing done and the museum object is added, reset all value.
    PENDING: The display were not actually set back off.
    addMuseumGroupGUIObject.tempSelectedParentNameAltString             = "";
    addMuseumGroupGUIObject.tempSelectedParentNameFullString            = "";
    addMuseumGroupGUIObject.tempSelectedTypeObjectMuseumNameAltString   = "";
    addMuseumGroupGUIObject.tempSelectedTypeObjectMuseumNameFullString  = "";
    addMuseumGroupGUIObject.tempSelectedTagNameFullStringList.clear();
    */

}
////////////////////////////////////////////////////////////////////////////////////////////////////
//END//AddMuseumGroupGUIObject.pde Controller's Functions.//////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////



////////////////////////////////////////////////////////////////////////////////////////////////////
//START//AddTagGroupGUIObject.pde Controller's Functions.///////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
public void AddTagGroupTagTypeNameFullScrollableListObject (int _indexInt){

    addTagGroupGUIObject.tempSelectedTagTypeNameFullString = addTagGroupGUIObject.addTagGroupTagTypeNameFullScrollableListObject.getItem(_indexInt).get("text").toString();

}
public void AddTagGroupTagAddButtonObject                  (int _indexInt){

    String          tempTagNameAltString        = addTagGroupGUIObject.addTagGroupTagNameAltTextfieldObject     .getText();
    String          tempTagNameFullString       = addTagGroupGUIObject.addTagGroupTagNameFullTextfieldObject    .getText();
    String          tempTagTypeString           = "";
    Tag             tempTagObject               = null;
    List<Tag>       tempTagObjectList           = null;
    List<String>    tempTagNameAltStringList    = null;
    List<String>    tempTagNameFullStringList   = null;


    if      (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("SUBJECT"))           {

        tempTagTypeString                       = "SUB";
        tempTagObjectList                       = subjectTagObjectList;
        tempTagNameAltStringList                = subjectTagNameAltStringList;
        tempTagNameFullStringList               = subjectTagNameFullStringList;

        String tempSubjectString                = addTagGroupGUIObject.addTagGroupTagSubjectTextfieldObject.getText();
        tempTagObject                           = new Tag(new Name(tempTagNameAltString, tempTagNameFullString), tempTagTypeString, tempSubjectString);

    }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("VERB"))              {

        tempTagTypeString                       = "VER";
        tempTagObjectList                       = verbTagObjectList;
        tempTagNameAltStringList                = verbTagNameAltStringList;
        tempTagNameFullStringList               = verbTagNameFullStringList;

        String tempVerb1String                  = addTagGroupGUIObject.addTagGroupTagVerb1TextfieldObject   .getText();
        String tempVerb2String                  = addTagGroupGUIObject.addTagGroupTagVerb2TextfieldObject   .getText();
        String tempVer3bString                  = addTagGroupGUIObject.addTagGroupTagVerb3TextfieldObject   .getText();
        String tempVerIngbString                = addTagGroupGUIObject.addTagGroupTagVerbIngTextfieldObject .getText();
        String tempVerbSString                  = addTagGroupGUIObject.addTagGroupTagVerbSTextfieldObject   .getText();
        tempTagObject                           = new Tag(new Name(tempTagNameAltString, tempTagNameFullString), tempTagTypeString, tempVerb1String, tempVerb2String, tempVer3bString, tempVerIngbString, tempVerbSString);

    }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("NEGATIVE VERB"))     {

        tempTagTypeString                       = "NVE";
        tempTagObjectList                       = negativeVerbTagObjectList;
        tempTagNameAltStringList                = negativeVerbTagNameAltStringList;
        tempTagNameFullStringList               = negativeVerbTagNameFullStringList;

        String tempNegativeVerb1String          = addTagGroupGUIObject.addTagGroupTagNegativeVerb1TextfieldObject   .getText();
        String tempNegativeVerb2String          = addTagGroupGUIObject.addTagGroupTagNegativeVerb2TextfieldObject   .getText();
        String tempNegativeVer3bString          = addTagGroupGUIObject.addTagGroupTagNegativeVerb3TextfieldObject   .getText();
        String tempNegativeVerIngbString        = addTagGroupGUIObject.addTagGroupTagNegativeVerbIngTextfieldObject .getText();
        String tempNegativeVerbSString          = addTagGroupGUIObject.addTagGroupTagNegativeVerbSTextfieldObject   .getText();
        tempTagObject                           = new Tag(new Name(tempTagNameAltString, tempTagNameFullString), tempTagTypeString, tempNegativeVerb1String, tempNegativeVerb2String, tempNegativeVer3bString, tempNegativeVerIngbString, tempNegativeVerbSString);

    }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("NOUN"))              {

        tempTagTypeString                       = "NOU";
        tempTagObjectList                       = nounTagObjectList;
        tempTagNameAltStringList                = nounTagNameAltStringList;
        tempTagNameFullStringList               = nounTagNameFullStringList;

        String tempNounString                   = addTagGroupGUIObject.addTagGroupTagNounTextfieldObject    .getText();
        String tempNounSString                  = addTagGroupGUIObject.addTagGroupTagNounSTextfieldObject   .getText();
        tempTagObject                           = new Tag(new Name(tempTagNameAltString, tempTagNameFullString), tempTagTypeString, tempNounString, tempNounSString);


    }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("ADJECTIVE"))         {

        tempTagTypeString                       = "ADJ";
        tempTagObjectList                       = adjectiveTagObjectList;
        tempTagNameAltStringList                = adjectiveTagNameAltStringList;
        tempTagNameFullStringList               = adjectiveTagNameFullStringList;

        String tempAdjectiveString              = addTagGroupGUIObject.addTagGroupTagAdjectiveTextfieldObject.getText();
        tempTagObject                           = new Tag(new Name(tempTagNameAltString, tempTagNameFullString), tempTagTypeString, tempAdjectiveString);


    }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("NEGATIVE ADJECTIVE")){

        tempTagTypeString                       = "NDJ";
        tempTagObjectList                       = negativeAdjectiveTagObjectList;
        tempTagNameAltStringList                = negativeAdjectiveTagNameAltStringList;
        tempTagNameFullStringList               = negativeAdjectiveTagNameFullStringList;

        String tempNegativeAdjectiveString      = addTagGroupGUIObject.addTagGroupTagNegativeAdjectiveTextfieldObject.getText();
        tempTagObject                           = new Tag(new Name(tempTagNameAltString, tempTagNameFullString), tempTagTypeString, tempNegativeAdjectiveString);


    }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("ADVERB"))            {

        tempTagTypeString                       = "ADV";
        tempTagObjectList                       = adverbTagObjectList;
        tempTagNameAltStringList                = adverbTagNameAltStringList;
        tempTagNameFullStringList               = adverbTagNameFullStringList;

        String tempAdverbString                 = addTagGroupGUIObject.addTagGroupTagAdverbTextfieldObject.getText();
        tempTagObject                           = new Tag(new Name(tempTagNameAltString, tempTagNameFullString), tempTagTypeString, tempAdverbString);


    }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("NEGATIVE ADVERB"))   {

        tempTagTypeString                       = "NDV";
        tempTagObjectList                       = negativeAdverbTagObjectList;
        tempTagNameAltStringList                = negativeAdverbTagNameAltStringList;
        tempTagNameFullStringList               = negativeAdverbTagNameFullStringList;

        String tempNegativeAdverbString         = addTagGroupGUIObject.addTagGroupTagNegativeAdverbTextfieldObject.getText();
        tempTagObject                           = new Tag(new Name(tempTagNameAltString, tempTagNameFullString), tempTagTypeString, tempNegativeAdverbString);

    }

    tempTagObjectList                           .add(tempTagObject);
    tempTagNameAltStringList                    .add(tempTagObject.nameAltString );
    tempTagNameFullStringList                   .add(tempTagObject.nameFullString);

    if      (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("SUBJECT"))              { addMuseumGroupGUIObject.addMuseumGroupSelectSubjectTagMuseumObjectScrollableListObject            .setItems(tempTagNameFullStringList); }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("VERB"))                 { addMuseumGroupGUIObject.addMuseumGroupSelectVerbTagMuseumObjectScrollableListObject               .setItems(tempTagNameFullStringList); }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("NEGATIVE VERB"))        { addMuseumGroupGUIObject.addMuseumGroupSelectNegativeVerbTagMuseumObjectScrollableListObject       .setItems(tempTagNameFullStringList); }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("NOUN"))                 { addMuseumGroupGUIObject.addMuseumGroupSelectNounTagMuseumObjectScrollableListObject               .setItems(tempTagNameFullStringList); }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("ADJECTIVE"))            { addMuseumGroupGUIObject.addMuseumGroupSelectAdjectiveTagMuseumObjectScrollableListObject          .setItems(tempTagNameFullStringList); }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("NEGATIVE ADJECTIVE"))   { addMuseumGroupGUIObject.addMuseumGroupSelectNegativeAdjectiveTagMuseumObjectScrollableListObject  .setItems(tempTagNameFullStringList); }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("ADVERB"))               { addMuseumGroupGUIObject.addMuseumGroupSelectAdverbTagMuseumObjectScrollableListObject             .setItems(tempTagNameFullStringList); }
    else if (addTagGroupGUIObject.tempSelectedTagTypeNameFullString.equals("NEGATIVE ADVERB"))      { addMuseumGroupGUIObject.addMuseumGroupSelectNegativeAdverbTagMuseumObjectScrollableListObject     .setItems(tempTagNameFullStringList); }

}
////////////////////////////////////////////////////////////////////////////////////////////////////
//END//AddTagGroupGUIObject.pde Controller's Functions./////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////



////////////////////////////////////////////////////////////////////////////////////////////////////
//START//AddPlayerGroupGUIObject.pde Controller's Functions.////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
/*Find the starting exhibition alternate name String.*/
public void AddPlayerGroupPickExhibitionStartScrollableListObject  (int _indexInt){

    String          tempStartingExhibitionNameAltString         = "";
    String          tempStartingExhibitionNameFullString        = addPlayerGroupGUIObject.addPlayerGroupPickExhibitionStartScrollableListObject.getItem(_indexInt).get("text").toString();
    ObjectMuseum    tempStartingExhibitionObject                = null;

    tempStartingExhibitionObject                                = FindMuseumObject(tempStartingExhibitionNameFullString);
    tempStartingExhibitionNameAltString                         = tempStartingExhibitionObject.nameAltString;
    addPlayerGroupGUIObject.tempExhibitionStartNameAltString    = tempStartingExhibitionNameAltString;

}
public void AddPlayerGroupPlayerAddButtonObject                    (int _indexInt){

    int             temporaryBiggestPlayerIndexInt      = biggestPlayerIndexInt + 1;
    String          tempStartingExhibitionNameAltString = addPlayerGroupGUIObject.tempExhibitionStartNameAltString;
    String          tempPlayerNameString                = addPlayerGroupGUIObject.addPlayerGroupPlayerNameTextfieldObject.getText();
    ObjectPlayer    tempPlayerObject                    = new ObjectPlayer(temporaryBiggestPlayerIndexInt, tempPlayerNameString, tempStartingExhibitionNameAltString);

    playerStringList.add("" + tempPlayerObject.playerIndexInt);

    selectPlayerScrollableListObject                                                        .setItems(playerStringList);
    removePlayerGroupGUIObject.removePlayerGroupSelectPlayerToRemoveScrollableListObject    .setItems(playerStringList);

}
////////////////////////////////////////////////////////////////////////////////////////////////////
//END//AddPlayerGroupGUIObject.pde Controller's Functions.//////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////// 



////////////////////////////////////////////////////////////////////////////////////////////////////
//START//RemovePlayerGroupGUIObject.pde Controller's Functions./////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
/*This function below is for the user to pick which player they want to remove.*/
public void RemovePlayerGroupSelectPlayerToRemoveScrollableListObject  (int _indexInt){

    String  tempIndexSelectedPlayerString                   = removePlayerGroupGUIObject.removePlayerGroupSelectPlayerToRemoveScrollableListObject.getItem(_indexInt).get("text").toString();
    int     tempIndexSelectedPlayerInt                      = Integer.parseInt(tempIndexSelectedPlayerString);
    removePlayerGroupGUIObject.tempPlayerToRemoveObject     = FindPlayerObject(tempIndexSelectedPlayerInt   );

}
public void RemovePlayerGroupRemoveButtonObject                        (int _indexInt){

    if(removePlayerGroupGUIObject.tempPlayerToRemoveObject != null){
        
        /*Remove the player from both player object list and the player string object list.*/
        playerObjectList                .remove(     removePlayerGroupGUIObject.tempPlayerToRemoveObject                );
        playerStringList                .remove("" + removePlayerGroupGUIObject.tempPlayerToRemoveObject.playerIndexInt );

        selectPlayerScrollableListObject                                                        .setItems(playerStringList);
        removePlayerGroupGUIObject.removePlayerGroupSelectPlayerToRemoveScrollableListObject    .setItems(playerStringList);

        /*When the user remove the player do not forget to set every player sibling object list.*/
        for(int i = 0; i < playerObjectList.size(); i ++){ playerObjectList.get(i).SetSiblingObjectList(); }
        /*Reset the selected player value so that when user click the button again it will not returned a null pointer error.*/
        removePlayerGroupGUIObject.tempPlayerToRemoveObject = null;
        
    }

}
////////////////////////////////////////////////////////////////////////////////////////////////////
//END//RemovePlayerGroupGUIObject.pde Controller's Functions.///////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////// 



////////////////////////////////////////////////////////////////////////////////////////////////////
//START//EditPlayerGroupGUIObject.pde Controller's Functions.///////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
/*Set the movement mode for both player object and the graphical user interface object.
This function is to make sure that both mode is always the same.*/
public void EditPlayerGroupPlayerModeValueRadioButtonObject            (int _intIndex)     {

    editPlayerGroupGUIObject.tempSelectedPlayerMovementModeInt                  = _intIndex;
    editPlayerGroupGUIObject.tempSelectedPlayerObject.playerMovementModeInt     = _intIndex;

}
/*A function to move the selected player into new exhibition.
This function need to only happened when the appropriate movement mode is selected.*/
public void EditPlayerGroupPlayerExhibitionNextScrollableListObject    (int _indexInt)     {

    if(editPlayerGroupGUIObject.tempSelectedPlayerMovementModeInt == 2){

        String  receivedMuseumNameFullString    = editPlayerGroupGUIObject.editPlayerGroupPlayerExhibitionNextScrollableListObject.getItem(_indexInt).get("text").toString();
        String  receivedMuseumNameAltString     = FindMuseumObject(receivedMuseumNameFullString).nameAltString;

        editPlayerGroupGUIObject.tempSelectedPlayerObject.ExhibitionMoveObject(receivedMuseumNameAltString);

    }

}
////////////////////////////////////////////////////////////////////////////////////////////////////
//END//EditPlayerGroupGUIObject.pde Controller's Functions./////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//END//Controller's Functions.//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



class AddMuseumGroupGUIObject extends GroupGUIObject{

    ControlP5       addMuseumGroupControlP5Object                                               ;                           /*ControlP5 object to control all graphical user interface controller.              */

    Group           addTagGroupObject                                                           ;

    String          tempSelectedParentNameAltString                                             = "";                       /*Selected object museum parent name alt  string.                                   */
    String          tempSelectedParentNameFullString                                            = "";                       /*Selected object museum parent name full string.                                   */
    String          tempSelectedTypeObjectMuseumNameAltString                                   = "";                       /*Selected object museum type   name alt  string ("FLR"  , "ROM" , "EXH"       ).   */
    String          tempSelectedTypeObjectMuseumNameFullString                                  = "";                       /*Selected object museum type   name full string ("Floor", "Room", "Exhibition").   */
    List<String>    tempSelectedTagNameFullStringList                                           = new ArrayList<String>();  /*Selected object museum tag    name full string.                                   */

    /*ControlP5 related graphical user interface controller variables.*/
    Group           addMuseumGroupObject                                                        ;
    ScrollableList  addMuseumGroupSelectTypeMuseumObjectScrollableListObject                    ;
    ScrollableList  addMuseumGroupSelectParentMuseumObjectScrollableListObject                  ;
    Textlabel       addMuseumGroupCanAddMultipleTagTextlabelObject                              ;
    ScrollableList  addMuseumGroupSelectSubjectTagMuseumObjectScrollableListObject              ;
    ScrollableList  addMuseumGroupSelectVerbTagMuseumObjectScrollableListObject                 ;
    ScrollableList  addMuseumGroupSelectNegativeVerbTagMuseumObjectScrollableListObject         ;
    ScrollableList  addMuseumGroupSelectNounTagMuseumObjectScrollableListObject                 ;
    ScrollableList  addMuseumGroupSelectAdjectiveTagMuseumObjectScrollableListObject            ;
    ScrollableList  addMuseumGroupSelectNegativeAdjectiveTagMuseumObjectScrollableListObject    ;
    ScrollableList  addMuseumGroupSelectAdverbTagMuseumObjectScrollableListObject               ;
    ScrollableList  addMuseumGroupSelectNegativeAdverbTagMuseumObjectScrollableListObject       ;
    Textfield       addMuseumGroupNameFullMuseumObjectTextfieldObject                           ;
    Textfield       addMuseumGroupNameAltMuseumObjectTextfieldObject                            ;
    Button          addMuseumGroupAddMuseumObjectButtonObject                                   ;

    AddMuseumGroupGUIObject                                         (

        int         _guiXInt            ,
        int         _guiYInt            ,
        int         _guiWidthInt        ,
        int         _guiHeightInt       ,
        Group       _addTagGroupObject  ,
        PApplet     _pAppletObject

    ){

        super                                                                       (_guiXInt, _guiYInt, _guiWidthInt, _guiHeightInt, _pAppletObject);
        addMuseumGroupControlP5Object                                               = new ControlP5(pAppletObject);

        addTagGroupObject                                                           = _addTagGroupObject;                                               /*PENDING.*/



        addMuseumGroupObject                                                        =
            addMuseumGroupControlP5Object   .addGroup                               ("AddMuseumGroupObject")
                                            .close                                  ()
                                            .setBackgroundColor                     (groupBackgroundColor)
                                            .setBackgroundHeight                    (guiHeightInt)
                                            .setColor                               (defaultCColor)
                                            .setColorBackground                     (groupColorBackgroundColor)
                                            .setColorLabel                          (groupColorLabelColor)
                                            .setLabel                               ("ADD MUSEUM OBJECT:")
                                            .setPosition                            (guiXInt, guiYInt)
                                            .setWidth                               (guiWidthInt);



        addMuseumGroupSelectTypeMuseumObjectScrollableListObject                    =
            addMuseumGroupControlP5Object   .addScrollableList                      ("AddMuseumGroupSelectTypeMuseumObjectScrollableListObject")
                                            .addItems                               (Arrays.asList("Floor", "Room", "Exhibition"))
                                            .setColor                               (defaultCColor)
                                            .setGroup                               (addMuseumGroupObject)
                                            .setLabel                               ("CHOOSE TYPE:")
                                            .setPosition                            (guiElement4ColumnFirstColumnXInt, guiLayoutOffsetInt)
                                            .setSize                                (guiElement4ColumnWidth, guiScrollableList4RowHeightInt)
                                            .setType                                (ControlP5.LIST);



        addMuseumGroupSelectParentMuseumObjectScrollableListObject                  =
            addMuseumGroupControlP5Object   .addScrollableList                      ("AddMuseumGroupSelectParentMuseumObjectScrollableListObject")
                                            .addItems                               (defaultStringList)
                                            .setColor                               (defaultCColor)
                                            .setGroup                               (addMuseumGroupObject)
                                            .setLabel                               ("PARENT OBJECT:")
                                            .setPosition                            (guiElement4ColumnSecondColumnXInt, guiLayoutOffsetInt)
                                            .setSize                                (((guiElement4ColumnWidth*3) + (guiLayoutOffsetInt*2)), guiScrollableList5RowHeightInt)
                                            .setType                                (ControlP5.LIST);



        addMuseumGroupCanAddMultipleTagTextlabelObject                              =
            addMuseumGroupControlP5Object   .addTextlabel                           ("AddMuseumGroupCanAddMultipleTagTextlabelObject")
                                            .setColor                               (defaultCColor)
                                            .setColorValue                          (255)
                                            .setGroup                               (addMuseumGroupObject)
                                            .setPosition                            (guiElement1ColumnFirstColumnXInt, ((guiLayoutOffsetInt*2) + guiScrollableList5RowHeightInt))
                                            .setText                                ("*YOU CAN ADD MULTIPLE TAGS\nBUT MINIMUM ONE TAG IN EACH CATEGORY.");



        addMuseumGroupSelectSubjectTagMuseumObjectScrollableListObject              =
            addMuseumGroupControlP5Object   .addScrollableList                      ("AddMuseumGroupSelectSubjectTagMuseumObjectScrollableListObject")
                                            .addItems                               (subjectTagNameFullStringList)
                                            .setColor                               (falseCheckListCColor)
                                            .setGroup                               (addMuseumGroupObject)
                                            .setLabel                               ("SUBJECT TAG:")
                                            .setPosition                            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*5) + guiScrollableList5RowHeightInt))
                                            .setSize                                (guiElement2ColumnWidth, guiScrollableList5RowHeightInt)
                                            .setType                                (ControlP5.LIST);



        addMuseumGroupSelectNounTagMuseumObjectScrollableListObject                 =
            addMuseumGroupControlP5Object   .addScrollableList                      ("AddMuseumGroupSelectNounTagMuseumObjectScrollableListObject")
                                            .addItems                               (nounTagNameFullStringList)
                                            .setColor                               (falseCheckListCColor)
                                            .setGroup                               (addMuseumGroupObject)
                                            .setLabel                               ("NOUN TAG:")
                                            .setPosition                            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*5) + guiScrollableList5RowHeightInt))
                                            .setSize                                (guiElement2ColumnWidth, guiScrollableList5RowHeightInt)
                                            .setType                                (ControlP5.LIST);



        addMuseumGroupSelectVerbTagMuseumObjectScrollableListObject                 =
            addMuseumGroupControlP5Object   .addScrollableList                      ("AddMuseumGroupSelectVerbTagMuseumObjectScrollableListObject")
                                            .addItems                               (verbTagNameFullStringList)
                                            .setColor                               (falseCheckListCColor)
                                            .setLabel                               ("VERB TAG:")
                                            .setGroup                               (addMuseumGroupObject)
                                            .setPosition                            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + (guiScrollableList5RowHeightInt*2)))
                                            .setSize                                (guiElement2ColumnWidth, guiScrollableList5RowHeightInt)
                                            .setType                                (ControlP5.LIST);



        addMuseumGroupSelectNegativeVerbTagMuseumObjectScrollableListObject         =
            addMuseumGroupControlP5Object   .addScrollableList                      ("AddMuseumGroupSelectNegativeVerbTagMuseumObjectScrollableListObject")
                                            .addItems                               (negativeVerbTagNameFullStringList)
                                            .setColor                               (falseCheckListCColor)
                                            .setGroup                               (addMuseumGroupObject)
                                            .setLabel                               ("NEGATIVE VERB TAG:")
                                            .setPosition                            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*6) + (guiScrollableList5RowHeightInt*2)))
                                            .setSize                                (guiElement2ColumnWidth, guiScrollableList5RowHeightInt)
                                            .setType                                (ControlP5.LIST);



        addMuseumGroupSelectAdjectiveTagMuseumObjectScrollableListObject            =
            addMuseumGroupControlP5Object   .addScrollableList                      ("AddMuseumGroupSelectAdjectiveTagMuseumObjectScrollableListObject")
                                            .addItems                               (adjectiveTagNameFullStringList)
                                            .setColor                               (falseCheckListCColor)
                                            .setGroup                               (addMuseumGroupObject)
                                            .setLabel                               ("ADJECTIVE TAG:")
                                            .setPosition                            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*7) + (guiScrollableList5RowHeightInt*3)))
                                            .setSize                                (guiElement2ColumnWidth, guiScrollableList5RowHeightInt)
                                            .setType                                (ControlP5.LIST);



        addMuseumGroupSelectNegativeAdjectiveTagMuseumObjectScrollableListObject    =
            addMuseumGroupControlP5Object   .addScrollableList                      ("AddMuseumGroupSelectNegativeAdjectiveTagMuseumObjectScrollableListObject")
                                            .addItems                               (negativeAdjectiveTagNameFullStringList)
                                            .setColor                               (falseCheckListCColor)
                                            .setGroup                               (addMuseumGroupObject)
                                            .setLabel                               ("NEGATIVE ADJECTIVE TAG:")
                                            .setPosition                            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*7) + (guiScrollableList5RowHeightInt*3)))
                                            .setSize                                (guiElement2ColumnWidth, guiScrollableList5RowHeightInt)
                                            .setType                                (ControlP5.LIST);



        addMuseumGroupSelectAdverbTagMuseumObjectScrollableListObject               =
            addMuseumGroupControlP5Object   .addScrollableList                      ("AddMuseumGroupSelectAdverbTagMuseumObjectScrollableListObject")
                                            .addItems                               (adverbTagNameFullStringList)
                                            .setColor                               (falseCheckListCColor)
                                            .setGroup                               (addMuseumGroupObject)
                                            .setLabel                               ("ADVERB TAG:")
                                            .setPosition                            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*8) + (guiScrollableList5RowHeightInt*4)))
                                            .setSize                                (guiElement2ColumnWidth, guiScrollableList5RowHeightInt)
                                            .setType                                (ControlP5.LIST);



        addMuseumGroupSelectNegativeAdverbTagMuseumObjectScrollableListObject       =
            addMuseumGroupControlP5Object   .addScrollableList                      ("AddMuseumGroupSelectNegativeAdverbTagMuseumObjectScrollableListObject")
                                            .addItems                               (negativeAdverbTagNameFullStringList)
                                            .setColor                               (falseCheckListCColor)
                                            .setGroup                               (addMuseumGroupObject)
                                            .setLabel                               ("NEGATIVE ADVERB TAG:")
                                            .setPosition                            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*8) + (guiScrollableList5RowHeightInt*4)))
                                            .setSize                                (guiElement2ColumnWidth, guiScrollableList5RowHeightInt)
                                            .setType                                (ControlP5.LIST);



        addMuseumGroupNameFullMuseumObjectTextfieldObject                           =
            addMuseumGroupControlP5Object   .addTextfield                           ("AddMuseumGroupNameFullMuseumObjectTextfieldObject")
                                            .setColor                               (defaultCColor)
                                            .setGroup                               (addMuseumGroupObject)
                                            .setLabel                               ("NAME FULL")
                                            .setPosition                            (guiElement3ColumnFirstColumnXInt, ((guiLayoutOffsetInt*9) + (guiScrollableList5RowHeightInt*5)))
                                            .setSize                                (guiElement3ColumnWidth, guiElement2LineHeight);



        addMuseumGroupNameAltMuseumObjectTextfieldObject                            =
            addMuseumGroupControlP5Object   .addTextfield                           ("AddMuseumGroupNameAltMuseumObjectTextfieldObject")
                                            .setColor                               (defaultCColor)
                                            .setGroup                               (addMuseumGroupObject)
                                            .setLabel                               ("NAME ALTERNATIVE")
                                            .setPosition                            (guiElement3ColumnSecondColumnXInt, ((guiLayoutOffsetInt*9) + (guiScrollableList5RowHeightInt*5)))
                                            .setSize                                (guiElement3ColumnWidth, guiElement2LineHeight);



        addMuseumGroupAddMuseumObjectButtonObject                                   =
            addMuseumGroupControlP5Object   .addButton                              ("AddMuseumGroupAddMuseumObjectButtonObject")
                                            .setColor                               (defaultCColor)
                                            .setGroup                               (addMuseumGroupObject)
                                            .setLabel                               ("ADD MUSEUM OBJECT")
                                            .setPosition                            (guiElement3ColumnThirdColumnXInt, ((guiLayoutOffsetInt*9) + (guiScrollableList5RowHeightInt*5)))
                                            .setSize                                (guiElement3ColumnWidth, guiElement2LineHeight);



    }

    public void DrawVoid                                                   (float _alphaFloat){

        super.DrawVoid(_alphaFloat, addMuseumGroupObject);

    }

}



class AddPlayerGroupGUIObject extends GroupGUIObject{

    ControlP5       addPlayerGroupControlP5Object                           ;

    Group           removePlayerGroupObject                                 ;

    String          tempExhibitionStartNameAltString                        = "";

    /*ControlP5 related graphical user interface controller variables.*/
    Group           addPlayerGroupObject                                    ;
    Textlabel       addPlayerGroupPlayerIndexTextlabelObject                ;
    Textlabel       addPlayerGroupPlayerIndexValueTextlabelObject           ;
    ScrollableList  addPlayerGroupPickExhibitionStartScrollableListObject   ;
    Textfield       addPlayerGroupPlayerNameTextfieldObject                 ;
    Button          addPlayerGroupPlayerAddButtonObject                     ;

    AddPlayerGroupGUIObject                                         (

        int         _guiXInt                    ,
        int         _guiYInt                    ,
        int         _guiWidthInt                ,
        int         _guiHeightInt               ,
        Group       _removePlayerGroupObject    ,
        PApplet     _pAppletObject

    ){

        super                                                       (_guiXInt, _guiYInt, _guiWidthInt, _guiHeightInt, _pAppletObject);
        addPlayerGroupControlP5Object                               = new ControlP5(pAppletObject);

        removePlayerGroupObject                                     = _removePlayerGroupObject;

        addPlayerGroupObject                                        =
            addPlayerGroupControlP5Object   .addGroup               ("AddPlayerGroupObject")
                                            .close                  ()
                                            .setBackgroundColor     (groupBackgroundColor)
                                            .setBackgroundHeight    (guiHeightInt)
                                            .setColor               (defaultCColor)
                                            .setColorBackground     (groupColorBackgroundColor)
                                            .setColorLabel          (groupColorLabelColor)
                                            .setLabel               ("ADD VISITOR:")
                                            .setPosition            (guiXInt, guiYInt)
                                            .setWidth               (guiWidthInt);



        addPlayerGroupPlayerIndexTextlabelObject                    =
            addPlayerGroupControlP5Object   .addTextlabel           ("AddPlayerGroupPlayerIndexTextlabelObject")
                                            .setColor               (defaultCColor)
                                            .setColorValue          (255)
                                            .setGroup               (addPlayerGroupObject)
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, guiLayoutOffsetInt)
                                            .setText                ("VISITOR INDEX:");



        addPlayerGroupPlayerIndexValueTextlabelObject               =
            addPlayerGroupControlP5Object   .addTextlabel           ("AdPlayerGroupPlayerIndexValueTextlabelObject")
                                            .setColor               (defaultCColor)
                                            .setColorValue          (255)
                                            .setGroup               (addPlayerGroupObject)
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, guiLayoutOffsetInt)
                                            .setText                ("" + playerAmountInt);



        addPlayerGroupPickExhibitionStartScrollableListObject       =
            addPlayerGroupControlP5Object   .addScrollableList      ("AddPlayerGroupPickExhibitionStartScrollableListObject")
                                            .addItems               (exhibitionNameFullStringList)
                                            .setColor               (defaultCColor)
                                            .setGroup               (addPlayerGroupObject)
                                            .setLabel               ("PICK STARTING EXHIBITION:")
                                            .setPosition            (guiElement1ColumnFirstColumnXInt, (guiLayoutOffsetInt*3))
                                            .setSize                (guiElement1ColumnWidth, guiScrollableList5RowHeightInt)
                                            .setType                (ControlP5.LIST);



        addPlayerGroupPlayerNameTextfieldObject                     =
            addPlayerGroupControlP5Object   .addTextfield           ("AddPlayerGroupPlayerNameTextfieldObject")
                                            .setColor               (defaultCColor)
                                            .setGroup               (addPlayerGroupObject)
                                            .setLabel               ("VISITOR NAME:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*4) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addPlayerGroupPlayerAddButtonObject                         =
            addPlayerGroupControlP5Object   .addButton              ("AddPlayerGroupPlayerAddButtonObject")
                                            .setColor               (defaultCColor)
                                            .setGroup               (addPlayerGroupObject)
                                            .setLabel               ("ADD PLAYER")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*4) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);

    }

    public void DrawVoid                                                   (float   _alphaFloat){

        super.DrawVoid(_alphaFloat, addPlayerGroupObject);

    }

}



class AddTagGroupGUIObject extends GroupGUIObject{

    ControlP5       addTagGroupControllerP5Object                       ;

    ScrollableList  selectMuseumObjectScrollableListObject              ;

    String          tempSelectedTagTypeNameFullString                   = "";

    /*ControlP5 related graphical user interface controller variables.*/
    Group           addTagGroupObject                                   ;
    ScrollableList  addTagGroupTagTypeNameFullScrollableListObject      ;
    Textfield       addTagGroupTagNameAltTextfieldObject                ;
    Textfield       addTagGroupTagNameFullTextfieldObject               ;
    Textfield       addTagGroupTagSubjectTextfieldObject                ;
    Textfield       addTagGroupTagVerb1TextfieldObject                  ;
    Textfield       addTagGroupTagVerb2TextfieldObject                  ;
    Textfield       addTagGroupTagVerb3TextfieldObject                  ;
    Textfield       addTagGroupTagVerbIngTextfieldObject                ;
    Textfield       addTagGroupTagVerbSTextfieldObject                  ;
    Textfield       addTagGroupTagNegativeVerb1TextfieldObject          ;
    Textfield       addTagGroupTagNegativeVerb2TextfieldObject          ;
    Textfield       addTagGroupTagNegativeVerb3TextfieldObject          ;
    Textfield       addTagGroupTagNegativeVerbIngTextfieldObject        ;
    Textfield       addTagGroupTagNegativeVerbSTextfieldObject          ;
    Textfield       addTagGroupTagNounTextfieldObject                   ;
    Textfield       addTagGroupTagNounSTextfieldObject                  ;
    Textfield       addTagGroupTagAdjectiveTextfieldObject              ;
    Textfield       addTagGroupTagNegativeAdjectiveTextfieldObject      ;
    Textfield       addTagGroupTagAdverbTextfieldObject                 ;
    Textfield       addTagGroupTagNegativeAdverbTextfieldObject         ;
    Button          addTagGroupTagAddButtonObject                       ;

    AddTagGroupGUIObject(

        int                 _guiXInt                                ,
        int                 _guiYInt                                ,
        int                 _guiWidthInt                            ,
        int                 _guiHeightInt                           ,
        ScrollableList      _selectMuseumObjectScrollableListObject ,
        PApplet             _pAppletObject

    ){


        super(_guiXInt, _guiYInt, _guiWidthInt, _guiHeightInt, _pAppletObject);
        addTagGroupControllerP5Object               = new ControlP5(pAppletObject);

        selectMuseumObjectScrollableListObject      = _selectMuseumObjectScrollableListObject;



        addTagGroupObject                                           =
            addTagGroupControllerP5Object   .addGroup               ("AddTagGroupObject")
                                            .close                  ()
                                            .setBackgroundColor     (groupBackgroundColor)
                                            .setBackgroundHeight    (guiHeightInt)
                                            .setColor               (defaultCColor)
                                            .setColorBackground     (groupColorBackgroundColor)
                                            .setColorLabel          (groupColorLabelColor)
                                            .setLabel               ("ADD TAG:")
                                            .setPosition            (guiXInt, guiYInt)
                                            .setWidth               (guiWidthInt);



        addTagGroupTagTypeNameFullScrollableListObject              =
            addTagGroupControllerP5Object   .addScrollableList      ("AddTagGroupTagTypeNameFullScrollableListObject")
                                            .addItems               (Arrays.asList("SUBJECT", "VERB", "NEGATIVE VERB", "NOUN", "ADJECTIVE", "NEGATIVE ADJECTIVE", "ADVERB", "NEGATIVE ADVERB"))
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("SELECT TAG TYPE:")
                                            .setPosition            (guiElement1ColumnFirstColumnXInt, guiLayoutOffsetInt)
                                            .setSize                (guiElement1ColumnWidth, guiScrollableList5RowHeightInt)
                                            .setType                (ControlP5.LIST);



        addTagGroupTagNameFullTextfieldObject                       =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNameFullTextfieldObject")
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("TAG NAME FULL:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*2) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagNameAltTextfieldObject                        =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNameAltTextfieldObject")
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("TAG NAME ALT:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*2) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagSubjectTextfieldObject                        =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagSubjectTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("SUBJECT:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagVerb1TextfieldObject                          =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagVerb1TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("VERB 1:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagVerb2TextfieldObject                          =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagVerb2TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("VERB 2:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagVerb3TextfieldObject                          =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagVerb3TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("VERB 3:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*10) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagVerbIngTextfieldObject                        =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagVerbIngTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("VERB + ING:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*10) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagVerbSTextfieldObject                          =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagVerbSTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("VERB + S:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*14) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagNegativeVerb1TextfieldObject                  =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNegativeVerb1TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("NEGATIVE VERB 1:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagNegativeVerb2TextfieldObject                  =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNegativeVerb2TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("NEGATIVE VERB 2:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagNegativeVerb3TextfieldObject                  =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNegativeVerb3TextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("NEGATIVE VERB 3:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*10) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagNegativeVerbIngTextfieldObject                =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNegativeVerbIngTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("NEGATIVE VERB + ING:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*10) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagNegativeVerbSTextfieldObject                  =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNegativeVerbSTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("NEGATIVE VERB + S:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*14) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagNounTextfieldObject                           =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNounTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("NOUN:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagNounSTextfieldObject                          =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNounSTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("NOUN + S:")
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagAdjectiveTextfieldObject                      =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagAdjectiveTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("ADJECTIVE:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagNegativeAdjectiveTextfieldObject              =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNegativeAdjectiveTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("NEGATIVE ADJECTIVE:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagAdverbTextfieldObject                         =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagAdverbTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("ADVERB:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagNegativeAdverbTextfieldObject                 =
            addTagGroupControllerP5Object   .addTextfield           ("AddTagGroupTagNegativeAdverbTextfieldObject")
                                            .hide                   ()
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("NEGATIVE ADVERB:")
                                            .setPosition            (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*6) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



        addTagGroupTagAddButtonObject                               =
            addTagGroupControllerP5Object   .addButton              ("AddTagGroupTagAddButtonObject")
                                            .setColor               (defaultCColor)
                                            .setGroup               (addTagGroupObject)
                                            .setLabel               ("ADD TAG")  
                                            .setPosition            (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*14) + guiScrollableList5RowHeightInt))
                                            .setSize                (guiElement2ColumnWidth, guiElement2LineHeight);



    }

    public void DrawVoid(float   _alphaFloat){

        super.DrawVoid(_alphaFloat, addTagGroupObject);

        ControlFormVoid();

    }

    /*Show the necessary text field according to the selected type tag.*/
    public void ControlFormVoid(){

        if(tempSelectedTagTypeNameFullString.equals("SUBJECT"))                 {

            addTagGroupTagSubjectTextfieldObject            .show();
            addTagGroupTagVerb1TextfieldObject              .hide();
            addTagGroupTagVerb2TextfieldObject              .hide();
            addTagGroupTagVerb3TextfieldObject              .hide();
            addTagGroupTagVerbIngTextfieldObject            .hide();
            addTagGroupTagVerbSTextfieldObject              .hide();
            addTagGroupTagNegativeVerb1TextfieldObject      .hide();
            addTagGroupTagNegativeVerb2TextfieldObject      .hide();
            addTagGroupTagNegativeVerb3TextfieldObject      .hide();
            addTagGroupTagNegativeVerbIngTextfieldObject    .hide();
            addTagGroupTagNegativeVerbSTextfieldObject      .hide();
            addTagGroupTagNounTextfieldObject               .hide();
            addTagGroupTagNounSTextfieldObject              .hide();
            addTagGroupTagAdjectiveTextfieldObject          .hide();
            addTagGroupTagNegativeAdjectiveTextfieldObject  .hide();
            addTagGroupTagAdverbTextfieldObject             .hide();
            addTagGroupTagNegativeAdverbTextfieldObject     .hide();

        }
        else if(tempSelectedTagTypeNameFullString.equals("VERB"))               {

            addTagGroupTagSubjectTextfieldObject            .hide();
            addTagGroupTagVerb1TextfieldObject              .show();
            addTagGroupTagVerb2TextfieldObject              .show();
            addTagGroupTagVerb3TextfieldObject              .show();
            addTagGroupTagVerbIngTextfieldObject            .show();
            addTagGroupTagVerbSTextfieldObject              .show();
            addTagGroupTagNegativeVerb1TextfieldObject      .hide();
            addTagGroupTagNegativeVerb2TextfieldObject      .hide();
            addTagGroupTagNegativeVerb3TextfieldObject      .hide();
            addTagGroupTagNegativeVerbIngTextfieldObject    .hide();
            addTagGroupTagNegativeVerbSTextfieldObject      .hide();
            addTagGroupTagNounTextfieldObject               .hide();
            addTagGroupTagNounSTextfieldObject              .hide();
            addTagGroupTagAdjectiveTextfieldObject          .hide();
            addTagGroupTagNegativeAdjectiveTextfieldObject  .hide();
            addTagGroupTagAdverbTextfieldObject             .hide();
            addTagGroupTagNegativeAdverbTextfieldObject     .hide();

        }
        else if(tempSelectedTagTypeNameFullString.equals("NEGATIVE VERB"))      {

            addTagGroupTagSubjectTextfieldObject            .hide();
            addTagGroupTagVerb1TextfieldObject              .hide();
            addTagGroupTagVerb2TextfieldObject              .hide();
            addTagGroupTagVerb3TextfieldObject              .hide();
            addTagGroupTagVerbIngTextfieldObject            .hide();
            addTagGroupTagVerbSTextfieldObject              .hide();
            addTagGroupTagNegativeVerb1TextfieldObject      .show();
            addTagGroupTagNegativeVerb2TextfieldObject      .show();
            addTagGroupTagNegativeVerb3TextfieldObject      .show();
            addTagGroupTagNegativeVerbIngTextfieldObject    .show();
            addTagGroupTagNegativeVerbSTextfieldObject      .show();
            addTagGroupTagNounTextfieldObject               .hide();
            addTagGroupTagNounSTextfieldObject              .hide();
            addTagGroupTagAdjectiveTextfieldObject          .hide();
            addTagGroupTagNegativeAdjectiveTextfieldObject  .hide();
            addTagGroupTagAdverbTextfieldObject             .hide();
            addTagGroupTagNegativeAdverbTextfieldObject     .hide();

        }
        else if(tempSelectedTagTypeNameFullString.equals("NOUN"))               {

            addTagGroupTagSubjectTextfieldObject            .hide();
            addTagGroupTagVerb1TextfieldObject              .hide();
            addTagGroupTagVerb2TextfieldObject              .hide();
            addTagGroupTagVerb3TextfieldObject              .hide();
            addTagGroupTagVerbIngTextfieldObject            .hide();
            addTagGroupTagVerbSTextfieldObject              .hide();
            addTagGroupTagNegativeVerb1TextfieldObject      .hide();
            addTagGroupTagNegativeVerb2TextfieldObject      .hide();
            addTagGroupTagNegativeVerb3TextfieldObject      .hide();
            addTagGroupTagNegativeVerbIngTextfieldObject    .hide();
            addTagGroupTagNegativeVerbSTextfieldObject      .hide();
            addTagGroupTagNounTextfieldObject               .show();
            addTagGroupTagNounSTextfieldObject              .show();
            addTagGroupTagAdjectiveTextfieldObject          .hide();
            addTagGroupTagNegativeAdjectiveTextfieldObject  .hide();
            addTagGroupTagAdverbTextfieldObject             .hide();
            addTagGroupTagNegativeAdverbTextfieldObject     .hide();

        }
        else if(tempSelectedTagTypeNameFullString.equals("ADJECTIVE"))          {

            addTagGroupTagSubjectTextfieldObject            .hide();
            addTagGroupTagVerb1TextfieldObject              .hide();
            addTagGroupTagVerb2TextfieldObject              .hide();
            addTagGroupTagVerb3TextfieldObject              .hide();
            addTagGroupTagVerbIngTextfieldObject            .hide();
            addTagGroupTagVerbSTextfieldObject              .hide();
            addTagGroupTagNegativeVerb1TextfieldObject      .hide();
            addTagGroupTagNegativeVerb2TextfieldObject      .hide();
            addTagGroupTagNegativeVerb3TextfieldObject      .hide();
            addTagGroupTagNegativeVerbIngTextfieldObject    .hide();
            addTagGroupTagNegativeVerbSTextfieldObject      .hide();
            addTagGroupTagNounTextfieldObject               .hide();
            addTagGroupTagNounSTextfieldObject              .hide();
            addTagGroupTagAdjectiveTextfieldObject          .show();
            addTagGroupTagNegativeAdjectiveTextfieldObject  .hide();
            addTagGroupTagAdverbTextfieldObject             .hide();
            addTagGroupTagNegativeAdverbTextfieldObject     .hide();

        }
        else if(tempSelectedTagTypeNameFullString.equals("NEGATIVE ADJECTIVE")) {

            addTagGroupTagSubjectTextfieldObject            .hide();
            addTagGroupTagVerb1TextfieldObject              .hide();
            addTagGroupTagVerb2TextfieldObject              .hide();
            addTagGroupTagVerb3TextfieldObject              .hide();
            addTagGroupTagVerbIngTextfieldObject            .hide();
            addTagGroupTagVerbSTextfieldObject              .hide();
            addTagGroupTagNegativeVerb1TextfieldObject      .hide();
            addTagGroupTagNegativeVerb2TextfieldObject      .hide();
            addTagGroupTagNegativeVerb3TextfieldObject      .hide();
            addTagGroupTagNegativeVerbIngTextfieldObject    .hide();
            addTagGroupTagNegativeVerbSTextfieldObject      .hide();
            addTagGroupTagNounTextfieldObject               .hide();
            addTagGroupTagNounSTextfieldObject              .hide();
            addTagGroupTagAdjectiveTextfieldObject          .hide();
            addTagGroupTagNegativeAdjectiveTextfieldObject  .show();
            addTagGroupTagAdverbTextfieldObject             .hide();
            addTagGroupTagNegativeAdverbTextfieldObject     .hide();

        }
        else if(tempSelectedTagTypeNameFullString.equals("ADVERB"))             {

            addTagGroupTagSubjectTextfieldObject            .hide();
            addTagGroupTagVerb1TextfieldObject              .hide();
            addTagGroupTagVerb2TextfieldObject              .hide();
            addTagGroupTagVerb3TextfieldObject              .hide();
            addTagGroupTagVerbIngTextfieldObject            .hide();
            addTagGroupTagVerbSTextfieldObject              .hide();
            addTagGroupTagNegativeVerb1TextfieldObject      .hide();
            addTagGroupTagNegativeVerb2TextfieldObject      .hide();
            addTagGroupTagNegativeVerb3TextfieldObject      .hide();
            addTagGroupTagNegativeVerbIngTextfieldObject    .hide();
            addTagGroupTagNegativeVerbSTextfieldObject      .hide();
            addTagGroupTagNounTextfieldObject               .hide();
            addTagGroupTagNounSTextfieldObject              .hide();
            addTagGroupTagAdjectiveTextfieldObject          .hide();
            addTagGroupTagNegativeAdjectiveTextfieldObject  .hide();
            addTagGroupTagAdverbTextfieldObject             .show();
            addTagGroupTagNegativeAdverbTextfieldObject     .hide();

        }
        else if(tempSelectedTagTypeNameFullString.equals("NEGATIVE ADVERB"))    {

            addTagGroupTagSubjectTextfieldObject            .hide();
            addTagGroupTagVerb1TextfieldObject              .hide();
            addTagGroupTagVerb2TextfieldObject              .hide();
            addTagGroupTagVerb3TextfieldObject              .hide();
            addTagGroupTagVerbIngTextfieldObject            .hide();
            addTagGroupTagVerbSTextfieldObject              .hide();
            addTagGroupTagNegativeVerb1TextfieldObject      .hide();
            addTagGroupTagNegativeVerb2TextfieldObject      .hide();
            addTagGroupTagNegativeVerb3TextfieldObject      .hide();
            addTagGroupTagNegativeVerbIngTextfieldObject    .hide();
            addTagGroupTagNegativeVerbSTextfieldObject      .hide();
            addTagGroupTagNounTextfieldObject               .hide();
            addTagGroupTagNounSTextfieldObject              .hide();
            addTagGroupTagAdjectiveTextfieldObject          .hide();
            addTagGroupTagNegativeAdjectiveTextfieldObject  .hide();
            addTagGroupTagAdverbTextfieldObject             .hide();
            addTagGroupTagNegativeAdverbTextfieldObject     .show();

        }

    }

}
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

        fill                            (255);
        stroke                          (0);
        shapeMode                       (CENTER);                   /*Set this button origin point mode as center.*/

        buttonOpenCloseObject           = createShape(GROUP);       /*Create a shape type GROUP, which is an accumulation of other shapes.*/
        
        /*Create the sub shape components.
        The components are the main circle shape and two lines that formed a plus.*/
        buttonOpenCloseCircleObject     = createShape(

            ELLIPSE, 
            originXInt, 
            originYInt, 
            buttonSizeInt, 
            buttonSizeInt

        );
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

        noFill                          ();
        noStroke                        ();
        shapeMode                       (CORNER);                   /*Set this button origin point mode as center.*/

    }

    /*A function to draw the combined shape.*/
    public void DrawVoid                               (int _buttonXInt, int _buttonYInt){

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
    public boolean MouseOverBoolean            (){

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









class EditPlayerGroupGUIObject extends GroupGUIObject{

    ControlP5       editPlayerGroupControlP5Object                              ;                           /*ControlP5 object to control all graphical user interface controller.                              */

    ScrollableList  selectPlayerScrollableListObject                            ;

    ObjectPlayer    tempSelectedPlayerObject                                    ;                           /*Selected player object.*/
    int             tempSelectedPlayerMovementModeInt                           = 2;                        /*Movement mode of selected player object.                                                          */
    String          tempSelectedPlayerSentenceString                            = "";                       /*Temporary variable that contains selected player object sentence                           String.*/
    String          tempSelectedPlayerFinishedString                            = "";                       /*Temporary variable that contains selected player object finished                           String.*/
    List<String>    tempSelectedPlayerExhibitionTargetNameFullStringList        = new ArrayList<String>();  /*Temporary variable that contains selected player object target   exhibition list full name String.*/
    List<String>    tempSelectedPlayerExhibitionVisitedNameFullStringList       = new ArrayList<String>();  /*Temporary variable that contains selected player object visited  exhibition list full name String.*/
    List<String>    tempSelectedPlayerTagNameFullStringList                     = new ArrayList<String>();  /*Temporary variable that contains selected player object tag                 list full name String.*/

    /*ControlP5 related graphical user interface controller variables.*/
    Group           editPlayerGroupObject                                       ;
    Textlabel       editPlayerGroupPlayerIndexTextlabelObject                   ;
    Textlabel       editPlayerGroupPlayerIndexValueTextlabelObject              ;
    Textfield       editPlayerGroupPlayerNameTextfieldObject                    ;
    Button          editPlayerGroupPlayerNameChangeButtonObject                 ;
    Textlabel       editPlayerGroupPlayerFinishedTextlabelObject                ;
    Textlabel       editPlayerGroupPlayerFinishedValueTextlabelObject           ;
    Textlabel       editPlayerGroupPlayerScoreTextlabelObject                   ;
    Textlabel       editPlayerGroupPlayerScoreValueTextlabelObject              ;
    Textlabel       editPlayerGroupPlayerExhibitionCurrentTextlabelObject       ;
    Textlabel       editPlayerGroupPlayerExhibitionCurrentValueTextlabelObject  ;
    ScrollableList  editPlayerGroupPlayerExhibitionTargetScrollableListObject   ;
    ScrollableList  editPlayerGroupPlayerExhibitionVisitedScrollableListObject  ;
    Textlabel       editPlayerGroupPlayerSentenceTextlabelObject                ;
    Textarea        editPlayerGroupPlayerSentenceValueTextareaObject            ;
    Textlabel       editPlayerGroupPlayerExplanationTextlabelObject             ;
    Textarea        editPlayerGroupPlayerExaplanationValueTextareaObject        ;
    ScrollableList  editPlayerGroupPlayerTagScrollableListObject                ;
    Textlabel       editPlayerGroupPlayerModeTextlabelObject                    ;
    RadioButton     editPlayerGroupPlayerModeValueRadioButtonObject             ;
    ScrollableList  editPlayerGroupPlayerExhibitionNextScrollableListObject     ;
    Button          editPlayerGroupPlayerResetButtonObject                      ;
    Button          editPlayerGroupPlayerGeneratePatternButtonObject            ;

    EditPlayerGroupGUIObject                                        (

        int             _guiXInt                            ,
        int             _guiYInt                            ,
        int             _guiWidthInt                        ,
        int             _guiHeightInt                       ,
        ScrollableList  _selectPlayerScrollableListObject   ,
        PApplet         _pAppletObject

    ){

        super                                                       (_guiXInt, _guiYInt, _guiWidthInt, _guiHeightInt, _pAppletObject);
        editPlayerGroupControlP5Object                              = new ControlP5(pAppletObject);

        selectPlayerScrollableListObject                            = _selectPlayerScrollableListObject;                                                                /*PENDING.*/

        tempSelectedPlayerObject                                    =  playerObjectList     .get(0);                                                                    /*Set the default player object.                                            */
        tempSelectedPlayerFinishedString                            = (tempSelectedPlayerObject .playerFinishedBoolean == true) ? "True" : "False";                     /*Convert boolean value into String type data with sentence case.           */
        for(int i = 0; i < tempSelectedPlayerObject.sentenceStringList.size(); i ++){                                                                                   /*Put all selected player sentences into one paragraph of a String variable.*/

            if(i == 0)  { tempSelectedPlayerSentenceString          =                                             tempSelectedPlayerObject.sentenceStringList.get(i); }
            else        { tempSelectedPlayerSentenceString          = tempSelectedPlayerSentenceString + "\n\n" + tempSelectedPlayerObject.sentenceStringList.get(i); }

        }



        editPlayerGroupObject                                       =
            editPlayerGroupControlP5Object
                .addGroup                                           ("EditPlayerGroupObject")
                .close                                              ()
                .setBackgroundColor                                 (groupBackgroundColor)
                .setBackgroundHeight                                (guiHeightInt)
                .setColor                                           (defaultCColor)
                .setColorBackground                                 (groupColorBackgroundColor)
                .setColorLabel                                      (groupColorLabelColor)
                .setLabel                                           ("EDIT VISITOR:")
                .setPosition                                        (guiXInt, guiYInt)
                .setWidth                                           (guiWidthInt);



        editPlayerGroupPlayerIndexTextlabelObject                   =
            editPlayerGroupControlP5Object
                .addTextlabel                                       ("EditPlayerGroupPlayerIndexTextlabelObject")
                .setColor                                           (defaultCColor)
                .setColorValue                                      (255)
                .setGroup                                           (editPlayerGroupObject)
                .setPosition                                        (guiElement2ColumnFirstColumnXInt, guiLayoutOffsetInt)
                .setText                                            ("VISITOR INDEX:");



        editPlayerGroupPlayerIndexValueTextlabelObject              =   
            editPlayerGroupControlP5Object
                .addTextlabel                                       ("EditPlayerGroupPlayerIndexValueTextlabelObject")
                .setColor                                           (defaultCColor)
                .setColorValue                                      (255)
                .setGroup                                           (editPlayerGroupObject)
                .setPosition                                        (guiElement2ColumnSecondColumnXInt, guiLayoutOffsetInt)
                .setText                                            ("" + tempSelectedPlayerObject.playerIndexInt);



        editPlayerGroupPlayerNameTextfieldObject                    =
            editPlayerGroupControlP5Object
                .addTextfield                                       ("EditPlayerGroupPlayerNameTextfieldObject")
                .setColor                                           (defaultCColor)
                .setGroup                                           (editPlayerGroupObject)
                .setLabel                                           ("VISITOR NAME:")
                .setPosition                                        (guiElement2ColumnFirstColumnXInt, (guiLayoutOffsetInt*3))
                .setSize                                            (guiElement2ColumnWidth,  guiElement2LineHeight);



        editPlayerGroupPlayerNameChangeButtonObject                 =
            editPlayerGroupControlP5Object
                .addButton                                          ("EditPlayerGroupPlayerNameChangeButtonObject")
                .setColor                                           (defaultCColor)
                .setGroup                                           (editPlayerGroupObject)
                .setLabel                                           ("CHANGE VISITOR NAME")
                .setPosition                                        (guiElement2ColumnSecondColumnXInt, (guiLayoutOffsetInt*3))
                .setSize                                            (guiElement2ColumnWidth,  guiElement2LineHeight);



        editPlayerGroupPlayerFinishedTextlabelObject                =   
            editPlayerGroupControlP5Object
                .addTextlabel                                       ("EditPlayerGroupPlayerFinishedTextlabelObject")
                .setColor                                           (defaultCColor)
                .setColorValue                                      (255)
                .setGroup                                           (editPlayerGroupObject)
                .setPosition                                        (guiElement2ColumnFirstColumnXInt, (guiLayoutOffsetInt*7))
                .setText                                            ("VISITOR FINISHED:");



        editPlayerGroupPlayerFinishedValueTextlabelObject           =
                editPlayerGroupControlP5Object
                    .addTextlabel                                   ("EditPlayerGroupPlayerFinishedValueTextlabelObject")
                    .setColor                                       (defaultCColor)
                    .setColorValue                                  (255)
                    .setGroup                                       (editPlayerGroupObject)
                    .setPosition                                    (guiElement2ColumnSecondColumnXInt, (guiLayoutOffsetInt*7))
                    .setText                                        (tempSelectedPlayerFinishedString);



        editPlayerGroupPlayerScoreTextlabelObject                   =
            editPlayerGroupControlP5Object
                .addTextlabel                                       ("EditPlayerGroupPlayerScoreTextlabelObject")
                .setColor                                           (defaultCColor)
                .setColorValue                                      (255)
                .setGroup                                           (editPlayerGroupObject)
                .setPosition                                        (guiElement2ColumnFirstColumnXInt, (guiLayoutOffsetInt*8))
                .setText                                            ("VISITOR SCORE:");



        editPlayerGroupPlayerScoreValueTextlabelObject              =
            editPlayerGroupControlP5Object
                .addTextlabel                                       ("EditPlayerGroupPlayerScoreValueTextlabelObject")
                .setColor                                           (defaultCColor)
                .setColorValue                                      (255)
                .setGroup                                           (editPlayerGroupObject)
                .setPosition                                        (guiElement2ColumnSecondColumnXInt, (guiLayoutOffsetInt*8))
                .setText                                            ("" + tempSelectedPlayerObject.playerScoreInt);



        editPlayerGroupPlayerExhibitionCurrentTextlabelObject       =
            editPlayerGroupControlP5Object
                .addTextlabel                                       ("EditPlayerGroupPlayerExhibitionCurrentTextlabelObject")
                .setColor                                           (defaultCColor)
                .setColorValue                                      (255)
                .setGroup                                           (editPlayerGroupObject)
                .setPosition                                        (guiElement2ColumnFirstColumnXInt, (guiLayoutOffsetInt*9))
                .setText                                            ("VISITOR CURRENT EXHIBITION:");



        editPlayerGroupPlayerExhibitionCurrentValueTextlabelObject  =
            editPlayerGroupControlP5Object
                .addTextlabel                                       ("EditPlayerGroupPlayerExhibitionCurrentValueTextlabelObject")
                .setColor                                           (defaultCColor)
                .setColorValue                                      (255)
                .setGroup                                           (editPlayerGroupObject)
                .setPosition                                        (guiElement2ColumnSecondColumnXInt, (guiLayoutOffsetInt*9))
                .setText                                            ("" + tempSelectedPlayerObject.exhibitionCurrentNameFullString);



        editPlayerGroupPlayerExhibitionTargetScrollableListObject   =
            editPlayerGroupControlP5Object
                .addScrollableList                                  ("EditPlayerGroupPlayerExhibitionTargetScrollableListObject")
                .addItems                                           (tempSelectedPlayerObject.exhibitionTagCounterNameFullStringList)
                .setColor                                           (staticScrollableListCColor)
                .setGroup                                           (editPlayerGroupObject)
                .setLabel                                           ("VISITOR TARGET EXHIBITIONS:")
                .setPosition                                        (guiElement2ColumnFirstColumnXInt,  (guiLayoutOffsetInt*11))
                .setSize                                            (guiElement2ColumnWidth, guiScrollableList4RowHeightInt)
                .setType                                            (ControlP5.LIST);



        editPlayerGroupPlayerExhibitionVisitedScrollableListObject  =
            editPlayerGroupControlP5Object
                .addScrollableList                                  ("EditPlayerGroupPlayerExhibitionVisitedScrollableListObject")
                .addItems                                           (tempSelectedPlayerExhibitionVisitedNameFullStringList)
                .setColor                                           (staticScrollableListCColor)
                .setGroup                                           (editPlayerGroupObject)
                .setLabel                                           ("VISITOR VISITED EXHIBITIONS:")
                .setPosition                                        (guiElement2ColumnSecondColumnXInt,  (guiLayoutOffsetInt*11))
                .setSize                                            (guiElement2ColumnWidth, guiScrollableList5RowHeightInt)
                .setType                                            (ControlP5.LIST);



        editPlayerGroupPlayerSentenceTextlabelObject                =
            editPlayerGroupControlP5Object
                .addTextlabel                                       ("EditPlayerGroupPlayerSentenceTextlabelObject")
                .setColor                                           (defaultCColor)
                .setColorValue                                      (255)
                .setGroup                                           (editPlayerGroupObject)
                .setPosition                                        (guiElement2ColumnFirstColumnXInt,  ((guiLayoutOffsetInt*12) + guiScrollableList5RowHeightInt))
                .setText                                            ("VISITOR SENTENCES:");



        editPlayerGroupPlayerSentenceValueTextareaObject            =
            editPlayerGroupControlP5Object
                .addTextarea                                        ("editPlayerGroupPlayerSentenceValueTextareaObject")
                .setColor                                           (defaultCColor)
                .setGroup                                           (editPlayerGroupObject)
                .setPosition                                        (guiElement2ColumnFirstColumnXInt,  ((guiLayoutOffsetInt*13) + guiScrollableList5RowHeightInt))
                .setSize                                            (guiElement2ColumnWidth, guiScrollableList5RowHeightInt)
                .setText                                            (tempSelectedPlayerSentenceString);

        

        editPlayerGroupPlayerExplanationTextlabelObject             =
            editPlayerGroupControlP5Object
                .addTextlabel                                       ("EditPlayerGroupPlayerExplanationTextlabelObject")
                .setColor                                           (defaultCColor)
                .setColorValue                                      (255)
                .setGroup                                           (editPlayerGroupObject)
                .setPosition                                        (guiElement2ColumnSecondColumnXInt,  ((guiLayoutOffsetInt*12) + guiScrollableList5RowHeightInt))
                .setText                                            ("VISITOR EXPLANATIONS:");



        editPlayerGroupPlayerExaplanationValueTextareaObject        =
            editPlayerGroupControlP5Object
                .addTextarea                                        ("EditPlayerGroupPlayerExaplanationValueTextareaObject")
                .setColor                                           (defaultCColor)
                .setGroup                                           (editPlayerGroupObject)
                .setPosition                                        (guiElement2ColumnSecondColumnXInt,  ((guiLayoutOffsetInt*13) + guiScrollableList5RowHeightInt))
                .setSize                                            (guiElement2ColumnWidth , guiScrollableList5RowHeightInt)
                .setText                                            (tempSelectedPlayerSentenceString);



        editPlayerGroupPlayerTagScrollableListObject                =
            editPlayerGroupControlP5Object
                .addScrollableList                                  ("EditPlayerGroupPlayerTagScrollableListObject")
                .addItems                                           (tempSelectedPlayerTagNameFullStringList)
                .setColor                                           (staticScrollableListCColor)
                .setGroup                                           (editPlayerGroupObject)
                .setLabel                                           ("VISITOR COLLECTED TAGS:")
                .setPosition                                        (guiElement2ColumnFirstColumnXInt,  ((guiLayoutOffsetInt*14) + (guiScrollableList5RowHeightInt*2)))
                .setSize                                            (guiElement1ColumnWidth , guiScrollableList5RowHeightInt)
                .setType                                            (ControlP5.LIST);



        editPlayerGroupPlayerModeTextlabelObject                    =
            editPlayerGroupControlP5Object
                .addTextlabel                                       ("EditPlayerGroupPlayerModeTextlabelObject")
                .setColor                                           (defaultCColor)
                .setColorValue                                      (255)
                .setGroup                                           (editPlayerGroupObject)
                .setPosition                                        (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*15) + (guiScrollableList5RowHeightInt*3)))
                .setText                                            ("MODES:");



        editPlayerGroupPlayerModeValueRadioButtonObject             =
            editPlayerGroupControlP5Object
                .addRadioButton                                     ("EditPlayerGroupPlayerModeValueRadioButtonObject")
                .activate                                           (1)
                .addItem                                            ("SOFTWARE - AUTO"  , 1)
                .addItem                                            ("SOFTWARE - MANUAL", 2)
                .addItem                                            ("HARDWARE - MANUAL", 3)
                .setGroup                                           (editPlayerGroupObject)
                .setPosition                                        (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*16) + (guiScrollableList5RowHeightInt*3)))
                .setSize                                            (guiLayoutOffsetInt, guiLayoutOffsetInt);



        editPlayerGroupPlayerExhibitionNextScrollableListObject     =
            editPlayerGroupControlP5Object
                .addScrollableList                                  ("EditPlayerGroupPlayerExhibitionNextScrollableListObject")
                .addItems                                           (exhibitionNameFullStringList)
                .setColor                                           (defaultCColor)
                .setGroup                                           (editPlayerGroupObject)
                .setLabel                                           ("SELECT VISITOR NEXT EXHIBITION:")
                .setPosition                                        (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*15) + (guiScrollableList5RowHeightInt*3)))
                .setSize                                            (guiElement2ColumnWidth , 64)
                .setType                                            (ControlP5.LIST);



        editPlayerGroupPlayerResetButtonObject                      =
            editPlayerGroupControlP5Object
                .addButton                                          ("EditPlayerGroupPlayerResetButtonObject")
                .setColor                                           (defaultCColor)
                .setGroup                                           (editPlayerGroupObject)
                .setLabel                                           ("RESET VISITOR")
                .setPosition                                        (guiElement2ColumnFirstColumnXInt, ((guiLayoutOffsetInt*16) + (guiScrollableList5RowHeightInt*4)))
                .setSize                                            (guiElement2ColumnWidth, guiLayoutOffsetInt);



        editPlayerGroupPlayerGeneratePatternButtonObject            =
            editPlayerGroupControlP5Object
                .addButton                                          ("EditPlayerGroupPlayerGeneratePatternButtonObject")
                .setColor                                           (defaultCColor)
                .setGroup                                           (editPlayerGroupObject)
                .setLabel                                           ("GENERATE PATTERN")
                .setPosition                                        (guiElement2ColumnSecondColumnXInt, ((guiLayoutOffsetInt*16) + (guiScrollableList5RowHeightInt*4)))
                .setSize                                            (guiElement2ColumnWidth, guiLayoutOffsetInt);



    }

    public void DrawVoid                                                   (float   _alphaFloat){

        super.DrawVoid(_alphaFloat, editPlayerGroupObject);

        /*Specify the position of another controller below this group controller.*/
        if      (editPlayerGroupObject.isOpen() == true ){

                selectPlayerScrollableListObject.setPosition(
                    editPlayerGroupObject.getPosition()[0],
                    editPlayerGroupObject.getPosition()[1] + guiHeightInt
                );

        }
        else if (editPlayerGroupObject.isOpen() == false){

                selectPlayerScrollableListObject.setPosition(
                    editPlayerGroupObject.getPosition()[0],
                    editPlayerGroupObject.getPosition()[1]
                );

        }

        /*Always assign values to the controllers.*/
        if(tempSelectedPlayerObject                             != null ){

            tempSelectedPlayerFinishedString                = (tempSelectedPlayerObject .playerFinishedBoolean == true) ? "True" : "False";     /*Convert boolean value into String type data with sentence case.           */
            for(int i = 0; i < tempSelectedPlayerObject.sentenceStringList.size(); i ++){                                                       /*Put all selected player sentences into one paragraph of a String variable.*/

                if(i == 0)  { tempSelectedPlayerSentenceString =                                             tempSelectedPlayerObject.sentenceStringList.get(i); }
                else        { tempSelectedPlayerSentenceString = tempSelectedPlayerSentenceString + "\n\n" + tempSelectedPlayerObject.sentenceStringList.get(i); }

            }

            editPlayerGroupPlayerIndexValueTextlabelObject              .setText (("" + tempSelectedPlayerObject.playerIndexInt                         ));
            editPlayerGroupPlayerFinishedValueTextlabelObject           .setText ((     tempSelectedPlayerFinishedString                            ));
            editPlayerGroupPlayerScoreValueTextlabelObject              .setText (("" + tempSelectedPlayerObject.playerScoreInt                         ));
            editPlayerGroupPlayerExhibitionCurrentValueTextlabelObject  .setText ((     tempSelectedPlayerObject.exhibitionCurrentNameFullString        ));
            editPlayerGroupPlayerExhibitionTargetScrollableListObject   .setItems((     tempSelectedPlayerObject.exhibitionTargetNameFullStringList     ));
            editPlayerGroupPlayerExhibitionVisitedScrollableListObject  .setItems((     tempSelectedPlayerObject.exhibitionVisitedNameFullStringList    ));
            editPlayerGroupPlayerTagScrollableListObject                .setItems((     tempSelectedPlayerObject.exhibitionTagCounterNameFullStringList ));
            editPlayerGroupPlayerSentenceValueTextareaObject            .setText ((     tempSelectedPlayerSentenceString                            ));
            editPlayerGroupPlayerExaplanationValueTextareaObject        .setText ((     tempSelectedPlayerSentenceString                            ));
            editPlayerGroupPlayerExhibitionNextScrollableListObject     .setItems((     exhibitionNameFullStringList                                ));
            editPlayerGroupPlayerModeValueRadioButtonObject             .activate((     (tempSelectedPlayerObject.playerMovementModeInt - 1)            ));

        }

        /*Hide the unecessary controller, for example when movement player mode int is not 2 (software, manual control) then
            we do not need to show scrollable list that show next exhibition to be choose.*/
        if      (tempSelectedPlayerMovementModeInt == 1){ editPlayerGroupPlayerExhibitionNextScrollableListObject.hide(); }
        else if (tempSelectedPlayerMovementModeInt == 2){ editPlayerGroupPlayerExhibitionNextScrollableListObject.show(); }
        else if (tempSelectedPlayerMovementModeInt == 3){ editPlayerGroupPlayerExhibitionNextScrollableListObject.hide(); }
        else                                            { editPlayerGroupPlayerExhibitionNextScrollableListObject.hide(); }

    }

}



class GroupGUIObject{

    int           groupBackgroundColor                                        ;                           /*The color of group main  panel background color.*/
    int           groupColorBackgroundColor                                   ;                           /*The color of group title panel background color.*/
    int           groupColorLabelColor                                        ;                           /*The color of group title panel text       color.*/

    float           alphaFloat                                                  = 255;                      /*The opacity of all controllers in group object. */

    int             guiXInt                                                     ;                           /*The x position  of group object.*/
    int             guiYInt                                                     ;                           /*The y position  of group object.*/
    int             guiWidthInt                                                 ;                           /*The height size of group object.*/
    int             guiHeightInt                                                ;                           /*The width  size of group object.*/

    int             guiLayoutOffsetInt                                          = 10;                       /*The offset used to space each controllers in group object.*/

    int 			guiElement1ColumnFirstColumnXInt 							;                           /*The x position of first  controller in 1 Columns row.*/
    int             guiElement2ColumnFirstColumnXInt                            ;                           /*The x position of first  controller in 2 Columns row.*/
    int             guiElement2ColumnSecondColumnXInt                           ;                           /*The x position of second controller in 2 Columns row.*/
    int             guiElement3ColumnFirstColumnXInt                            ;                           /*The x position of first  controller in 3 Columns row.*/
    int             guiElement3ColumnSecondColumnXInt                           ;                           /*The x position of second controller in 3 Columns row.*/
    int             guiElement3ColumnThirdColumnXInt                            ;                           /*The x position of third  controller in 3 Columns row.*/
    int             guiElement4ColumnFirstColumnXInt                            ;                           /*The x position of first  controller in 4 Columns row.*/
    int             guiElement4ColumnSecondColumnXInt                           ;                           /*The x position of second controller in 4 Columns row.*/
    int             guiElement4ColumnThirdColumnXInt                            ;                           /*The x position of third  controller in 4 Columns row.*/
    int             guiElement4ColumnFourthColumnXInt                           ;                           /*The x position of fourth controller in 4 Columns row.*/

    int 			guiElement1ColumnWidth 									    ; 							/*The width of any controller in 1 Column  row.*/
    int             guiElement2ColumnWidth                                      ;                           /*The width of any controller in 2 Columns row.*/
    int             guiElement3ColumnWidth                                      ;                           /*The width of any controller in 3 Columns row.*/
    int             guiElement4ColumnWidth                                      ;                           /*The width of any controller in 4 Columns row.*/

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

        guiElement1ColumnWidth                          = ((guiWidthInt - (guiLayoutOffsetInt*2))/1)                ;
        guiElement2ColumnWidth                          = ((guiWidthInt - (guiLayoutOffsetInt*3))/2)                ;
        guiElement3ColumnWidth                          = ((guiWidthInt - (guiLayoutOffsetInt*4))/3)                ;
        guiElement4ColumnWidth                          = ((guiWidthInt - (guiLayoutOffsetInt*5))/4)                ;
        guiElement1ColumnFirstColumnXInt                = ((guiLayoutOffsetInt*1) + (guiElement1ColumnWidth*0))     ;
        guiElement2ColumnFirstColumnXInt                = ((guiLayoutOffsetInt*1) + (guiElement2ColumnWidth*0))     ;
        guiElement2ColumnSecondColumnXInt               = ((guiLayoutOffsetInt*2) + (guiElement2ColumnWidth*1))     ;
        guiElement3ColumnFirstColumnXInt                = ((guiLayoutOffsetInt*1) + (guiElement3ColumnWidth*0))     ;
        guiElement3ColumnSecondColumnXInt               = ((guiLayoutOffsetInt*2) + (guiElement3ColumnWidth*1))     ;
        guiElement3ColumnThirdColumnXInt                = ((guiLayoutOffsetInt*3) + (guiElement3ColumnWidth*2))     ;
        guiElement4ColumnFirstColumnXInt	 			= ((guiLayoutOffsetInt*1) + (guiElement4ColumnWidth*0))     ;
		guiElement4ColumnSecondColumnXInt	 			= ((guiLayoutOffsetInt*2) + (guiElement4ColumnWidth*1))     ;
		guiElement4ColumnThirdColumnXInt	 			= ((guiLayoutOffsetInt*3) + (guiElement4ColumnWidth*2))     ;
		guiElement4ColumnFourthColumnXInt	 			= ((guiLayoutOffsetInt*4) + (guiElement4ColumnWidth*3))     ;

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

    public void DrawVoid 								(

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
	public void CovertScrollableListIntoCheckListVoid	(int _indexInt, ScrollableList _scrollableListObject)   {

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
    public List<String> SetSelectedCheckListStringList	(

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


/*A class for museum object.
The museum objects within this application are things that can interract with visitor.
For example floor, room, and exhibition.*/
class   ObjectMuseum                                                                    {

    List<ObjectMuseum>  childObjectList             = new ArrayList<ObjectMuseum>();    /*This list contains all possible exhibition object.*/
    List<ObjectPlayer>  childPlayerObjectList       = new ArrayList<ObjectPlayer>(); 

    int                 indexGlobalInt              = -1;                               /*This is an index number of the location of this object in its respective list.*/
    int                 indexLocalInt               = -1;                               /*This is an index number of the location of this object within its parent child object list.*/

    Name                nameObject                  = null;                             /*Name object that contains the alternative name and the full name of this object.*/
    String              nameAltString               = "";                               /*This variable is intended solely to store the alternative name of this object.*/
    String              nameFullString              = "";                               /*This variable is intended solely to store the full name of this object.*/

    ObjectMuseum        parentObject                = null;                             /*The object parent of this object, which means this object should be inside the parent object's child object list.*/
    String              parentNameAltString         = "";                               /*The alternative name of the parent object.*/
    
    String              typeString                  = "";                               /*The type of this object (the only possible values are "FLR", "ROM", and "EXH").*/

    List<Tag>           tagMuseumObjectList         = new ArrayList<Tag>();             /*Object tag list.*/
    List<String>        tagMuseumNameAltStringList  = new ArrayList<String>();          /*The tags for this museum object.*/
    List<String>        tagMuseumNameFullStringList = new ArrayList<String>();          /*The tags for this museum object.*/

    boolean             fullBoolean                 = false;                            /*Whether this museum object is full or not.*/
    int                 visitorCurrentInt           = 0;                                /*This museum object current visitor.*/
    int                 visitorTotalInt             = 0;                                /*This museum objecy total visitor.*/

    boolean             activeBoolean               = false;                            /*Variable to control ControlP5 GUI element.*/

    /*Variables of panel graphical user interfaces.*/
    boolean             hoverBoolean                = false;
    int               floorPanelColor             = color(69 , 40, 60);
    int               roomPanelColor              = color(102, 57, 49);
    int               exhibitionPanelColor        = color(143, 86, 59);
    int                 widthPanelInt               = 0;
    int                 heightPanelInt              = 0;
    int                 xPanelInt                   = 0;
    int                 yPanelInt                   = 0;
    Panel               panelObject                 = null;

    ObjectMuseum                                    (

        Name                                        _nameObject             ,
        String                                      _parentNameAltString    ,
        String                                      _typeString             ,
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

            tagMuseumNameAltStringList.add(tagMuseumObjectList.get(i).nameAltString);
            tagMuseumNameFullStringList.add(tagMuseumObjectList.get(i).nameFullString);

        }

        /*Create panel.*/
        panelObject                                 = new Panel();

    }

    /*A function to update this object museum variables over time.*/
    public void DrawVoid()                                                                     {

        SetFullBoolean  ();
        SetHoverBoolean ();
        PanelDrawVoid   ();

    }

    /*A set of functions to move this object into a new parent object.
    For initial use use SetParentObject() instead of this function!.*/
    public void SetParentVoid(

        List<ObjectMuseum>  _targetObjectList       , 
        String              _parentNameAltString

    ){

        RemoveChildObjectList       (_targetObjectList      );
        SetParentNameAltString      (_parentNameAltString   );
        SetInitialParentObject      (_targetObjectList      );
        SetChildObjectList          (_targetObjectList      );
        SetIndexAllInsideVoid       ();

    }

    /*This class function to set both local and global index.*/
    public void SetIndexInsideVoid()                                                           {

        indexLocalInt           = SetIndexLocalInt();
        indexGlobalInt          = SetIndexGlobalInsideInt();

    }

    /*This function is to set all index in all possible museum object within this application.*/
    public void SetIndexAllInsideVoid()                                                        {

        /*Set the index of all object museum in the application.*/
        for(int i = 0; i < floorObjectList.size()       ; i ++){ floorObjectList        .get(i).SetIndexInsideVoid(); }
        for(int i = 0; i < roomObjectList.size()        ; i ++){ roomObjectList         .get(i).SetIndexInsideVoid(); }
        for(int i = 0; i < exhibitionObjectList.size()  ; i ++){ exhibitionObjectList   .get(i).SetIndexInsideVoid(); }

    }

    public void SetPanelVariableInsideVoid()                                                   {

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

            widthPanelInt   = ((parentObject.widthPanelInt - ((parentObject.childObjectList.size() - 1)*panelLayoutOffsetInt))/parentObject.childObjectList.size());
            heightPanelInt  = parentObject.heightPanelInt;
            xPanelInt       = parentObject.xPanelInt + (indexLocalInt*widthPanelInt) + (indexLocalInt*panelLayoutOffsetInt);
            yPanelInt       = parentObject.yPanelInt + parentObject.heightPanelInt + panelLayoutOffsetInt;

            if      (widthPanelInt <= 10 ){ widthPanelInt = 10;  }
            else if (heightPanelInt <= 10){ heightPanelInt = 10; }

        }
        
    }

    /*A function to set the threshold to determine whether this museum object is full or not.*/
    public boolean SetFullBoolean()                                                            {

        if      (museumObjectFullThresholdInt   <= visitorCurrentInt)  { fullBoolean = true;  }
        else if (museumObjectFullThresholdInt   >  visitorCurrentInt)  { fullBoolean = false; }

        return                      fullBoolean;
        
    }

    /*A function to determine whether this object is hovered by mouse or not.*/
    public boolean SetHoverBoolean()                                                           {

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
    public int SetIndexInt(List<ObjectMuseum> _targetObjectList)                              {

        int indexInt            = -1;
        for(int i = 0; i < _targetObjectList.size(); i ++){

            if(_targetObjectList.get(i).nameAltString.equals(nameAltString)){ indexInt = i; break; }

        }

        return indexInt;

    }

    /*A bare function to set global index int of this object in the main global object list.*/
    public int SetIndexGlobalInt(List<ObjectMuseum> _targetObjectList)                         {

        indexGlobalInt  = SetIndexInt(_targetObjectList);
        return          indexGlobalInt;

    }

    /*A class specific function to set global index int.*/
    public int SetIndexGlobalInsideInt()                                                       {

        if      (typeString.equals("FLR")){ indexGlobalInt = SetIndexGlobalInt(floorObjectList);        }
        else if (typeString.equals("ROM")){ indexGlobalInt = SetIndexGlobalInt(roomObjectList);         }
        else if (typeString.equals("EXH")){ indexGlobalInt = SetIndexGlobalInt(exhibitionObjectList);   }
        return  indexGlobalInt;

    }

    /*A function to set local index int of this object in its parent index.*/
    public int SetIndexLocalInt()                                                              {

        if(!typeString.equals("FLR")){ indexLocalInt = SetIndexInt(parentObject.childObjectList); }
        return indexLocalInt;

    }

    /*A function to remove this object from child object of its parent.*/
    public List<ObjectMuseum> RemoveChildObjectList(List<ObjectMuseum> _targetObjectList)      {

        for(int i = 0; i < parentObject.childObjectList.size(); i ++){

            if(parentObject.childObjectList.get(i).nameAltString.equals(nameAltString)){ parentObject.childObjectList.remove(i); }

        }

        return _targetObjectList;

    }

    /*A function to add the children of this object into childObjectList.*/
    public List<ObjectMuseum> SetChildObjectList(List<ObjectMuseum> _targetObjectList)         {

        if(childObjectList.size() > 0){ childObjectList.clear(); }                                                                  /*Clear the previous child object array.*/

        for(int i = 0;          i < _targetObjectList.size(); i ++){                                                                /*Itarete through all the object list to find whether or not there is a museum object that refers this object as its parent.*/

            if(nameAltString    == _targetObjectList.get(i).parentNameAltString){ childObjectList.add(_targetObjectList.get(i)); }  /*If the parent object from the _targetObjectList is the same with this object name then add the object into this object child object list.*/

        }

        return                  childObjectList;

    }



    /*A function to return object from any object list.*/
    public ObjectMuseum FindObject(

        List<ObjectMuseum>  _targetObjectList       , 
        String              _nameAltString

    ){

        ObjectMuseum objectMuseum = null;
        for(int i = 0; i < _targetObjectList.size(); i ++){

            if(_targetObjectList.get(i).nameAltString.equals(_nameAltString)){ objectMuseum = _targetObjectList.get(i); }

        }
        return objectMuseum;

    }

    /*A function to set this object parent.*/
    public ObjectMuseum SetInitialParentObject(List<ObjectMuseum> _targetObjectList)           {

        /*Iterate through all parent object list to find this object parent object.*/
        for(int i = 0; i < _targetObjectList.size(); i ++){

            if(parentNameAltString == _targetObjectList.get(i).nameAltString){ parentObject = _targetObjectList.get(i); break; }

        }

        return parentObject;

    }
    
    /*A function to draw panel.*/
    public Panel PanelDrawVoid()                                                                 {

        SetPanelVariableInsideVoid  ();

        /*Adjust the color based on what panel is this object used for.*/
        int   usedColor;
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
    public String SetParentNameAltString(String _parentNameAltString)                          {

        parentNameAltString     = _parentNameAltString;
        return                  parentNameAltString;

    }
    
};


/*Create an internal class to be put in the list for easiness.
This is because List in Java must be homogenous.
This class is intended to make calculation on how many 
    exhibition with same tag has been visited.*/
class TagCounter{

    /*I create an array becuse comparator will not working on primitive data type.
    Hence, I put the value in one element List.*/
    int             tagCounterInt       = -1;
    List<Integer>   tagCounterIntList   = new ArrayList<Integer>();
    String          tagNameAltString    = "";
    String          tagNameFullString   = "";
    Tag             tagObject           ;

    TagCounter(){}

    /*Getter and setter function for counting tha tags.*/
    public void    SetTagObject            (Tag    _tagObject)         { tagObject         = _tagObject; }
    public void    SetTagNameAltString     (String _tagNameAltString)  { tagNameAltString  = _tagNameAltString;    }
    public void    SetTagNameFullString    (String _tagNameFullString) { tagNameFullString = _tagNameFullString;   }
    public void    SetTagCounterIntVoid    (int    _tagCounterInt)     {

        /*I create an array becuse comparator will not working on primitive data type.
        Hence, I put the value in one element List.*/
        tagCounterInt       = _tagCounterInt;
        tagCounterIntList   = new ArrayList<Integer>();
        tagCounterIntList   .add(tagCounterInt);

    }
    public int     GetTagCounterInt        (){ return tagCounterInt;       }
    public Tag     GetTagObject            (){ return tagObject;           }
    public String  GetTagNameAltString     (){ return tagNameAltString;    }
    public String  GetTagNameFullString    (){ return tagNameFullString;   }

}

/*A class of player object.
The player object will be the class that can be either played by the user (somekind like simulation)
    or being automated.*/
class ObjectPlayer{

    String exhibitionCurrentNameAltString = "";
    String exhibitionCurrentNameFullString = "";

    String              exhibitionCurrentString                     = "";                               /*Current exhibition in String.*/
    ObjectMuseum        exhibitionCurrentObject                     = null;
    List<String>        exhibitionTargetNameAltStringList           = new ArrayList<String>();          /*Target exhibition that will be given to the player*/
    List<String>        exhibitionVisitedNameAltStringList          = new ArrayList<String>();          /*Amount of exhibition that have just visited by the player.*/
    List<String>        exhibitionTagCounterNameAltStringList       = new ArrayList<String>();          /*This is exactly the exhibitionTagCounter but with easy String coversion so that the value can be easily displayed.*/
    
    List<String>        exhibitionTargetNameFullStringList          = new ArrayList<String>();          /*Target exhibition that will be given to the player*/
    List<String>        exhibitionVisitedNameFullStringList         = new ArrayList<String>();          /*Amount of exhibition that have just visited by the player.*/
    List<String>        exhibitionTagCounterNameFullStringList      = new ArrayList<String>();          /*This is exactly the exhibitionTagCounter but with easy String coversion so that the value can be easily displayed.*/
    
    List<String>        sentenceStringList                          = new ArrayList<String>();
    List<String>        subjectCurrentPrevTagStringList             = new ArrayList<String>();
    List<String>        verb1CurrentPrevTagStringList               = new ArrayList<String>();
    List<String>        verb2CurrentPrevTagStringList               = new ArrayList<String>();
    List<String>        verb3CurrentPrevTagStringList               = new ArrayList<String>();
    List<String>        verbSCurrentPrevTagStringList               = new ArrayList<String>();
    List<String>        verbIngCurrentPrevTagStringList             = new ArrayList<String>();
    List<String>        negativeVerb1CurrentPrevTagStringList       = new ArrayList<String>();
    List<String>        negativeVerb2CurrentPrevTagStringList       = new ArrayList<String>();
    List<String>        negativeVerb3CurrentPrevTagStringList       = new ArrayList<String>();
    List<String>        negativeVerbSCurrentPrevTagStringList       = new ArrayList<String>();
    List<String>        negativeVerbIngCurrentPrevTagStringList     = new ArrayList<String>();
    List<String>        nounCurrentPrevTagStringList                = new ArrayList<String>();
    List<String>        nounSCurrentPrevTagStringList               = new ArrayList<String>();
    List<String>        adjectiveCurrentPrevTagStringList           = new ArrayList<String>();
    List<String>        negativeAdjectiveCurrentPrevTagStringList   = new ArrayList<String>();
    List<String>        adverbCurrentPrevTagStringList              = new ArrayList<String>();
    List<String>        negativeAdverbCurrentPrevTagStringList      = new ArrayList<String>();
    List<TagCounter>    exhibitionTagCounterList                    = new ArrayList<TagCounter>();      /*The amount of tag that have been collected by this player.*/

    int                 playerIndexInt                              = 0;                                /*Unique identifier for each player object, can be changed later to name.*/
    String              playerNameString                            = "";

    List<ObjectPlayer>  playerSiblingObjectList                     = new ArrayList<ObjectPlayer>();    /*How many player object are in the same exhibition.*/
    int                 playerSiblingIndexInt                       = -1;                               /*The index of this object within the List of object player sibling.*/

    int                 playerMovementModeInt                       = 2;                                /*The mode that runs this player.
                                                                                                            editPlayerMode =    1, this player controlled by AIAutoVoid.
                                                                                                            editPlayerMode =    2, this player controlled manually using this application.
                                                                                                            editPlayerMode =    3, this player controlled manually using Arduino.*/
    float               timeCurrentExhibitionFloat                  = 0f;                               /*How many frame/tick this player already stay in an exhibition.*/

    /*Panel variable.*/
    boolean hoverBoolean                                            = false;
    int   panelUnfinishedColor                                    = color(217, 160, 102);
    int   panelFinishedColor                                      = color(223, 113, 38 );
    int     widthPanelInt                                           = 0;
    int     heightPanelInt                                          = 0;
    int     xPanelInt                                               = 0;
    int     yPanelInt                                               = 0;
    Panel   panelObject                                             = null;

    int     playerScoreInt                                          = 0;
    boolean playerVisitCorrectExhibitionBoolean                     = false;
    boolean playerFinishedBoolean                                   = false;

    /*Constructor.*/
    ObjectPlayer(

        int     _playerIndexInt             ,
        String  _playerNameString           ,
        String  _exhibitionStartString

    ){

        playerIndexInt              = _playerIndexInt;
        playerNameString            = _playerNameString;
        playerObjectList            .add(this);
        panelObject                 = new Panel();
        ExhibitionMoveObject        (_exhibitionStartString);
        exhibitionCurrentObject     = FindObject(exhibitionObjectList, exhibitionCurrentString);

    }

    /*A function to either add the tag or increase the tag value in this player.*/
    public void AddTagCounterVoid(

        ObjectMuseum _exhibitionCurrentObject

    ){

        for(int i = 0; i < _exhibitionCurrentObject.tagMuseumObjectList.size(); i ++){

            /*Create new tag counter to count how many tags are in the user preference.*/
            TagCounter  tagCounterObject    = new TagCounter();
            /*PENDING: There might be an inconsistency error within these three lines of code below.
            PENDING: The solution probably to set the alternate and the full name directly from the tagCounterObject.tagObject.
            PENDING: At this moment the tag is set into three different List which might caused inconsistency later on.*/
                        tagCounterObject    .SetTagObject           (_exhibitionCurrentObject   .tagMuseumObjectList            .get(i));
                        tagCounterObject    .SetTagNameAltString    (_exhibitionCurrentObject   .tagMuseumNameAltStringList     .get(i));
                        tagCounterObject    .SetTagNameFullString   (_exhibitionCurrentObject   .tagMuseumNameFullStringList    .get(i));

            boolean     newBoolean          = true;     /*Whether the tag is new to the array or there is already existing one.*/
            int         indexInt            = -1;       /*If there is the corresponding tag already in the array return its index with this variable, otherwise it keeps -1.*/

            /*Iterate through all tag those already gathered to find if there any tag that
                is already registered in this player.*/
            for(int j = 0; j < exhibitionTagCounterList.size(); j ++){

                if(

                    exhibitionTagCounterList.get(j).GetTagNameAltString().equals(

                        tagCounterObject.GetTagNameAltString()

                    )

                ){

                    newBoolean              = false;    /*If newBoolean is false then the object is alrady inside the list.*/
                    indexInt                = j;        /*The index of the tag is the tag is already inside the list.*/

                }

            }

            /*If the tag received is new then set the initial tag value to 1 and
                add the tag to the tag counter.*/
            if      (newBoolean == true ){

                tagCounterObject                .SetTagCounterIntVoid(1);
                exhibitionTagCounterList        .add(tagCounterObject);

            }
            /*If the tag received is alredy filled in before then increase the tag counter.*/
            else if (newBoolean == false){

                exhibitionTagCounterList        .get(indexInt).SetTagCounterIntVoid(exhibitionTagCounterList.get(indexInt).GetTagCounterInt() + 1);

            }

        }

        /*Sort the object in the list based on tag counter int.*/
        Collections.sort(exhibitionTagCounterList, new Comparator<TagCounter>(){

                public int compare(TagCounter _tagCounter1Object, TagCounter _tagCounter2Object) {
                
                    return _tagCounter2Object.tagCounterIntList.get(0).compareTo(_tagCounter1Object.tagCounterIntList.get(0));
                
                }

            }

        );

    }

    /*A function to add or remove this object from parent child object.*/
    public void AddRemoveChildVoid(boolean _isAdd)                 {

        ObjectMuseum exhibitionCurrentObject                = FindObject(exhibitionObjectList, exhibitionCurrentString);
        if      (_isAdd == true )                           { exhibitionCurrentObject.childPlayerObjectList.add(this);      }
        else if (_isAdd == false)                           { exhibitionCurrentObject.childPlayerObjectList.remove(this);   }

    }

    public void AIAutoVoid()                                       {

        /*Check wether this player has already visited most exhibitions in the museum.
        I checked the whether the exhibition visited has the same amount of length with total exhibition length.
        It is not necessary for this player to have all exhibitions visited due to there is a chance that this player
            visited same exhibitions twice or more.*/
        if(playerFinishedBoolean == false){

            /*Increase the amount of time of this player in the current exhibition the visitor visits.
            The more time this player spent time in the exhibition the more chance the visitor will move to the
                new exhibition.
            PENDING: Change the time increment per second add and per frame.*/
            float   randomFloat                             = (float)(Math.random());
                    timeCurrentExhibitionFloat              += 0.01f;

            if(randomFloat > (1f - timeCurrentExhibitionFloat)){

                /*Move player to the new exhibition.*/
                int randomIndexInt          = (int)(Math.floor((Math.random()*exhibitionTargetNameAltStringList.size()) + 0));
                ExhibitionMoveObject        (exhibitionTargetNameAltStringList.get(randomIndexInt));
                timeCurrentExhibitionFloat  = 0;                                                                            /*Reset timer.*/

            }

        }

    }

    /*A function to update this player variables over time.*/
    public void DrawVoid()                                                                     {

        SetHoverBoolean ();
        PanelDrawVoid   ();

        /*PROTOTYPE: Changing player mode.*/
        if(playerMovementModeInt == 1){ AIAutoVoid(); }
        /*PROTOTYPE: Creating function to move this player manually.*/

        /*PENDING: Give the codes below in the new own method and create commentation for these code below.*/
        exhibitionTagCounterNameAltStringList .clear();
        exhibitionTagCounterNameFullStringList.clear();
        for(int i = 0; i < exhibitionTagCounterList.size(); i ++){

            String  tempTagNameAltString                = "";
            String  tempTagNameFullString               = "";
                    tempTagNameAltString                = ("(" + exhibitionTagCounterList.get(i).GetTagCounterInt() + ") " + exhibitionTagCounterList.get(i).GetTagNameAltString ());
                    tempTagNameFullString               = ("(" + exhibitionTagCounterList.get(i).GetTagCounterInt() + ") " + exhibitionTagCounterList.get(i).GetTagNameFullString());
            exhibitionTagCounterNameAltStringList       .add(tempTagNameAltString);
            exhibitionTagCounterNameFullStringList      .add(tempTagNameFullString);

        }

        if(exhibitionVisitedNameAltStringList.size() > exhibitionObjectList.size()){ playerFinishedBoolean = true; }

    }

    public void ResetVoid(){

        println("Function under construction.");

    }

    /*A function to populate tag string received from the current exhibition.*/
    public void PopulateTagStringList(boolean _isPreviousBoolean)                              {

        /*Determine the current exhibition.
        PENDING: Please put current exhibition, current room , and current floor to be public variable of this class.*/
        ObjectMuseum    exhibitionCurrentObject = FindObject(exhibitionObjectList, exhibitionCurrentString);

        /*If there is a previous exhibition visited before you visit new exhibition clear all TagStringList before adding new one.*/
        if(_isPreviousBoolean == true){

            if(subjectCurrentPrevTagStringList              .size() > 0){ subjectCurrentPrevTagStringList           .clear(); }
            if(verb1CurrentPrevTagStringList                .size() > 0){ verb1CurrentPrevTagStringList             .clear(); }
            if(verb2CurrentPrevTagStringList                .size() > 0){ verb2CurrentPrevTagStringList             .clear(); }
            if(verb3CurrentPrevTagStringList                .size() > 0){ verb3CurrentPrevTagStringList             .clear(); }
            if(verbSCurrentPrevTagStringList                .size() > 0){ verbSCurrentPrevTagStringList             .clear(); }
            if(verbIngCurrentPrevTagStringList              .size() > 0){ verbIngCurrentPrevTagStringList           .clear(); }
            if(negativeVerb1CurrentPrevTagStringList        .size() > 0){ negativeVerb1CurrentPrevTagStringList     .clear(); }
            if(negativeVerb2CurrentPrevTagStringList        .size() > 0){ negativeVerb2CurrentPrevTagStringList     .clear(); }
            if(negativeVerb3CurrentPrevTagStringList        .size() > 0){ negativeVerb3CurrentPrevTagStringList     .clear(); }
            if(negativeVerbSCurrentPrevTagStringList        .size() > 0){ negativeVerbSCurrentPrevTagStringList     .clear(); }
            if(negativeVerbIngCurrentPrevTagStringList      .size() > 0){ negativeVerbIngCurrentPrevTagStringList   .clear(); }
            if(nounCurrentPrevTagStringList                 .size() > 0){ nounCurrentPrevTagStringList              .clear(); }
            if(nounSCurrentPrevTagStringList                .size() > 0){ nounSCurrentPrevTagStringList             .clear(); }
            if(adjectiveCurrentPrevTagStringList            .size() > 0){ adjectiveCurrentPrevTagStringList         .clear(); }
            if(negativeAdjectiveCurrentPrevTagStringList    .size() > 0){ negativeAdjectiveCurrentPrevTagStringList .clear(); }
            if(adverbCurrentPrevTagStringList               .size() > 0){ adverbCurrentPrevTagStringList            .clear(); }
            if(negativeAdverbCurrentPrevTagStringList       .size() > 0){ negativeAdverbCurrentPrevTagStringList    .clear(); }

        }

        /*Adding all the string into player word database.
        Here, I make sure that the word entered is always unique to the words that is already in the List.
        PENDING: Use HashSet instead of List.*/
        for(int i = 0; i < exhibitionCurrentObject.tagMuseumObjectList.size(); i ++){

            if      (exhibitionCurrentObject.tagMuseumObjectList.get(i).tagTypeString.equals("SUB")){

                if(!subjectCurrentPrevTagStringList .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagSubjectString)) { subjectCurrentPrevTagStringList.add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagSubjectString); }

            }
            else if (exhibitionCurrentObject.tagMuseumObjectList.get(i).tagTypeString.equals("VER")){

                if(!verb1CurrentPrevTagStringList       .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagVerb1String))                       { verb1CurrentPrevTagStringList           .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagVerb1String);      }
                if(!verb2CurrentPrevTagStringList       .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagVerb2String))                       { verb2CurrentPrevTagStringList           .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagVerb2String);      }
                if(!verb3CurrentPrevTagStringList       .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagVerb3String))                       { verb3CurrentPrevTagStringList           .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagVerb3String);      }
                if(!verbSCurrentPrevTagStringList       .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagVerbSString))                       { verbSCurrentPrevTagStringList           .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagVerbSString);      }
                if(!verbIngCurrentPrevTagStringList     .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagVerbIngString))                     { verbIngCurrentPrevTagStringList         .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagVerbIngString);    }

            }
            else if (exhibitionCurrentObject.tagMuseumObjectList.get(i).tagTypeString.equals("NVE")){

                if(!negativeVerb1CurrentPrevTagStringList       .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagNegativeVerb1String))       { negativeVerb1CurrentPrevTagStringList           .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagNegativeVerb1String);      }
                if(!negativeVerb2CurrentPrevTagStringList       .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagNegativeVerb2String))       { negativeVerb2CurrentPrevTagStringList           .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagNegativeVerb2String);      }
                if(!negativeVerb3CurrentPrevTagStringList       .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagNegativeVerb3String))       { negativeVerb3CurrentPrevTagStringList           .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagNegativeVerb3String);      }
                if(!negativeVerbSCurrentPrevTagStringList       .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagNegativeVerbSString))       { negativeVerbSCurrentPrevTagStringList           .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagNegativeVerbSString);      }
                if(!negativeVerbIngCurrentPrevTagStringList     .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagNegativeVerbIngString))     { negativeVerbIngCurrentPrevTagStringList         .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagNegativeVerbIngString);    }

            }
            else if (exhibitionCurrentObject.tagMuseumObjectList.get(i).tagTypeString.equals("NOU")){

                if(!nounCurrentPrevTagStringList        .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagNounString))                        { nounCurrentPrevTagStringList            .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagNounString);       }
                if(!nounSCurrentPrevTagStringList       .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagNounSString))                       { nounSCurrentPrevTagStringList           .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagNounSString);      }

            }
            else if (exhibitionCurrentObject.tagMuseumObjectList.get(i).tagTypeString.equals("ADJ")){

                if(!adjectiveCurrentPrevTagStringList   .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagAdjectiveString))                   { adjectiveCurrentPrevTagStringList       .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagAdjectiveString);  }

            }
            else if (exhibitionCurrentObject.tagMuseumObjectList.get(i).tagTypeString.equals("NDJ")){

                if(!negativeAdjectiveCurrentPrevTagStringList   .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagAdjectiveString))           { negativeAdjectiveCurrentPrevTagStringList       .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagNegativeAdjectiveString);  }

            }
            else if (exhibitionCurrentObject.tagMuseumObjectList.get(i).tagTypeString.equals("ADV")){

                if(!adverbCurrentPrevTagStringList      .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagNegativeAdverbString))              { adverbCurrentPrevTagStringList          .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagAdverbString);     }

            }
            else if (exhibitionCurrentObject.tagMuseumObjectList.get(i).tagTypeString.equals("NDV")){

                if(!negativeAdverbCurrentPrevTagStringList      .contains(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagNegativeAdverbString))      { negativeAdverbCurrentPrevTagStringList          .add(exhibitionCurrentObject.tagMuseumObjectList.get(i).tagNegativeAdverbString);     }

            }

        }

    }

    /*A function to manage this player graphical user interface.
    In this function the width, height, x position, and y position are set.*/
    public void SetPanelVariableInsideVoid()                                                   {

        /*Panel layout calculations.*/
        ObjectMuseum    exhibitionCurrentObject = FindObject(exhibitionObjectList, exhibitionCurrentString);
                        widthPanelInt           = exhibitionCurrentObject.widthPanelInt;
                        heightPanelInt          = exhibitionCurrentObject.heightPanelInt;
                        xPanelInt               = exhibitionCurrentObject.xPanelInt;
                        yPanelInt               = exhibitionCurrentObject.yPanelInt + ((playerSiblingIndexInt + 1)*heightPanelInt) + ((playerSiblingIndexInt + 1)*panelLayoutOffsetInt);

        if      (widthPanelInt <= 10 ){ widthPanelInt = 10;  }
        else if (heightPanelInt <= 10){ heightPanelInt = 10; }
        
    }

    /*A function to determine whether this object is hovered by mouse or not.*/
    public boolean SetHoverBoolean()                                                           {

        if(

            (mouseX < panelObject.xPanelInt + panelObject.widthPanelInt )   &&
            (mouseX > panelObject.xPanelInt                             )   &&
            (mouseY < panelObject.yPanelInt + panelObject.heightPanelInt)   &&
            (mouseY > panelObject.yPanelInt                             )

        )   { hoverBoolean = true ; }
        else{ hoverBoolean = false; }

        return hoverBoolean;

    }

    /*A function to return the position of this player in the player sibling list*/
    public int SetPlayerSiblingIndexInt(

        List<ObjectPlayer> _playerSiblingObjectList

    ){

        playerSiblingIndexInt = -1;
        for(int i = 0; i < _playerSiblingObjectList.size(); i ++){ if(_playerSiblingObjectList.get(i) == this){ playerSiblingIndexInt = i; } }
        return playerSiblingIndexInt;

    }

    /*A function to automatically add other player of which in the same exhibition.*/
    public List<ObjectPlayer> SetSiblingObjectList()               {

        playerSiblingObjectList = new ArrayList<ObjectPlayer>();

        for(int i = 0; i < playerObjectList.size(); i ++){

            if(playerObjectList.get(i).exhibitionCurrentString.equals(exhibitionCurrentString)){

                playerSiblingObjectList.add(playerObjectList.get(i));

            }

        }

        /*Set the new index of this player object.*/
        playerSiblingIndexInt = SetPlayerSiblingIndexInt(playerSiblingObjectList);

        return playerSiblingObjectList;

    }

    /*A function to determine target exhibition.*/
    public List<String> SetExhibitionTargetNameAltStringList()      {

        exhibitionTargetNameAltStringList  = new ArrayList<String>();
        exhibitionTargetNameFullStringList = new ArrayList<String>();

        /*Stage one sort.
        Stage one sort is to remove the currently visited exhibition from the target exhibition index.
        So that the player have no chance on visiting the exhibition that he/she  currently visits.*/
        for(int i = 0; i < exhibitionObjectList.size(); i ++){

            /*Compare the current exihibition with the object exhibitiob array.
            After that remove the object exhibition that is the current exhibition and put the rest
                of the exhibition in the target exhibition array string.*/
            if(

                !(exhibitionObjectList.get(i).nameAltString.equals(exhibitionCurrentString))

            ){

                exhibitionTargetNameAltStringList .add(exhibitionObjectList.get(i).nameAltString );
                exhibitionTargetNameFullStringList.add(exhibitionObjectList.get(i).nameFullString);

            }

        }

        /*Stage two sort.
        Remove all exhibition target that is full of visitor.*/
        for(int i = 0; i < exhibitionObjectList.size(); i ++){

            if(

                 (exhibitionObjectList.get(i).fullBoolean       == true)                                               &&
                !(exhibitionCurrentString                       .equals(exhibitionObjectList.get(i).nameAltString))

            ){
                
                /*After each remove make sure to have the exhibition target length to be 3.
                If not 3 elements in the target exhibition array, then return the last 3 elements
                    of target exhibition array ever exist.*/
                exhibitionTargetNameAltStringList                       .remove(exhibitionObjectList.get(i).nameAltString );
                exhibitionTargetNameFullStringList                      .remove(exhibitionObjectList.get(i).nameFullString);
                if(exhibitionTargetNameAltStringList.size() == 3)       { return exhibitionTargetNameAltStringList; }

            }

        }

        /*Stage three sort.
        Stage three sort is to make the exhibition that has been visited before has 90% chance to make into target exhibition.
        For example the visitor is now in the Exhibition C as he/she used to visits Exhibition A and Exhibition B before,
            the system now will let Exhibition A and Exhibition B to have 10% chance to be not removed from the target
            exhibition array.*/
        for(int i = 0; i < exhibitionVisitedNameAltStringList.size(); i ++){

            for(int j = 0; j < exhibitionTargetNameAltStringList.size(); j ++){

                /*Compare the target exhibitions with all visited exhibition.
                If it matches then the corresponding exhibition has 90% chance to be deleted
                    from target exhibition array.*/
                if(exhibitionTargetNameAltStringList.get(j).equals(exhibitionVisitedNameAltStringList.get(i))){

                    if(Math.random() < 0.90f){

                        exhibitionTargetNameAltStringList .remove(exhibitionTargetNameAltStringList .get(j));
                        exhibitionTargetNameFullStringList.remove(exhibitionTargetNameFullStringList.get(j));
                        j --;

                    }

                    /*After each remove make sure to have the exhibition target length to be 3.
                    If not 3 elements in the target exhibition array, then return the last 3 elements
                        of target exhibition array ever exist.*/
                    if(exhibitionTargetNameAltStringList.size() == 3)  { return exhibitionTargetNameAltStringList; }

                }

            }

        }

        /*Stage four sort.
        So now this application compare the the most visited tags from this player profile (take three most visited tags)
            and compared to the exhibition tag.
        Each exhibition has 3 tags so,
            if nothing match the exhibition is excluded from from the target exhibition array,
            if one tag is match the exhibition has 66% chance of being removed from the target exhibition array,
            if two tags are match the exhibition has 33% chance of being removed from the target exhibition array,
            if three tags are match the exhibition will stay in the target exhibition array.*/
        String tempTagStringArray[] = new String[3];
        for(int i = 0; i < tempTagStringArray.length                    ; i ++){ tempTagStringArray[i] = exhibitionTagCounterList.get(i).GetTagNameAltString(); }
        for(int i = 0; i < exhibitionTargetNameAltStringList.size()     ; i ++){

            ObjectMuseum    exhibitionTargetObject  = FindObject(exhibitionObjectList, exhibitionTargetNameAltStringList.get(i));
            int             tagSameCountInt         = 0;

            for(int j = 0; j < exhibitionTargetObject.tagMuseumNameAltStringList.size(); j ++){

                for(int k = 0; k < tempTagStringArray.length; k ++){

                    if(exhibitionTargetObject.tagMuseumNameAltStringList.get(j) == tempTagStringArray[k]){ tagSameCountInt ++; }

                }

            }
            
            if      (tagSameCountInt == 0)          {                            exhibitionTargetNameAltStringList.remove(exhibitionTargetNameAltStringList.get(i)); exhibitionTargetNameFullStringList.remove(exhibitionTargetNameFullStringList.get(i)); i --; }
            else if (tagSameCountInt == 1)          { if(Math.random() < 0.66f){ exhibitionTargetNameAltStringList.remove(exhibitionTargetNameAltStringList.get(i)); exhibitionTargetNameFullStringList.remove(exhibitionTargetNameFullStringList.get(i)); i --; } }
            else if (tagSameCountInt == 2)          { if(Math.random() < 0.33f){ exhibitionTargetNameAltStringList.remove(exhibitionTargetNameAltStringList.get(i)); exhibitionTargetNameFullStringList.remove(exhibitionTargetNameFullStringList.get(i)); i --; } }
            else if (tagSameCountInt == 3)          {  }

            /*After each remove make sure to have the exhibition target length to be 3.
            If not 3 elements in the target exhibition array, then return the last 3 elements
                of target exhibition array ever exist.*/
            if(exhibitionTargetNameAltStringList.size() == 3)  { return exhibitionTargetNameAltStringList; }

        }

        ObjectMuseum    exhibitionCurrentObject     = FindObject(exhibitionObjectList, exhibitionCurrentString);
        String          roomCurrentString           = exhibitionCurrentObject.parentNameAltString;
        ObjectMuseum    roomCurrentObject           = FindObject(roomObjectList, roomCurrentString);
        String          floorCurrentString          = roomCurrentObject.parentNameAltString;
        ObjectMuseum    floorCurrentObject          = FindObject(floorObjectList, floorCurrentString);

        /*Stage five sort.
        The fourth sort is to make the exhibition target that are not in the same floor or room of which player's
            current exhibition to have 50% chance of stay.*/
        for(int i = 0; i < exhibitionTargetNameAltStringList.size(); i ++){

            ObjectMuseum    exhibitionTargetObject  = FindObject(exhibitionObjectList, exhibitionTargetNameAltStringList.get(i));
            String          roomTargetString        = exhibitionTargetObject.parentNameAltString;
            ObjectMuseum    roomTargetObject        = FindObject(roomObjectList, roomTargetString);
            String          floorTargetString       = roomTargetObject.parentNameAltString;
            ObjectMuseum    floorTargetObject       = FindObject(floorObjectList, floorTargetString);

            if(roomCurrentString    != roomTargetString ){

                if(Math.random() < 0.20f){ exhibitionTargetNameAltStringList.remove(exhibitionTargetNameAltStringList.get(i)); exhibitionTargetNameFullStringList.remove(exhibitionTargetNameFullStringList.get(i)); i --; }
                else{

                    if(floorCurrentString != floorTargetString){ if(Math.random() < 0.50f){ exhibitionTargetNameAltStringList.remove(exhibitionTargetNameAltStringList.get(i)); exhibitionTargetNameFullStringList.remove(exhibitionTargetNameFullStringList.get(i)); i --; } }

                }

            }
            
            /*After each remove make sure to have the exhibition target length to be 3.
            If not 3 elements in the target exhibition array, then return the last 3 elements
                of target exhibition array ever exist.*/
            if(exhibitionTargetNameAltStringList.size() == 3)  { return exhibitionTargetNameAltStringList; }

        }

        /*Make sure to only have three exhibition target at the end of this function.*/
        if(exhibitionTargetNameAltStringList.size() > 3){

            int listIndexInt = exhibitionTargetNameAltStringList.size() - 1;

            while(exhibitionTargetNameAltStringList.size() > 3){

                exhibitionTargetNameAltStringList   .remove(listIndexInt);
                exhibitionTargetNameFullStringList  .remove(listIndexInt);
                listIndexInt                        --;

            }

        }

        return                              exhibitionTargetNameAltStringList;

    }

    /*A function to move this player into new exhibition and add the tags to the tag coutner list.*/
    public ObjectMuseum ExhibitionMoveObject(

        String _targetNameAltString

    ){

        /*Variable to hold currently visited museum object.*/
        ObjectMuseum exhibitionCurrentObject    = null;
        ObjectMuseum roomCurrentObject          = null;
        ObjectMuseum floorCurrentObject         = null;

        /*If this player has a parent (means that this is not the first move).
        So that, this if statement is only when the player is first time
            initiated.*/
        if(exhibitionCurrentString != ""){

            /*Remove this player from the current child list of the parent,
                before we move this player into another exhibition.*/
            AddRemoveChildVoid          (false);

            exhibitionCurrentObject     = FindObject(exhibitionObjectList   , exhibitionCurrentString                           );
            roomCurrentObject           = FindObject(roomObjectList         , exhibitionCurrentObject   .parentNameAltString    );
            floorCurrentObject          = FindObject(floorObjectList        , roomCurrentObject         .parentNameAltString    );
            exhibitionCurrentObject     .visitorCurrentInt --;
            roomCurrentObject           .visitorCurrentInt --;
            floorCurrentObject          .visitorCurrentInt --;

            PopulateTagStringList       (true);
            
        }

        /*Calculate whether player score is increasing or decreasing.*/
        for(int i = 0; i < exhibitionTargetNameAltStringList.size(); i ++){

            if(exhibitionTargetNameAltStringList.get(i).equals(_targetNameAltString)){ playerScoreInt ++; playerVisitCorrectExhibitionBoolean = true; break; }
            if(i == (exhibitionTargetNameAltStringList.size() - 1)){ playerScoreInt --; playerVisitCorrectExhibitionBoolean = false; }

        }

        exhibitionCurrentString                 = _targetNameAltString;                                         /*Chance the String for current exhibition.*/
        exhibitionCurrentObject                 = FindObject(exhibitionObjectList, exhibitionCurrentString);
        exhibitionVisitedNameAltStringList      .add(exhibitionCurrentObject.nameAltString );                   /*Add the current exhibition to visited exhibition list.*/
        exhibitionVisitedNameFullStringList     .add(exhibitionCurrentObject.nameFullString);
        
        /*Re - instantiated all newly visited museum objects.*/
        exhibitionCurrentObject         = FindObject(exhibitionObjectList   , exhibitionCurrentString                           );
        roomCurrentObject               = FindObject(roomObjectList         , exhibitionCurrentObject   .parentNameAltString    );
        floorCurrentObject              = FindObject(floorObjectList        , roomCurrentObject         .parentNameAltString    );

        /*Add total number museum visit.*/
        exhibitionCurrentObject         .visitorCurrentInt  ++;
        roomCurrentObject               .visitorCurrentInt  ++;
        floorCurrentObject              .visitorCurrentInt  ++;
        exhibitionCurrentObject         .visitorTotalInt    ++;
        roomCurrentObject               .visitorTotalInt    ++;
        floorCurrentObject              .visitorTotalInt    ++;

        PopulateTagStringList           (false);

        AddTagCounterVoid               (exhibitionCurrentObject);
        AddRemoveChildVoid              (true);
        
        SetExhibitionTargetNameAltStringList    ();
        SetSiblingObjectList                    ();

        /*For everytime a player move to another exhibition iterate through all player to re - add the siblings.*/
        for(int i = 0; i < playerObjectList.size(); i ++){

            playerObjectList.get(i).SetExhibitionTargetNameAltStringList    ();
            playerObjectList.get(i).SetSiblingObjectList                    ();

        }

        /*If this is the second exhibition visited than put the sentence into the sentence List.
        The sentence List is will the container of every sentences that has been collected by this player.*/
        if(

            (exhibitionVisitedNameAltStringList  .size() > 1) &&
            (exhibitionVisitedNameFullStringList .size() > 1)

        ){

            String tempThreeSentencesString = SentenceMultipleGenerateString(3);
            sentenceStringList.add(tempThreeSentencesString);

        }

        /*
        if(playerIndexInt == 1){

            println("===");
            println(subjectCurrentPrevTagStringList);
            println(verb1CurrentPrevTagStringList);
            println(verb2CurrentPrevTagStringList);
            println(verb3CurrentPrevTagStringList);
            println(verbSCurrentPrevTagStringList);
            println(verbIngCurrentPrevTagStringList);
            println(negativeVerb1CurrentPrevTagStringList);
            println(negativeVerb2CurrentPrevTagStringList);
            println(negativeVerb3CurrentPrevTagStringList);
            println(negativeVerbSCurrentPrevTagStringList);
            println(negativeVerbIngCurrentPrevTagStringList);
            println(nounCurrentPrevTagStringList);
            println(nounSCurrentPrevTagStringList);
            println(adjectiveCurrentPrevTagStringList);
            println(negativeAdjectiveCurrentPrevTagStringList);
            println(adverbCurrentPrevTagStringList);
            println(negativeAdverbCurrentPrevTagStringList);
            println("===");
            println(exhibitionCurrentObject.tagMuseumNameAltStringList);
            println("===");
            println(SentenceMultipleGenerateString(3));
            println("===");

        }
        */

        return exhibitionCurrentObject;

    }

    /*A function to find an object from an array.
    PROTOTYPE: Change this function so that it can also search from the full name.
    PENDING: Change this so that it follows convention of String first then the List.*/
    public ObjectMuseum FindObject(

        List<ObjectMuseum>  _targetObjectList       ,
        String              _targetNameString

    ){

        ObjectMuseum objectMuseum = null;
        for(int i = 0; i < _targetObjectList.size(); i ++){

            if(_targetObjectList.get(i).nameAltString .equals(_targetNameString)){ objectMuseum = _targetObjectList.get(i); return objectMuseum; }
            if(_targetObjectList.get(i).nameFullString.equals(_targetNameString)){ objectMuseum = _targetObjectList.get(i); return objectMuseum; }

        }

        return null;

    }
    
    /*A function to draw panel.*/
    public Panel PanelDrawVoid()                                                                 {

        exhibitionCurrentObject         = FindObject(exhibitionObjectList, exhibitionCurrentString);
        exhibitionCurrentNameAltString  = exhibitionCurrentObject.nameAltString;
        exhibitionCurrentNameFullString = exhibitionCurrentObject.nameFullString;

        SetPanelVariableInsideVoid      ();

        /*Here we determine the color based whether this player/visitor has visited total amount exhibition or not.*/
        int   usedColor;
        if      (exhibitionVisitedNameAltStringList.size() >= exhibitionObjectList.size())  { usedColor = panelFinishedColor;   }
        else                                                                                { usedColor = panelUnfinishedColor; }

        panelObject                     .DrawVoid(

            usedColor                   ,
            widthPanelInt               ,
            heightPanelInt              ,
            xPanelInt                   ,
            yPanelInt                   ,
            ("" + playerIndexInt)

        );

        return panelObject;

    }

    /*Set of functions to generate sentence.
    PENDING: Make this functions into a class.*/
    public int     SentenceRandomNumberGeneratorInt    (int        _randomNumber)          { return (int)(Math.round(Math.random()*(_randomNumber - 1))); }
    public String  SentenceWordFixString               (String     _fixString)             { return _fixString.substring(0, 1).toUpperCase() + _fixString.substring(1, _fixString.length()); }
    public String  SentenceMultipleGenerateString      (int        _numberOfSentenceInt)   {

        String  textString = "";
        for     (int i = 0; i < _numberOfSentenceInt; i ++){

            if(i == 0) { textString = SentenceSingleGenerateString(); }
            else                                { textString = textString + "\n" + SentenceSingleGenerateString(); }
            

        }
        return  textString;

    }
    public String  SentenceSingleGenerateString        (){

        String[]    patternStringArray                          = new String[]{

            "{ % +."              ,
            "{ * to @."           ,
            "I will & { to @."

        };
        String[]    verbVerbCurrentPrevTagStringList           = new String[]{ "agree", "demand", "desire", "expect", "know how", "like", "need", "offer", "promise", "refuse", "want", "wish" };
        String[]    verbVerbSCurrentPrevTagStringList          = new String[]{ "agrees", "demands", "desires", "expects", "knows how", "likes", "needs", "offers", "promises", "refuses", "wants", "wishes" };
        String[]    adjectiveHabitCurrentPrevTagStringList     = new String[]{ "every day", "about once a week", "all the time", "as often as possible", "at least twice a week", "every evening", "every month", "every night", "every other day", "every other month", "every other week", "every third day", "every thirty minutes", "every year", "four or five times a day", "three times a day", "more than four times a month", "once a week", "once or twice a year", "three times a year", "twice a day", "twice a month" };

        String      patternString   = patternStringArray[SentenceRandomNumberGeneratorInt(patternStringArray.length)];
        String      sentenceString  = "";

        for         (int i = 0; i   < patternString.length(); i ++){

            String  scanString      = patternString.substring(i, i + 1);
            String  wordString      = "";

            if      (scanString.equals("{"))    {

                if(playerNameString != ""){

                    wordString          =           playerNameString;
                    if(Math.random()    <= 0.50f)    { wordString = subjectCurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(subjectCurrentPrevTagStringList.size())); }

                }
                else if(playerNameString == ""){

                    wordString          = subjectCurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(subjectCurrentPrevTagStringList.size()));

                }
                else{ wordString        = subjectCurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(subjectCurrentPrevTagStringList.size())); }

            }
            else if (scanString.equals("@"))    {

                if      (playerVisitCorrectExhibitionBoolean == true )  { wordString = verb1CurrentPrevTagStringList            .get(SentenceRandomNumberGeneratorInt(verb1CurrentPrevTagStringList             .size())); }
                else if (playerVisitCorrectExhibitionBoolean == false)  {

                    if(Math.random() > 0.80f)                            { wordString = verb1CurrentPrevTagStringList            .get(SentenceRandomNumberGeneratorInt(verb1CurrentPrevTagStringList             .size())); }
                    else                                                { wordString = negativeVerb1CurrentPrevTagStringList    .get(SentenceRandomNumberGeneratorInt(negativeVerb1CurrentPrevTagStringList     .size())); }

                }
                

            }
            else if (scanString.equals("#"))    {

                if      (playerVisitCorrectExhibitionBoolean == true )  { wordString = verb2CurrentPrevTagStringList            .get(SentenceRandomNumberGeneratorInt(verb2CurrentPrevTagStringList             .size())); }
                else if (playerVisitCorrectExhibitionBoolean == false)  {

                    if(Math.random() > 0.80f)                            { wordString = verb2CurrentPrevTagStringList            .get(SentenceRandomNumberGeneratorInt(verb2CurrentPrevTagStringList             .size())); }
                    else                                                { wordString = negativeVerb2CurrentPrevTagStringList    .get(SentenceRandomNumberGeneratorInt(negativeVerb2CurrentPrevTagStringList     .size())); }

                }

            }
            else if (scanString.equals("$"))    {

                if      (playerVisitCorrectExhibitionBoolean == true )  { wordString = verb3CurrentPrevTagStringList            .get(SentenceRandomNumberGeneratorInt(verb3CurrentPrevTagStringList             .size())); }
                else if (playerVisitCorrectExhibitionBoolean == false)  {

                    if(Math.random() > 0.80f)                            { wordString = verb3CurrentPrevTagStringList            .get(SentenceRandomNumberGeneratorInt(verb3CurrentPrevTagStringList             .size())); }
                    else                                                { wordString = negativeVerb3CurrentPrevTagStringList    .get(SentenceRandomNumberGeneratorInt(negativeVerb3CurrentPrevTagStringList     .size())); }

                }

            }
            else if (scanString.equals("%"))    {

                if      (playerVisitCorrectExhibitionBoolean == true )  { wordString = verbIngCurrentPrevTagStringList          .get(SentenceRandomNumberGeneratorInt(verbIngCurrentPrevTagStringList         .size())); }
                else if (playerVisitCorrectExhibitionBoolean == false)  {

                    if(Math.random() > 0.80f)                            { wordString = verbIngCurrentPrevTagStringList          .get(SentenceRandomNumberGeneratorInt(verbIngCurrentPrevTagStringList         .size())); }
                    else                                                { wordString = negativeVerbIngCurrentPrevTagStringList  .get(SentenceRandomNumberGeneratorInt(negativeVerbIngCurrentPrevTagStringList .size())); }

                }

            }
            else if (scanString.equals("^"))    {

                if      (playerVisitCorrectExhibitionBoolean == true )  { wordString = verbSCurrentPrevTagStringList            .get(SentenceRandomNumberGeneratorInt(verbSCurrentPrevTagStringList             .size())); }
                else if (playerVisitCorrectExhibitionBoolean == false)  {

                    if(Math.random() > 0.80f)                            { wordString = verbSCurrentPrevTagStringList            .get(SentenceRandomNumberGeneratorInt(verbSCurrentPrevTagStringList             .size())); }
                    else                                                { wordString = negativeVerbSCurrentPrevTagStringList    .get(SentenceRandomNumberGeneratorInt(negativeVerbSCurrentPrevTagStringList     .size())); }

                }

            }
            else if (scanString.equals("&"))    { wordString = verbVerbCurrentPrevTagStringList     [SentenceRandomNumberGeneratorInt      (verbVerbCurrentPrevTagStringList        .length)]; }
            else if (scanString.equals("*"))    { wordString = verbVerbSCurrentPrevTagStringList    [SentenceRandomNumberGeneratorInt      (verbVerbSCurrentPrevTagStringList       .length)]; }
            else if (scanString.equals("("))    { wordString = nounCurrentPrevTagStringList         .get(SentenceRandomNumberGeneratorInt  (nounCurrentPrevTagStringList            .size())); }
            else if (scanString.equals(")"))    { wordString = nounSCurrentPrevTagStringList        .get(SentenceRandomNumberGeneratorInt  (nounSCurrentPrevTagStringList           .size())); }
            else if (scanString.equals("_"))    {

                if      (playerVisitCorrectExhibitionBoolean == true )  { wordString = adjectiveCurrentPrevTagStringList        .get(SentenceRandomNumberGeneratorInt(adjectiveCurrentPrevTagStringList         .size())); }
                else if (playerVisitCorrectExhibitionBoolean == false)  {

                    if(Math.random() > 0.80f)                            { wordString = adjectiveCurrentPrevTagStringList        .get(SentenceRandomNumberGeneratorInt(adjectiveCurrentPrevTagStringList         .size())); }
                    else                                                { wordString = negativeAdjectiveCurrentPrevTagStringList.get(SentenceRandomNumberGeneratorInt(negativeAdjectiveCurrentPrevTagStringList .size())); }

                }

            }
            
            else if (scanString.equals("+"))    { wordString = adjectiveHabitCurrentPrevTagStringList   [SentenceRandomNumberGeneratorInt      (adjectiveHabitCurrentPrevTagStringList  .length)]; }
            else if (scanString.equals("="))    {

                if      (playerVisitCorrectExhibitionBoolean == true )  { wordString = adverbCurrentPrevTagStringList           .get(SentenceRandomNumberGeneratorInt(adverbCurrentPrevTagStringList            .size())); }
                else if (playerVisitCorrectExhibitionBoolean == false)  {

                    if(Math.random() > 0.80f)                            { wordString = adverbCurrentPrevTagStringList           .get(SentenceRandomNumberGeneratorInt(adverbCurrentPrevTagStringList            .size())); }
                    else                                                { wordString = negativeAdverbCurrentPrevTagStringList   .get(SentenceRandomNumberGeneratorInt(negativeAdverbCurrentPrevTagStringList    .size())); }

                }

            }       
            else                                { wordString = scanString; }
    
            sentenceString  += wordString;

        }

        return SentenceWordFixString(sentenceString);

    }

}
/*Creating a Panel class for each object museum.*/
class Panel                                         {

    PFont   layoutPanelPFont        ;   /*Font variable to hold the font style.*/
    int   fillColor               ;   /*The color of the panel.*/
    int     widthPanelInt           ;
    int     heightPanelInt          ;
    int     xPanelInt               ;
    int     yPanelInt               ;
    int     layoutTextSizeInt   = 12;   /*The default font size for the panel.*/

    Panel(){

        layoutPanelPFont        = createFont(panelFontString, layoutTextSizeInt);

    }

    public void DrawVoid(

        int   _fillColor      ,
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



class RemovePlayerGroupGUIObject extends GroupGUIObject{

    ControlP5       removePlayerGroupControlP5Object                            ;

    Group           editPlayerScrollableListObject                              ;

    ObjectPlayer    tempPlayerToRemoveObject                                    ;

    /*ControlP5 related graphical user interface controller variables.*/
    Group           removePlayerGroupObject                                     ;
    ScrollableList  removePlayerGroupSelectPlayerToRemoveScrollableListObject   ;
    Button          removePlayerGroupRemoveButtonObject                         ;

    RemovePlayerGroupGUIObject                                        (

        int             _guiXInt                        ,
        int             _guiYInt                        ,
        int             _guiWidthInt                    ,
        int             _guiHeightInt                   ,
        Group           _editPlayerScrollableListObject ,
        PApplet         _pAppletObject

    ){

        super                                   (_guiXInt, _guiYInt, _guiWidthInt, _guiHeightInt, _pAppletObject);
        removePlayerGroupControlP5Object        = new ControlP5(pAppletObject);

        editPlayerScrollableListObject          = _editPlayerScrollableListObject;



        removePlayerGroupObject                                         =
            removePlayerGroupControlP5Object    .addGroup               ("RemovePlayerGroupObject")
                                                .close                  ()
                                                .setBackgroundColor     (groupBackgroundColor)
                                                .setBackgroundHeight    (guiHeightInt)
                                                .setColor               (defaultCColor)
                                                .setColorBackground     (groupColorBackgroundColor)
                                                .setColorLabel          (groupColorLabelColor)
                                                .setLabel               ("REMOVE VISITOR:")
                                                .setPosition            (guiXInt, guiYInt)
                                                .setWidth               (guiWidthInt);



        removePlayerGroupSelectPlayerToRemoveScrollableListObject       =
            removePlayerGroupControlP5Object    .addScrollableList      ("RemovePlayerGroupSelectPlayerToRemoveScrollableListObject")
                                                .addItems               (playerStringList)
                                                .setColor               (defaultCColor)
                                                .setGroup               (removePlayerGroupObject)
                                                .setLabel               ("PICK VISITOR YOU WANT TO REMOVE:")
                                                .setPosition            (guiElement1ColumnFirstColumnXInt, guiLayoutOffsetInt)
                                                .setSize                (guiElement1ColumnWidth, guiScrollableList5RowHeightInt)
                                                .setType                (ControlP5.LIST);



        removePlayerGroupRemoveButtonObject                             =
            removePlayerGroupControlP5Object    .addButton              ("RemovePlayerGroupRemoveButtonObject")
                                                .setColor               (defaultCColor)
                                                .setGroup               (removePlayerGroupObject)
                                                .setLabel               ("REMOVE VISITOR")
                                                .setPosition            (guiElement1ColumnFirstColumnXInt, ((guiLayoutOffsetInt*2) + guiScrollableList5RowHeightInt))
                                                .setSize                (guiElement1ColumnWidth, guiLayoutOffsetInt);



    }

    public void DrawVoid(float _alphaFloat){

        super.DrawVoid(_alphaFloat, removePlayerGroupObject);

    }

}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "JavaProcessingMuseumManager" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
