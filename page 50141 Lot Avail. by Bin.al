page 50141 "Lot Avail. by Bin"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Warehouse Entry";
    SourceTableTemporary = true; // Устанавливает, является ли исходная таблица временной таблицей

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = Basic;

                }
                field("Location Code"; Rec."Location Code")
                {

                }
                field("Bin Code"; Rec."Bin Code")
                {

                }
                field("Serial No."; Rec."Serial No.")
                {

                }
                field(Quantity; Rec.Quantity)
                {

                }

            }
        }
    }
    trigger OnOpenPage()
    var
        LotAvail: Query "Lot Avail. by Bin";
    begin
        LotAvail.Open();
        while LotAvail.Read do begin
            Rec.Init();
            Rec."Item No." := LotAvail.Item_No_;
            Rec."Location Code" := LotAvail.Location_Code;
            Rec."Bin Code" := LotAvail.Bin_Code;
            Rec.Quantity := LotAvail.Sum_Quantity;
            Rec.Insert();
        end;
    end;
}