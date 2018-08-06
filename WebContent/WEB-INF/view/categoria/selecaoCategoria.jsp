<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Selecionar categoria</title>

<!-- Import do jQuery 3.3.1 -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/bootstrap/js/jquery-3.3.1.min.js"></script>

<!-- Import do jQuery validate -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/bootstrap/js/jquery.validate.min.js"></script>

<!-- Import da máscara -->
<script type="text/javascript" src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/3/jquery.inputmask.bundle.js"></script>

<!-- Import de uma lista de funções personalizadas em JS -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/functions.js" charset="utf-8"></script>

<!-- Import do bootstrap css -->
<link   rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" />

<!-- Import do Style css -->
<link   rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/style/style.css" />

<!-- Import do bootstrap js -->
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>

</head>

<body>

<div class="container">
<div class="col-md-4">
			
			 <form>
			
				<h2>Seleção de categorias</h2>
				
				<%int i=0; %>
				<c:forEach var="categoria" items="${listaCategoria}">
					
						<input type="checkbox" name="categoriaNome<%=i%>" id="categoriaNome<%=i%>" value="${categoria.id}"> 
						<span class="label-text">${categoria.nome}</span>
						
						<br>
						
				<%i++; %>
					
				</c:forEach>

				<input type="button" id="submitButton" class="btn" value="Selecionar">
				
			</form> 
			

</div>

</div>

</body>
</html>
