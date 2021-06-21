({
    callChildMethod  : function(component, event, helper) {
        var childCmp = component.find('mychildComponent');
        var returnMsg = childCmp.childMethod('From Parent Component');
        alert(returnMsg);

    }
})
