page 50114 "Radio Show FanList"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Radio Show Fan";
    CardPageId = "Radio Show FanCard";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {

                }
                field("E-Mail"; Rec."E-Mail")
                {

                }
                field("Radio Show"; Rec."Radio Show")
                {

                }
            }
        }
    }
}