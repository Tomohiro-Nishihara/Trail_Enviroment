public with sharing class TestDataFactory {
    public static List<Case> createcases(integer numCases){
        List<Case> caseList = new List<Case>();
        for(integer i = 0; i < numcases; i++){
            case newcase = new case(Subject = 'awesome case');
            caseList.add(newcase);
        }
        return caseList;
    }   
}

