float gap = 3.0;
float counter = 0.0;
key id;

default
{
    
    state_entry()
    {
        // Activate the timer listener every 3 seconds
        llSetTimerEvent(gap);
    }
    
        sensor( integer detected )
    {
        while(detected--)
        {
              id      = llDetectedKey(detected);
        }
    }

    timer()
    {
       llSensor("", NULL_KEY, ACTIVE | PASSIVE | SCRIPTED, 10.0, PI);
        counter = counter + gap; 
            list details = llGetObjectDetails(id, ([OBJECT_NAME, OBJECT_DESC,
                            OBJECT_POS, OBJECT_ROT, OBJECT_VELOCITY,
                            OBJECT_OWNER, OBJECT_GROUP, OBJECT_CREATOR]));
      llOwnerSay( "UUID: " + (string)id
                    + "\nName: "          + llList2String(details, 0)
                    + "\nDescription: "  + llList2String(details, 1)
                    + "\nPosition: "      + llList2String(details, 2)
                    + "\nRotation: "       + llList2String(details, 3)
                    + "\nVelocity: "       + llList2String(details, 4)
                    + "\nOwner: "          + llList2String(details, 5)
                    + "\nGroup: "          + llList2String(details, 6)
                    + "\nCreator: "        + llList2String(details, 7));
    }
}
