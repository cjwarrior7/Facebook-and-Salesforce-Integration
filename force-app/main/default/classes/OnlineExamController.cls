public  class OnlineExamController {
    @AuraEnabled
    public static List<QuestionWrapper> getAllQuestions(){
    List<QuestionWrapper> qwList = new List<QuestionWrapper>();
    List<Question__c> questionList = [SELECT Id, question__c, Answer__c, IsActive__c, OptionA__c, Option_B__c, Option_C__c, Option_D__c FROM Question__c ];
    if(questionList != null && questionList.size() > 0){
        Integer i = 1;
        for (Question__c que : questionList) {
            List<Options> optionList = new List<Options>(); 
            QuestionWrapper quewrap = new QuestionWrapper();
            quewrap.question = que;
            quewrap.qNo = i;
            i++;
            quewrap.selectedAnswer = '';
            optionList.add(new Options(que.OptionA__c ,'A'));
            optionList.add(new Options(que.Option_B__c ,'B'));
            optionList.add(new Options(que.Option_C__c , 'C'));
            optionList.add(new Options(que.Option_D__c , 'D'));
            quewrap.options = optionList;
            qwList.add(quewrap);

        }
        return qwList;
    } 
    else{
        return null;
    }
      
    }

public class QuestionWrapper {
@AuraEnabled
public Question__c question;
@AuraEnabled
public Integer qNo;
@AuraEnabled
public List<Options> options;
@AuraEnabled
public String selectedAnswer;


}
public class Options {
@AuraEnabled
public String label;
@AuraEnabled
public String value ;

public Options(String label,String value){
this.label = label;
this.value = value;
}
}
}
