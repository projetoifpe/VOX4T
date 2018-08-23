
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
			remote: "Esse email já Existe"
		},
	}
});
});

/**************************************************************************************************************/


//Máscara da data//

$(document).ready(function () {
    $('#dataNascimento').inputmask('99/99/9999');
});



/**************************************************************************************************************/

//Jquery da edição de usuario//

$(document).ready(function(){
// var conteudo = $("#nome").val();
    $("#nome").mousedown(function(){
    	$("#nome").val('');
        });
    
    /*$("#nome").focusout(function(){
    	if($("#nome").val(null)){
    		$("#nome").val(conteudo);
    	}else {
    		$("#nome").val('caso2');
    	}
    });*/
    
    $("#email").mousedown(function(){
    	$("#email").val('');
        });

    $("#dataNascimento").mousedown(function(){
    	$("#dataNascimento").val('');
        });


});
/**************************************************************************************************************/
