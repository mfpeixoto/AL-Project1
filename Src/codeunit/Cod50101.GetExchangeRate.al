codeunit 50101  "GetExchangeRate"
{
    procedure ShowExhangeRate(Currency:Text);
    var
        HttpClient: HttpClient;
        HttpResponse: HttpResponseMessage;
        Url: Text;
        ResponseText: text;
        JSONMethods: codeunit JSONMethods;
        JSONResult: JsonObject;
    begin
        
        Url := StrSubstNo('http://data.fixer.io/api/latest?access_key=92a59b5b7ad72083484bb20f9f90e088&symbols=%1',Currency);
        if HttpClient.get(Url,HttpResponse) then begin
            HttpResponse.Content().ReadAs(ResponseText);
            JSONResult.ReadFrom(ResponseText);
            //Message(ResponseText);
            //Message(JSONMethods.GetJsonValueAsText(JSONResult,'base'));
            Message(JSONMethods.SelectJsonValueAsText(JSONResult,StrSubstNo('$.rates.%1',Currency)));
        end;
    end;

    procedure GetExhangeRate(Currency:Text):Decimal;
    var
        HttpClient: HttpClient;
        HttpResponse: HttpResponseMessage;
        Url: Text;
        ResponseText: text;
        JSONMethods: codeunit JSONMethods;
        JSONResult: JsonObject;
        ResultDecimal: Decimal;
    begin
        
        Url := StrSubstNo('http://data.fixer.io/api/latest?access_key=92a59b5b7ad72083484bb20f9f90e088&symbols=%1',Currency);
        if HttpClient.get(Url,HttpResponse) then begin
            HttpResponse.Content().ReadAs(ResponseText);
            JSONResult.ReadFrom(ResponseText);
            Evaluate(ResultDecimal,JSONMethods.SelectJsonValueAsText(JSONResult,StrSubstNo('$.rates.%1',Currency)));
            Exit(ResultDecimal);
        end;
    end;
}