public class ContactController {
    @AuraEnabled
    public static void createContact(Contact cont){
     //Contact con = new Contact();
     //con.FirstName = cont.FirstName;
     //con.LastName = cont.LastName;
     //con.Phone = cont.Phone;
     System.debug('cont:'+cont.firstName);
     insert cont;
    }

    @AuraEnabled
    public static List<Contact> retrieveContacts(){
        return [Select id, FirstName, LastName, Phone, email FROM Contact order by createdDate DESC LIMIT 5];
     
    }
}