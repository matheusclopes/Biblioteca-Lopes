({
	init : function(component, event, helper) {
		component.set('v.columns', [
            {label: 'Nome', fieldName: 'Name', type: 'text'},
            {label: 'Telefone', fieldName: 'Phone', type: 'phone'},
            {label: 'Email', fieldName: 'closeDate', type: 'text'}
        ]);	
	},
    
    buscarConta : function(component, event, helper){
        //Nome do método apex
        var action = component.get("c.buscaConta");
        //Passa parametros
        action.setParams({
            "idRegistro" : idRegistro,
            "name" : name});
        
        action.setCallback(this, function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                var retorno = response.getReturnValue();
                component.set("v.acctList", response.getReturnValue());
                Console.log(retorno);
            }else{
                console.log(response.getError()[0]);
            }
        });
        $A.enqueueAction(action);
    }
})