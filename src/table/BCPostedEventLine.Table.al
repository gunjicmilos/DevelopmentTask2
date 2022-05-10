table 50640 "BC Posted Event Line"
{
    Caption = 'Posted Event Line';
    DataClassification = ToBeClassified;
    LookupPageId = "BC Posted Event Line List";

    fields
    {
        field(1; "Event No."; Code[20])
        {
            Caption = 'Event No.';
            DataClassification = ToBeClassified;
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = ToBeClassified;
        }
        field(3; Type; Enum "BC Event Line Type")
        {
            Caption = 'Type';
            DataClassification = ToBeClassified;
        }
        field(4; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
            TableRelation = IF (Type = CONST(Employee)) Employee
            ELSE
            IF (Type = CONST(Contact)) Contact;
        }
        field(5; Name; Text[100])
        {
            Caption = 'Name';
            DataClassification = ToBeClassified;
        }
        field(6; "E-mail"; Text[80])
        {
            Caption = 'E-mail';
            DataClassification = ToBeClassified;
        }
        field(7; "No. of Sessions"; Integer)
        {
            Caption = 'No. of Sessions';
            DataClassification = ToBeClassified;
        }
        field(8; "No. of Days"; Decimal)
        {
            Caption = 'No. of Days';
            DataClassification = ToBeClassified;
        }
        field(9; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
            DataClassification = ToBeClassified;
        }
        field(10; "Ending Date"; Date)
        {
            Caption = 'Ending Date';
            DataClassification = ToBeClassified;
        }
        field(11; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DataClassification = ToBeClassified;
        }
        field(12; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
            DataClassification = ToBeClassified;
        }
        field(13; Amount; Decimal)
        {
            Caption = 'Amount';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Event No.", "Line No.")
        {
            Clustered = true;
        }
    }
}
