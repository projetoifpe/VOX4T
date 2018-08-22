<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-br">
<head>
<title>Alterar Canal</title>
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
			<input type="hidden" name="id" id="id" value="${canal.id}">

			<!-- DIV do Modal -->
			<div class="modal-content container " style="width: 350px;">
				<div class="modal-header">
					<!-- DIV do Modal -->
					<h4 class="modal-title">Alterar Canal</h4>
					
					<!-- Botão de fechar Modal -->
					<a href="incluirCanal" class="close">&times;</a>
				</div>
				
				<!-- DIV do Modal -->
				<div class="modal-body">
					<div class="form-group">
					<label for="categoria">Categoria</label>
						<select id="categoria" name="categoria" class="custom-select"
							style="width: 280px;">
							
							<c:forEach items="${listaCategoria}" var="obj">
								<option value="${obj.id}"
									<c:if test="${obj.id eq canal.categoria.id}">selected="selected"</c:if>  >
									${obj.nome}
								</option>
							</c:forEach>
						</select> 
						
						<br> <br> 
						
						<label for="nome">Nome do Canal</label>
					
						<input type="text" id="nome" value="${canal.nome}" class="form-control" name="nome" style="width: 280px;" maxlength="45" required />
					</div>
				</div>
				
				<!-- Submit -->
				<div class="modal-footer">
					<a href="incluirCanal" class="btn btn-default" role="button">Cancelar</a>
					<button type="submit" class="btn btn-info">Salvar</button>

					<!-- FIM da DIV do Modal -->
				</div>
			</div>
		</form>
	</div>
</body>
</html>