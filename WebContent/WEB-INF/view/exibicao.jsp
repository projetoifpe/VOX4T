<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="br">


<head> 

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Home</title>

	<!-- FONTE ROBOTO -->
	<link href="https://fonts.googleapis.com/css?family=Roboto" rel="stylesheet" type="text/css">
	
	<!-- Import do bootstrap css -->
	<link   rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" />
    
    <!-- Custom fonts for this template -->
    <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:200,200i,300,300i,400,400i,600,600i,700,700i,900,900i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Merriweather:300,300i,400,400i,700,700i,900,900i" rel="stylesheet">
    <link href="<%=request.getContextPath()%>/resources/externo/font-awesome/css/font-awesome.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<%=request.getContextPath()%>/resources/externo/css/coming-soon.css" rel="stylesheet">
    
    <!-- Import do Style css -->
	<link   rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/style/style.css" />
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.2.0/css/all.css" integrity="sha384-hWVjflwFxL6sNzntih27bfxkr27PmbbK/iSvJ+a4+0owXq79v+lsFkW54bOGbiDQ" crossorigin="anonymous">

	
    
   
	
	<!-- Import do bootstrap js -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>
	
	
	<!-- Import do jQuery 3.3.1 -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/bootstrap/js/jquery-3.3.1.min.js"></script>
	
	<!-- Bootstrap core JavaScript -->
	<script src="<%=request.getContextPath()%>/resources/externo/js/jquery.min.js"></script>    
	<script src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.bundle.min.js"></script>
	
	<!-- Import de uma lista de funções personalizadas em JS -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/functions.js" charset="utf-8"></script>
	
	<!-- Custom scripts for this template -->
	<script src="<%=request.getContextPath()%>/resources/externo/js/coming-soon.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>	
	<script src="http://code.responsivevoice.org/responsivevoice.js"></script>
	
</head>


<script>
	
 $(document).ready(function(){
	 
	var idsessao = $("#idSessao").val();
	
	
	$('input[type=checkbox]').change(function(){
		
		if(this.checked){
			
			$.ajax({
	            url : 'userselect',
	            type : 'POST',
	            data : 'idCategoria=' + this.value + '&idUsuario='+idsessao,
	            success: function(data){
	            	location.reload();
	            }
	        });
			
		}else{
			 
			$.ajax({
	            url : 'userunselect',
	            type : 'POST',
	            data : 'idCategoria=' + this.value + '&idUsuario='+idsessao,
	            success: function(data){
	            	location.reload();
	            }
	        });
		}
		
	});


}); 
$( document ).ready(function() {
	
	var lista = [];
	$.post("publicacoes", {}, function(dadosJSON){
		/* for(i = 0; i < dadosJSON.length; i++){
			var string = ${canais.get(i)}.toString();
			dadosJSON[i].unshift(string);
		}
		*/
		lista = dadosJSON;
		console.log(dadosJSON);
	});
	console.log(lista);
		//ESTA LISTA TEM QUE SER A LISTA DE CANAIS E PUBLICACOES!
		var i = -1;
		var j = 0;
		
		function voiceEndCallback() {
			i++;
			if(i >= lista[j].length){
				j++;
				i = 0;
				if(j >= lista.length){
					console.log("Final da reprodução");
					i = -1;
					j = 0;
				}else{
					responsiveVoice.speak(lista[j][i], "Brazilian Portuguese Female", parameters);
				}
			}else{
				responsiveVoice.speak(lista[j][i], "Brazilian Portuguese Female", parameters);
			}
		    
		}
		 
		var parameters = {
		    onend: voiceEndCallback
		}
		 
	    	 
		$('#play').click(function(){

	    	responsiveVoice.speak(" ", "Brazilian Portuguese Female", parameters);

	    });
		
		 $('#stop').click(function(){
			responsiveVoice.pause();
			i--;
		});
		 
		 $('#passar').click(function(){
			 responsiveVoice.pause();
		 		i++;
		 		if(i >= lista[j].length){
		 			j++;
		 			i = 0;
		 			
		 			if(j >= lista.length){
		 				j = 0;
		 				i = -1;
		 				console.log("Final da reprodução");
		 			}else{
		 				responsiveVoice.speak(lista[j][i], "Brazilian Portuguese Female", parameters);
		 			}
		 		}else{
		 			responsiveVoice.speak(lista[j][i], "Brazilian Portuguese Female", parameters);
		 		}
		 		
			});
		 
		 $('#voltar').click(function(){
				responsiveVoice.pause();
		 		i--;
		 		if(i < 0){
		 			j--;
		 			if(j < 0){
		 				i= -1;
		 				j=0
		 				responsiveVoice.speak(lista[j][i], "Brazilian Portuguese Female", parameters);
		 			}else{
		 				i = lista[j].length-1;
		 				responsiveVoice.speak(lista[j][i], "Brazilian Portuguese Female", parameters);
		 			}
		 			
		 		}else{
		 			responsiveVoice.speak(lista[j][i], "Brazilian Portuguese Female", parameters);
		 		}
		 		
			});
	});

	    
	
