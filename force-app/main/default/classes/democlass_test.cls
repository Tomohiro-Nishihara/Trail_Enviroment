@isTest
public with sharing class democlass_test {
    @isTest
    public static void multiplenumbers(){
        demo_class sdsd = new demo_class();
        integer sss = sdsd.multiplyNumbers(3, 4);
        Assert.areEqual(12, sss, '計算が正しくありません');
    }
    @isTest
    public static void caseupdater_pos(){
        case newcase = new case(Subject ='hi there');
        insert newcase;
    }
}