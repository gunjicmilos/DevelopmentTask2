page 50646 "BC Spokesperson Ledger Entry"
{
    ApplicationArea = All;
    Caption = 'Spokesperson Ledger Entry';
    PageType = List;
    SourceTable = "BC Spokesperson Ledger Entry";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ToolTip = 'Specifies the value of the Entry No. field.';
                    ApplicationArea = All;
                }
                field("Spokesperson No."; Rec."Spokesperson No.")
                {
                    ToolTip = 'Specifies the value of the Spokesperson No. field.';
                    ApplicationArea = All;
                }
                field("Spokesperson Description"; Rec."Spokesperson Description")
                {
                    ToolTip = 'Specifies the value of the Spokesperson Description field.';
                    ApplicationArea = All;
                }
                field("Event No."; Rec."Event No.")
                {
                    ToolTip = 'Specifies the value of the Event No. field.';
                    ApplicationArea = All;
                }
                field("Posted Event No."; Rec."Posted Event No.")
                {
                    ToolTip = 'Specifies the value of the Posted Event No. field.';
                    ApplicationArea = All;
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ToolTip = 'Specifies the value of the Starting Date field.';
                    ApplicationArea = All;
                }
                field("Ending Date"; Rec."Ending Date")
                {
                    ToolTip = 'Specifies the value of the Ending Date field.';
                    ApplicationArea = All;
                }
                field(Open; Rec.Open)
                {
                    ToolTip = 'Specifies the value of the Open field.';
                    ApplicationArea = All;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Posting Date field.';
                    ApplicationArea = All;
                }
                field(Amount; Rec.Amount)
                {
                    ToolTip = 'Specifies the value of the Amount field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
