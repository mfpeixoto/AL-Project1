table 50100 "TempTable"
{
    DataClassification = ToBeClassified;
    LookupPageId = 50100;
    
    fields
    {
        field(50000; Code; Code[10])
        {
            DataClassification = ToBeClassified;
            
        }
        field(50001;Description;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50002;Automatic;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50003;"Last Invoice No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(50004;"Exchange Rate";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(PK; Code)
        {
            Clustered = true;
        }
    }

    var
        GetExchRate: codeunit GetExchangeRate;

    trigger OnInsert();
    begin
        "Exchange Rate" := GetExchRate.GetExhangeRate('USD');
    end;
}