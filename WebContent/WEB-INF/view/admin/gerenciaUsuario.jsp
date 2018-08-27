<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
    <html lang="pt-br">

    <head>
		<title>Gerenciar Usuário</title>
		<meta charset="utf-8">
		<script src="<%=request.getContextPath()%>/resources/bootstrap/js/jquery-3.3.1.min.js"></script>
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">

<script>
$(document).ready(function(){
    $('input[type=checkbox]').change(function(){
                if(this.checked){
                	$.ajax({
        	            url : 'usuario-status-checked',    //Aqui onde tem x coloca a url de um controler que você vai fazer o método
         	            type : 'POST',
        	            data : 'status=' +this.value,
        	            success: function(data){
        	                $('#resultado').html(data);
        	            }
        	        });
                }else{
                	$.ajax({
        	            url : 'usuario-status-unchecked',        //Aqui onde tem y coloca a url de um controller pra desativar o usuario
        	            type : 'POST',
        	            data : 'status='+this.value,
        	            success: function(data){
        	                $('#resultado').html(data);
        	            }
        	        });
                }
     });

});
</script>
    <style>
    
   /* SWITCH BUTTON */ 
.switch {
  position: relative;
  display: inline-block;
  width: 60px;
  height: 34px;
}

.switch input {display:none;}

.slider {
  position: absolute;
  cursor: pointer;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #ccc;
  -webkit-transition: .4s;
  transition: .4s;
}

.slider:before {
  position: absolute;
  content: "";
  height: 26px;
  width: 26px;
  left: 4px;
  bottom: 4px;
  background-color: white;
  -webkit-transition: .4s;
  transition: .4s;
}

input:checked + .slider {
  background-color: #2196F3;
}

input:focus + .slider {
  box-shadow: 0 0 1px #2196F3;
}

input:checked + .slider:before {
  -webkit-transform: translateX(26px);
  -ms-transform: translateX(26px);
  transform: translateX(26px);
}

/* Rounded sliders */
.slider.round {
  border-radius: 34px;
}

.slider.round:before {
  border-radius: 50%;
}
</style>

        <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" />

    </head>

    <body style="overflow:hidden;">

		<c:import url="/WEB-INF/view/comum/nav-adm.jsp"></c:import>
            
	<div class="container">
	
	<h1 align="center" class="display-5 mt-5"><i class="fas fa-users text-primary" aria-hidden="true"></i> Lista de Usuários</h1>

            <!-- USUÁRIOS -->
                            <table class="table table-responsive-sm table-dark">
                                <thead>
                                    <tr class="text-center">
                                        <th scope="col">Nome</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Status</th>
                                        <th scope="col">Excluir</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                	<c:forEach var="user" items="${usuarios}">
                                    <tr class="text-center">
                                        <th scope="row">${user.getNome()}</th>
                                        <td>${user.getEmail()}</td>
                                        <td>    
                                       
                                        	<label class="switch">
                                        	<c:choose> 
                                        		<c:when test="${user.status == 1}">
                                        			<input type="checkbox" name="status" value="${user.id}" checked>
                                				</c:when>
                                        		<c:otherwise>
                                        			<input type="checkbox" name="status" value="${user.id}">
                                        		</c:otherwise>
                                        	</c:choose>
  											<span class="slider round"></span>
											</label>
    								
  										</td>                                      
                                         <td><a class="btn btn-danger" href="excluirUsuario?id=${user.id}">X</a></td>
                                    </tr>
                                    
                                    <br>
                                    
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
    </body>
    </html>