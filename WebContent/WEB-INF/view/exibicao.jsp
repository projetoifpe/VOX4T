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
	
	<!-- Import do bootstrap css -->
	<link   rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" />
    
    <!-- Custom fonts for this template -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:200,200i,300,300i,400,400i,600,600i,700,700i,900,900i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Merriweather:300,300i,400,400i,700,700i,900,900i" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/externo/font-awesome/css/font-awesome.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<%=request.getContextPath()%>/resources/externo/css/coming-soon.css" rel="stylesheet">
    
    <!-- Import do Style css -->
	<link   rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/style/style.css" />
    
   
	
	<!-- Import do bootstrap js -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>
	
	
	<!-- Import do jQuery 3.3.1 -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/bootstrap/js/jquery-3.3.1.min.js"></script>
	
	<!-- Bootstrap core JavaScript -->
	<script src="<%=request.getContextPath()%>/resources/externo/js/jquery.min.js"></script>    
	<script src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.bundle.min.js"></script>
	
	<!-- Import de uma lista de funções personalizadas em JS -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/functions.js" charset="utf-8"></script>
	
	<!-- Custom scripts for this template -->
	<script src="<%=request.getContextPath()%>/resources/externo/js/coming-soon.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>	
	
</head>


<script>
	
 $(document).ready(function(){
	
	
	var idsessao = $("#idSessao").val();
	
	
	$('input[type=checkbox]').change(function(){
		
		if(this.checked){
			
			$.ajax({
	            url : 'userselect',
	            type : 'POST',
	            data : 'idCategoria=' + this.value + '&idUsuario='+idsessao,
	            success: function(data){
	                $('#resultado').html(data);
	            }
	        });
			
		}else{
			 
			$.ajax({
	            url : 'userunselect',
	            type : 'POST',
	            data : 'idCategoria=' + this.value + '&idUsuario='+idsessao,
	            success: function(data){
	                $('#resultado').html(data);
	            }
	        });
		}
		
	});


}); 
	
</script>

<body style="overflow-y: hidden;overflow-x: hidden;">



    <div class="overlay">
<!-- NAV BAR -->
        <nav class="navbar navbar-expand-lg navbar-light bg-dark" style="background-color: ;">
            <a class="navbar-brand text-success" href="<%=request.getContextPath()%>/home">VOX4T</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link text-success" href="#">Sobre</a>
                    </li>


                </ul>

                    <a href="<%=request.getContextPath()%>/usuario/cadastro" class="btn btn-outline-success my-2 my-sm-0" style="margin-right: 6px">Cadastre-se</a>
                    <button class="btn btn-outline-success my-2 my-sm-0" data-toggle="modal" data-target="#modal-mensagem">Login</button>

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
                            	<form>

									<%int i=0; %>
											
									<c:forEach var="categoria" items="${listaCategoria}">
												
										<input type="checkbox" name="categoriaNome<%=i%>" id="categoriaNome<%=i%>" value="${categoria.id}"> 
													
										<span class="label-text">${categoria.nome}</span>
													
										<br>
													
										<%i++; %>
												
									</c:forEach>
											
									<input type="hidden" id="idSessao" value="${usuarioLogado.id}">
							
											
								</form>
                        </div>

                    </div>
                </div>
<!-- DIV DO MEIO -->
                <div class="col-md-8">

                    <div class ="card"  style="width: 12 rem;height: 100%; width: 900px; position:fixed;">

                        <div class="card-body" style="overflow-y: scroll;">
	                        <c:forEach var = "i" begin = "0" end = "${publicacoes.size()-1}">
								<h4 class="card-title">${canais.get(i)}</h4>
				                <br>
			                    <c:forEach var="twitter" items="${publicacoes.get(i)}">
									<p>${twitter}</p>
									<br>
								</c:forEach>
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
	</div>
            
</body>

</html>
