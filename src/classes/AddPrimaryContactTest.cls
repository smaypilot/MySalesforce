@isTest
public class AddPrimaryContactTest {
    @testSetup
    static void setup(){
        List<Account> accountsToInsert = new List<Account>();
        String[] states = new String[]{'NY', 'CA'};
        for (String state : states){
            for (Integer i = 0; i < 50; i++){
            	accountsToInsert.add(new Account(Name='Account'+i, BillingState=state));
        	}    
        }
        insert accountsToInsert;
    }
    
    static testMethod void testAddPrimaryContact(){
        
        Contact con = new Contact(LastName='TestContact');
        insert con;
        AddPrimaryContact apc = new AddPrimaryContact(con, 'CA');
        Test.startTest();
        System.enqueueJob(apc);
        Test.stopTest();
        
       	System.assertEquals(50, [Select count() from Contact where Account.BillingState = 'CA']);
        
    }

}