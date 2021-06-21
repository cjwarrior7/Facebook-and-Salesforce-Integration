public class TestFbPage {
    
    public String idInfo{get;set;}
    public String nameInfo{get;set;}
    public String websiteInfo{get;set;}
    public Integer fancountInfo{get;set;}
   
    public TestFbPage() {

        Http http = new  Http();
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://graph.facebook.com/104699321865341?fields=id,name,website,fan_count,posts&access_token=EAAHACWJrUs4BAMIEvVxllpdxNO3gYHoZCXmuXeweTGOzhDswoZBTfGMLsMBs5eJLnweVfu2MLKCm8IodOiOLPQl6X7JL3SETayeDtMEfwFCpjpTl8UiXA9l1MF9oUHNZBHFXCwNzxAZBkUALfZANoZBKBXMFkLT9HeGp0U0SdRYfLeF7zdlIX1pV4YZCZBrVe4pjnxVrb1itGAZDZD');
        req.setMethod('GET');
        HttpResponse resp = http.send(req);
        String response = resp.getBody();
        System.debug('response'+response);
        JSON2Apex wrapper = JSON2Apex.parse(response);
        idInfo = wrapper.id;
        nameInfo = wrapper.name;
        fancountInfo = wrapper.fan_count;

}
    public List<PieWedgeData> getPieData(){

          List<PieWedgeData> data = new List<PieWedgeData>();
          data.add(new PieWedgeData('Total Fan Count',fancountInfo));
          return data;
        
    }
    
    class PieWedgeData {
        public String fanType{get;set;}
        public Integer fanCount{get;set;}
        public PieWedgeData(String fanType,Integer fanCount){
            this.fanType = fanType;
            this.fanCount = fanCount;
            
        }
    }

}