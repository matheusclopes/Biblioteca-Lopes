trigger RegistroDeEmprestimoTrigger on Registro_de_Emprestimo__c (after insert, after update) {
    
    boolean afterInsert = trigger.isAfter && trigger.isInsert;  
    boolean afterUpdate = trigger.isAfter && trigger.isUpdate;
    
    //if(afterInsert || afterUpdate) RegistroDeEmprestimoHandler.disparoDeEmailEmprestimo(trigger.new);
}