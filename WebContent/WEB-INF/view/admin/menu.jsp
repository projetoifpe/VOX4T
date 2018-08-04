<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   <!DOCTYPE html>

<html>
<head>

<style>
label{margin-left: 45%;margin-top: 0px;}
#sair {margin-left: 1900%;}
#vox{margin-left: 5%;}
#usuario{margin-left: 55%;}
#categoria{margin-left: 70%;}
#canal{margin-left: 160%;}
</style>

<meta charset="utf-8"> 

<!-- Import do bootstrap css -->
<link   rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" />

<!-- Import do Style css -->
<link   rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/style/style.css" />

<title>Criação de Categoria</title>

</head>


<body>

	<div class="overlay">
	
		<!-- navbar menu -->
        <nav class="navbar navbar-expand-lg navbar-light bg-dark" style="background-color: ;">
            
            <!-- Logo VOX4T redireciona para a pagina inicial -->
            <a id="vox" class="navbar-brand text-light" href="<%=request.getContextPath()%>/admin/menu">VOX4T</a>
            
            <!-- esconde um botão -->
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    		<span class="navbar-toggler-icon"></span>
  			</button>

			<!-- menu -->
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
            		<a id="usuario" class="navbar-brand text-warning" href="#">usuario</a>
                    </li><li>
                    <a id="categoria" class="navbar-brand text-warning" href="<%=request.getContextPath()%>/categoria/add">categoria</a>
                    </li><li>                    
                    <a id="canal" class="navbar-brand text-warning" href="#">canal</a>
	                </li><li>                    
                    <a id="sair" class="navbar-brand text-light" href="<%=request.getContextPath()%>/logout">sair</a>
                    </li></ul>
						


            </div>
        </nav>

    </div>
    
    <br>
    
    <hr> 
	<h1><b><label class="vox4t">VOX4T</label></b></h1>
	<hr>
    
    	

	
	
</body>

</html>