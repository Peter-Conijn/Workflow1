pageextension 50100 "E1 Customer Card" extends "Customer Card"
{
    layout
    {
        addafter("Disable Search by Name")
        {
            field("E1 Name Value"; Rec."E1 Name Value")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies which name value will be copied into the E1 Name field.';
            }
            field("E1 Name"; Rec."E1 Name")
            {
                ApplicationArea = All;
                ToolTip = 'Specifies which name value is represented here.';
                Editable = false;
            }
        }
    }
}