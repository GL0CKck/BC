table 50100 "Radio Show"
{
    fields
    {
        field(1; "No."; Code[20])
        {

        }
        field(10; "Radio Show Type"; Code[10])
        {
            // TableRelation = "Radio Show Type";
            trigger OnLookup()
            var
                RadioShowType: Record "Radio Show Type";
            begin
                RadioShowType.Reset();
                if Page.RunModal(Page::"Radio Show Type", RadioShowType) = Action::LookupOK then
                    "Radio Show Type" := RadioShowType.Code;
                Message(StrSubstNo('Trigger OnLookup Table, %1', Rec.RecordId()));

            end;
        }
        field(20; "Name"; Text[50])
        {
            trigger OnValidate()
            begin
                Message(StrSubstNo('Trigger OnValidate Table, %1', Rec.RecordId()));

            end;
        }
        field(40; "Run Time"; Duration)
        {
            trigger OnLookup()
            var
                RadioShowTime: Record "Radio Show Time";
                RadioShowTimePage: Page "Radio Show Time";
            begin
                RadioShowTimePage.LookupMode := true;
                if RadioShowTimePage.RunModal = Action::LookupOK then begin
                    RadioShowTimePage.GetRecord(RadioShowTime);
                    Rec."Run Time" := RadioShowTime.Time;
                end;

                Message(StrSubstNo('Trigger OnLookup Table, %1, %2', Rec.RecordId(), RadioShowTime.RecordId()));
            end;
        }
        field(50; "Host Code"; Code[20]) { }
        field(60; "Host Name"; Text[50])
        {
        }
        field(100; "Avarage Listeners"; Decimal)
        {

            Editable = false;
            FieldClass = FlowField;
            CalcFormula = average("Listenership Entry"."Listener Count"
            where("Radio Show No." = field("No."), Date = field("Date Filter")));
            trigger OnValidate()
            begin
                Message(StrSubstNo('Table OnValidate %1', Rec.RecordId())); // Не срабатывает
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
        field(1000; Frequency; Option)
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
    keys
    {
        key(PK; "No.", "Radio Show Type")
        {
            Clustered = true;
        }
    }
    trigger OnInsert()
    begin
        Message(StrSubstNo('Trigger OnInsert Table, %1', Rec.RecordId())); // %1,2,3 - параметр єтой строчки     
    end;

    trigger OnDelete()
    begin
        Message(StrSubstNo('Trigger OnDelete Table, %1', Rec.RecordId()));

    end;

    trigger OnModify()
    begin
        Message(StrSubstNo('Trigger OnModify Table, %1', Rec.RecordId()));

    end;

    trigger OnRename()
    begin
        Message(StrSubstNo('Trigger OnRename Table, %1', Rec.RecordId()));

    end;

    procedure GetNewRoyaltyCost(): Decimal
    begin
        CalcFields("Royalty Cost");
        exit("Royalty Cost" * 0.1);
    end;

}