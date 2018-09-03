<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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

    <title>Edição usuário</title>
    
    <!-- Import do jQuery 3.3.1 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>

<!-- Import de uma lista de funções personalizadas em JS -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/valid.js" charset="utf-8"></script>

<!-- Import do bootstrap css -->
<link   rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" />

<!-- Import do Style css -->
<link   rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/style/style.css" />

<!-- Import do bootstrap js -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>
 
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	
	<!-- FONTE ROBOTO -->
	<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
	
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" />
   	
    
   
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
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/externo/jquery/inputSenha.js"></script>

		
	


	<div class="overlay">
		<c:import url="/WEB-INF/view/comum/nav-user-logado-comum.jsp"></c:import>
    </div>
    
    <br><br><br>
    	
		<div class="container">
             <div>
			<p style="color: red; margin-left: 230px;">${msgSucesso}</p>
		</div>
            <form id="cadastroForm" class="form-horizontal" method="post" action="update">
            
                <input type="hidden" name="id" value="${usuario.id}">
                <input type="hidden" name="senhaOriginal" value="${usuario.senha}" />
                <input type="hidden" name="sexo" value="${usuario.sexo}" />
                <input type="hidden" name="status" value="1" />
                <div class="form-group">
                
                
                <!-- Campo Nome -->
                
			    <div class="form-group">
			        <label for="nome" class="col-md-3 control-label">Nome</label>
			        <div class="col-md-6">
			            <input type="text" class="form-control" value="${usuario.nome}" id="nome" placeholder="Informe seu nome" name="nome" style="width: 420px;" maxlength="45" required />
			    	</div>
			    </div>
			    
			    <!-- Campo Email -->
			    
                <div class="form-group">
                    <label for="email" class="col-sm-3 control-label">Email</label>
                    <div class="col-md-6">
                        <input type="email" name="email" id="email" value="${usuario.email}" placeholder="Informe seu Email" class="form-control" style="width: 420px;" required />
                    </div>
                </div>
                
                <!-- Campo Data -->

                <div class="form-group">
                    <label for="date" class="col-sm-3 control-label">Data de Nascimento</label>
                    <div class="col-md-6">
                         <input type="text" name="dataNascimento"  value="<fmt:formatDate value="${usuario.dataNascimento}" pattern="dd/MM/yyyy" />" minlength="10" id="dataNascimento" class="form-control" style="width: 420px;" placeholder="Data de nascimento" required>
                    </div>
                </div>
                
                <div class="form-group">
                    <div class="col-md-6">
                    	<a href="#" class="" id="linkSenha" data-toggle="modal" data-target="#exampleModal">Editar Senha</a> 
                    </div>
                </div>
                
                <div class="form-group" >
                    <div class="col-md-6">
                    	 <input type="hidden" name="senha" value="${usuario.senha}" />
                         <input type="password" id="inputSenha" name="senhaNova" maxlength="45" class="form-control" style="width: 420px;" placeholder="Nova Senha">
                         <a href="#" id="cancelarSenha">Cancelar Edição</a>
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