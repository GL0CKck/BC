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
                    Caption = 'No.';
                    ApplicationArea = Basic;
                }
                field("Radio Show Type"; Rec."Radio Show Type")
                {
                    Caption = 'Radio Show Type';
                    ApplicationArea = Basic;
                }
                field("Name"; Rec."Name")
                {
                    Caption = 'Name';
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field("Run Time"; Rec."Run Time")
                {
                    Caption = 'Run Time';
                    ApplicationArea = Basic;
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

                }
                field("Audience Share"; Rec."Audience Share")
                {
                    Caption = 'Audience Share';
                    ApplicationArea = Basic;
                }
                field("Adverstising Revenue"; Rec."Adverstising Revenue")
                {
                    Caption = 'Adverstising Revenue';
                    ApplicationArea = Basic;
                }
                field("New Royalty Cost"; NewRoyaltyCost)
                {
                    Caption = 'Royalty Cost';
                    ApplicationArea = Basic;
                    trigger OnAfterLookup(Selected: RecordRef)
                    begin

                    end;

                    trigger OnDrillDown()
                    begin

                    end;

                    trigger OnLookup(var Text: Text): Boolean
                    begin

                    end;

                    trigger OnValidate()
                    begin

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
            group("&Customer")
            {
                Caption = '&Customer';
                Image = Customer;
                action("Co&mments")
                {
                    ApplicationArea =;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category7;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = CONST(Customer),
                                  "No." = FIELD("No.");
                    ToolTip = 'View or add comments for the record.';
                    trigger OnAction()
                    begin
                        TestFunc();
                    end;
                }
            }
        }
    }
    procedure TestFunc()
    var
        SalesInvoiceHeader: Record "Sales Header";
    begin
        SalesInvoiceHeader.SetRange("Document Type", SalesInvoiceHeader."Document Type"::Invoice);
        SalesInvoiceHeader.SetRange(Amount, 106.80);
        Page.Run(Page::"Sales Invoice List", SalesInvoiceHeader);
    end;

    trigger OnAfterGetRecord()
    begin
        Message(StrSubstNo('Trigger OnAfterGetRecord Page, %1', Rec.RecordId()));
        GetVarRoyaltyCost()
    end;

    var
        NewRoyaltyCost: Decimal;

    procedure GetVarRoyaltyCost(): Decimal

    begin
        Rec.CalcFields("Royalty Cost");
        NewRoyaltyCost := Rec."Royalty Cost" * 0.1;
        exit(NewRoyaltyCost)

    end;


}


