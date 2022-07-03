table 50100 "Radio Show"
{
    fields
    {
        field(1; "No."; Code[20])
        {

        }
        field(10; "Radio Show Type"; Code[10])
        {
            TableRelation = "Radio Show Type";
        }
        field(20; "Name"; Text[50]) { }
        field(40; "Run Time"; Duration)
        {
            TableRelation = "Radio Show Time";
        }
        field(50; "Host Code"; Code[20]) { }
        field(60; "Host Name"; Text[50]) { }
        field(100; "Avarage Listeners"; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = average("Listenership Entry"."Listener Count"
            where("Radio Show No." = field("No."), Date = field("Date Filter")));
            trigger OnLookup()
            var
                myInt: Integer;
            begin

            end;
        }
        field(110; "Audience Share"; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = average("Listenership Entry"."Audience Share"
            where("Radio Show No." = field("No."), Date = field("Date Filter")));
        }
        field(120; "Adverstising Revenue"; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Radio Show Entry"."Fee Amount"
        where("Radio Show No." = field("No."), "Data Format" = filter(Advertisment)));
        }
        field(130; "Royalty Cost"; Decimal)
        {
            Editable = false;
            FieldClass = FlowField;
            CalcFormula = sum("Radio Show Entry"."Fee Amount"
        where("Radio Show No." = field("No."), "Data Format" = filter(Advertisment)));

        }
        field(1000; "Frequency"; Option)
        {
            OptionMembers = ,Hourly,Daily,Weekly,Monthy;
        }
        field(1010; "APA Planned Quantity"; Integer) { }
        field(1020; "PSA Planned Quantity"; Integer) { }
        field(1030; "News Required"; Boolean)
        {
            InitValue = true;
        }
        field(1040; "News Duration"; Duration) { }
        field(1050; "Sport Required"; Boolean)
        {
            InitValue = true;
        }
        field(1060; "Sport Duration"; Duration) { }
        field(1070; "Weather Required"; Boolean)
        {
            InitValue = true;
        }
        field(1080; "Weather Duration"; Duration) { }
        field(1090; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
    }
    procedure GetNewRoyaltyCost(): Decimal
    begin
        CalcFields("Royalty Cost");
        exit("Royalty Cost" * 0.1);
    end;
}