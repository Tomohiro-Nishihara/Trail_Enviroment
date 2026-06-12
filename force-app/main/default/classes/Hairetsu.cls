public with sharing class Hairetsu {
    //コンストラクタ
    public void Hairetsu() {}
    
    //リストは重複可能 順序がある
    public void List_Test() {List<String> myList = new List<String>();
        myList.add('Hello');        
        myList.add('World');
        system.debug(myList[1]);        
        List<Integer> myList2 = new List<Integer>();
        myList2.add(0);
        myList2.add(1);        
        myList2.add(2);
        myList2.add(3);
        //myList2.add(1,30);
        integer ww = myList2.get(3);
    System.debug(ww);}
    
    
    //セットは重複不可　必ず値が一位であることを保証する 順序はない
    public void Set_Test() {
        set<String> myList3 = new set<String>();
        myList3.add('aWorld');
        myList3.add('Hello');
        myList3.add('WoFASFSArld');
        system.debug(myList3);
        set<Integer> myList4= new set<Integer>();
        myList4.add(0);
        myList4.add(1);
        myList4.add(2);
        myList4.add(1);
        system.debug(myList4);
    }
    
    
    
    //マップはキーと値のペアでデータを格納する　キーは重複不可　順序はない
    public void Map_Test() {
        Map<String, decimal> myMap = new Map<String, decimal>();
        myMap.put('Apple', 1);
        myMap.put('Banana', 9);
        myMap.put('Cherry', 3);
        myMap.put('Lemon', 4);
        system.debug(myMap);
        myMap.put('Banana', 3);
        system.debug(myMap);
    }
    
    
}