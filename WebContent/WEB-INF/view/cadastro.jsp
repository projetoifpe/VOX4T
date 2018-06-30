<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/resources/bootstrap/js/bootstrap.min.js"></script>
<!--<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>-->

<style type="text/css">
*[role="form"] {
    padding: 15px;
    margin-top: 220px;
    margin-left: 220px;
    background-color: #fff;
    border-radius: 0.3em;
}

input.alinha {
    margin-left: 5em;
    margin-bottom: 1em;
}




</style>
  <title>Teste cadastro</title>
</head>
<body>
<div class="container">
            <form class="form-horizontal" role="form">
                <div class="form-group">
                    <label for="firstName" class="col-sm-3 control-label">Nome</label>
                    <div class="col-sm-9">
                        <input type="text" id="firstName" placeholder="Nome" class="form-control" style="width: 250px;" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="col-sm-3 control-label">Email</label>
                    <div class="col-sm-9">
                        <input type="email" id="email" placeholder="Email" class="form-control" style="width: 250px;" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-3 control-label">Senha</label>
                    <div class="col-sm-9">
                        <input type="password" id="password" placeholder="senha" class="form-control" style="width: 250px;" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="confpassword" class="col-sm-3 control-label">Confirmar Senha</label>
                    <div class="col-sm-9">
                        <input type="password" id="confpassword" placeholder="Confirmar senha" class="form-control" style="width: 250px;" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="birthDate" class="col-sm-3 control-label">Data de Nascimento</label>
                    <div class="col-sm-9">
                    
                    
                    
                    <!-- Coloca a mascara aqui!! -->
                    
                    
                    
                        <input type="text" id="birthDate" class="form-control" style="width: 250px;" placeholder="Data de nascimento" required>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-3">Genero</label>
                    <div class="col-sm-6">
                        <div class="row">
                            <div class="col-sm-4">
                                <label class="radio-inline"><input type="radio" id="feminino" name="genero" value="Female" required>Feminino</label>   
                            </div>
                            <div class="col-sm-4">
                                <label class="radio-inline"><input type="radio" id="masculino" name="genero" value="Male">Masculino</label>        
                            </div>
                            <div class="col-sm-4">
                                <label class="radio-inline"><input type="radio" id="outro" name="genero" value="Unknown"> Outros</label>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-9 col-sm-offset-3" style="margin-left: 50px;">
                        <button type="submit" style="width: 150px; margin-left: 220px;" class="btn btn-primary btn-block">Cadastrar</button>
                    </div>
                </div>
            </form> 
        </div> 
</body>
</html>