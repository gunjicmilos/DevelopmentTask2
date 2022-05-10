table 50639 "BC Posted Event Header"
{
    Caption = 'Posted Event Header';
    DataClassification = ToBeClassified;
    LookupPageId = "BC Posted Event List";


    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = ToBeClassified;
        }
        field(2; Type; Enum "BC Event Type")
        {
            Caption = 'Type';
            DataClassification = ToBeClassified;
        }
        field(3; Description; Text[100])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
        field(4; "Event Creation Date"; Date)
        {
            Caption = 'Event Creation Date';
            DataClassification = ToBeClassified;
        }
        field(5; "Starting Date"; Date)
        {
            Caption = 'Starting Date';
            DataClassification = ToBeClassified;
        }
        field(6; "Ending Date"; Date)
        {
            Caption = 'Ending Date';
            DataClassification = ToBeClassified;
        }
        field(7; "Spokesperson No."; Code[20])
        {
            Caption = 'Spokesperson No.';
            DataClassification = ToBeClassified;
            TableRelation = "BC Spokesperson";
        }
        field(8; "Spokesperson Name"; Text[100])
        {
            Caption = 'Spokesperson Name';
            DataClassification = ToBeClassified;
        }
        field(9; "Spokesperson Email"; Text[80])
        {
            Caption = 'Spokesperson Email';
            DataClassification = ToBeClassified;
        }
        field(10; Status; Enum "BC Event Status")
        {
            Caption = 'Status';
            DataClassification = ToBeClassified;
        }
        field(11; "Contact No."; Code[20])
        {
            Caption = 'Contact No.';
            DataClassification = ToBeClassified;
        }
        field(12; "Contact Name"; Text[100])
        {
            Caption = 'Contact Name';
            DataClassification = ToBeClassified;
        }
        field(13; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = ToBeClassified;
        }
        field(14; "No. of Print"; Integer)
        {
            Caption = 'No. of Print';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}
