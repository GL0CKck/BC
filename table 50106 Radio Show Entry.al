table 50106 "Radio Show Entry"
{

    fields
    {
        field(1; "Entry No."; Integer) { }
        field(10; "Radio Show No."; Code[20])
        {
            TableRelation = "Radio Show";
        }
        field(20; Type; Option)
        {
            OptionMembers = ,Resource,Show,Item;
        }
        field(30; "No."; Code[20])
        {
            TableRelation = "Listenership Entry";
        }
        field(40; "Data Format"; Option)
        {
            OptionMembers = ,Vinyl,Cd,MP3,PSA,Advertisment;
        }
        field(50; Description; Text[50]) { }
        field(60; Date; Date) { }
        field(70; Time; Time) { }
        field(80; Duration; Duration) { }
        field(90; "Fee Amount"; Decimal) { }
        field(100; "ACSAP ID"; Integer) { }
        field(120; "Publisher Code"; Code[20]) { }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
        key(Reporting; "Radio Show No.", Date)
        {
            SumIndexFields = "Fee Amount";
        }
        key(Reporting2; Type, "No.", Date)
        {
            SumIndexFields = "Fee Amount";
        }
    }
}