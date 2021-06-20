({
    fireEvent : function(component, event, helper) {

        var cmpEvent = component.getEvent("ComponentEvent");
        cmpEvent.setParams({
            "message" : "An component event fired me. from child Component" +
            "It all happened so fast. Now, I'm everywhere!" });
            // Step 2 ->fire the Event from child component
        cmpEvent.fire();

    }
})