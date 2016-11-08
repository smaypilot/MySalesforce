global class DailyLeadProcessor implements Schedulable{
    
    global void execute(SchedulableContext sContext){
       
        List<Lead> leads = [Select ID from Lead where LeadSource = '' or LeadSource = null Limit 200];
        for (Lead lead : leads){
            lead.LeadSource = 'Dreamforce ';
        }
        update leads;
    }
    

}