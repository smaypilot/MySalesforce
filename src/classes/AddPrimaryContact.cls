public class AddPrimaryContact implements Queueable {
    
    String state;
    Contact contact;
    public AddPrimaryContact(Contact contact, String state){
        this.state = state;
        this.contact = contact;
    }
    
    public void execute(QueueableContext qc){
        List<Account> accts = [Select Id from Account where BillingState = :this.state LIMIT 200];
        List<Contact> contactsToInsert = new List<Contact>();
        for (Account account : accts){
        	Contact con = contact.clone();
            con.AccountId = account.Id;
            contactsToInsert.add(con);
        }
        insert contactsToInsert;
    }

}