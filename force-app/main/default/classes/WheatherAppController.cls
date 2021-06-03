public class WheatherAppController {
    @AuraEnabled
    public static Decimal getWheatherDetails(String cityName){
      String temperature;
      Decimal convTemp;
      String endpoint = 'https://api.openweathermap.org/data/2.5/weather?q='+cityName+'&appid='+System.label.OpenWheatherAPI ;
      Http http = new Http();
      HttpRequest req = new  HttpRequest();
      req.setMethod('GET');
      req.setEndpoint(endpoint);
      HttpResponse resp = http.send(req);
      String body = resp.getBody();
      System.debug('resp:'+body);
        if(resp.getStatusCode() == 200){
            JSONParser parser = JSON.createParser(body);
            While(parser.nextToken() != null){
                String key = parser.getText();
                    if(key == 'temp'){
                        parser.nextToken();
                        temperature = (String)parser.getText();
                        convTemp =  decimal.valueOf(temperature) - 273;
                        System.debug('TTTT'+convTemp);
                        
                    }
                
            }
        }
      return convTemp;
    }
    
}