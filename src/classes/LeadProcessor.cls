global class LeadProcessor implements Database.Batchable<sObject>, Database.Stateful  {
    
    // instance member to retain state across transactions
    global Integer recordsProcessed = 0;

    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT ID FROM Lead'
        );
    }

    global void execute(Database.BatchableContext bc, List<Lead> scope){
        // process each batch of records
        List<Lead> leads = new List<Lead>();
        for (Lead lead : scope) {
           	lead.LeadSource = 'Dreamforce';
           	leads.add(lead);
            recordsProcessed++;
        }
        update leads;
    }    

    global void finish(Database.BatchableContext bc){
        System.debug(recordsProcessed + ' records processed. Shazam!');
        AsyncApexJob job = [SELECT Id, Status, NumberOfErrors, 
            JobItemsProcessed,
            TotalJobItems, CreatedBy.Email
            FROM AsyncApexJob
            WHERE Id = :bc.getJobId()];
        // call some utility to send email
        System.debug('Records Processed=' + recordsProcessed + ' ;Job Id=' + job.Id + ' ;Job Status=' + Job.Status);
        //EmailManager.sendMail('smaypilot@gmail.com', 'My batch upload', 'Records Processed=' + recordsProcessed + ' ;Job Id=' + job.Id + ' ;Job Status=' + Job.Status);
    }    

}