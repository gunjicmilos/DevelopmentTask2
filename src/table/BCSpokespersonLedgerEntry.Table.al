table 50641 "BC Spokesperson Ledger Entry"
{
    Caption = 'Spokesperson Ledger Entry';
    DataClassification = ToBeClassified;
    LookupPageId = "BC Spokesperson Ledger Entry";

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
            DataClassification = ToBeClassified;
            AutoIncrement = true;
        }
        field(2; "Spokesperson No."; Code[20])
        {
            Caption = 'Spokesperson No.';
            DataClassification = ToBeClassified;
        }
        field(3; "Spokesperson Description"; Text[100])
        {
            Caption = 'Spokesperson Description';
            DataClassification = ToBeClassified;
        }
        field(4; "Event No."; Code[20])
        {
            Caption = 'Event No.';
            DataClassification = ToBeClassified;
        }
        field(5; "Posted Event No."; Code[20])
        {
            Caption = 'Posted Event No.';
            DataClassification = ToBeClassified;
        }
        field(6; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
            DataClassification = ToBeClassified;
        }
        field(7; "Ending Date"; Date)
        {
            Caption = 'Ending Date';
            DataClassification = ToBeClassified;
        }
        field(8; Open; Boolean)
        {
            Caption = 'Open';
            DataClassification = ToBeClassified;
        }
        field(9; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = ToBeClassified;
        }
        field(10; Amount; Decimal)
        {
            Caption = 'Amount';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}
