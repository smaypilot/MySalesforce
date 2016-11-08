trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
    List<Task> tasks = new List<Task>();
    for (Opportunity opp : [SELECT ID FROM Opportunity WHERE ID IN :trigger.new AND StageName = 'Closed Won']){
        Task newTask = new Task(Subject='Follow Up Test Task', WhatId=opp.Id);
        tasks.add(newTask);
    }
    
    insert tasks;
    
    

}