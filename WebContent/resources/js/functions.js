/**************************************************************************************************************/


//Validação dos formulários//

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
				url:"disponivel",
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
		
		senha:{
			required:"Digite a sua senha",
			minlength:"Digite uma senha de no mínimo 6 caracteres"
		},
		
		confSenha:{
			required:"Confirme sua senha",
			equalTo:"As senhas precisam ser iguais"
		},
		
		dataNascimento:{
			required:"Digite a data"
		},
		
		genero:{
			required:"Selecione um gênero"
		}
	
	}
	
	
});


});

/**************************************************************************************************************/


//Máscara da data//

$(document).ready(function(){
	/*$('.date').mask('00/00/0000',{
		alias:"dd/MM/yyyy",
		placeholder: "__/__/___"
	});*/
	
	$('#dataNascimento').inputmask("99/99/9999");

	
});

/**************************************************************************************************************/

//Impedir número no nome//

$(document).ready(function(){

	$("#nome").keypress(function(event){
	    var inputValue = event.charCode;
	    //alert(inputValue);
	    if(!((inputValue > 64 && inputValue < 91) || (inputValue > 96 && inputValue < 123)||(inputValue==32) || (inputValue==0))){
	        event.preventDefault();
	    }
	});
});

/**************************************************************************************************************/


//Validação login administrador

$("#formLoginAdmin").validate({
    rules : {
          email:{
                 required:true
          },
          senha:{
                 required:true
          }                                
    }, 
    messages:{
          email:{
                 required:"Campo E-mail precisa ser preenchido",
                 email:"Insira um endereço de e-mail válido."
          },
          senha:{
                 required:"Campo senha precisa ser preenchido"
          }    
    }
});

//Envio dos dados AJAX Seleção categoria

$(document).ready(function(){
	
	$('input[type=checkbox]').change(function(){
		
		if(this.checked){
	
			$.ajax({
	            url : 'userselect',
	            type : 'POST',
	            data : 'idCategoria=' + this.value + '&idUsuario='+1,
	            success: function(data){
	                $('#resultado').html(data);
	            }
	        });
			
		}else{
			
			$.ajax({
	            url : 'userunselect',
	            type : 'POST',
	            data : 'idCategoria=' + this.value + '&idUsuario='+1,
	            success: function(data){
	                $('#resultado').html(data);
	            }
	        });
		}
		
	});


});
