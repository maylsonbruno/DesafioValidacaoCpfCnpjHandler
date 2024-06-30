/**
 * @author maylsonbruno
 */
public with sharing class AccountTriggerHandler extends TriggerHandler{
   
    List<Account> newAccounts;
    Map<Id, Account> oldAccounts;

    AccountFilter filter;

    public AccountTriggerHandler() {
        this( (List<Account>) Trigger.new
            , (Map<Id, Account>) Trigger.oldMap );
    }

    public AccountTriggerHandler(List<Account> newAccounts
    , Map<Id, Account> oldAccounts) {

        this.newAccounts = newAccounts;
        this.oldAccounts = oldAccounts;
        this.filter = new AccountFilter();
       
    }

    override
    public void beforeInsert() {
        
        this.filter.validatorToInsertAccountWithWrong(this.newAccounts);

    }

    override
    public void beforeUpdate() {

       this.filter.validatorToChangeAccountWithWrong(this.newAccounts, this.oldAccounts);
}
}