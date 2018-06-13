page 50100 "TempTable"
{
    PageType = List;
    SourceTable = 50100;
    CardPageId = 50101;
    UsageCategory = Lists;
    layout
    {
        area(content)
        {
            repeater(Group)
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
                field("Exchange Rate";"Exchange Rate")
                {
                    Editable = false;
                    ApplicationArea = ALL;
                }
            }
        }
        area(factboxes)
        {
        }

    }

    actions
    {
        area(processing)
        {
            action("Get Exchange Rate")
            {
                image=GetEntries;
                trigger OnAction();
                var
                    GetExchRate: Codeunit GetExchangeRate;    
                begin
                    GetExchRate.ShowExhangeRate('USD');
                end;
            }
            action(Print)
            {
                Image=Print;
                trigger OnAction();
                begin
                    report.Run(Report::TempTable);
                end;
            }
        }
    }
}