		<!-- NAV BAR DO ADM -->
 <!-- gdrgd
		<nav class="navbar navbar-expand-lg navbar-light bg-dark" style="background-color: ;">
            <a id="vox" class="navbar-brand text-light" href="<%=request.getContextPath()%>/admin/menu">VOX4T</a>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
            			<a id="usuario" class="navbar-brand text-light" href="<%=request.getContextPath()%>/admin/gerenciar-usuario">Usuario</a>
                    </li>
                    <li>
                    	<a id="categoria" class="navbar-brand text-light" href="<%=request.getContextPath()%>/categoria/add">Categoria</a>
                    </li>
                    <li>                    
                    	<a id="canal" class="navbar-brand text-light" href="<%=request.getContextPath()%>/canal/incluirCanal">Canal</a>
	                </li>
	                <li>
	                	<a id="logoff" class="navbar-brand text-light" href="<%=request.getContextPath()%>/exibicao">Tweets</a>
	                </li>
				</ul>
					<a id="logoff" class="navbar-brand text-light" href="<%=request.getContextPath()%>/logout">Sair</a>
            </div>
        </nav>  -->

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
	<div class="container">
		<a href="" class="navbar-brand h1 mb-0">VOX4T</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarAdm">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarAdm">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item">
					<a class="nav-link" href="<%=request.getContextPath()%>/admin/gerenciar-usuario">Usuario</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="<%=request.getContextPath()%>/categoria/add">Categoria</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="<%=request.getContextPath()%>/canal/incluirCanal">Canal</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="<%=request.getContextPath()%>/exibicao">Tweets</a>
				</li>
			</ul>

			<ul class="navbar-nav ml-auto">
				<li class="nav-item">
					<a class="nav-link" href="<%=request.getContextPath()%>/logout">Sair</a>
				</li>
			</ul>

		</div>
	</div>
</nav>

			<script src="<%=request.getContextPath()%>/resources/bootstrap/js/jquery.js"></script>    
			<script src="<%=request.getContextPath()%>/resources/bootstrap/js/popper.js"></script>
			<script src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.js"></script>	            
			<script src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.bundle.min.js"></script>
            <script src="<%=request.getContextPath()%>/resources/externo/js/coming-soon.min.js"></script>