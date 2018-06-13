
report 50100 TempTable
{
    DefaultLayout = RDLC;
    RDLCLayout = 'Src\reportlayout\TempTableRDLCReport.rdl';

    dataset
    {
        dataitem(TempTable; TempTable)
        {
            column(Code; TempTable.Code)
            {
            }
            column(Description; TempTable.Description)
            {
            }
        }
    }
}