public class NewCaseListController {
    
    
    public List<Case> getNewCases(){
        List<Case> results = [Select ID, CaseNumber from Case where status = 'new'];
		System.debug('results='+results);
        return results;
    }

}