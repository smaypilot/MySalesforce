trigger AccountAddressTrigger on Account (before insert, before update) {
    
    for(Account acct : trigger.new){
        if(acct.BillingPostalCode.length() > 0 && acct.Match_Billing_Address__c == true){
            acct.ShippingPostalCode = acct.BillingPostalCode;
        }
    }
}