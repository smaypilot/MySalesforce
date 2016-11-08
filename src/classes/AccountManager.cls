@RestResource(urlMapping='/Accounts/*/Contacts')
global with sharing class AccountManager {
    
    @HttpGet
    global static Account getAccount() {
        RestRequest request = RestContext.request;
        // grab the caseId from the end of the URL
        
        String part1 = request.requestURI.substringBeforeLast('/');
        String accountId = part1.substring(part1.lastIndexOf('/')+1);
        System.debug('acountId='+accountId);
        
        Account result =  [SELECT Account.ID, Account.Name, (SELECT Contact.ID, Contact.LastName FROM Account.Contacts) FROM Account WHERE Account.id = :accountId];
        System.debug('result='+result);
        return result;
    }

}