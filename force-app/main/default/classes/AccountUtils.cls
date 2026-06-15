public with sharing class AccountUtils {
    public List<Account> accountsByState(string Industry) {
        List<Account> myAccounts = [SELECT Id, Name FROM Account where billingState = :Industry];
        return myAccounts;
        
    }
}