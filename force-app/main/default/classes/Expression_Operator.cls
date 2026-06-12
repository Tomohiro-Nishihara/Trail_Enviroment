public with sharing class Expression_Operator {
    public void Operator() {
        Integer a = 10;
        Integer b = 5;


        
        a++;
        b--;


        system.debug('Value resuleeet ' + a + ' Value result wawawawa ' + b); 

if (a > b && a != 11) {
    system.debug('a is greater than b');
} else if (a < b) {
    system.debug('a is less than b');
} else {
    system.debug('a is equal to b');       
    }
}
}