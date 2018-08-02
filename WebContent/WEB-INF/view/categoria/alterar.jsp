<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<!-- Atualiza a página quando fechar o modal -->
<script>function atualiza(){location.reload();}</script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<!-- Fim do HEAD -->

<body>
      <form  action="update" method="post">
        
            <!-- recebe id -->
      <input type="hidden" name="id" value="${categoria.id}">
        
        <!-- DIV do Modal -->
      <div class="modal-content"> 
        <div class="modal-header">
        <!-- DIV do Modal -->
        
          <h4 class="modal-title">Alterar Categoria</h4>
            
            	<!-- Botão de fechar Modal -->
          <a href="add" class="close" >&times;</a>
      </div>
        <!-- DIV do Modal -->
        <div class="modal-body">
          <div class="form-group">

			<label for="inputNome">Nome da Categoria</label> 

			        <!-- Input Alterar Categoria -->  	
  				<input type="text" id="nome" value="${categoria.nome}"  class="form-control" name="nome"
				style="width: 350px;" maxlength="45" required="required" />
	
	
		</div> 
        </div>
         		<!-- Submit -->
        <div class="modal-footer">
        <a href="add" class="btn btn-default" role="button">Fechar</a>
        <button type="submit" class="btn btn-success" >Salvar</button>
        
        <!-- FIM da DIV do Modal -->
        </div>
      </div>
      
<!-- FIM do Formulário -->
</form>      

</body>
</html>