<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="utf-8">
<title>Criação de Canal</title>

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
		<form method="post" action="saveCanal">
			<div class="form-row my-2 ">
				<div class="form-group col-md-6 ">
					<select class="custom-select" required name="categoria">
							<option selected value="">Selecione a Categoria...</option>
							<c:forEach items="${listaCategoria}" var="obj">
								<option value="${obj.id}"> ${obj.nome} </option>
							</c:forEach> 
					</select>
				</div>
				<div class="form-group col-md-6">
					<input type="text" class="form-control" id="nome" name="nome"
						placeholder="Nome do Canal" required>
				</div>

			</div>
			<button type="submit" class="btn btn-info mb-0">Cadastrar Canal</button>
		</form>
	</div>
	
	<br> <br>

<h1 align="center" class="display-5"><i class="fab fa-twitter text-primary" aria-hidden="true"></i> Lista de Canais</h1>

	<div class="container">
		<c:import url="/canal/list" />
	</div>
</body>
</html>