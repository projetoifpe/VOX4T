<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
    <html lang="br">

    <!--  CABEÇALHO -->

    <head>
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/bootstrap/js/jquery-3.3.1.min.js"></script>

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
   
        <title>Administrador</title>

        <!-- Bootstrap core CSS -->
        <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" />
        <!-- Link cdn glyplicon-->

        <!-- Custom fonts for this template -->
    	<link href="<%=request.getContextPath()%>/resources/externo/font-awesome/css/font-awesome.min.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="<%=request.getContextPath()%>/resources/externo/css/coming-soon.css" rel="stylesheet">

    </head>

    <body style="overflow:hidden;">
        <div class="overlay">
		<c:import url="/WEB-INF/view/comum/nav-adm.jsp"></c:import>
            


            <!-- USUÃRIOS -->
            <div class="content">
                <div class="row">
                    <div class="col-md-10">

                        <div class="card" style="margin-top: 10px;">

                            <form>
                                <input type="text" class="form-control" style="width: 25%" placeholder="Buscar">

                            </form>
                            
                            <form>
                            <table class="table table-striped">
                                <thead>
                                    <tr>
                                        <th scope="col">Nome</th>
                                        <th scope="col">Email</th>
                                        <th scope="col">Status</th>
                                       
                                        <th scope="col">Excluir</th>
                                    </tr>
                                </thead>
                                <tbody>
                                
                                	<c:forEach var="user" items="${usuarios}">
                                    <tr>
                                        <th scope="row">${user.getNome()}</th>
                                        <td>${user.getEmail()}</td>
                                        <td>    
                                       
                                        	<label class="switch">
  											<input type="checkbox" name="status" value="${user.id}" checked>
  											<span class="slider round"></span>
											</label>
    								
  										</td>                                      
                                         <td><a class="btn btn-danger" href="excluirUsuario?id=${user.id}">X</a></td>
                                    </tr>
                             	
                             	
                                   
                                    <br>
                                </c:forEach>
                                    
                               
                                </tbody>
                            </table>
							</form>
                        </div>
                    </div>
                </div>

            </div>













            <!-- Bootstrap core JavaScript -->
            <script src="<%=request.getContextPath()%>/resources/externo/js/jquery.min.js"></script>    
			<script src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.bundle.min.js"></script>

            <!-- Custom scripts for this template -->
            <script src="<%=request.getContextPath()%>/resources/externo/js/coming-soon.min.js"></script>

    </body>

    </html>