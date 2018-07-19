<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="br">


<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Home</title>

	<!-- FONTE ROBOTO -->
	<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
	
    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" />
     <link href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.css" rel="stylesheet">
    <!-- Custom fonts for this template -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:200,200i,300,300i,400,400i,600,600i,700,700i,900,900i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Merriweather:300,300i,400,400i,700,700i,900,900i" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/externo/font-awesome/css/font-awesome.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<%=request.getContextPath()%>/resources/externo/css/coming-soon.css" rel="stylesheet">
    
</head>

<body style="overflow:hidden;">

<!-- Bootstrap core JavaScript -->
	<script src="<%=request.getContextPath()%>/resources/externo/js/jquery.min.js"></script>    
	<script src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- Custom scripts for this template -->
	<script src="<%=request.getContextPath()%>/resources/externo/js/coming-soon.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/bootstrap/js/jquery.validate.min.js"></script>
	

    <div class="overlay">

        <nav class="navbar navbar-expand-lg navbar-light bg-dark" style="background-color: ;">
            <a class="navbar-brand text-success" href="#">VOX4T</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link text-success" href="#">Sobre</a>
                    </li>


                </ul>
                <form class="form-inline my-2 my-lg-0">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit" style="margin-right: 6px">Cadastre-se</button>
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Login</button>
                </form>
            </div>
        </nav>





        <div class="content">

            <div class="row">
                <div class="col-sm"></div>
            </div>
            <div class="row">
                <div class="col-sm"></div>
            </div>


            <div class="row">
                <div class="col-md-2">

                    <div class="card " style="width: 12 rem; height: 100%; margin-top: 2%;">

                        <div class="card-body">
                            <h5 class="card-title">Categorias</h5>
                            <form action="">

                                <input type="checkbox" name="categoria" value="Esporte">Esporte<br>
                                <input type="checkbox" name="categoria" value="Noticias">Notícias<br>
                                <input type="checkbox" name="categoria" value="Transito">Trânsito<br>
                                <input type="checkbox" name="categoria" value="Famosos">Famosos<br>

                            </form>
                        </div>

                    </div>
                </div>

                <div class="col-md-8" style="overflow-y: auto">

                    <div class="card " style="width: 12 rem;height: 100%; margin-top: 8%; overf">

                        <div class="card-body">
                        
                        <c:forEach var="twitter" items="${publicacao}">
                        
						<h4 class="card-title">${canal}</h4>
						<p>${twitter}</p>
						<br>
						</c:forEach>
                        </div>

                    </div>
                    
                    
                </div>

                <div class="col-md-2">
                    <div class="card float-right" style="width: 25em margin-top: 8%;">

                        <div class="card-body">
                            <h5 class="card-title center">Modo Voz</h5>

                            <button type="button" class="btn btn-default btn-lg">
                <span class="glyphicon glyphicon-step-backward" ></span>
                                
                            </button>

                            <button type="button" class="btn btn-default btn-lg">
                <span class=" glyphicon glyphicon-play" ></span>
                            </button>

                            <button type="button" class="btn btn-default btn-lg">
                <span class="glyphicon glyphicon-pause" ></span>
                            </button>

                            <button type="button" class="btn btn-default btn-lg">
                <span class="glyphicon glyphicon-step-forward" ></span>
                            </button>




                        </div>

                    </div>
                </div>

            </div>

            
</body>

</html>
