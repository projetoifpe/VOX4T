<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
	<meta charset="utf-8">
	<title>Incluir Categoria</title>

	<style>
		label {
			margin-left: 45%;
			margin-top: 0px;
		}
	</style>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/style/style.css" />
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">

</head>

<body>
	<div class="overlay">
		<c:import url="/WEB-INF/view/comum/nav-adm.jsp"></c:import>
	</div>
	<!-- ************************************************ -->
	<div class="container">
		<form method="post" action="save">
			<div class="form-row my-2 ">
				<div class="form-group col-md-6">
					<input type="text" class="form-control" id="nome" name="nome"
					placeholder="Nome da Categoria" required>
				</div>
			</div>
			<button type="submit" class="btn btn-info mb-0">Cadastrar Categoria</button>
		</form>
	</div>

	<br> <br>

	<h1 align="center" class="display-5"><i class="fab fa-twitter text-primary" aria-hidden="true"></i> Lista de Categorias</h1>

	<div class="container">
		<c:import url="/categoria/list" />
	</div>

</body>
</html>