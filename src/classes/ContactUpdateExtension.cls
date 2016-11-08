public with sharing class ContactUpdateExtension {
  public String statusToSet {get;set;}
  private Contact c;
  
  public ContactUpdateExtension(ApexPages.StandardController ctr) {
    c = [SELECT Status__c FROM Contact WHERE Id=: ctr.getRecord().Id]; 
    statusToSet = c.Status__c;
  }
  public PageReference updateStatus() {
    System.debug('Entered updateStatus');
    // Check if the user has update access on the Contact.Name field
    if (!Schema.sObjectType.Contact.fields.Status__c.isUpdateable()){
      System.debug('not updateable');
      return null;
    }
    c.Status__c = statusToSet;
    System.debug('c.Status__c='+c.status__c);
    update c;
    return null;
  }
}