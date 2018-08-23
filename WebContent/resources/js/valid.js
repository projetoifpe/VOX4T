$(document).ready(function(){

	$('#cadastroForm').validate({
		rules:{
			nome:{
				required:true
			},
			email:{
				required:true,
				email:true,
				remote:{
					url:"verificarEmail",
					type:"get",
					data:{
						email: function(){
							
								return $("#email").val();	
							
						}
					}
				}
			},
			senha:{
				required:true
			},
			confSenha:{
				required:true,
				equalTo:"#senha"
			},
			dataNascimento:{
			}
		},
	messages:{
		
		nome:{
			required:"Digite um nome"
		},
		
		email:{
			required:"Digite um email",
			email: "Digite um email válido",
			remote: "Esse email já está sendo usado"
		},
	}
});
});

/**************************************************************************************************************/


function dataConta(c){
  if(c.value.length ==2){
	c.value += '/';
	  }
  if(c.value.length ==5){
		c.value += '/';
	  }
  }



/**************************************************************************************************************/