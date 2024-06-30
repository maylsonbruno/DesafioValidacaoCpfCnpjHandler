/**
 * @author maylsonbruno
 */
public with sharing class LeadTriggerHandler  extends TriggerHandler{

    List<Lead> newLeads;
    Map<Id, Lead> oldLeads;

    LeadFilter filter;
   

    public LeadTriggerHandler() {
        this( (List<Lead>) Trigger.new
            , (Map<Id, Lead>) Trigger.oldMap );
    }

    public LeadTriggerHandler(List<Lead> newLeads
    , Map<Id, Lead> oldLeads) {

        this.newLeads = newLeads;
        this.oldLeads = oldLeads;

        this.filter = new LeadFilter();
       
    }

    override
    public void beforeInsert(){

       this.filter.validatorToInsertLeadWithWrong(this.newLeads);
    
    }
    

    override
    public void beforeUpdate(){

       this.filter.validatorToChangeLeadWithWrong(this.newLeads, this.oldLeads);

    }
}