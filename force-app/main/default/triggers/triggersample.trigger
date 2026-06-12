trigger triggersample on Contact (before update, after update) {

if(trigger.isbefore){
    system.debug('maedesu');
    //triggermethod();
   // System.debug('トリガーメソッドが呼ばれました');
}

if(trigger.isafter){
    system.debug('ato');
    //triggermethod();
   // System.debug('トリガーメソッドが呼ばれました');

   
}

    public static void triggermethod(){
System.debug('トリガーメソッドが呼ばれました');

    }
}