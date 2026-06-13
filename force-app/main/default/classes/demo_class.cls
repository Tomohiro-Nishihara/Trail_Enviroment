public with sharing class demo_class {
    
    public Integer multiplyNumbers(integer intone, Integer inttwo){
        return intone * inttwo;
    }

    public void caseUpdater(case casetoupdate){
        casetoupdate.subject = 'ケースの項目更新';
        update casetoupdate;   
    }
       
}