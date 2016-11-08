public class OppExtension {
     public Opportunity opp {get;set;}
    public OppExtension(ApexPages.StandardController controller) {
        this.opp = (Opportunity)controller.getRecord();   
                    
    }

}