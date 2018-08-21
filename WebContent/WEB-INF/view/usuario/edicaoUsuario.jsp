<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- LOGIN API GOOGLE -->
<script src="https://apis.google.com/js/platform.js"></script>
<meta name="google-signin-client_id" content="686903218226-p5t42arftgs3onms88c2pvhj4j5tlvfb.apps.googleusercontent.com">
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/google.js"></script>


	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Edi��o usu�rio</title>
	
	<!-- FONTE ROBOTO -->
	<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
	
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" />
   	
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
   
    <!-- Custom fonts for this template -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:200,200i,300,300i,400,400i,600,600i,700,700i,900,900i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Merriweather:300,300i,400,400i,700,700i,900,900i" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/externo/font-awesome/css/font-awesome.min.css" rel="stylesheet">

 
	

</head>


<body>
 	
 	<!-- Bootstrap core JavaScript -->
    <script src="<%=request.getContextPath()%>/resources/externo/js/jquery.min.js"></script>    
    <script src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.bundle.min.js"></script>


    <!-- Custom scripts for this template -->
    <script src="<%=request.getContextPath()%>/resources/externo/js/coming-soon.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/bootstrap/js/jquery.validate.min.js"></script>
	

		
	


	<div class="overlay">
		<c:import url="/WEB-INF/view/comum/nav-user-logado-comum.jsp"></c:import>
    </div>
    
    <br><br><br>
    	
		<div class="container">
             <div>
			<p style="color: red; margin-left: 230px;">${msgSucesso}</p>
		</div>
            <form id="cadastroForm" class="form-horizontal" method="post" action="save">
                
                <div class="form-group">
                
                
                <!-- Campo Nome -->
                
			    <div class="form-group">
			        <label for="nome" class="col-md-3 control-label">Nome</label>
			        <div class="col-md-6">
			            <input type="text" class="form-control" id="nome" placeholder="Informe seu nome" name="nome" style="width: 420px;" maxlength="45" required />
			    	</div>
			    </div>
			    
			    <!-- Campo Email -->
			    
                <div class="form-group">
                    <label for="email" class="col-sm-3 control-label">Email</label>
                    <div class="col-md-6">
                        <input type="email" name="email" id="email" placeholder="Informe seu Email" class="form-control" style="width: 420px;" required />
                    </div>
                </div>
                
                <!-- Campo Data -->

                <div class="form-group">
                    <label for="date" class="col-sm-3 control-label">Data de Nascimento</label>
                    <div class="col-md-6">
                         <input type="text" name="dataNascimento" maxlength="10" id="dataNascimento" class="form-control" style="width: 420px;" placeholder="Data de nascimento" required>
                    </div>
                </div>
                
                <div class="form-group">
                    <div class="col-md-6">
                    	<a href="#" class="" data-toggle="modal" data-target="#exampleModal">Editar Senha</a> 
                    </div>
                </div>
                
             
                <!-- Bot�o submit -->
                
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-3" style="margin-left: 50px;">
                        <button type="submit" style="width: 150px; margin-left: 220px;" class="btn btn-primary btn-block">Alterar</button>
                    </div>
                </div>
                
                </div>
                                
            </form> 
        </div>
        
        
        <!-- MODAL EDI��O SENHA -->
     
     <!-- Button trigger modal -->

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel" style=" text-align: center;">Alterar senha</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form method="post" name="formAlterar" id="formAlterar">
        	
        	<!--  SENHA ANTIGA   -->
        	
        	
        	<div class="form-group">
                    <label for="senha" class="col-sm-6 control-label">Senha antiga</label>
                    <div class="col-md-6">
                        <input type="password" name="senhaAntiga" id="senha" 
                        placeholder="Digite sua senha antiga" class="form-control" required />
                    </div>
            </div>
        	
        	
        	<!--  NOVA SENHA -->
        	
        	
        	<div class="form-group">
                    <label for="senha" class="col-sm-3 control-label">Nova senha</label>
                    <div class="col-md-6">
                        <input type="password" name="senhaNova" id="senha" 
                        placeholder="Digite sua nova senha" class="form-control" required />
                    </div>
            </div>
        	
        	<!-- CONFIRMAR SENHA -->
        	
        	<div class="form-group">
                    <label for="senha" class="col-sm-5 control-label">Confirmar senha</label>
                    <div class="col-md-6">
                        <input type="password" name="senhaConfirm" id="senha" 
                        placeholder="Confirme sua senha" class="form-control" required />
                    </div>
            </div>
        	
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
        <button type="button" class="btn btn-primary">Salvar altera��es</button>
      </div>
    </div>
  </div>
</div>
	
	<script type="text/javascript">
	
	$('#myModal').on('shown.bs.modal', function () {
		  $('#myInput').trigger('focus')
		})
	</script>
</body>

</html>