public class ContactSearch {
    
    public static List<Contact> searchForContacts (String contactLastName, String contactPostalCode){
        
        List<Contact> contactList = [Select ID, Contact.Name from Contact where Contact.LastName = :contactLastName and Contact.MailingPostalCode = :contactPostalCode];
        
        return contactList;
    }
    
}