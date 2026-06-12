public with sharing class literation {
    public void collectionFun(List<Contact> a){
        
        //for文　繰り返し
        for(integer i = 0; i<a.size(); i++){
            System.debug(a.size());
            System.debug(i);
            system.debug(a[i].LastName);
            a[i].lastName = '上書き';
            System.debug(a[i].LastName);
            insert a[i];//ガバナ制限にかかるからfor文の中にSQLを書かない
            //for文の中にfor文を書かない--重くなる
        }
    }
    public void collectionFun2(List<Contact> b){
        //拡張for文　繰り返し
        for(Contact xxxx: b){
            System.debug(xxxx.LastName);
            xxxx.LastName = '上書き';
            
            System.debug(xxxx.LastName);
            
            
        }
    }
    
}