<%-- 
    Document   : autenticate
    Created on : 21 de mar. de 2023, 14:51:10
    Author     : ppgant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="Java" import="model.Usuario"%>
<%@ page language="Java" import="model.Connection"%>
<%@ page language="Java" import="java.util.List"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            Usuario user = new Usuario();
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            List<Usuario> userFound = user.getUser(email, password);
            
            if(userFound.size() == 0){
                session.setAttribute("msg", "Usuário ou senha incorretos!");
                response.sendRedirect("login.jsp");
            }else{
                session.setAttribute("msg", "Login realizado com sucesso!");
                session.setAttribute("email", userFound.get(0).getEmail());
                session.setAttribute("senha", userFound.get(0).getSenha());
                response.sendRedirect("atendimentos.jsp");
            }
        %>
    </body>
</html>
