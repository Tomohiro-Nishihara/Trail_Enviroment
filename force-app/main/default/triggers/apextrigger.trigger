trigger apextrigger on Opportunity (before update, after update) {
    // 更新対象の取引先を格納
    Map<Id, Account> accountsToUpdate = new Map<Id, Account>();
    for (Opportunity opp : Trigger.new) {
        Opportunity oldOpp = Trigger.oldMap.get(opp.Id);
        // フェーズが「受注」に変わった瞬間だけ実行
        if (opp.StageName == 'Closed Won' && oldOpp.StageName != 'Closed Won') {
            // 親取引先が存在する場合のみ
            if (opp.AccountId != null) {
                System.debug('rrrrrrrrrrrrrrrrrrrrrrrrr');
                // 例：取引先の項目を更新したい場合
                Account acc = new Account(
                    Id = opp.AccountId,
                // ここに更新したい項目を書く
                // Contract_Start_Date__c = opp.CloseDate
                agreementdate__c = Date.today()
                    );
                accountsToUpdate.put(acc.Id, acc);
            }
        }
    }
    
    // DML 実行
    if (!accountsToUpdate.isEmpty()) {
        update accountsToUpdate.values();
    }
}