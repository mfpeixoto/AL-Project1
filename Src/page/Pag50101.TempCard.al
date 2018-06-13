page 50101 "TempCard"
{
    PageType = Card;
    SourceTable = 50100;
    UsageCategory = None;
    layout
    {
        area(content)
        {
            group(General)
            {
                field(Code;Code)
                {
                   ApplicationArea = ALL; 
                }
                field(Description;Description)
                {
                    ApplicationArea = ALL;
                }
                field(Automatic;Automatic)
                {
                    Editable = false;
                    ApplicationArea = ALL;
                }
                field("Last Invoice No.";"Last Invoice No.")
                {
                    Editable = false;
                    ApplicationArea = ALL;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Get Exchange Rate")
            {
                trigger OnAction();
                var
                    GetExchRate: Codeunit GetExchangeRate;
                begin
                    GetExchRate.ShowExhangeRate('USD');
                end;
            }
        }
    }
}