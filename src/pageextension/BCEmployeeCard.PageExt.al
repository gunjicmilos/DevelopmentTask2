pageextension 50635 "BC Employee Card" extends "Employee Card"
{
    layout
    {
        addafter(General)
        {
            field("BC No. of Events"; Rec."BC No. of Events")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies';

            }
            field("BC No. of Posted Events"; Rec."BC No. of Posted Events")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies';


            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}