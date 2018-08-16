<!-- NAV BAR DO USUARIO LOGADO - NÃO ADM -->
        <nav class="navbar navbar-expand-lg navbar-light bg-dark" style="background-color: ;">
            <a class="navbar-brand text-light" href="<%=request.getContextPath()%>/exibicao">VOX4T</a>
            <!-- OPÇÕES DA BARRA -->
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto"></ul>
                <ul class="navbar-nav mr-left">
                	<li class="nav-item dropdown">
                		<a href="#" class="nav-link dropdown-toggle" id="dropdown1" data-toggle="dropdown" aria-haspopup="true" style="color:white; margin-left: 65px;" aria-expanded="false">Usuario</a>
                		<ul class="dropdown-menu" aria-labelledby="dropdown1">
                    		<li class="dropdown-item"><a href="#">Editar Dados</a></li>
                    		<li class="dropdown-item"><a href="<%=request.getContextPath()%>">Sair</a></li>
                		</ul>
               		</li>
                </ul>
            </div>
        </nav>
