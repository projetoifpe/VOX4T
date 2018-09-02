<!-- INICIO NAV -->
        <nav class="navbar navbar-expand-lg navbar-light bg-dark" style="background-color: ;">
            <a class="navbar-brand text-light" href="<%=request.getContextPath()%>">VOX4T</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link text-light" href="sobre">Sobre</a>
                    </li>


                </ul>

                    <a href="<%=request.getContextPath()%>/usuario/cadastro" class="btn btn-outline-light my-2 my-sm-0" style="margin-right: 6px">Cadastre-se</a>
                    <button class="btn btn-outline-light my-2 my-sm-0" data-toggle="modal" data-target="#modal-mensagem">Login</button>

            </div>
        </nav>

<!-- FINAL NAV -->