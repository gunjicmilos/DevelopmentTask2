/*codeunit 50635 "BC Event-Post (Yes/No)"
{
    TableNo = "BC Event Header";
    EventSubscriberInstance = Manual;

    trigger OnRun()
    var
        EventHeader: Record "BC Event Header";
    begin
        OnBeforeOnRun(Rec);

        if not Find then
            Error(NothingToPostErr);

        EventHeader.Copy(Rec);
        Code(EventHeader, false);
        Rec := EventHeader;
    end;

    var
        ShipInvoiceQst: Label '&Ship,&Invoice,Ship &and Invoice';
        PostConfirmQst: Label 'Do you want to post the %1?', Comment = '%1 = Document Type';
        ReceiveInvoiceQst: Label '&Receive,&Invoice,Receive &and Invoice';
        NothingToPostErr: Label 'There is nothing to post.';

    procedure PostAndSend(var EventHeader: Record "BC Event Header")
    var
        EventHeaderToPost: Record "BC Event Header";
    begin
        EventHeaderToPost.Copy(EventHeader);
        Code(EventHeaderToPost, true);
        EventHeader := EventHeaderToPost;
    end;

    local procedure "Code"(var EventHeader: Record "BC Event Header"; PostAndSend: Boolean)
    var
        EventSetup: Record "BC Event Setup";
        SalesPostViaJobQueue: Codeunit "Sales Post via Job Queue";
        HideDialog: Boolean;
        IsHandled: Boolean;
        DefaultOption: Integer;
    begin
        HideDialog := false;
        IsHandled := false;
        DefaultOption := 3;
        OnBeforeConfirmSalesPost(EventHeader, HideDialog, IsHandled, DefaultOption, PostAndSend);
        if IsHandled then
            exit;

        if not HideDialog then
            if not ConfirmPost(EventHeader, DefaultOption) then
                exit;

        OnAfterConfirmPost(EventHeader);

        EventSetup.Get();
        if EventSetup."Default Event Duration" and not PostAndSend then
            SalesPostViaJobQueue.EnqueueSalesDoc(EventHeader)
        else
            RunSalesPost(EventHeader);

        OnAfterPost(EventHeader);
    end;

    local procedure RunSalesPost(var EventHeader: Record "BC Event Header")
    var
        SalesPost: Codeunit "Sales-Post";
        IsHandled: Boolean;
        SuppressCommit: Boolean;
    begin
        IsHandled := false;
        OnBeforeRunSalesPost(EventHeader, IsHandled, SuppressCommit);
        if IsHandled then
            exit;

        Post.SetSuppressCommit(SuppressCommit);
        SalesPost.Run(EventHeader);
    end;

    local procedure ConfirmPost(var EventHeader: Record "BC Event Header"; DefaultOption: Integer) Result: Boolean
    var
        ConfirmManagement: Codeunit "Confirm Management";
        Selection: Integer;
        IsHandled: Boolean;
    begin
        IsHandled := false;
        OnBeforeConfirmPost(EventHeader, DefaultOption, Result, IsHandled);
        if IsHandled then
            exit(Result);

        if DefaultOption > 3 then
            DefaultOption := 3;
        if DefaultOption <= 0 then
            DefaultOption := 1;

        with EventHeader do begin
            OnConfirmPostOnBeforeSetSelection(EventHeader);
            case "Document Type" of
                "Document Type"::Order:
                    begin
                        Selection := StrMenu(ShipInvoiceQst, DefaultOption);
                        Ship := Selection in [1, 3];
                        Invoice := Selection in [2, 3];
                        if Selection = 0 then
                            exit(false);
                    end;
                "Document Type"::"Return Order":
                    begin
                        Selection := StrMenu(ReceiveInvoiceQst, DefaultOption);
                        if Selection = 0 then
                            exit(false);
                        Receive := Selection in [1, 3];
                        Invoice := Selection in [2, 3];
                    end
                else
                    if not ConfirmManagement.GetResponseOrDefault(
                         StrSubstNo(PostConfirmQst, LowerCase(Format("Document Type"))), true)
                    then
                        exit(false);
            end;
            "Print Posted Documents" := false;
        end;
        exit(true);
    end;

procedure Preview(var SalesHeader: Record "Sales Header")
var
    SalesPostYesNo: Codeunit "Sales-Post (Yes/No)";
    GenJnlPostPreview: Codeunit "Gen. Jnl.-Post Preview";
begin
    BindSubscription(SalesPostYesNo);
    GenJnlPostPreview.Preview(SalesPostYesNo, SalesHeader);
end;

[IntegrationEvent(false, false)]
local procedure OnAfterPost(var EventHeader: Record "BC Event Header")
begin
end;

[IntegrationEvent(false, false)]
local procedure OnAfterConfirmPost(var EventHeader: Record "BC Event Header")
begin
end;

[EventSubscriber(ObjectType::Codeunit, Codeunit::"Gen. Jnl.-Post Preview", 'OnRunPreview', '', false, false)]
local procedure OnRunPreview(var Result: Boolean; Subscriber: Variant; RecVar: Variant)
var
    SalesHeader: Record "Sales Header";
    SalesPost: Codeunit "Sales-Post";
begin
    with SalesHeader do begin
        Copy(RecVar);
        Receive := "Document Type" = "Document Type"::"Return Order";
        Ship := "Document Type" in ["Document Type"::Order, "Document Type"::Invoice, "Document Type"::"Credit Memo"];
        Invoice := true;
    end;

    OnRunPreviewOnAfterSetPostingFlags(SalesHeader);

    SalesPost.SetPreviewMode(true);
    Result := SalesPost.Run(SalesHeader);
end;

[IntegrationEvent(false, false)]
local procedure OnRunPreviewOnAfterSetPostingFlags(var SalesHeader: Record "Sales Header")
begin
end;

[IntegrationEvent(false, false)]
local procedure OnBeforeConfirmPost(var EventHeader: Record "BC Event Header"; var DefaultOption: Integer; var Result: Boolean; var IsHandled: Boolean)
begin
end;

[IntegrationEvent(false, false)]
local procedure OnBeforeConfirmSalesPost(var EventHeader: Record "BC Event Header"; var HideDialog: Boolean; var IsHandled: Boolean; var DefaultOption: Integer; var PostAndSend: Boolean)
begin
end;

[IntegrationEvent(false, false)]
local procedure OnBeforeOnRun(var EventHeader: Record "BC Event Header")
begin
end;

[IntegrationEvent(false, false)]
local procedure OnBeforeRunSalesPost(var EventHeader: Record "BC Event Header"; var IsHandled: Boolean; var SuppressCommit: Boolean)
begin
end;

[IntegrationEvent(false, false)]
local procedure OnConfirmPostOnBeforeSetSelection(var EventHeader: Record "BC Event Header")
begin
end;



}
*/