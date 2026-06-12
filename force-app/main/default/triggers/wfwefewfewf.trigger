trigger wfwefewfewf on account (before insert, after insert) 
{
 
 

    if(trigger.new != null && trigger.isbefore){
System.debug(trigger.new);
coolmethod();
    }
    
    public static void coolmethod(){
        System.debug('表示１');
  //if(account cont: trigger.new){
//System.debug(cont);
//coolmethod();
    }

    }