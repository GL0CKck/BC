report 50102 "Demo"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = Basic;
    WordLayout = 'Demo.docx';
    DefaultLayout = Word;

    dataset
    {
        dataitem(DateItem1; "Radio Show Type")
        {
            column(Code; Code)
            {

            }
            dataitem(DateItem2; "Radio Show")
            {
                column(Name; Name)
                {

                }
                column(No_; "No.")
                {

                }
                dataitem(DateItem3; "Playlist Header")
                {
                    column(Radio_Show_No_; "Radio Show No.")
                    {

                    }
                    column(Duration; Duration)
                    {

                    }
                }
            }
        }
    }
}