<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
    <html lang="br">

    <!--  CABEÇALHO -->

    <head>
    <style>
   #sobre{
    position:relative;
    left: 130px;
     
    }
    
    a{
    position:relative;
    right: 135px;
    
    }
    </style>
        <title>Administrador</title>

        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" />
        <!-- Link cdn glyplicon-->

        <!-- Custom fonts for this template -->
    	<link href="<%=request.getContextPath()%>/resources/externo/font-awesome/css/font-awesome.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="<%=request.getContextPath()%>/resources/externo/css/coming-soon.css" rel="stylesheet">

    </head>

    <body style="overflow:hidden;">
        <div class="overlay">

         	<nav class="navbar navbar-expand-lg navbar-light bg-dark"
		style="background-color: ;">
	<div class="container">
		<a class="navbar-brand text-light h1 mb-0"
			href="<%=request.getContextPath()%>/home" >VOX4T</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link text-light" id="sobre" href="#">Sobre</a>
				</li>
			</ul>
		</div>
	</div>






	</nav>














            <!-- Bootstrap core JavaScript -->
            <script src="<%=request.getContextPath()%>/resources/externo/js/jquery.min.js"></script>    
			<script src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.bundle.min.js"></script>

            <!-- Custom scripts for this template -->
            <script src="<%=request.getContextPath()%>/resources/externo/js/coming-soon.min.js"></script>

    </body>

    </html>
    