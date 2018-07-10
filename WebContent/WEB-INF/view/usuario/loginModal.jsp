<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>LoginModal</title>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">


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

</head>
<body>

	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/bootstrap/js/jquery-3.3.1.min.js"></script>
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
	
	//---------------------------------------------------------------------------------------------
	
	
	</script>
<center>
<button class="btn btn-primary" data-toggle="modal" data-target="#modal-mensagem">Login</button>
</center>


 <div class="modal fade" id="modal-mensagem" tabindex="-1">
    <div class="modal-dialog">
         <div class="modal-content">
              <div class="login-form">
              	<form action="loginCheck" method="post" name="formLogin" id="formLogin">
        			
        			<h2 class="text-center">Entrar</h2>   
        			
        		   <div class="form-group">
        				<div class="input-group">
                			<span class="input-group-addon"><i class="fa fa-user"></i></span>
                			<input type="email" class="form-control" name="email" id="email" class="required" placeholder="Email">				
            			</div>            			
        		   </div>
				   
				   
				   <div class="form-group">
            			<div class="input-group">
                			<span class="input-group-addon"><i class="fa fa-lock"></i></span>
                			<input type="password" class="form-control" name="senha" id="senha" class="required" placeholder="Senha">				
            			</div>
        		  </div>
        		          
        		  
        		  <div class="form-group">
            			<button type="submit" class="btn btn-primary login-btn btn-block">Login</button>
        		  </div>
       
        		  
        		  <p class="text-center">Entrar com redes sociais</p>
        		  
        		  
        		  <div class="text-center social-btn">
            			<a href="#" class="btn btn-primary"><i class="fab fa-facebook-square"></i>&nbsp; Facebook</a>
						<a href="#" class="btn btn-danger"><i class="fab fa-google-plus-g"></i>&nbsp; Google</a>
        		  </div>
        		  
    			</form>
    
    			<p class="text-center text-muted small">Você não tem uma conta? <a href="cadastro">Cadastre-se aqui!</a></p>
			
			</div>
         </div>
     </div>
 </div>

</body>
</html>