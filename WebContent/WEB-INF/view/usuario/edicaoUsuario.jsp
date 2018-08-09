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

    <title>Index</title>
	
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

        <nav class="navbar navbar-expand-lg navbar-light bg-dark" style="background-color: ;">
            <a class="navbar-brand text-success" href="<%=request.getContextPath()%>">VOX4T</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link text-success" href="#">Sobre</a>
                    </li>
						    
	            </ul>

                <button class="btn btn-outline-success my-2 my-sm-0" data-toggle="modal" data-target="#modal-mensagem">Login</button>

            </div>
        </nav>

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
                
                <!-- Campo Senha -->
                
                <div class="form-group">
                    <label for="senha" class="col-sm-3 control-label">Senha</label>
                    <div class="col-md-6">
                        <input type="password" name="senha" id="senha" placeholder="Escolha uma senha" class="form-control" style="width: 420px;" minlength = "6" maxlength="45" required>
                    </div>
                </div>
                
                <!-- Campo Confirmar Senha -->
                
                <div class="form-group">
                    <label for="confSenha" class="col-sm-3 control-label">Confirmar Senha</label>
                    <div class="col-md-6">
                        <input type="password" name="confSenha" placeholder="Confirme a senha" class="form-control" style="width: 420px;" data-match="#senha" data-match-error="senhas não correspondem" required>
					</div>
                </div>
                
                <!-- Campo Data -->

                <div class="form-group">
                    <label for="date" class="col-sm-3 control-label">Data de Nascimento</label>
                    <div class="col-md-6">
                         <input type="text" name="dataNascimento" maxlength="10" id="dataNascimento" class="form-control" style="width: 420px;" placeholder="Data de nascimento" required>
                    </div>
                </div>
                
                
                <!-- Campo Gênero -->
         
                <div class="form-group">
                    <label class="control-label col-sm-3">Gênero</label>
                    
                    <div class="col-md-6">
                       <label for="sexo">&nbsp;Masculino</label>
                       <input type="radio" name="sexo" id="sexo" value="M" checked>
                    
                       <label for="sexo">&nbsp;Feminino</label>
                       <input type="radio" name="sexo" id="sexo" value="F" required>
                    </div>
                </div>
                
                
                <!-- Botão submit -->
                
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-3" style="margin-left: 50px;">
                        <button type="submit" style="width: 150px; margin-left: 220px;" class="btn btn-primary btn-block">Alterar</button>
                    </div>
                </div>
                
                </div>
                                
            </form> 
        </div>
	
</body>

</html>