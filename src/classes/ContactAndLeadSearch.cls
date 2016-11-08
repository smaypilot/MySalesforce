public class ContactAndLeadSearch {
    
    public static List<List< SObject>> searchContactsAndLeads (String searchItem){
        return [FIND :searchItem IN ALL Fields RETURNING Contact(FirstName, LastName), Lead(FirstName, LastName)];
    }

}