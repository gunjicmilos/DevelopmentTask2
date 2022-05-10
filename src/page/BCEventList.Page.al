page 50641 "BC Event List"
{
    ApplicationArea = All;
    Caption = 'Event List';
    PageType = List;
    SourceTableView = sorting("Spokesperson No.", "Starting Date");
    SourceTable = "BC Event Header";
    UsageCategory = Lists;
    CardPageId = "BC Event Card";
    Editable = false;


    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Contact Name"; Rec."Contact Name")
                {
                    ToolTip = 'Specifies the value of the Contact Name field.';
                    ApplicationArea = All;
                }
                field("Contact No."; Rec."Contact No.")
                {
                    ToolTip = 'Specifies the value of the Contact No. field.';
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                    ApplicationArea = All;
                }
                field("Ending Date"; Rec."Ending Date")
                {
                    ToolTip = 'Specifies the value of the Ending Date field.';
                    ApplicationArea = All;
                }
                field("Event Creation Date"; Rec."Event Creation Date")
                {
                    ToolTip = 'Specifies the value of the Event Creation Date field.';
                    ApplicationArea = All;
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Posting Date field.';
                    ApplicationArea = All;
                }
                field("Spokesperson E-mail"; Rec."Spokesperson E-mail")
                {
                    ToolTip = 'Specifies the value of the Spokesperson E-mail field.';
                    ApplicationArea = All;
                }
                field("Spokesperson Name"; Rec."Spokesperson Name")
                {
                    ToolTip = 'Specifies the value of the Spokesperson Name field.';
                    ApplicationArea = All;
                }
                field("Spokesperson No."; Rec."Spokesperson No.")
                {
                    ToolTip = 'Specifies the value of the Spokesperson No. field.';
                    ApplicationArea = All;
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ToolTip = 'Specifies the value of the Starting Date field.';
                    ApplicationArea = All;
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                    ApplicationArea = All;
                }
                field(Type; Rec."Type")
                {
                    ToolTip = 'Specifies the value of the Type field.';
                    ApplicationArea = All;
                }
            }
        }
    }
}
