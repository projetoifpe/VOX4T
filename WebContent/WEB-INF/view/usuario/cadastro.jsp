<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="http://code.jquery.com/jquery.min.js"></script>
<link rel="stylesheet" href="http://jqueryvalidation.org/files/demo/site-demos.css">
 <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.min.js"> </script> 
<link href="Content/Style.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.10.0/jquery.validate.min.js"></script>
<script>

$(document).ready(function() {
    $('#contactForm').bootstrapValidator({
    	 container: '#messages',
    	        feedbackIcons: {
    	        	valid: 'glyphicon glyphicon-ok',
    	            invalid: 'glyphicon glyphicon-remove',
    	            validating: 'glyphicon glyphicon-refresh'
    	        },



    	        fields: {
    	          	email: {
    	          		required: true,
    	          			email: true,
    	               validators: {
    	                   notEmpty: {
    	                       message: 'Email não informado'
    	                   },
    	                   emailAddress: {
    	                       message: 'Insira um email válido'
    	                   }
    	               }
    	           },
    	           
    	           key: {
    	       	   	validators: {
    	       	   	  notEmpty: {
    	                       message: 'Informe uma senha'
    	                   },
    	                   stringLength: {
    	                       min: 6,
    	                       max: 45,
    	                       message: 'Mínimo 6 caracteres'
    	               }
    	           }
    	           },
    	           
    	           confSenha: {
    	              	validators: {
    	                   notEmpty: {
    	                       message: 'Confirme sua senha'
    	                   },
    	                   stringLength: {
    	                       min: 6,
    	                       max: 45,
    	                       message: 'Mínimo 6 caracteres'
    	               
    	           }
    	           	}
    	       	
    	           },
    	           
    	           sexo: {
    	       	   	validators: {
    	                   notEmpty: {
    	                       message: 'Gênero não informado'
    	                   },
    	                        }
    	           },
    	          nome: {
    	               validators: {
    	                   notEmpty: {
    	                       message: 'Informe seu nome'
    	                   },
    	                   stringLength: {
    	                       max: 100,
    	                       message: 'Minimo 6 caracteres'
    	                   }
    	               }
    	           },
    	           data: {
    	               validators: {
    	                   notEmpty: {
    	                       message: 'Informe sua data de nascimento'
    	                   },
    	                   stringLength: {
    	                       max: 10,
    	                       min: 10,
    	                       message: 'Data Inválida'
    	                   }
    	               }
    	        
    	            }
    	        },
    	   	   
        	    });
   	   
 });

</script>


<script language="JavaScript" type="text/javascript">
   function mascaraData(campoData){
              var data = campoData.value;
              if (data.length == 2){
                  data = data + '/';
                  document.forms[0].data.value = data;
      return true;              
              }
              if (data.length == 5){
                  data = data + '/';
                  document.forms[0].data.value = data;
                  return true;
              }
         }
</script>

<style type="text/css">
*[role="form"] {
    padding: 0px;
    margin-top: 120px;
    margin-left: 260px;
    border-radius: 0.3em;
}

input.alinha {
    margin-left: 5em;
    margin-bottom: 1em;
}
.sex{
padding: 15px;
margin-top: -20px;
}

</style>
  <title>Teste cadastro</title>
</head>
<body>
	<div><p style="color: red; margin-left: 230px;">${msgSucesso}</p></div>
      
		<div class="container">
            <form id="contactForm" class="form-horizontal" method="post" action="save">
                <div class="form-group">
        <div class="col-md-7 col-md-offset-3">
            <div id="messages"></div>
        </div>
    </div>       
       <div class="form-group">
        <label for="nome" class="col-md-3 control-label">Nome</label>
        <div class="col-md-6">
            <input type="text" class="form-control" id="nome" placeholder="Informe seu nome" name="nome" style="width: 420px;" minlength = "6" maxlength="45" required/>
        </div>
    </div>
                <div class="form-group">
                    <label for="email" class="col-sm-3 control-label">Email</label>
                    <div class="col-md-6">
                        <input type="email" name="email" placeholder="Informe seu Email" class="form-control" style="width: 420px;" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="senha" class="col-sm-3 control-label">Senha</label>
                    <div class="col-md-6">
                        <input type="password" name="senha" id="key" placeholder="Escolha uma senha" class="form-control" style="width: 420px;" minlength = "6" maxlength="45" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="confSenha" class="col-sm-3 control-label">Confirmar Senha</label>
                    <div class="col-md-6">
                        <input type="password" name="confSenha" placeholder="Confirme a senha" class="form-control" style="width: 420px;" data-match="#key" data-match-error="senhas não correspondem" required>
					<div class="help-block with-errors"></div>
					
					</div>
                </div>

                <div class="form-group">
                    <label for="date" class="col-sm-3 control-label">Data de Nascimento</label>
                    <div class="col-md-6">
                         <input type="text" name="dataNascimento" OnKeyUp="mascaraData(this);" class="form-control" style="width: 420px;" placeholder="Data de nascimento" required>
                    </div>
                </div>
         
                <div class="form-group">
                    <label class="control-label col-sm-3">Genero</label>
                    <div class="col-md-6">
                        <div class="row">
                            <div>
                                <label class="sex"><input type="radio" name="sexo" class="form-control" value="F" required>Feminino</label>   
                             </div>
                            <div>
                                <label class="sex"><input type="radio" name="sexo" class="form-control"  value="M">Masculino</label>        
                            </div>
                           
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-3" style="margin-left: 50px;">
                        <button type="submit" style="width: 150px; margin-left: 220px;" class="btn btn-primary btn-block">Cadastrar</button>
                    </div>
                </div>
            </form> 
        </div> 
</body>

</html>