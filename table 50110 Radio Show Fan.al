table 50110 "Radio Show Fan"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {

        }
        field(10; "Radio Show"; Code[20])
        {
            TableRelation = "Radio Show";
        }
        field(20; Name; Text[50])
        {

        }
        field(30; "E-Mail"; Text[250])
        {

        }
        field(40; "Last Contacted"; Date)
        {

        }
    }

}