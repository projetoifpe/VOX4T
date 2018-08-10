<!-- NAV BAR DO USUARIO LOGADO - NÃO ADM -->
        <nav class="navbar navbar-expand-lg navbar-light bg-dark" style="background-color: ;">
            <a class="navbar-brand text-light" href="<%=request.getContextPath()%>/exibicao">VOX4T</a>
            <!-- OPÇÕES DA BARRA -->
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto"></ul>
                <a class="navbar-brand text-light" href="<%=request.getContextPath()%>/admin/menu">ADM</a>
                <a id="logoff" class="navbar-brand text-light" href="logout">Sair</a>
            </div>
        </nav>