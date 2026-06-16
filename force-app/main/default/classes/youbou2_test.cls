@istest
public with sharing class youbou2_test {
    public youbou2_test() {
  // 電話番号がある場合 → 正常に保存できる
    @isTest
    static void testContactWithPhone() {

        Contact con = new Contact(
            LastName = 'Test User',
            Phone = '090-1111-2222'
        );

   //     Test.startTest();
        insert con;
   //     Test.stopTest();

        // 正常に保存されていることを確認
        System.assertNotEquals(null, con.Id);
    }


    // 電話番号がない場合 → エラーになる
 //   @istest
  //  static void testContactWithoutPhone() {

    //    Contact con = new Contact(
      //      LastName = 'Test User'
            // Phone 未入力
        //);

      //  Test.startTest();
        //try {
         //   insert con;
         //   System.assert(false, 'エラーが発生するはずなのに、発生しませんでした。');
        //} catch (DmlException e) {
         //   System.assert(e.getMessage().contains('電話番号が未入力のため保存できません。'));
       // }
     //   Test.stopTest();


    }
}



    // 電話番号がある場合 → 正常に保存できる
    @isTest
    static void testContactWithPhone() {

        Contact con = new Contact(
            LastName = 'Test User',
            Phone = '090-1111-2222'
        );

      //  Test.startTest();
        insert con;
    //    Test.stopTest();

        // 正常に保存されていることを確認
        System.assertNotEquals(null, con.Id);
    }


  