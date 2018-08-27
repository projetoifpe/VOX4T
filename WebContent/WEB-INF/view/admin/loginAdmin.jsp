<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-br">
<head>
	<title>Login Administrativo</title>
	<meta charset="utf-8">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<!-- Bootstrap core CSS -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" />

	<style>
	form {
		margin-top: 220px;
	} 
	 .error{
             color:red
       }
	</style>

</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<div class="container">
		<a class="navbar-brand text-light h1 mb-0" href="<%=request.getContextPath()%>/admin/">VOX4T</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent">
			<span class="navbar-toggler-icon"></span>
		</button>
		
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item">
					<a class="nav-link" href="javascript:void(0);">Administrador</a>
				</li>
			</ul>
		</div>
	</div>
	</nav>

	<!-- 
	<div style="color: red;" align="center">
		<h3>${msg}</h3>
	</div>
	 -->
	<div class="row justify-content-center mb-5">
		<form action="loginAdminCheck" method="post" id="formLoginAdmin">
			<div class="form-row mb-2">
				<div class="col-12">
					<input type="email" class="form-control" id="email" name="email"
						placeholder="E-mail" required>
				</div>
			</div>
			<div class="form-row mb-3">
				<div class="col-12">
					<input type="password" class="form-control" id="senha" name="senha"
						placeholder="Senha" required>
						<div style="color: red;" align="center">${msg}</div>
				</div>
			</div>
			<div class="form-row ">
				<div class="col-12">
					<button type="submit" class="btn btn-outline-info col-12">Acessar</button>
				</div>
			</div>
		</form>
	</div>
	<script src="<%=request.getContextPath()%>/resources/bootstrap/js/jquery-3.3.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/bootstrap/js/jquery.validate.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/functions.js"></script>
	
</body>
</html>