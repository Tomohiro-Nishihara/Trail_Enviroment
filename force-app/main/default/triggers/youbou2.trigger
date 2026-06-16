trigger youbou2 on Contact (before insert, before update) {


    for (Contact con : Trigger.new) {

        // 電話番号が未入力の場合にエラー
        if (String.isBlank(con.Phone)) {
            con.addError('電話番号が未入力のため保存できません。');
        }
    }
}
