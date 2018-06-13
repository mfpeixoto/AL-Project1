pageextension 50100 "ExtendOrderProcessorRole" extends "9006" 
{
    layout
    {
        
    }
    
    actions
    {
        
        addlast(Embedding) 
        {
                action("Temp Table")
                {
                    RunObject = page 50100;
                    ApplicationArea = All;
                }
        }
    }
}