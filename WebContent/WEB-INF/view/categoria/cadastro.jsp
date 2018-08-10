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
		<c:import url="/WEB-INF/view/comum/nav-adm.jsp"></c:import>
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