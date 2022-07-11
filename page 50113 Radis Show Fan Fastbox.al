page 50113 "Radio Show Fan Fastbox"
{
    PageType = CardPart; // list
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Radio Show Fan";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(Name; Rec.Name)
                {
                    trigger OnDrillDown()
                    var
                        UserName: Record "Radio Show Fan";
                    begin
                        UserName.SetFilter(UserName."No.", Rec."No.");
                        Page.Run(Page::"Radio Show FanList", UserName); 
                    end;
                }
            }
        }
    }
}
