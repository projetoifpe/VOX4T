<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   <!DOCTYPE html>

<html>
<head>

<style>
.meio{
margin-left: 43%;
}
#sair {
margin-left: 1100%;
}
#vox{
margin-left: 5%;
}


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
            <a id="vox" class="navbar-brand text-light" href="<%=request.getContextPath()%>">VOX4T</a>
            
            <!-- esconde um botão -->
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    		<span class="navbar-toggler-icon"></span>
  			</button>

			<!-- menu -->
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
            		<a id="usuario" class="navbar-brand text-warning" href="<%=request.getContextPath()%>/usuario">usuario</a>
                    </li><li>
                    <a id="categoria" class="navbar-brand text-warning" href="<%=request.getContextPath()%>/categoria/add">categoria</a>
                    </li><li>                    
                    <a id="canal" class="navbar-brand text-warning" href="<%=request.getContextPath()%>/categoria/add">canal</a>
	                </li><li>                    
                    <a id="sair" class="navbar-brand text-light" href="<%=request.getContextPath()%>/logout">sair</a>
                    </li></ul>
						


            </div>
        </nav>

    </div>
    
    <br>
    	
		<div class="container">
            
            <form class="form-horizontal" method="post" action="save">
                
                <div class="form-group">
                
                
                <!-- Campo Nome -->
                
			    <div class="form-group">
			        <label for="nome" class="col-md-3 control-label">Nome da categoria</label>
			        <div class="col-md-6">
			            <input type="text" class="form-control" id="nome" placeholder="Informe a categoria" name="nome" style="width: 420px;" maxlength="45" required />
			    	</div>
			    </div>
	                
                <!-- Botão submit -->
                
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-3" >
                        <button type="submit" style="width: 150px;" class="btn btn-success btn-block">Incluir Categoria</button>
                    </div>
                </div>        
                </div>
                                
            </form> 
        </div>
        
	<hr> 
	<h3><label class="meio">Lista de Categorias</label></h3>
	<hr>
	<c:import url="/categoria/list" />
	
	
	
</body>

</html>