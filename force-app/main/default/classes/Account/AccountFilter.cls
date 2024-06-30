/**
* @author maylsonbruno
*/
public  class AccountFilter {
    
    Map<String, RecordTypeInfo> recordTypes = Account.getSObjectType()
        .getDescribe()
        .getRecordTypeInfosByDeveloperName();
    
    public void validatorToChangeAccountWithWrong(List<Account> newAccounts, Map<Id, Account> oldAccounts) {
        
        for (Account account : newAccounts) {
            
            Account oldAccount = oldAccounts.get(account.Id);                
            
            if ( String.isNotEmpty(account.CpfCnpj__c) ){
                
                if(account.RecordTypeId== this.recordTypes.get('PessoaFisica').getRecordTypeId()) {
                    if (!AccountCpfValidator.validatorCPF(account.CpfCnpj__c) && account.CpfCnpj__c != oldAccount.CpfCnpj__c){
                        account.CpfCnpj__c.addError('Documento Inválido');
                    }
                }
                
                if(account.RecordTypeId== this.recordTypes.get('PessoaJuridica').getRecordTypeId()){
                    if (!AccountCnpjValidator.validatorCNPJ(account.CpfCnpj__c) && account.CpfCnpj__c != oldAccount.CpfCnpj__c) {
                        account.CpfCnpj__c.addError('Documento Inválido');
                    }
                }
                
            }
        }
    }
    
    public void validatorToInsertAccountWithWrong(List<Account> newAccounts){
        
        for (Account account : newAccounts) {
            
            if ( String.isNotEmpty(account.CpfCnpj__c)) {
                
                if(account.RecordTypeId== this.recordTypes.get('PessoaFisica').getRecordTypeId()) {
                    if (!AccountCpfValidator.validatorCPF(account.CpfCnpj__c)){
                        account.CpfCnpj__c.addError('Documento Inválido');
                    }
                }
                
                if(account.RecordTypeId== this.recordTypes.get('PessoaJuridica').getRecordTypeId()){
                    if (!AccountCnpjValidator.validatorCNPJ(account.CpfCnpj__c)) {
                        account.CpfCnpj__c.addError('Documento Inválido');
                    }
                }
            }
        }
    }
}