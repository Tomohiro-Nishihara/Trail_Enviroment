@isTest
public with sharing class Demo_Test {
    @isTest
    static void testMultiplyNumbers() {

Test.startTest();
        Demo demo = new Demo();
        Integer result = demo.multiplyNumbers(3, 4);
        result = demo.divideNumbers(12, 4);

    //  caseUpdater(new Case(Id = '5001t0000012345', Subject = 'Test Case'));
Test.stopTest();
//assert.areEqual(3, result);
 }
}