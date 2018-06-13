codeunit 50100 "TempTableMngt"
{
    [EventSubscriber(ObjectType::Table, 27, 'OnAfterInsertEvent', '',true, true)]
    local procedure OnInsertItem(Var Rec:Record Item)
    var 
        TempTable:Record TempTable;
        MyNotification: Notification;

    begin
        TempTable.Reset();
        TempTable.SetRange(Code,Rec."No.");
        if not TempTable.FindSet() then begin
            TempTable.Init();
            TempTable.Code := Rec."No.";
            //TempTable.Description := Rec.Description;
            TempTable.Automatic := true;
            TempTable.Insert(true);
        end;

        MyNotification.Id := CreateGuid(); //create guid extension
        MyNotification.Message(StrSubstNo('Added Item %1 in temp table',Rec."No."));
        MyNotification.send();
    end;

    [EventSubscriber(ObjectType::Page, Page::"Item Card", 'OnModifyRecordEvent', '', true, true)]
    local procedure UpdateTempTableDescription(var Rec:Record Item; var xRec:Record Item)
    var
        TempTable:Record TempTable;
    begin
        if Rec.Description <> xRec.Description then
            if TempTable.get(rec."No.") then
                if TempTable.Automatic = true then begin
                    TempTable.Description := Rec.Description;
                    TempTable.Modify();
                end;    
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterFinalizePosting', '', true, true)]
    local procedure UpdateTempTableAfterPost(var SalesInvoiceHeader:Record "Sales Invoice Header")
    var
        TempTable:Record TempTable;
        SalesInvoiceLine:Record "Sales Invoice Line";
    begin
        if SalesInvoiceHeader."No." <> '' then begin
            SalesInvoiceLine.Reset();
            SalesInvoiceLine.SetRange("Document No.",SalesInvoiceHeader."No.");
            SalesInvoiceLine.SetRange(Type,SalesInvoiceLine.Type::Item);
            if SalesInvoiceLine.FindSet() then
                repeat
                    if TempTable.Get(SalesInvoiceLine."No.") then begin
                        TempTable."Last Invoice No." := SalesInvoiceHeader."No.";
                        TempTable.Modify();
                    end;
                until(SalesInvoiceLine.Next()=0);
        end;
    end;
}