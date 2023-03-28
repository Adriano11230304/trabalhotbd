<%-- 
    Document   : logout
    Created on : 21 de mar. de 2023, 16:47:46
    Author     : ppgant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    session.setAttribute("email", null);
    session.setAttribute("senha", null);
    session.setAttribute("msg", "Logout realizado com sucesso!");  
    response.sendRedirect("../index.jsp");

%>
