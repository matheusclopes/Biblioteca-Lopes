public class RegistroDeEmprestimoHandler {
    
    public static void disparoDeEmailEmprestimo(List<Registro_de_Emprestimo__c>lstNewRegistroDeEmprestimo){
        Set<String> lstLeitor = new Set<String>();
        String emailLeitor;
        
        for(Registro_de_Emprestimo__c regEmprestimoQuery : [SELECT Id, Cadastro_de_Leitor__c FROM Registro_de_Emprestimo__c WHERE Id =: lstNewRegistroDeEmprestimo]){
            lstLeitor.add(regEmprestimoQuery.Cadastro_de_Leitor__c); 
        }
        
        for(Cadastro_de_Leitor__c cadastroLeitor : [SELECT Id, Email__c FROM Cadastro_de_Leitor__c WHERE Id =: lstLeitor]){
            emailLeitor = cadastroLeitor.Email__c;
        }
        System.debug(emailLeitor);
        for(Registro_de_Emprestimo__c regEmprestimo : lstNewRegistroDeEmprestimo){
            if(regEmprestimo.Emprestar_Livro__c){
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                
                String[] toAddresses = new String[] {emailLeitor};
                mail.setToAddresses(toAddresses);
                mail.setSubject('Empréstimo de Livro');
                mail.setHtmlBody('<p><strong>Empréstimo de Livro</strong></p><p>Empréstimo realizado com sucesso!</p>');
                Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
            }
        }   
    }
}