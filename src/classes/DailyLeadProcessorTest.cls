@isTest
public class DailyLeadProcessorTest {
    
    // Dummy CRON expression: midnight on March 15.
    // Because this is a test, job executes
    // immediately after Test.stopTest().
    public static String CRON_EXP = '0 0 0 15 3 ? 2022';
    
    @testSetup
    static void setup(){
        
        List<Lead> leads = new List<Lead>();
        for (Integer i = 0; i < 200; i++){
        	leads.add(new Lead(LastName='SomeLastName'+i, Company='SomeCompany'+i, Status='Open - Not Contacted'));
        }
        insert leads;
        
    }
    
    public static TestMethod void testScheduleDailyLeadProcessor(){
        
       	Test.startTest();
        String jobId = System.schedule('ApexScheduledJob', CRON_EXP, new DailyLeadProcessor());
        System.assertEquals(0, [Select count() from Lead where LeadSource != ''], 'Before Test.stopTest()');
        Test.stopTest();
        System.assertEquals(200, [Select count() from Lead where LeadSource != ''], 'After Test.stopTest()');


        
        
    }

}