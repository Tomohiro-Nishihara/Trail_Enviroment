public with sharing virtual class Car 
{
    protected string carType;
    //車が存在する必要がないー静的変数
    public static integer existingCarInstances;
    
    public void driveCar() {
        System.debug(carType);
    }

    //車が存在する必要がないー静的メソッド～各車に対して一意である必要がない
    public static integer staticMethod(integer num) {
        System.debug('静的メソッド');
        return 1;
    }

}