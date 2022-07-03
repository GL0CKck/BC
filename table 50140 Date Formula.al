table 50140 "Date Formula"
{

    fields
    {
        field(1; "Primary Key"; Integer) { }
        field(10; "Reference for Data Calculation"; Date)
        {
            trigger OnValidate()
            begin
                CalculateNewDate;
            end;
        }
        field(20; "Date Formula to Test"; DateFormula)
        {
            trigger OnValidate()
            begin
                CalculateNewDate;
            end;
        }
        field(30; "Date Result"; Date) { }
    }
    local procedure CalculateNewDate()
    begin
        "Date Result" := CalcDate("Date Formula to Test", "Reference for Data Calculation")
    end;

}