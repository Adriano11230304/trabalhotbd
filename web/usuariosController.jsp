<%-- 
    Document   : usuariosController
    Created on : 24 de mar. de 2023, 13:38:42
    Author     : ppgant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="Java" import="model.Usuario"%>
<%@ page language="Java" import="model.Connection"%>
<%@ page language="Java" import="model.Atendimento"%>
<%@ page language="Java" import="model.Setor"%>

<%
        try{
            String email = (String) session.getAttribute("email");
            String senha = (String) session.getAttribute("senha");
            Usuario user = Usuario.getUser(email, senha);
            if(email == null){
                session.setAttribute("msg", "Você não tem está logado. Por favor, faça o login!");
                response.sendRedirect("index.jsp");
            }else{
                String msg = (String) session.getAttribute("msg");
                if(msg != null){
                    out.println("<h5 class='alert alert-success'>"+msg+"</h5>");
                    session.setAttribute("msg", null);
                }
            
            }
            if(request.getParameter("funcao").equals("add")){
                Usuario useradd = new Usuario();
                useradd.setNome(request.getParameter("nome"));
                useradd.setEmail(request.getParameter("email"));
                useradd.setCodigo(request.getParameter("codigo"));
                Setor s = Setor.getById(Integer.parseInt(request.getParameter("setor")));
                useradd.setSetor(s);
                
                
                useradd.create();
                session.setAttribute("msg","Usuario adicionado com sucesso!");
                response.sendRedirect("usuarios.jsp");
            }
            
            if(request.getParameter("funcao").equals("excluir")){
                int id = Integer.parseInt(request.getParameter("id"));
                Usuario.delete(id);
                session.setAttribute("msg", "Usuário excluído com sucesso!");
                response.sendRedirect("usuarios.jsp");
            }
    
            if(request.getParameter("funcao").equals("editar")){
                out.println("<script>console.log('entrou');</script>");
            }
            
        }catch(Exception e){
            out.println(e);
        }

%>
