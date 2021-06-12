({
    doSave : function(component, event, helper) {
     helper.save(component, event);
     helper.getContacts(component, event);
    }
})