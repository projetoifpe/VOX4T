<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Ocorreu um erro!</title>

	<!-- Import do bootstrap css -->
	<link   rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" />
    
	<!-- Import do jQuery 3.3.1 -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/bootstrap/js/jquery-3.3.1.min.js"></script>
	
	<!-- Bootstrap core JavaScript -->
	<script src="<%=request.getContextPath()%>/resources/externo/js/jquery.min.js"></script>    
	<script src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.bundle.min.js"></script>
</head>

<body>

<c:choose>
	<c:when test="${adminLogado.email != null}">
		<c:import url="/WEB-INF/view/comum/nav-adm.jsp"></c:import>
	</c:when>
	
	<c:when test="${usuarioLogado != null}">
		<c:import url="/WEB-INF/view/comum/nav-user-logado-comum.jsp"></c:import>
	</c:when>
	
	<c:otherwise>
		<c:import url="/WEB-INF/view/comum/nav-comum.jsp"></c:import>
	</c:otherwise>
</c:choose>

<div class="card">
	<div class="card-body">
		<h1 class="card-title">Ocorreu um erro inesperado.</h1>
		<p>Por favor, contate os responsáveis e reporte o problema.</p>
		<p>Email: vox4t@gmail.com.
	</div>
</div>

</body>
</html>