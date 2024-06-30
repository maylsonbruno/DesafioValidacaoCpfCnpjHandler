/**
* @author maylsonbruno
*/
public class LeadFilter {
    
    Map<String, RecordTypeInfo> recordTypes = Lead.getSObjectType()
        .getDescribe()
        .getRecordTypeInfosByDeveloperName();
    
    public void validatorToChangeLeadWithWrong(List<Lead> newLeads, Map<Id, Lead> oldLeads) {
        
        for (Lead lead : newLeads) {
            
            Lead oldLead = oldLeads.get(lead.Id);                
            
            if ( String.isNotEmpty(lead.CpfCnpj__c) ){
                
                if(lead.RecordTypeId== this.recordTypes.get('PessoaFisica').getRecordTypeId()) {
                    if (!LeadCpfValidator.validatorCPF(lead.CpfCnpj__c) && lead.CpfCnpj__c != oldLead.CpfCnpj__c){
                        lead.CpfCnpj__c.addError('Documento Inválido');
                    }
                }
                
                if(lead.RecordTypeId== this.recordTypes.get('PessoaJuridica').getRecordTypeId()){
                    if (!LeadCnpjValidator.validatorCNPJ(lead.CpfCnpj__c) && lead.CpfCnpj__c != oldLead.CpfCnpj__c) {
                        lead.CpfCnpj__c.addError('Documento Inválido');
                    }
                }
                
            }
        }
    }
    
    public void validatorToInsertLeadWithWrong(List<Lead> newLeads){
        
        for (Lead lead : newLeads) {
            
            if ( String.isNotEmpty(lead.CpfCnpj__c)){
                
                if(lead.RecordTypeId== this.recordTypes.get('PessoaFisica').getRecordTypeId()) {
                    if (!LeadCpfValidator.validatorCPF(lead.CpfCnpj__c)){
                        lead.CpfCnpj__c.addError('Documento Inválido');
                    }
                }
                
                if(lead.RecordTypeId== this.recordTypes.get('PessoaJuridica').getRecordTypeId()){
                    if (!LeadCnpjValidator.validatorCNPJ(lead.CpfCnpj__c)) {
                        lead.CpfCnpj__c.addError('Documento Inválido');
                    }
                }
            }
        }
    }
}