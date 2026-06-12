public with sharing class FlowChart {
    //アルゴリズムー流れ図
    //順次処理
    public void jyunji(){
        system.debug('太郎');
        system.debug('次郎');
        system.debug('花子');
    }
    //選択処理
    public void sentaku(){
        integer age = 19;
        string sexual = 'male';
        
        if (sexual == 'male') {
            system.debug('男');
        }else if (sexual == 'female') {
            system.debug('女');
        }else {
        }
    }
    //繰り返し処理
    public void kurikaeshi(){
        integer intx = 1;
        while (intx <= 5) {
            system.debug('あいさつ' + intx + '回目');
            intx ++;
        }
        system.debug('こんばんは');
    }
    //複合
    public void fukugou(){
        integer intx = 1;
        string sexual = 'female';
        while (intx <= 5) {
            system.debug( intx + '回目');
            intx ++;
            system.debug('太郎');
            system.debug('次郎');
            
            if (sexual == 'male') {
                system.debug('男');
            }else if (sexual == 'female') {
                system.debug('女');
            }else {
            }
        }
        system.debug('こんば んは');
    }
}