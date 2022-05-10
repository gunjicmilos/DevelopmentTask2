table 50636 "BC Spokesperson"
{
    DataClassification = CustomerContent;
    Caption = 'Spokesperson';
    LookupPageId = "BC Spokesperson List";

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = SystemMetadata;
            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    EventSetup.Get();
                    NoSeriesMgt.TestManual(EventSetup."Primary Key"); //testira da li je korisnik uneo rucno, ili je automatizovano
                    "No. Series" := ''; //ako je korisnik rucno uneo, on mora da anulira, znaci nije koriscena nijedna postojeca brojcana serija
                end;
            end;

        }
        field(2; Name; Text[100])
        {
            DataClassification = CustomerContent;

        }
        field(3; Address; Text[100])
        {
            DataClassification = CustomerContent;

        }
        field(4; "Phone No."; Text[30])
        {
            DataClassification = CustomerContent;

        }
        field(5; "E-mail"; Text[100])
        {
            DataClassification = CustomerContent;

        }
        field(6; "Contact No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Contact;

        }
        field(7; "No. of Events"; Integer)
        {

            FieldClass = FlowField;
            CalcFormula = count("BC Event Header" where("Spokesperson No." = field("No.")));
            Editable = false;

        }
        field(8; "No. Series"; Code[20])
        {
            DataClassification = CustomerContent;
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
        key(SK; Name)
        {

        }
    }

    var
        EventSetup: Record "BC Event Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;


    trigger OnInsert()
    begin
        EventSetup.Get();
        if "No." = '' then begin
            EventSetup.TestField("Spokesperson No. Series");
            NoSeriesMgt.InitSeries(EventSetup."Spokesperson No. Series", xRec."No. Series", 0D, "No.", "No. Series"); //noseries je standardni codeunit ima preko 20 funkcija
        end;
    end;


    procedure AssistEdit() Result: Boolean
    var
        BCEventSetup: Record "BC Event Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
    begin
        BCEventSetup.Get();
        BCEventSetup.TestField("Spokesperson No. Series");
        if NoSeriesManagement.SelectSeries(EventSetup."Spokesperson No. Series", xRec."No. Series", "No. Series") then begin
            NoSeriesManagement.SetSeries("No.");
            exit(true);
        end;
    end;

}