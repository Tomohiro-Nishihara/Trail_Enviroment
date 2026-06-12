public with sharing class Variable_Scope {
 
public String methodVariable = 'I am a method variable';


public void methodOne() {
 methodVariable = 'dsadasdasdas';
   System.debug(methodVariable);
}

public string methodTwo() {
   return 'comuter is running';


}
}