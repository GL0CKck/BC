page 50100 "Radio Show List"
{
    PageType = List;
    ApplicationArea = Basic; // What is области приложения
    UsageCategory = Administration; // Помогает странице или отчету быть доступными в поиске для поддержки навигации
    SourceTable = "Radio Show"; // Main table for this page
    CardPageID = "Radio Show Card";

    layout
    {
        area(Content)
        {
            group(Filters)
            {
                Editable = true;
                field(MyFilterDecimailVar; MyFilterDecimalVarFrom)
                {
                    ApplicationArea = All;
                }
                field(MyFilterDecimalVarto; MyFilterDecimalVarto)
                {
                    ApplicationArea = All;
                }
            }
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    Caption = 'No.';
                    ApplicationArea = Basic;
                }
                field("Radio Show Type"; Rec."Radio Show Type")
                {
                    Caption = 'Radio Show Type';
                    ApplicationArea = Basic;
                    trigger OnAfterLookup(Selected: RecordRef)
                    var
                    begin
                        // Must be option or enum
                        Message(StrSubstNo('Trigger OnAfterLookup  On Page field, %1', Rec.RecordId()));

                    end;


                    trigger OnLookup(var Text: Text): Boolean
                    var
                        RadioShowType: Record "Radio Show Type";
                        RadioShowTypePage: Page "Radio Show Type";
                    begin
                        RadioShowTypePage.LookupMode := true;
                        if RadioShowTypePage.RunModal = Action::LookupOK then begin
                            RadioShowTypePage.GetRecord(RadioShowType);
                            Rec."Radio Show Type" := RadioShowType.Code;
                        end;

                        Message(StrSubstNo('Trigger OnLookup  On Page field, %1', Rec.RecordId()));

                    end;

                    trigger OnAssistEdit()
                    begin
                        Message(StrSubstNo('Trigger OnAssistEdit  On Page field, %1', Rec.RecordId()));
                        // What case use
                    end;

                    trigger OnControlAddIn(Index: Integer; Data: Text)
                    begin
                        Message(StrSubstNo('Trigger OnControlAddIn  On Page field, %1', Rec.RecordId()));
                        // What case use
                    end;
                }
                field("Name"; Rec."Name")
                {
                    Caption = 'Name';
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    trigger OnValidate()
                    begin
                        Message(StrSubstNo('Trigger OnValidate  On Page field, %1', Rec.RecordId()));

                    end;
                }
                field("Run Time"; Rec."Run Time")
                {
                    Caption = 'Run Time';
                    ApplicationArea = Basic;
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        RunTime: Record "Radio Show Time";
                    begin
                        RunTime.Reset();
                        if Page.RunModal(Page::"Radio Show Time", RunTime) = Action::LookupOK then
                            Rec."Run Time" := RunTime.Time;
                        Message(StrSubstNo('Trigger OnLookup  On Page field, %1', Rec.RecordId()));

                    end;
                }
                field("Host Code"; Rec."Host Code")
                {
                    Caption = 'Host Code';
                    ApplicationArea = Basic;
                }
                field("Host Name"; Rec."Host Name")
                {
                    Caption = 'Host Name';
                    ApplicationArea = Basic;
                }
                field("Avarage Listeners"; Rec."Avarage Listeners")
                {
                    Caption = 'Avarage Listeners';
                    ApplicationArea = Basic;
                    trigger OnDrillDown()
                    var
                        Cost: Record "Listenership Entry";
                    begin
                        Cost.SetRange(Cost."Radio Show No.", Rec."No.");
                        Page.Run(Page::"Listenership Entry", Cost);

                        Message(StrSubstNo('Trigger OnDrillDown  On Page field, %1', Rec.RecordId()));

                    end;

                }
                field("Audience Share"; Rec."Audience Share")
                {
                    Caption = 'Audience Share';
                    ApplicationArea = Basic;
                    trigger OnDrillDown()
                    var
                        AudienceShare: Record "Listenership Entry";
                    begin
                        AudienceShare.SetRange(AudienceShare."Radio Show No.", Rec."No.");
                        Page.Run(Page::"Listenership Entry", AudienceShare);
                        Message(StrSubstNo('Trigger OnDrillDown  On Page field, %1', Rec.RecordId()));

                    end;
                }
                field("Adverstising Revenue"; Rec."Adverstising Revenue")
                {
                    Caption = 'Adverstising Revenue';
                    ApplicationArea = Basic;
                    trigger OnDrillDown()
                    var
                        Revenue: Record "Radio Show Entry";
                    begin
                        Revenue.SetRange(Revenue."Radio Show No.", Rec."No.");
                        Page.Run(Page::"Radio Show Entry", Revenue);
                        Message(StrSubstNo('Trigger OnDrillDown  On Page field, %1', Rec.RecordId()));

                    end;
                }
                field("New Royalty Cost"; NewRoyaltyCost)
                {
                    Caption = 'Royalty Cost';
                    ApplicationArea = Basic;
                    trigger OnDrillDown()
                    var
                        Cost: Record "Radio Show Entry";
                    begin
                        Cost.SetRange(Cost."Radio Show No.", Rec."No.");
                        Page.Run(Page::"Radio Show Entry", Cost);
                        Message(StrSubstNo('Trigger OnDrillDown  On Page field, %1', Rec.RecordId()));

                    end;
                }

            }

        }


        area(FactBoxes)
        {
            part(Fans; "Radio Show Fan Fastbox")
            {
                ApplicationArea = Basic;
                SubPageLink = "Radio Show" = field("No.");

            }
        }

    }

    actions
    {
        area(Processing)
        {
            group("Sales Header")
            {
                Caption = 'Sales Header';
                action("SalesHeader")
                {

                    ApplicationArea = All;
                    Caption = 'Sales Header';
                    Promoted = true;
                    PromotedCategory = Category7;
                    trigger OnAction()
                    begin
                        TestFunc();
                    end;
                }
                action(CheckFilterValue)
                {
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        Message((Format(MyFilterDecimalVarFrom)));
                        Message((Format(MyFilterDecimalVarTo)));
                    end;
                }
            }
        }
    }


    trigger OnAfterGetRecord()
    begin
        // Message(StrSubstNo('Trigger OnAfterGetRecord  All Page, %1', Rec.RecordId()));
        GetVarRoyaltyCost();
    end;

    trigger OnClosePage()
    begin
        Message(StrSubstNo('Trigger OnClosePage All Page, %1', Rec.RecordId()));
        // runs after close list and main page
    end;

    trigger OnDeleteRecord(): Boolean
    begin

        Message(StrSubstNo('Trigger OnDeleteRecord All Page, %1', Rec.RecordId()));
        // runs before table trigger delete if delete in card - runs table trig
    end;

    // trigger OnFindRecord(Which: Text): Boolean
    // begin
    //     Message(StrSubstNo('Trigger OnFindRecord All Page, %1', Rec.RecordId()));
    //     // what case use
    // end;
    trigger OnInit()
    var
        Some: Text;
    begin
        Some := 'Hello VAR Some';
        Message(StrSubstNo('Trigger OnInit All Page, %1', Some));
        // runs before OnOpenpage trigger
    end;

    trigger OnOpenPage()
    begin
        Message(StrSubstNo('Trigger OnOpenPage All Page'));
        // runs after OnInit trigger

    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean

    begin

        Message(StrSubstNo('Trigger OnInsertRecord All Page'));

    end;

    trigger OnModifyRecord(): Boolean
    begin
        Message(StrSubstNo('Trigger OnModifyRecord All Page, %1', Rec.RecordId()));

    end;
    // trigger OnNewRecord(BelowxRec: Boolean)
    // begin

    // end;
    // trigger OnFindRecord(Which: Text): Boolean
    // begin

    // end;
    procedure TestFunc()
    var
        SalesInvoiceHeader: Record "Sales Header";
    begin
        SalesInvoiceHeader.SetRange("Document Type", SalesInvoiceHeader."Document Type"::Invoice);
        // SalesInvoiceHeader.SetRange(Amount, 106.80, 1000);
        // SalesInvoiceHeader.SetRange("Posting Date", 20210101D, 20221230D);
        SalesInvoiceHeader.SetRange(Amount, MyFilterDecimalVarFrom, MyFilterDecimalVarto);
        // SalesInvoiceHeader.SetFilter("Posting Date", Format(20210110D)); // first
        // SalesInvoiceHeader.SetFilter("Posting Date", Format(MyFilterDateVar));
        Page.Run(Page::"Sales Invoice List", SalesInvoiceHeader);
    end;

    var
        NewRoyaltyCost: Decimal;
        MyFilterDecimalVarFrom: Decimal;
        MyFilterDecimalVarto: Decimal;

    procedure GetVarRoyaltyCost(): Decimal

    begin
        Rec.CalcFields("Royalty Cost");
        NewRoyaltyCost := Rec."Royalty Cost" * 0.1;
        exit(NewRoyaltyCost)

    end;



}


