<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Alterar Categoria</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<!-- Atualiza a página quando fechar o modal -->
<script>
	function atualiza() {
		location.reload();
	}
</script>

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" />
<script src="<%=request.getContextPath()%>/resources/bootstrap/js/jquery-3.3.1.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>

</head>

<body>
	<div class="container">
		<form action="update" method="post">
			<!-- recebe id -->
			<input type="hidden" name="id" id="id" value="${categoria.id}">

			<!-- DIV do Modal -->
			<div class="modal-content container " style="width: 350px;">
				<div class="modal-header">
					<!-- DIV do Modal -->
					<h4 class="modal-title">Alterar Categoria</h4>
					
					<!-- Botão de fechar Modal -->
					<a href="add" class="close">&times;</a>
				</div>
				
				<!-- DIV do Modal -->
				<div class="modal-body">
					<div class="form-group">
						<label for="nome">Nome da Categoria</label>					
						<input type="text" id="nome" value="${categoria.nome}" class="form-control" name="nome" style="width: 280px;" maxlength="45" required />
					</div>
				</div>
				
				<!-- Submit -->
				<div class="modal-footer">
					<a href="add" class="btn btn-default" role="button">Cancelar</a>
					<button type="submit" class="btn btn-info">Salvar</button>

					<!-- FIM da DIV do Modal -->
				</div>
			</div>
		</form>
	</div>
</body>
</html>