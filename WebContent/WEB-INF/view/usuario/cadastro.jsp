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

<div id="fb-root"></div>
<script>
(function(d, s, id) {
	  var js, fjs = d.getElementsByTagName(s)[0];
	  if (d.getElementById(id)) return;
	  js = d.createElement(s); js.id = id;
	  js.src = 'https://connect.facebook.net/pt_BR/sdk.js#xfbml=1&version=v3.0&appId=1924110817611014&autoLogAppEvents=1';
	  fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));


//FUNÇÃO CHAMADA ASSIM QUE EXECUTA O PROCESSO DE LOGIN	
function checkLoginState() {
	FB.getLoginStatus(function(response) {
		var token = response.authResponse.accessToken;
		   //console.log(token);
		   ExibeDados(token);
		});
}

//FUNÇÃO CHAMADA APÓS A AUTENTICAÇÃO COM O FACEBOOK - RETORNA OS DADOS DO USUÁRIO LOGADO	
function ExibeDados(token){
	
	FB.api('/me?fields=name,email,gender,birthday',function(response) {
		
		//Acessa o controller que recebe os dados do usuário e ativa a sessão do usuário
		$.post("https://localhost:8443/VOX4T/usuario/facebook?nome="+response.name+"&email="+response.email, function(data){
			if(data == "true"){
				//Url para a tela inicial
				window.location.href = "/VOX4T/usuario/logadoFacebook";
			}
		});
		
		
		
		});
}
</script>
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

 
    
    <!-- CSS do botão do Google -->
	<link   rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/style/google.css" />
	
	<!-- CSS DO MODAL DO LOGIN -->
	<style type="text/css">
	.login-form {
		width: 300px;
		margin: 30px auto;
	}
    .login-form form {        
    	margin-bottom: 15px;
        background: #f7f7f7;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
        padding: 30px;
    }
    .login-form h2 {
        margin: 0 0 15px;
    }
    .form-control, .login-btn {
        min-height: 38px;
        border-radius: 2px;
    }
    .input-group-addon .fa {
        font-size: 18px;
    }
    .login-btn {
        font-size: 15px;
        font-weight: bold;
    }
	.social-btn .btn {
		border: none;
        margin: 10px 3px 0;
        opacity: 1;
	}
    .social-btn .btn:hover {
        opacity: 0.9; 
    }
	.social-btn .btn-primary {
        background: #507cc0;
    }
	.social-btn .btn-info {
		background: #64ccf1;
	}
	.social-btn .btn-danger {
		background: #df4930;
	}
    .or-seperator {
        margin-top: 20px;
        text-align: center;
        border-top: 1px solid #ccc;
    }
    .or-seperator i {
        padding: 0 10px;
        background: #f7f7f7;
        position: relative;
        top: -11px;
        z-index: 1;
    }   
    
    #form .form-group label.error {
    	color: #FB3A3A;
    	display: inline-block;
    	margin: 0px 0 0px 0px;
    	padding: 0;
    	text-align: left;
    }
    
    .modal-dialog{
    	width: 400px;
    }

    
</style>
<!-- FIM DO CSS MODAL LOGIN -->

</head>


<body>
 	
 	<!-- Bootstrap core JavaScript -->
    <script src="<%=request.getContextPath()%>/resources/externo/js/jquery.min.js"></script>    
    <script src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.bundle.min.js"></script>


    <!-- Custom scripts for this template -->
    <script src="<%=request.getContextPath()%>/resources/externo/js/coming-soon.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/bootstrap/js/jquery.validate.min.js"></script>
	

		
	<script>
	
	//VALIDAÇÃO COM JQUERY VALIDATE -----------------------------------------------------------------------
	
	 $(document).ready(function(){

	    $("#formLogin").validate({
	        rules: {
	            email: {
	                required: true
	            },
	            senha: {
	                required: true
	            }
	        },
	        messages: {
	            email: {
	                required: "Digite seu email"
	            },
	            senha: {
	                required: "Digite sua senha"
	            }
	        }
	    });

	}); 
	 </script>
	


	<div class="overlay">

        <nav class="navbar navbar-expand-lg navbar-light bg-dark" style="background-color: ;">
            <a class="navbar-brand text-light" href="<%=request.getContextPath()%>">VOX4T</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link text-light" href="#">Sobre</a>
                    </li>
						    
	            </ul>

                <button class="btn btn-outline-light my-2 my-sm-0" data-toggle="modal" data-target="#modal-mensagem">Login</button>

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
                
                <!--  CAMPO DE STATUS HIDDEN -->
                
                <div class="form-group">
                    
                    <div class="col-md-6">
                         <input type="hidden" name="status"  id="status" class="form-control" style="width: 420px;" value="1" required>
                    </div>
                </div>
                
                	
                <!-- Botão submit -->
                
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-3" style="margin-left: 50px;">
                        <button type="submit" style="width: 150px; margin-left: 220px;" class="btn btn-primary btn-block">Cadastrar</button>
                    </div>
                </div>
                
                </div>
                                
            </form> 
        </div>
		<!-- INICIO MODAL LOGIN -->
	<div class="modal fade" id="modal-mensagem" tabindex="-1">
    <div class="modal-dialog">
         <div class="modal-content">
              <div class="login-form">
              	<form action="loginCheck" method="post" name="formLogin" id="formLogin">
        			
        			<h2 class="text-center">Entrar</h2>   
        			
        		   <div class="form-group">
        				<div class="input-group">
                			<span class="input-group-text"><i class="fa fa-user"></i></span>
                			<input type="email" class="form-control" name="email" id="email" class="required" placeholder="Email">				
            			</div>            			
        		   </div>
				   
				   
				   <div class="form-group">
            			<div class="input-group">
                			<span class="input-group-text"><i class="fa fa-lock"></i></span>
                			<input type="password" class="form-control" name="senha" id="senha" class="required" placeholder="Senha">				
            			</div>
        		  </div>
        		          
        		  
        		  <div class="form-group">
            			<button type="submit" class="btn btn-primary login-btn btn-block">Login</button>
        		  </div>
       
        		  
        		  <p class="text-center">Entrar com redes sociais</p>
        		  
        		  
        		  <div class="text-center social-btn">
						
						<!-- BOTÃO LOGIN GOOGLE -->
						<div id="gSignInWrapper">
						    <div id="customBtn" class="customGPlusSignIn">
						      <span class="icon"></span>
						      <span class="buttonText">Entrar com o Google</span>
						    </div>
					  	</div>
         					<script>startApp();</script>		  	
						<br> 
						
						<!-- BOTÃO LOGIN FACEBOOK -->
						<div class="fb-login-button" data-max-rows="1" data-size="large" data-button-type="login_with"  scope="public_profile"  onlogin="checkLoginState();"></div>
        		  </div>
        		  
    			</form>
    
    			<p class="text-center text-muted small">Você não tem uma conta? <a href="../usuario/cadastro">Cadastre-se aqui!</a></p>
			
			</div>
         </div>
     </div>
 </div>
 
 <!-- FIM MODAL LOGIN -->	
</body>

</html>