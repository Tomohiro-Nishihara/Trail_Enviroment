public with sharing class Collection_Test {
    public void Collection_Test() {
}


public void List_Test() {
List<String> myList = new List<String>();
myList.add('Hello');
myList.add('World');   
system.debug(myList[0]);
//リストは重複可能
List<Integer> myList2 = new List<Integer>();
myList2.add(0);
myList2.add(1);
myList2.add(2);
myList2.add(3);
myList2.add(1,30);
system.debug(myList2);
}



public void Set_Test() {
set<String> myList3 = new set<String>();
myList3.add('Hello');
myList3.add('World');   
system.debug(myList3);
//セットは重複不可
set<Integer> myList4= new set<Integer>();
myList4.add(0);
myList4.add(1);
myList4.add(2);
myList4.add(1);
//myList4.add(1,30);
system.debug(myList4);
}




}