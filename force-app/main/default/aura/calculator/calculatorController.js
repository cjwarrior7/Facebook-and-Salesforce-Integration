({
    calculate : function(component, event, helper) {
        /* How to get value of aura:id in js Controller
       var firstnum  = component.find('input1').get("v.value"); //how to get aura id
       console.log('firstnum:',firstnum);
       var secondnum = component.find('input2').get("v.value");
       console.log('secondnum:',secondnum);
       var result = component.find('result');
       result.set("v.value",firstnum+secondnum);//how to s et aura id
       //result.set("v.value",parseInt(firstnum) + parseInt(secondnum));
       console.log('result :'+result );
       */

       //How to get aura attribute
       /*
       var firstnum  = component.get("v.fnum"); 
       console.log('firstnum:',typeof firstnum);
       var secondnum = component.get("v.snum");
       console.log('secondnum:',typeof secondnum);
       component.set("v.res",parseInt(firstnum)+parseInt(secondnum));
       */
       
       var firstnum  = component.get("v.fnum"); 
       console.log('firstnum:',typeof firstnum);
       var secondnum = component.get("v.snum");
       console.log('secondnum:',typeof secondnum);
       
       //below code how to pass params to apex method
       var action = component.get("c.calculateValues");
       action.setParams({"firstnumb":firstnum , "secondnumb":secondnum });
       action.setCallback(this,function(response){
           console.log("response:",response);
           var state = response.getState();
           console.log("state:",state);
           if(state === "SUCCESS"){
            component.set("v.res",response.getReturnValue());

           }

       });
       $A.enqueueAction(action);
       

    }
})
