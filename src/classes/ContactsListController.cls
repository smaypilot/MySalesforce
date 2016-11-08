public class ContactsListController {
private String sortOrder = 'LastName';
    
    public List<Contact> getContacts() {
        
        List<Contact> results = Database.query(
            'SELECT Id, Attended_Status__c, FirstName, LastName, Title, Email ' +
            'FROM Contact ' +
            'ORDER BY ' + sortOrder + ' ASC ' +
            'LIMIT 10'
        );
        return results;
    }
    
    public void sortByLastName() {
        this.sortOrder = 'LastName';
    }
        
    public void sortByFirstName() {
        this.sortOrder = 'FirstName';
    }
    
    
    
}