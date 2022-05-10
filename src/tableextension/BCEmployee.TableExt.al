tableextension 50635 "BC Employee" extends Employee


{
    fields
    {
        field(50635; "BC No. of Events"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("BC Event Line" where(Type = CONST(Employee), "No" = field("No.")));
        }

        field(50636; "BC No. of Posted Events"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("BC Posted Event Line" where(Type = CONST(Employee), "No." = field("No.")));

        }
    }


}