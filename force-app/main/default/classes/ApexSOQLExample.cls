public with sharing class ApexSOQLExample {
    Integer xx = 350000000;
    String sqlstr = 'select AnnualRevenue, LeadSource, CleanStatus, Address, Company from lead WHERE LeadSource IN : accountTypes';
    List<lead> leadList = Database.query(sqlstr);
    
    List<lead> acclist = new List<lead>();
    set<string> accountTypes = new Set<string>{'Phone Inquiry', 'Partner Referral'};
    Map<id, Lead> myMap = new Map<Id, Lead>([select AnnualRevenue, LeadSource,
CleanStatus, Address, Company from lead WHERE LeadSource IN : accountTypes]);
    
    public void sfdsfsd(){
        acclist = [select id, AnnualRevenue, CleanStatus, Address, Company from lead where AnnualRevenue = :xx];
        
        System.debug(acclist);
        System.debug(myMap);
        System.debug(leadList);
        
        
    }
}