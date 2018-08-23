$(document).ready(function(){
		$("#inputSenha").hide();
		$("#cancelarSenha").hide();
		
        $("#linkSenha").click(function(){
        	$("#inputSenha").show();
        	$("#cancelarSenha").show();
          });
        $("#cancelarSenha").click(function(){
        	$("#inputSenha").hide();
        	$("#cancelarSenha").hide();
          });
      });