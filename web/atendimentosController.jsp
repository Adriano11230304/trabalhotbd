<%-- 
    Document   : atendimentosController
    Created on : 23 de mar. de 2023, 18:41:26
    Author     : ppgant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="Java" import="model.Usuario"%>
<%@ page language="Java" import="model.Connection"%>
<%@ page language="Java" import="model.Atendimento"%>
<%
   if(request.getParameter("funcao").equals("excluir")){
        out.println("<script>console.log('entrou');</script>");
    }
    
    if(request.getParameter("funcao").equals("excluir")){
        out.println("<script>console.log('entrou');</script>");
    }
    
    if(request.getParameter("funcao").equals("add")){
        Atendimento a = new Atendimento();
        a.setNomepaciente(request.getParameter("nomepaciente"));
        a.setEmail(request.getParameter("email"));
        a.setCodigo(request.getParameter("codigo"));
        a.setData(request.getParameter("data"));
        Usuario u = new Usuario();
        String email = (String) session.getAttribute("email");
        String senha = (String) session.getAttribute("senha");
        Usuario user = u.getUser(email, senha);
        a.setUsuario(user);
        a.setObservacoes(request.getParameter("observacoes"));
        a.setDiagnostico(request.getParameter("diagnostico"));
        a.setData("2023-10-03 12:00:00");
        a.setSituacao("pendente");
        a.create();
        response.sendRedirect("todosAtendimentos.jsp");
    }

%>
