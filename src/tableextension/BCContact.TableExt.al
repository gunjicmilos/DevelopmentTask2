tableextension 50636 "BC Contact" extends Contact
{
    fields
    {
        field(50635; "BC No. Of Events"; Integer)
        {
            Caption = 'No. Of Events';
            FieldClass = FlowField;
            CalcFormula = count("BC Event Line" where(Type = const(Contact), No = field("No.")));
        }
        field(50636; "BC No. Of Posted Events"; Integer)
        {
            Caption = 'No. Of Posted Events';
            FieldClass = FlowField;
            CalcFormula = count("BC Posted Event Line" where(Type = const(Contact), "No." = field("No.")));
        }
    }


}