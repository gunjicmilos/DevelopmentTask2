page 50640 "BC Event Card"
{
    Caption = 'Event Card';
    PageType = Document;
    SourceTable = "BC Event Header";
    UsageCategory = None;


    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the No. field.';
                    Editable = false;
                    trigger OnAssistEdit()
                    begin
                        Rec.AssistEdit2();
                    end;
                }
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
            part(EventLines; "BC Event SubPage")
            {
                Caption = 'Event Lines';
                ApplicationArea = Basic, Suite;
                Enabled = Rec."Spokesperson No." <> '';
                SubPageLink = "Event No." = field(No);
                UpdatePropagation = Both;
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("Copy Document")
            {
                Image = AboutNav;
                ApplicationArea = All;
                RunObject = page "BC Event List";
                ToolTip = 'Executes the Copy Document action.';

                trigger OnAction()
                var
                    BCEventHeader: Record "BC Event Header";
                    BCNewEventHeader: Record "BC Event Header";
                    BCEventSetup: Record "BC Event Setup";
                    NoSeriesMgt: Codeunit NoSeriesManagement;
                    OptionsTxt: Label 'Yes,No';
                    QuestionTxt: Label 'Do you want to proceed?';
                    Choice: Integer;

                begin
                    If (Rec.Status = BCEventHeader.Status::Released) then begin
                        choice := Strmenu(OptionsTxt, 2, QuestionTxt);
                    end;
                    if (Rec.Status = BCNewEventHeader.Status::Closed) then begin
                        Error('Copy document is not possible');
                    end;
                    if (Rec.Status = BCNewEventHeader.Status::Postponed) then begin

                    end;
                    if Page.RunModal(0, BCEventHeader) = ACTION::LookupOK then begin
                        BCNewEventHeader."Contact No." := BCEventHeader."Contact No.";
                        BCNewEventHeader.Insert();
                    end;

                end;


            }

            action(Open)
            {
                ApplicationArea = All;
                Image = Absence;
                ToolTip = 'Executes the Open action.';


                trigger OnAction()
                var
                    BCEventHeader: Record "BC Event Header";
                    OptionsTxt: Label 'Yes,No';
                    QuestionTxt: Label 'Are you sure you want to open document with No. %1 ?';
                    Choice: Integer;
                begin
                    If (Rec.Status = "BC Event Status"::Released) or (Rec.Status = "BC Event Status"::Postponed) then begin
                        Rec.Status := Rec.Status::Open;
                        exit;
                    end
                    else
                        If (Rec.Status = "BC Event Status"::Open) then
                            Message('Document No. %1 is already open', Rec.No)
                        else
                            if (Rec.Status = "BC Event Status"::Closed) then begin
                                choice := Strmenu(OptionsTxt, 2, QuestionTxt);
                                If choice = 1 then
                                    Rec.Status := Rec.Status::Open;
                                if choice = 2 then
                                    exit;
                            end
                end;
            }

            action(Release)
            {
                ApplicationArea = All;
                Image = Addresses;
                ToolTip = 'Executes the Release action.';

                trigger OnAction()
                var
                    BCEventHeader: Record "BC Event Header";
                begin
                    If (Rec.Status = "BC Event Status"::Open) then begin
                        if (Rec."Contact No." <> ' ') or (Rec."Starting Date" <> 0D) or (Rec."Ending Date" <> 0D) or (Rec.No <> ' ')
                        or (Rec.Type <> ' ') or (Rec."Posting Date" <> 0D) or (Rec."Spokesperson No." <> ' ') then
                            //BCEventHeader.TestField(Status, "BC Event Status"::Open);
                    Rec.Status := Rec.Status::Released;
                    end
                    else
                        If (Rec.Status = "BC Event Status"::Closed) or (Rec.Status = "BC Event Status"::Postponed) or
                   (Rec.Status = "BC Event Status"::Released) then
                            Error('Greska');
                end;
            }

            action(Postponed)
            {
                ApplicationArea = All;
                Image = PostponedInteractions;
                ToolTip = 'Executes the Postponed action.';

                trigger OnAction()

                begin
                    If (Rec.Status = "BC Event Status"::Open) or (Rec.Status = "BC Event Status"::Released) then begin
                        Rec.Status := Rec.Status::Postponed;
                    end
                    else
                        Error('Greska');
                end;
            }

            action(Closed)
            {
                ApplicationArea = All;
                Image = Closed;
                ToolTip = 'Executes the Closed action.';

                trigger OnAction()

                begin
                    If (Rec.Status = "BC Event Status"::Postponed) then begin
                        Rec.Status := Rec.Status::Closed;
                    end
                    else
                        Error('Greska');
                end;
            }

            action(Spokesperson)
            {
                ApplicationArea = All;
                Image = User;
                RunObject = page "BC Spokesperson Card";
                RunPageLink = "No." = field("Spokesperson No.");
                ShortcutKey = 'Shift+F7';
                ToolTip = 'Executes the Spokesperson action.';

                trigger OnAction()
                begin

                end;
            }
            action(Post)
            {
                Image = Post;
                ShortcutKey = 'F9';
                trigger OnAction()
                begin

                end;
            }




        }
    }
    local procedure PostEvent()
    var

    begin


    end;


}
