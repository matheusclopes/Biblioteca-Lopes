public class PesquisaContaController {
    @AuraEnabled
    public static List<Account> buscaConta(Id idRegistro, String name){
        List<Account> lstAccount = new List<Account>();
        if(idRegistro != null) lstAccount = [SELECT Id, Name, Phone, Email__c FROM Account WHERE Id =: idRegistro];
        if(name != null && idRegistro == null) lstAccount = [SELECT Id, Name, Phone, Email__c FROM Account WHERE Id =: name];
        
        return lstAccount;
    }
}