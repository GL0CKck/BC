report 50101 "Shows by Type"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = Basic;
    WordLayout = 'Shows by Type.docx';
    DefaultLayout = Word;

    dataset
    {
        dataitem(RadioShowType; "Radio Show Type")
        {
            column(UserComment; UserComment)
            {

            }
            column(Code_RadioShowType; Code)
            {
                IncludeCaption = true;
            }
            column(Description_RadioShowType; Description)
            {
                IncludeCaption = true; // Устанавливает, следует ли включать заголовок поля в набор данных отчета.

            }
            dataitem(RadioShow; "Radio Show")
            {
                DataItemLink = "Radio Show Type" = field(Code);
                DataItemTableView = sorting("Radio Show Type");
                PrintOnlyIfDetail = true;
                column(No_RadioShow; "No.")
                {
                    IncludeCaption = true;
                }
                column(Name_RadioShow; Name)
                {
                    IncludeCaption = true;
                }
                column(RunTime_RadioShow; "Run Time")
                {
                    IncludeCaption = true;
                }
                dataitem(PlaylistHeader; "Playlist Header")
                {
                    DataItemLink = "Radio Show No." = field("No.");
                    DataItemTableView = sorting("No.");

                    column(PostingDate_PlaylistHeader; "Broadcast Date")
                    {

                    }
                    column(Start_time; "Start time")
                    {
                        IncludeCaption = true;
                    }
                }
            }

        }

    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    field(UserComment; UserComment)
                    {
                        ApplicationArea = All;
                        Caption = 'User Comment';
                    }
                }
            }
        }
    }
    labels
    {
        ReportTitle = 'Show Schelude by Type';
    }

    var
        UserComment: Text;

}
