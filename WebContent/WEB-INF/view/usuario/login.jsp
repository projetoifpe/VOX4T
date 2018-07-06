<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Teste Login</title>
</head>
<body>

	<form id="contactForm" class="form-horizontal" role="form" method="post" action="loginCheck">
                <div class="form-group">
        <div class="col-md-7 col-md-offset-3">
            <div id="messages"></div>
        </div>
    </div>       
                <div class="form-group">
                    <label for="email" class="col-sm-3 control-label">Email</label>
                    <div class="col-md-6">
                        <input type="email" name="email" placeholder="Informe seu Email" class="form-control" style="width: 420px;" required>
                    </div>
                    <div class="form-group">
                    <label for="senha" class="col-sm-3 control-label">Senha</label>
                    <div class="col-md-6">
                        <input type="password" name="senha" id="key" placeholder="Escolha uma senha" class="form-control" style="width: 420px;" minlength = "6" maxlength="45" required>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-3" style="margin-left: 50px;">
                        <button type="submit" style="width: 150px; margin-left: 220px;" class="btn btn-primary btn-block">Cadastrar</button>
                    </div>
                </div>
            </form> 
	
</body>
</html>