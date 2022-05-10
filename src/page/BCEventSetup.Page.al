page 50635 "BC Event Setup"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "BC Event Setup";
    DeleteAllowed = false;
    InsertAllowed = false;

    layout
    {
        area(Content)
        {
            group(General)
            {

                Caption = 'General';
                field("Default Event Duration"; Rec."Default Event Duration")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Default Event Duration field.';

                }

                field("Default Event Line Type"; Rec."Default Event Line Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Default Event Line Type field.';

                }

            }
            group("No. Series")
            {
                Caption = 'No.Series';
                field("Event No. Series"; Rec."Event No. Series")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Event No. Series field.';
                }
                field("Posted No. Series"; Rec."Posted No. Series")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posted No. Series field.';
                }
                field("Spokesperson No. Series"; Rec."Spokesperson No. Series")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Spokesperson No. Series field.';
                }

            }
        }
    }

    trigger OnOpenPage()
    begin
        Rec.Reset();
        if not Rec.Get() then begin
            Rec.Init();
            Rec.Insert();
        end;
    end;

}