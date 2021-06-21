({
    onChildMethod : function(component, event, helper) {
    var params = event.getParam('arguments');
    if(params){
        var message = params.message;
        alert(message);
        return 'Received the Message from Parent Component in Child Component: '+message;
    }
    }
})
