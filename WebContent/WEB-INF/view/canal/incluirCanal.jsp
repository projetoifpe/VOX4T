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

#sair {
	margin-left: 1900%;
}

#vox {
	margin-left: 5%;
}

#usuario {
	margin-left: 55%;
}

#categoria {
	margin-left: 70%;
}

#canal {
	margin-left: 160%;
}

form {
	margin-top: 100px
}
</style>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/style/style.css" />

</head>

<body>
	<div class="overlay">
		<!-- navbar menu -->
		<nav class="navbar navbar-expand-lg navbar-light bg-dark" style="background-color:;">

			<!-- Logo VOX4T redireciona para a pagina inicial -->
			<a id="vox" class="navbar-brand text-light"
				href="<%=request.getContextPath()%>/admin/menu">VOX4T</a>

			<!-- esconde um botão -->
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<!-- menu -->
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item"><a id="usuario"
						class="navbar-brand text-warning" href="#">usuario</a></li>
					<li><a id="categoria" class="navbar-brand text-warning"
						href="<%=request.getContextPath()%>/categoria/add">categoria</a></li>
					<li><a id="canal" class="navbar-brand text-warning"
						href="<%=request.getContextPath()%>/canal/incluirCanal">canal</a>
					</li>
					<li><a id="sair" class="navbar-brand text-light"
						href="<%=request.getContextPath()%>/logout">sair</a></li>
				</ul>
			</div>
		</nav>
	</div>
	<!-- ************************************************ -->
	<div class="container">
		<form method="post" action="saveCanal">
			<div class="form-row my-2 ">
				<div class="form-group col-md-6 ">
					<select class="custom-select" id="inputGroupSelect01" name="categoria">
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

	<h3>
		<label>Lista de Canais</label>
	</h3>

	<div class="container">
		<c:import url="/canal/list" />
	</div>
</body>
</html>