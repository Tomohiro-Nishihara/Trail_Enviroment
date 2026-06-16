@isTest
public class oppouptest {

    @isTest
    static void testClosedWonUpdatesAccount() {

        // 1. 取引先を作成
        Account acc = new Account(
            Name = 'Test Account'
        );
        insert acc;

        // 2. 商談を作成（まだ Closed Won ではない）
        Opportunity opp = new Opportunity(
            Name = 'Test Opportunity',
            StageName = 'Prospecting',
            CloseDate = Date.today(),
            AccountId = acc.Id
        );
        insert opp;

        // 3. 商談を Closed Won に更新（トリガー発火ポイント）
        opp.StageName = 'Closed Won';
        update opp;

        // 4. 親取引先を再取得して検証
        Account updatedAcc = [
            SELECT Id, agreementdate__c
            FROM Account
            WHERE Id = :acc.Id
        ];

        // 5. アサーション（今日の日付がセットされていること）
        System.assertEquals(
            Date.today(),
            updatedAcc.agreementdate__c,
            'Closed Won になったら agreementdate__c が今日の日付に更新されるべき'
        );
    }
}
