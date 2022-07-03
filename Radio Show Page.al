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
            repeater(Group)
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
                }
                field("Host Code"; Rec."Host Code")
                {
                    ApplicationArea = Basic;
                }
                field("Host Name"; Rec."Host Name")
                {
                    ApplicationArea = Basic;
                }
                field("Avarage Listeners"; Rec."Avarage Listeners")
                {
                    ApplicationArea = Basic;
                    trigger OnLookup(var Text: Text): Boolean
                    begin
                    end;
                }
                field("Audience Share"; Rec."Audience Share")
                {
                    ApplicationArea = Basic;
                }
                field("Adverstising Revenue"; Rec."Adverstising Revenue")
                {
                    ApplicationArea = Basic;
                }
                field("New Royalty Cost"; NewRoyaltyCost)   
                {
                    ApplicationArea = Basic;
                }
                field(Frequency; Rec.Frequency)
                {
                    ApplicationArea = Basic;
                }
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
                field("Date Filter"; Rec."Date Filter")
                {
                    ApplicationArea = Basic;
                }

            }

        }

    }
    // trigger OnInit()

    // begin
    //     InitValue();
    // end;

    // local procedure InitValue()

    // begin
    //     NewRoyaltyCost := Rec.GetNewRoyaltyCost();
    // end;
    // NewRoyaltyCost.AddLoadFields(Rec.GetNewRoyaltyCost())
    var
        NewRoyaltyCost: Decimal;

    procedure GetVarRoyaltyCost(): Decimal

    begin

        Rec.CalcFields("Royalty Cost");
        NewRoyaltyCost := Rec."Royalty Cost" * 0.1;
        exit(NewRoyaltyCost)

    end;

    trigger OnOpenPage()
    begin
        GetVarRoyaltyCost();
    end;
}

