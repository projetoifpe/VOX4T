<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
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
    
   /* SWITCH BUTTON */ 
.switch {
  position: relative;
  display: inline-block;
  width: 60px;
  height: 34px;
}

.switch input {display:none;}

.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: .4s;
  transition: .4s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 26px;
  width: 26px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
}

input:checked + .slider {
  background-color: #2196F3;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196F3;
}

input:checked + .slider:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
  border-radius: 34px;
}

.slider.round:before {
  border-radius: 50%;
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


            <div class="content">
                <div class="row">
                    <div class="col-sm">
                        <a class="btn btn-light" style="width: 33%">Usu�rios</a>
                        <a class="btn btn-light" style="width: 33%">Categorias</a>
                        <a class="btn btn-light" style="width: 33%">Canal</a>    
                    </div>
                </div>
            </div>


            <!-- USUÁRIOS -->
            <div class="content">
                <div class="row">
                    <div class="col-md-10">

                        <div class="card" style="margin-top: 10px;">

                            <form>
                                <input type="text" class="form-control" style="width: 25%" placeholder="Buscar">

                            </form>
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th scope="col">Nome</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Ativo</th>
                                       
                                        <th scope="col">Excluir</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                	<c:forEach var="user" items="${usuarios}">
                                    <tr>
                                        <th scope="row">${user.getNome()}</th>
                                        <td>${user.getEmail()}</td>
                                        <td>    
                                        	<label class="switch">
  											<input type="checkbox" checked>
  											<span class="slider round"></span>
											</label>
    
  										</td>                                      
                                         <td><button class="btn btn-danger">X</button></td>
                                    </tr>
                             	
                             	
                                   
                                    <br>
                                </c:forEach>
                                    
                               
                                </tbody>
                            </table>

                        </div>
                    </div>
                </div>

            </div>













            <!-- Bootstrap core JavaScript -->
            <script src="<%=request.getContextPath()%>/resources/externo/js/jquery.min.js"></script>    
			<script src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.bundle.min.js"></script>

            <!-- Custom scripts for this template -->
            <script src="<%=request.getContextPath()%>/resources/externo/js/coming-soon.min.js"></script>

    </body>

    </html>