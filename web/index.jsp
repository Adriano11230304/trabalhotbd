<%-- 
    Document   : index
    Created on : 21 de mar. de 2023, 12:23:22
    Author     : ppgant
--%>
<%@ page language="Java" import="model.Usuario"%>
<%@ page language="Java" import="model.Connection"%>
<%@ page language="Java" import="model.Setor"%>
<%@ page language="Java" import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>SUPAI</title>
        <link rel="stylesheet" href="css/style.css" crossorigin="anonymous">
    </head>
    <body>
        <div class="text-white bg-dark text-center border-0">
            <div class="card-header">
                <h3>Sistema SUPAI - Sistema da Unidade de Assistência Básica do IFRS</h3>
            </div>
        </div>
        <div class="container-fluid">
    <div class="row">
        <div class="col-md-4"></div>
        <form class="py-3 col-4 mt-3 border" action="views/autenticate.jsp" method="post">
            <div class="form-group">
                <label>Email</label>
                <input type="email" class="form-control" name="email" placeholder="Escreva o seu e-mail" onkeyup="teste()" required>
            </div>
            <div class="form-group">
                <label>Password</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="Escreva sua senha" required>
            </div>
            <div class="form-group">
                <input type="checkbox" name="inputpassword" id="inputpassword" onclick="mostrarpassword()">
                <label>Mostrar Senha</label>
            </div>
            <button class="btn btn-outline-dark" type="submit">Entrar</button>

        </form>
        
    </div>
            <%
            String msg = (String) session.getAttribute("msg");
            if(msg != null){
                out.println("<h5 class='alert alert-danger'>"+msg+"</h5>");
                session.setAttribute("msg", null);
            }
            
        %>
    <br /><br />
    
    <p class="float-right">Todos os direitos reservados.</p>
</div>
</div>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<script src="javascript/script.js"></script>
        
    </body>
</html>
