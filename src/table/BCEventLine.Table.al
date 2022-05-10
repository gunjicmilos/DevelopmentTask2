table 50637 "BC Event Line"
{
    DataClassification = CustomerContent;
    Caption = 'Event Line';

    fields
    {
        field(1; "Event No."; Code[20])
        {
            DataClassification = SystemMetadata;
            Caption = 'Event No.';
        }
        field(2; "Line No."; Integer)
        {
            DataClassification = SystemMetadata;
            Caption = 'Line No.';
        }
        field(3; Type; Enum "BC Event Line Type")
        {
            DataClassification = CustomerContent;
            Caption = 'Type';
        }
        field(4; No; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No';
            TableRelation = IF (Type = CONST(Employee)) Employee
            ELSE
            IF (Type = CONST(Contact)) Contact;
        }
        field(5; Name; Text[100])
        {
            DataClassification = CustomerContent;
            Caption = 'Name';
        }
        field(6; "E-mail"; Text[80])
        {
            DataClassification = CustomerContent;
            Caption = 'E-mail';
        }
        field(7; "No. of Sessions"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'No. of Sessions';
        }
        field(8; "No. of Days"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'No. of Days';
            //DecimalPlaces = 0 : 0;
            trigger OnValidate()
            var
                DaysTok: Label '<+%1D>', Locked = true, Comment = '%1 - Number of Days';
            begin
                Rec."Ending Date" := System.CalcDate(StrSubstNo(DaysTok, "No. of Days"), Rec."Starting Date");
            end;
        }
        field(9; "Starting Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Starting Date';

            trigger OnValidate()
            begin
                if Rec."Ending Date" = 0D then
                    exit;
                if Rec."Starting Date" = 0D then
                    exit;
                if Rec."Starting Date" > Rec."Ending Date" then
                    Error('Starting date is after ending date');
                Rec."No. of Days" := Rec."Ending Date" - Rec."Starting Date";
            end;
        }

        field(10; "Ending Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Ending Date';
            trigger OnValidate()
            var
                DateErr: Label 'Starting date is after ending date';
            begin
                if Rec."Ending Date" = 0D then
                    exit;
                if Rec."Starting Date" = 0D then
                    exit;
                if Rec."Starting Date" > Rec."Ending Date" then
                    Error(DateErr);
                Rec."No. of Days" := Rec."Ending Date" - Rec."Starting Date";
            end;
        }
        field(11; Quantity; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Quantity';
            trigger OnValidate()
            begin
                Rec.Amount := Rec.Quantity * Rec."Unit price";
            end;
        }
        field(12; "Unit price"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Unit price';
            trigger OnValidate()
            begin
                CalculateAmount();
            end;

        }
        field(13; Amount; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Amount';
        }
    }

    keys
    {
        key(PK; "Event No.", "Line No.")
        {
            Clustered = true;
        }

        key(SK; Type, No)
        {

        }
    }


    local procedure CalculateAmount()
    begin
        Rec.Amount := Rec.Quantity * Rec."Unit price";
    end;

}
