<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-br">
<head>
	<title>VOX4T</title>
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
    .msg{
    
    margin-top: 220px;
    }
	</style>
	
<meta http-equiv="refresh" content=1;url="${link}">	
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-dark"
		style="background-color: ;">
	<div class="container">
		<a class="navbar-brand text-light h1 mb-0"
			href="#">VOX4T</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link text-light" href="#">Sobre</a>
				</li>
			</ul>
		</div>
	</div>
	</nav>

	<div class="msg" style="color: red;" align="center">
		<h3>${msg}</h3>
	</div>
	 
	</div>
	<script src="<%=request.getContextPath()%>/resources/bootstrap/js/jquery-3.3.1.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/bootstrap/js/jquery.validate.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/functions.js"></script>
	
</body>
</html>