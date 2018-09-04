<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="pt-br">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title> Sobre </title>

    <!-- Bootstrap core CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" />

    <!-- Custom styles for this template -->
    <link href="<%=request.getContextPath()%>/resources/externo/css/coming-soon.css" rel="stylesheet">
    
    <style>
    	#inicio {
    		margin-top: 100px;
    	}
    </style>

  </head>

  <body>

	<c:import url="/WEB-INF/view/comum/nav-comum.jsp"></c:import>

    <!-- Page Content -->
    <div class="container" id="inicio">

      <!-- Introduction Row -->
      <h1 class="my-3">O que é o VOX4T ? </h1>
		<h5>É um sistema que se destina a facilitar a visualização de tweets com diversos filtros, ferramentas e funções, como por exemplo um sistema de transmissão das mensagens por voz!
			Além disso, possibilita que o usuário selecione categorias de tweets que mais o agradam, tornando o sistema mais confortável para cada tipo de usuário.
		</h5>

      <!-- Team Members Row -->
      <div class="row my-5">
        <div class="col-lg-12">
          <h2 class="my-4">Equipe</h2>
        </div>
        <div class="col-lg-4 col-sm-6 text-center mb-4">
          <img class="rounded-circle img-fluid d-block mx-auto" src="<%=request.getContextPath()%>/resources/img/claudes.jpg" alt="">
          <h3>Claudes Gomes
          </h3>
          <p>claudesferreira99@gmail.com</p>
        </div>
        <div class="col-lg-4 col-sm-6 text-center mb-4">
          <img class="rounded-circle img-fluid d-block mx-auto" src="<%=request.getContextPath()%>/resources/img/henrique.jpg" alt="">
          <h3>Henrique Nunes
          </h3>
          <p>henriquenunesti@gmail.com</p>
        </div>
        <div class="col-lg-4 col-sm-6 text-center mb-4">
          <img class="rounded-circle img-fluid d-block mx-auto" src="<%=request.getContextPath()%>/resources/img/hermes.jpg" alt="">
          <h3>Hermes Neto
          </h3>
          <p>hrmslns@gmail.com</p>
        </div>
        <div class="col-lg-4 col-sm-6 text-center mb-4">
          <img class="rounded-circle img-fluid d-block mx-auto" src="<%=request.getContextPath()%>/resources/img/marl.jpg" alt="">
          <h3>Marlysson de Oliveira
          </h3>
          <p>marlysson.oliveira@hotmail.com</p>
        </div>
        <div class="col-lg-4 col-sm-6 text-center mb-4">
          <img class="rounded-circle img-fluid d-block mx-auto" src="<%=request.getContextPath()%>/resources/img/wendel.jpg" alt="">
          <h3>Wendel Marcelino
          </h3>
          <p>wendel_mcr_sp@hotmail.com</p>
        </div>
        <div class="col-lg-4 col-sm-6 text-center mb-4">
          <img class="rounded-circle img-fluid d-block mx-auto" src="<%=request.getContextPath()%>/resources/img/wildici.jpg" alt="">
          <h3>Wildici Lins
          </h3>
          <p>wildici@hotmail.com</p>
        </div>
      </div>

    </div>
    <!-- /.container -->

    <!-- Footer -->
    <footer class="py-2 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; 2018 VOX4T - Todos os direitos reservados</p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="<%=request.getContextPath()%>/resources/externo/js/jquery.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.bundle.min.js"></script>

  </body>

</html>
