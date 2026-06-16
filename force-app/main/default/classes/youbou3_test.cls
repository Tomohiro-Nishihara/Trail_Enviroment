@isTest
public class youbou3_test {

    @isTest
    static void testDeleteBlocked() {

        // まず商談を作成
        Opportunity opp = new Opportunity(
            Name = 'Test Opportunity',
            StageName = 'Prospecting',
            CloseDate = Date.today()
        );
        insert opp;

       // Test.startTest();
        try {
            delete opp;
            System.assert(false, '削除が成功してしまいました。エラーが発生するべきです。');
        } catch (DmlException e) {
            System.assert(
                e.getMessage().contains('削除権限がありません'),
                '期待したエラーメッセージが含まれていません。'
            );
        }
     //   Test.stopTest();
    }
}
