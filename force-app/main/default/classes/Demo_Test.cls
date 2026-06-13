//テストクラスの宣言
@isTest
public with sharing class Demo_Test {
    
    //開始時にデータ作成
    @TestSetup
    public static void makeData(){
        List<case> caselist = TestDataFactory.createcases(3);
        insert caselist;
    }
    
    //テストメソッドの宣言
    @isTest
    public static void testMultiplyNumbers() {
        demo_class demo = new demo_class();
        Integer result = demo.multiplyNumbers(3, 4);
        Assert.areEqual(12, result, 'the return message is not true');
    }
    
    
    //テストメソッドの宣言
    @isTest
    public static void caseUpdater(){
        case newcase = new case(Subject='hi there');
        insert newcase;
        demo_class demo = new demo_class();
        demo.caseupdater(newcase);
        
        
        
    }
    //プライベートメソッドのテスト 普通はやらない　　ほとんど使わない
    @testvisible
    private void updatecasedescription(){
        
    }
    
}