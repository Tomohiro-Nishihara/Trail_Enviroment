trigger youbou3 on Opportunity (before delete){
    
    for (Opportunity opp : Trigger.old) {
        opp.addError('削除権限がありません');
    }

}

