page 50108 "Radio Show Card"
{
    PageType = Card;
    ApplicationArea = Basic;
    UsageCategory = Administration;
    SourceTable = "Radio Show";

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field("Radio Show Type"; Rec."Radio Show Type")
                {
                    ApplicationArea = Basic;
                }
                field("Name"; Rec."Name")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field("Run Time"; Rec."Run Time")
                {
                    ApplicationArea = Basic;
                    trigger OnLookup(var Text: Text): Boolean
                    var
                        RunTime: Record "Radio Show Time";
                    begin
                        RunTime.Reset();
                        if Page.RunModal(Page::"Radio Show Time", RunTime) = Action::LookupOK then
                            Rec."Run Time" := RunTime.Time;
                        Message(StrSubstNo('Trigger OnLookup  On Card field, %1', Rec.RecordId()));

                    end;
                }
                field("Host Code"; Rec."Host Code")
                {
                    ApplicationArea = Basic;
                }
                field("Host Name"; Rec."Host Name")
                {
                    ApplicationArea = Basic;
                }
                field(Frequency; Rec.Frequency)
                {
                    ApplicationArea = Basic;

                }
            }
            group(Requirements)
            {
                field("APA Planned Quantity"; Rec."APA Planned Quantity")
                {
                    ApplicationArea = Basic;
                }
                field("PSA Planned Quantity"; Rec."PSA Planned Quantity")
                {
                    ApplicationArea = Basic;
                }
                field("News Required"; Rec."News Required")
                {
                    ApplicationArea = Basic;
                }
                field("News Duration"; Rec."News Duration")
                {
                    ApplicationArea = Basic;
                }
                field("Sport Required"; Rec."Sport Required")
                {
                    ApplicationArea = Basic;
                }
                field("Sport Duration"; Rec."Sport Duration")
                {
                    ApplicationArea = Basic;
                }
                field("Weather Required"; Rec."Weather Required")
                {
                    ApplicationArea = Basic;
                }
                field("Weather Duration"; Rec."Weather Duration")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Statistics)
            {
                field("Avarage Listeners"; Rec."Avarage Listeners")
                {
                    ApplicationArea = Basic;
                }
                field("Audience Share"; Rec."Audience Share")
                {
                    ApplicationArea = Basic;
                }
                field("Adverstising Revenue"; Rec."Adverstising Revenue")
                {
                    ApplicationArea = Basic;
                }
                field("Royalty Cost"; Rec.GetNewRoyaltyCost())
                {
                    ApplicationArea = Basic;
                }
            }
            group(Quantity)
            {
                field(TotalQuantity; TotalAdverstisingRevenue)
                {
                    Caption = 'Total Adverstising Revenue';
                    ApplicationArea = All;
                    Editable = false;
                }

            }
        }

    }
    var
        TotalAdverstisingRevenue: Decimal;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean

    begin
        UpdateTotal();
        Message(StrSubstNo('Trigger OnInsertRecord All Page'));

    end;

    trigger OnDeleteRecord(): Boolean
    begin
        UpdateTotal();
        Message(StrSubstNo('Trigger OnDeleteRecord All Page, %1', Rec.RecordId()));
        // runs before table trigger delete if delete in card - runs table trig
    end;

    trigger OnAfterGetRecord()
    begin
        Message(StrSubstNo('Trigger OnAfterGetRecord  All Page, %1', Rec.RecordId()));
        UpdateTotal();
    end;

    procedure UpdateTotal()
    var
        RoyaltyCost: Record "Radio Show Entry";
    begin
        TotalAdverstisingRevenue := 0;
        RoyaltyCost.Reset();
        RoyaltyCost.CalcSums("Fee Amount");
        TotalAdverstisingRevenue := RoyaltyCost."Fee Amount";
    end;
}
