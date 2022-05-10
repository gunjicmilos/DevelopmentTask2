table 50635 "BC Event Setup"
{
    DataClassification = CustomerContent;
    Caption = 'Event Setup';

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            DataClassification = SystemMetadata;
            Caption = 'Primary Key';
        }

        field(2; "Event No. Series"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Event No. Series';
            TableRelation = "No. Series";
        }
        field(3; "Posted No. Series"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Posted No. Series';
            TableRelation = "No. Series";
        }
        field(4; "Spokesperson No. Series"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Spokesperson No. Series';
            TableRelation = "No. Series";
        }
        field(5; "Default Event Duration"; DateFormula)
        {
            DataClassification = CustomerContent;
            Caption = 'Default Event Duration';
        }
        field(6; "Default Event Line Type"; Enum "BC Event Line Type")
        {
            DataClassification = CustomerContent;
            Caption = 'Default Event Line Type';
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

}