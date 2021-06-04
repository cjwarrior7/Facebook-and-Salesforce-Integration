public with sharing class NewsController {

    @AuraEnabled
    public static Map<String,object> retriveNews(){
        HttpRequest req = new HttpRequest();
        req.setEndpoint('http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey='+ system.label.NewsAppKey);
        req.setMethod('GET');
        Map<String,object> newsJsonData = new  Map<String,object>();

        String strResponse;
   
        Http http = new Http();
        HttpResponse httpResp = http.send(req);

        if(httpResp.getStatusCode() == 200){
            strResponse = httpResp.getBody();
        }

        if(!String.isBlank(strResponse)){
            newsJsonData = (Map<String,object>)JSON.deserializeUntyped(strResponse);
        }

        if(!newsJsonData.isEmpty())
          return newsJsonData;

        return null;
        }

}
