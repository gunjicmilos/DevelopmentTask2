pageextension 50636 "BC Contact Card" extends "Contact Card"
{
    layout
    {
        addafter(General)
        {

            field("BC No. Of Events"; Rec."BC No. Of Events")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the No. Of Events field.';

            }
            field("BC No. Posted Of Events"; Rec."BC No. Of Posted Events")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies the value of the No. Of Posted Events field.';
                //FieldPropertyName = FieldPropertyValue;
            }

        }


    }
}