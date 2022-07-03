page 50112 "Publisher"
{
    PageType = List;
    ApplicationArea = Basic;
    UsageCategory = Lists;
    SourceTable = Publicher;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }

            }
        }
    }
}