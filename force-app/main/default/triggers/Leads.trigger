/**
* @author maylsonbruno
*/
trigger Leads on Lead (before insert,before update) {
    
   new LeadTriggerHandler().run();
}