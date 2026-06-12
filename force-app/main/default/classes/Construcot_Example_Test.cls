@istest
public with sharing class Construcot_Example_Test {
    
static testMethod void testConstructor() 
{
//Test.startTest();

constructor_Example example = new constructor_Example('Alice Smith');
constructor_Example example2 = new constructor_Example();

//Test.stopTest();
}
    
}