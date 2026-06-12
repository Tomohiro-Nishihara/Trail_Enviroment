public with sharing class condtional_statement {
    
    public static string conditional_example(Contact cont){
        
        if(cont.FirstName == '田中'){
            return '牛若丸';
        }
        else if(cont.FirstName == '山田'){
            return '石原';
        }
        else{
            return '中山';
        }
        
        
        
    }
}