		<!-- NAV BAR DO ADM -->
		<nav class="navbar navbar-expand-lg navbar-light bg-dark" style="background-color: ;">
            <a id="vox" class="navbar-brand text-light" href="<%=request.getContextPath()%>/admin/menu">VOX4T</a>
			<!-- OPÇÕES DA BARRA -->
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
        </nav>
