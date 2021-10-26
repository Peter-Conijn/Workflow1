tableextension 50100 "E1 Customer" extends Customer
{
    fields
    {
        field(50100; "E1 Name Value"; Enum "E1 Name Value")
        {
            DataClassification = CustomerContent;
            Caption = 'E1 Name';

            trigger OnValidate()
            begin
                SetE1Name("E1 Name Value");
            end;
        }

        field(50101; "E1 Name"; Text[200])
        {
            DataClassification = CustomerContent;
            Caption = 'E1 Name';
        }
    }

    local procedure SetE1Name(NewValue: Enum "E1 Name Value")
    begin
        case NewValue of
            Enum::"E1 Name Value"::"None":
                Validate("E1 Name", '');
            Enum::"E1 Name Value"::Name:
                Validate("E1 Name", Name);
            Enum::"E1 Name Value"::"Name 2":
                Validate("E1 Name", "Name 2");
        end;
    end;
}