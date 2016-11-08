@isTest
public class AccountProcessorTest {
    
    @isTest
    public static void testCountContacts(){
        
        List<String> ids = new List<String>();
        Account[] accts = TestDataFactory.createAccountsWithContacts(5,5);
        for(Account acct : accts){
            ids.add(acct.Id);
        }
        
        Test.startTest();
        AccountProcessor.countContacts(ids);
        Test.stopTest();
    }

}