
codeunit 50102 "JSONMethods"

{

    procedure GetJsonValueAsText(var JSonObject:JsonObject; Property:Text) Value:text
    var
        JsonValue:JsonValue;
    begin
        if not GetJsonValue(JSonObject,Property,JsonValue) then
            exit;
        Value := JsonValue.AsText();
    end;



    procedure GetJsonValue(var JSonObject:JsonObject; Property:Text; var JsonValue:JsonValue) :Boolean
    var
        JsonToken:JsonToken;
    begin
        if not JSonObject.Get(Property,JsonToken) then
            exit;
        JsonValue := JsonToken.AsValue();
        exit(true);
    end;


    procedure SelectJsonValueAsText(var JSonObject:JsonObject; Path:Text) Value:text
    var
        JsonValue:JsonValue;
    begin

        if not SelectJsonValue(JSonObject,Path,JsonValue) then
            exit;
        Value := JsonValue.AsText();
    end;

    procedure SelectJsonValue(var JSonObject:JsonObject; Path:Text; var JsonValue:JsonValue) :Boolean
    var
        JsonToken:JsonToken;
    begin

        if not JSonObject.SelectToken(Path,JsonToken) then
            exit;
        JsonValue := JsonToken.AsValue();
        exit(true);
    end;
}