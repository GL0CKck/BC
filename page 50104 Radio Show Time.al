page 50104 "Radio Show Time"
{
    PageType = List;
    ApplicationArea = Basic;
    UsageCategory = Administration;
    SourceTable = "Radio Show Time";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Time; Rec.Time)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
            }
        }

    }


}