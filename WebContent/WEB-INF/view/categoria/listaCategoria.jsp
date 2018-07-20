<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 </head>

<body>

	<br />
	<div style="text-align: center; color: red;">${mensagem}</div>
	<div style="text-align: center; color: red;"> ${msg} </div> <br/>

	<table id="tabelaListaCategoria" class="table table-striped table-bordered" style="margin-right:2% ;margin-left: 2%;">
		<thead>
			<tr>
				<th style="width: 30%; vertical-align: middle; text-align: center;">Nome</th>
				<th style="width: 15%; vertical-align: middle; text-align: center;">Ações</th>
			</tr>
		</thead>
		<c:forEach var="categoria" items="${listaCategoria}">
				<tr>
					<td style="vertical-align: middle; text-align: center;">${categoria.nome}</td>
					<td style="vertical-align: middle; text-align: center;">
						<a href="edit?id=${categoria.id}" id="idc" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Alterar Categoria</a> &nbsp; &nbsp;
						<a href="delete?id=${categoria.id}" class="btn btn-primary">Remover Categoria</a>	
					</td>
				</tr>
		</c:forEach>
	</table>


<!-- MODAL PARA ALTERAR -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      
    </div>
  </div>
  </form>
<!--FIM DO MODAL PARA ALTERAR -->



	</body>	
	</html>