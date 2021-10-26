codeunit 50100 "E1 Workflow Handling"
{

    local procedure CreateEventsLibrary()
    var
        WorkflowEventHandling: Codeunit "Workflow Event Handling";
        E1OnValidateE1NameValueDescriptionLbl: Label 'Changed the setting of the E1 Name Value field.';
    begin
        WorkflowEventHandling.AddEventToLibrary(OnValidateE1NameValueLbl, Database::Customer, E1OnValidateE1NameValueDescriptionLbl, 0, true);
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Workflow Event Handling", 'OnAddWorkflowEventsToLibrary', '', false, false)]
    local procedure OnAddWorkflowEventsToLibrary()
    begin
        CreateEventsLibrary();
    end;

    [EventSubscriber(ObjectType::Table, Database::Customer, 'OnAfterValidateEvent', 'E1 Name', false, false)]
    local procedure OnAfterValidateEvent(var Rec: Record Customer; var xRec: Record Customer; CurrFieldNo: Integer)
    var
        WorkflowManagement: Codeunit "Workflow Management";
    begin
        WorkflowManagement.HandleEventWithxRec(OnValidateE1NameValueLbl, Rec, xRec);
    end;

    var
        OnValidateE1NameValueLbl: Label 'E1ONVALIDATEE1NAMEVALUE', Locked = true;
}