table 50638 "BC Event Header"
{
    DataClassification = ToBeClassified;
    LookupPageId = "BC Event List";

    fields
    {
        field(1; No; Code[20])
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                BCEventSetup: Record "BC Event Setup";
                NoSeriesMgt: Codeunit NoSeriesManagement;
            begin
                if "No" <> xRec."No" then begin
                    BCEventSetup.Get();
                    NoSeriesMgt.TestManual(BCEventSetup."Event No. Series");
                    Rec."No. Series" := '';

                end;
            end;
        }
        field(2; Type; Enum "BC Event Type")
        {
            DataClassification = ToBeClassified;

        }
        field(3; Description; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(4; "Event Creation Date"; Date)
        {
            DataClassification = ToBeClassified;


        }
        field(5; "Starting Date"; Date)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                BCEventSetup: Record "BC Event Setup";
            begin
                BCEventSetup.get();
                if not (Format(BCEventSetup."Default Event Duration") = '') then //format pretvara svaku vrednost u prazan string
                    Rec."Ending Date" := System.CalcDate('<7D>', Rec."Starting Date");

            end;

        }
        field(6; "Ending Date"; Date)
        {
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                DateErr: Label 'Wrong dates';
            begin
                if "Ending Date" < "Starting Date" then
                    Error(DateErr);
            end;

        }
        field(7; "Spokesperson No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "BC Spokesperson";
            trigger OnValidate()
            var
                BCSpokesperson: Record "BC Spokesperson";
            begin
                BCSpokesperson.get("Spokesperson No.");
                Rec."Spokesperson Name" := BCSpokesperson.Name;
                Rec."Spokesperson E-mail" := BCSpokesperson."E-mail";
                Rec."Contact No." := BCSpokesperson."No.";
            end;

        }
        field(8; "Spokesperson Name"; Text[100])
        {
            DataClassification = ToBeClassified;

        }
        field(9; "Spokesperson E-mail"; Text[80])
        {
            DataClassification = ToBeClassified;

        }
        field(10; Status; Enum "BC Event Status")
        {
            DataClassification = ToBeClassified;
            Editable = false;


        }
        field(11; "Contact No."; Text[80])
        {
            DataClassification = ToBeClassified;
            TableRelation = Contact;
            trigger OnValidate()
            var
                Contact: Record Contact;
            begin
                Contact.get("Contact No.");
                Rec."Contact Name" := Contact.Name;
            end;

        }
        field(12; "Contact Name"; Text[80])
        {
            DataClassification = ToBeClassified;

        }
        field(13; "Posting Date"; Date)
        {
            DataClassification = ToBeClassified;

        }
        field(14; "No. Series"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; No)
        {
            Clustered = true;
        }
        key(SK; Type)
        {

        }
        key(SK2; "Spokesperson No.", "Starting Date")
        {

        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    var
        EventSetup: Record "BC Event Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
    begin
        Rec."Event Creation Date" := System.Today();
        EventSetup.Get();
        if No = '' then begin
            EventSetup.TestField("Event No. Series");
            NoSeriesMgt.InitSeries(EventSetup."Event No. Series", xRec."No. Series", 0D, No, "No. Series");
        end;
    end;

    procedure AssistEdit2() Result: Boolean
    var
        BCEventSetup: Record "BC Event Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
    begin
        BCEventSetup.Get();
        BCEventSetup.TestField("Event No. Series");
        if NoSeriesManagement.SelectSeries(BCEventSetup."Event No. Series", xRec."No. Series", "No. Series") then begin
            NoSeriesManagement.SetSeries(No);
            exit(true);
        end;
    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}