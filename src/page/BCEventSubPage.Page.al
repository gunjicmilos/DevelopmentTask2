page 50638 "BC Event SubPage"
{
    Caption = 'Event SubPage';
    PageType = ListPart;
    SourceTable = "BC Event Line";
    AutoSplitKey = true;
    UsageCategory = None;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Event No."; Rec."Event No.")
                {
                    ToolTip = 'Specifies the value of the Event No. field.';
                    ApplicationArea = All;
                    Visible = false;
                    Editable = false;
                }
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field.';
                    ApplicationArea = All;
                    Visible = false;
                    Editable = false;
                }
                field(Type; Rec."Type")
                {
                    ToolTip = 'Specifies the value of the Type field.';
                    ApplicationArea = All;
                }
                field(No; Rec.No)
                {
                    ToolTip = 'Specifies the value of the No field.';
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the value of the Name field.';
                    ApplicationArea = All;
                }
                field("E-mail"; Rec."E-mail")
                {
                    ToolTip = 'Specifies the value of the E-mail field.';
                    ApplicationArea = All;
                }
                field("No. of Sessions"; Rec."No. of Sessions")
                {
                    ToolTip = 'Specifies the value of the No. of Sessions field.';
                    ApplicationArea = All;
                }
                field("No. of Days"; Rec."No. of Days")
                {
                    ToolTip = 'Specifies the value of the No. of Days field.';
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

                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the value of the Quantity field.';
                    ApplicationArea = All;
                }
                field("Unit price"; Rec."Unit price")
                {
                    ToolTip = 'Specifies the value of the Unit price field.';
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

    actions
    {
        area(Processing)
        {
            action("Count Lines")
            {
                Promoted = true;
                ApplicationArea = All;
                Tooltip = 'Specifies action Count Lines';
                Image = Action;

                trigger OnAction()
                var
                    EventLine: Record "BC Event Line";
                    OptionsTxt: Label ' ,Employee,Contact';
                    QuestionTxt: Label 'Please select';
                    Choice: Integer;

                    numberOfLines: Integer;
                begin
                    choice := Strmenu(OptionsTxt, 2, QuestionTxt);
                    if choice < 2 then
                        exit;
                    EventLine.setRange("Event No.", Rec."Event No.");
                    if choice = 2 then
                        EventLine.setRange(Type, Enum::"BC Event Line Type"::Employee);
                    if choice = 3 then
                        EventLine.setRange(Type, Enum::"BC Event Line Type"::Contact);
                    numberOfLines := EventLine.Count();
                    Message('Number of lines is %1', numberOfLines);
                end;

            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    var
        //BCEventLine: Record "BC Event Line";
        BCEventHeader: Record "BC Event Header";

    begin
        Rec."Starting Date" := BCEventHeader."Starting Date";
        Rec."Ending Date" := BCEventHeader."Ending Date";

    end;
}
