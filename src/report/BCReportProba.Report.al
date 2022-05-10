report 50636 "BC Report Proba"
{
    Caption = 'Posted Event';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;
    RDLCLayout = './src/reportlayout/ReportProba.rdl';


    dataset
    {
        dataitem("BC Spokesperson Ledger Entry"; "BC Spokesperson Ledger Entry")
        {
            RequestFilterFields = "Posted Event No.";
            column(Entry_No_; "Entry No.") { }
            column(Posted_Event_No_; "Posted Event No.") { }

            dataitem("BC Posted Event Header"; "BC Posted Event Header")
            {
                DataItemTableView = sorting("No.");
                DataItemLinkReference = "BC Spokesperson Ledger Entry";
                DataItemLink = "No." = field("Event No.");
                RequestFilterFields = "No.";

                column(Starting_Date; "Starting Date") { }
                column(Ending_Date; "Ending Date") { }
                column(Spokesperson_No_; "Spokesperson No.") { }
                column(Spokesperson_Name; "Spokesperson Name") { }
                column(Spokesperson_E_mail; "Spokesperson Email") { }
                column(Contact_No_; "Contact No.") { }
                column(Contact_Name; "Contact Name") { }
                column(Description; Description) { }
                column(EventLbl; EventLbl) { }
                column(e; EventHeaderDataLbl) { }
                column(DescriptionLbl; DescriptionLbl) { }
                column(NoLbl; NoLbl) { }
                column(QuantityLbl; QuantityLbl) { }
                column(UnitPriceLbl; UnitPriceLbl) { }
                column(NoOfDaysLbl; NoOfDaysLbl) { }
                column(AmountLbl; AmountLbl) { }
                column(TotalLbl; TotalLbl) { }
                column(CompanyInfLbl; CompanyInfLbl) { }
                dataitem("BC Posted Event Line"; "BC Posted Event Line")
                {
                    DataItemTableView = sorting("Event No.");
                    DataItemLinkReference = "BC Spokesperson Ledger Entry";
                    DataItemLink = "Event No." = field("Event No.");
                    RequestFilterFields = "Event No.";

                    column(No_; "No.") { }
                    column(Quantity; Quantity) { }
                    column(Unit_Price; "Unit Price") { }
                    column(No__of_Days; "No. of Days") { }
                    column(Amount; Amount) { }
                    dataitem("Company Information"; "Company Information")
                    {
                        column(Address; Address) { }
                        column(Name; Name) { }
                        column(Bank_Account_No_; "Bank Account No.") { }
                        column(Country_Region_Code; "Country/Region Code") { }

                    }





                }


            }



        }

    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {

                }
            }
        }

    }
    trigger OnPostReport()
    var
        BCPostedEventHeader: Record "BC Posted Event Header";
    begin

        BCPostedEventHeader."No. of Print" := BCPostedEventHeader."No. of Print" + 1;

    end;


    var
        NoLbl: Label 'No.';
        DescriptionLbl: Label 'Description';
        QuantityLbl: Label 'Quantity';
        UnitPriceLbl: Label 'Unit Price';
        NoOfDaysLbl: Label 'No of Days';
        AmountLbl: Label 'Amount';
        TotalLbl: Label 'Total';
        EventLbl: Label 'Event';
        EventHeaderDataLbl: Label 'Event Header Data';
        CompanyInfLbl: Label 'Company Information';
}