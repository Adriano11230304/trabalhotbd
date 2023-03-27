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
            try{
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                
                Usuario userFound = Usuario.getUser(email, password);
            
               
                session.setAttribute("msg", "Login realizado com sucesso!");
                session.setAttribute("email", userFound.getEmail());
                session.setAttribute("senha", userFound.getSenha());
                response.sendRedirect("atendimentos.jsp");
                
            }catch(Exception e){
                session.setAttribute("msg", "Usuário ou senha incorretos!");
                response.sendRedirect("../index.jsp");
            }
            
        %>
    </body>
</html>
