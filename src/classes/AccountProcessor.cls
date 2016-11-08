public class AccountProcessor {
    
    @future
    public static void countContacts(List<String> recordIds){
        
        List<Account> accountsToUpdate = new List<Account>();
        
        for (String theId : recordIds){
            theId.trim();
            Integer contactsCount = 0;
            List<Account> accts = [Select Name from Account where Id=:theId];
            List<Contact> contacts = [SELECT Id FROM Contact WHERE Account.Id = :theId];
            for (Contact con : contacts){
                contactsCount++;
            }
            //Should only be one but do loop anyways
            for (Account acct : accts){
                acct.Number_of_Contacts__c = contactsCount;
            	accountsToUpdate.add(acct);
            }
            
        }
        
        update accountsToUpdate;
        
    }
    

}