</script>

<body style="overflow-y: hidden;overflow-x: hidden;background-color: #D3D3D3;">



    <div class="overlay">
<!-- NAV BAR -->
<c:choose>
	<c:when test="${adminLogado.email != null}">
		<c:import url="/WEB-INF/view/comum/nav-adm.jsp"></c:import>
	</c:when>
	<c:otherwise>
		<c:import url="/WEB-INF/view/comum/nav-user-logado-comum.jsp"></c:import>
	</c:otherwise>
</c:choose>






        <div class="content">

            <div class="row">
                <div class="col-sm"></div>
            </div>
            <div class="row">
                <div class="col-sm"></div>
            </div>


            <div class="row">
                <div class="col-md-2">

                    <div class="card " style="width: 12 rem; height: 100%; margin-top: 2%;">

                        <div class="card-body">
                            <h5 class="card-title">Categorias</h5>
                            	<form>

									<%int i=0; %> 										
									<c:forEach var="categoria" items="${listaCategoria}">
										
										<c:set var="contem" value="${0}" />
										<c:forEach var="categoriasUsuario" items="${CategoriasUsuario}">
										  <c:if test="${categoriasUsuario.idCategoria.id eq categoria.id}">
										    <c:set var="contem" value="${1}" />
										  </c:if>
										</c:forEach>
										
										  <c:choose>
         
									         <c:when test = "${contem == 1}">
									            <input type="checkbox" name="categoriaNome<%=i%>" id="categoriaNome<%=i%>" value="${categoria.id}" checked> 
									         </c:when>
									         
									         <c:otherwise>
									         	<input type="checkbox" name="categoriaNome<%=i%>" id="categoriaNome<%=i%>" value="${categoria.id}"> 
									         </c:otherwise>
									      </c:choose>
													
										<span class="label-text">${categoria.nome}</span>
													
										<br>
													
										<%i++; %>
												
									</c:forEach>
									
									<input type="hidden" id="idSessao" value="${usuarioLogado.id}">
							
											
								</form>
                        </div>

                    </div>
                </div>
<!-- DIV DO MEIO -->
<div class="col-md-8">

                    <div class ="card"  style="width: 12 rem;height: 100%; width: 900px; position:fixed;">
                    <c:if test="${publicacoes.size() > 0}">
                        <div class="card-body" style="overflow-y: scroll;">
                            <c:forEach var = "i" begin = "0" end = "${publicacoes.size()-1}">
                                <h4 class="card-title">${canais.get(i)}</h4>
                                <br>
                                <c:forEach var="twitter" items="${publicacoes.get(i)}">
                                    <p>${twitter}</p>
                                    <hr style="border-width:2px;">
                                </c:forEach>
                                <br>
                                <hr style="border-width:6px;">
                            </c:forEach> 
                        </div>
                    </c:if>
                    </div>


                </div>


                <div class="col-md-2">
                    <div class="card float-right" style="width: 17rem; margin-top: 8%;">

                        <div class="card-body">
                            <h5 class="card-title center" style="text-align: center;">Modo Voz</h5>

                            <button type="button" id="voltar" class="btn btn-default btn-lg">
                <i class="fas fa-step-backward" ></i>
                                
                            </button>

                            <button type="button" id="play" class="btn btn-default btn-lg">
                <i class="fas fa-play"></i>
                            </button>

                            <button type="button" id="stop" class="btn btn-default btn-lg">
                <i class="fas fa-stop"></i>
                            </button>

                            <button type="button" id="passar" class="btn btn-default btn-lg">
                <i class="fas fa-step-forward" ></i>
                            </button>




                        </div>

                    </div>
                </div>

            </div>
	</div>
            
</body>

</html>
