table 50101 "Radio Show Type"
{
    LookupPageId = "Radio Show Type"; // позволяет нам определить, какая страница используется по умолчанию для поиска данных в этой таблице
    DrillDownPageId = "Radio Show Type"; // позволяет нам определить, какая страница используется по умолчанию для детализации вспомогательных сведений 

    fields
    {
        field(1; Code; Code[20]) { }
        field(10; Description; Text[50]) { }
    }

}