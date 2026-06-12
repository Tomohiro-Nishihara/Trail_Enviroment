public with sharing class StaticPattern {
    //staticがあると、変動し続ける
    public static String staticVariable = '静的-変数';
    //Staticがないと、トランザクションにポイントがある
    public String nonStaticVariable = '非静的-変数';
    
    //静的はインスタンス化することはできない。クラス内で共有されているため
    public static void MethodA() {
        // system.debug('静的');
        //system.debug(staticVariable);
    }
    
    public void MethodB() {
        system.debug('非静的');
        system.debug(nonStaticVariable);
        system.debug(staticVariable);
        nonStaticVariable = '非静的-変数-変更';
        staticVariable = '静的-変数-変更';
        system.debug(nonStaticVariable);
        system.debug(staticVariable);
    }
    
    
    public void MethodB(String param) {
        nonStaticVariable = param;
        staticVariable = param;
        system.debug(nonStaticVariable);
        system.debug(staticVariable);
        
    }
}