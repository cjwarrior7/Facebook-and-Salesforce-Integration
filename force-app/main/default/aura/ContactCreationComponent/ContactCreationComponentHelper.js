({      
   
    save : function(component, event) {
        var action = component.get("c.createContact");
        var contactList = component.get("v.contactList");
        action.setParams({"cont":component.get('v.contactobj') });
        action.setCallback(this,function(response){
            console.log("response:",response);
            var state = response.getState();
            console.log("state:",state);
            if(state === "SUCCESS"){
             component.set("v.success","True");
             contactList.splice(0,0,component.get('v.contactobj'));
             component.set("v.contactList",contactList);
             //this.showToast(component, event); 
            }
 
        });
        $A.enqueueAction(action);
    },
    getContacts : function(component, event) {
        var action = component.get("c.retrieveContacts");
        console.log("action:",action);
        action.setCallback(this,function(response){
            console.log("response:",response);
            var state = response.getState();
            console.log("state:",state);
            if(state === "SUCCESS"){
             component.set("v.contactList",response.getReturnValue());
             console.log("state:",response.getReturnValue());
            }
 
        });
        $A.enqueueAction(action);
    }
  
})