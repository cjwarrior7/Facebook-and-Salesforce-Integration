({
    startTest : function(component, event, helper) {
    var studName = component.find('name').get('v.value');
    console.log('Name:',studName)
       if(studName != null && studName != '' ){
         helper.getQuestions(component, event, helper);
        }
        else{
            alert('Enter Student Name');
        }

    },
    submitTest : function(component, event, helper) {
     var questionReview = component.get("v.QuestionWrapper");
     var score = 0;
     for(var i=0 ; i < questionReview.length ; i++){
         if(questionReview[i].question.Answer__c == questionReview[i].selectedAnswer){
             score++;
         }
     }
     alert("Your Score is:"+score);
     location.reload();
    }
})
