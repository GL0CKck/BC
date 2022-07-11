table 50102 "Playlist Header"
{
    fields
    {
        field(1; "No."; Code[20]) { }
        field(10; "Radio Show No."; Code[20])
        {
            TableRelation = "Radio Show";
        }
        field(20; "Description"; Text[50]) { }
        field(30; "Broadcast Date"; Date) { }
        field(40; "Duration"; Duration) { }
        field(50; "Start time"; Time) { }
        field(60; "End Time"; Time) { }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }


}