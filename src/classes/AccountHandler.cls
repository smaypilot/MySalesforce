public class AccountHandler {
    
    public static Account insertNewAccount (String accountName){
        
        try{
            Account newAcct = new Account();
            newAcct.Name = accountName;
            insert newAcct;
            return newAcct;
        } Catch (DmlException e){
            System.debug('Insert DMLException Occured.  accountName param ='+accountName);
            return null;
        }
        
        
    }

}