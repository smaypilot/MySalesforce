@isTest
global class AccountManagerTest {
    
    @isTest static void testGetAccount() {
        Id recordId = createTestRecord();
        // Set up a test request
        RestRequest request = new RestRequest();
        request.requestUri =
            'https://na24.salesforce.com/services/apexrest/Accounts/'
            + recordId + '/Contacts';
        request.httpMethod = 'GET';
        RestContext.request = request;
        // Call the method to test
        Account thisAccount = AccountManager.getAccount();
        // Verify results
        System.assert(thisAccount != null);
        System.assertEquals('TestAccount', thisAccount.Name);
    }
    
    // Helper method
    static Id createTestRecord() {
        
        // Create test record
        Account accountTest = new Account(Name='TestAccount');
        insert accountTest;
        List<Contact> contacts = new List<Contact>();
        for (Integer i = 0; i < 5; i++ ){
            Contact contact = new Contact();
            contact.LastName = 'TestContact'+ i;
            contact.AccountId = accountTest.id;
            System.debug('contact='+contact);
            contacts.add(contact);
        }
        insert contacts;
        System.debug('contacts='+contacts);
        System.debug('accounts and contact='+[SELECT Account.ID, Account.Name, (SELECT Contact.ID, Contact.LastName FROM Account.Contacts where Account.id = :accountTest.id) FROM Account WHERE Account.id = :accountTest.id]);
        return accountTest.Id;
    
    }

}