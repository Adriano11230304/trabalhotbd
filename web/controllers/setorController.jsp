<%-- 
    Document   : setorController
    Created on : 24 de mar. de 2023, 11:54:03
    Author     : ppgant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="Java" import="model.Usuario"%>
<%@ page language="Java" import="model.Connection"%>
<%@ page language="Java" import="model.Atendimento"%>
<%@ page language="Java" import="model.Setor"%>
<%@ page language="Java" import="java.util.List"%>

<%
        try{
            String email = (String) session.getAttribute("email");
            String senha = (String) session.getAttribute("senha");
            Usuario user = Usuario.getUser(email, senha);
            if(email == null){
                session.setAttribute("msg", "Você não tem está logado. Por favor, faça o login!");
                response.sendRedirect("../index.jsp");
            }else{
                String msg = (String) session.getAttribute("msg");
                if(msg != null){
                    out.println("<h5 class='alert alert-success'>"+msg+"</h5>");
                    session.setAttribute("msg", null);
                }
            
            }
            if(request.getParameter("funcao").equals("add")){
                Setor setor = new Setor();
                setor.setNome(request.getParameter("nome"));
                setor.setDescricao(request.getParameter("descricao"));
                setor.setCodigo(request.getParameter("codigo"));
                
                setor.create();
                session.setAttribute("msg","Setor adicionado com sucesso!");
                response.sendRedirect("../views/setores.jsp");
            }
            
            if(request.getParameter("funcao").equals("excluir")){
                int id = Integer.parseInt(request.getParameter("id"));
                Setor s = Setor.getById(id);
                List<Usuario> list = Usuario.listUsersSetor(s);
                if(list.size() > 0){
                    session.setAttribute("msg", "Exclua primeiro os usuários desse setor para após excluir o Setor!");
                    response.sendRedirect("../views/setores.jsp");
                }else{
                    Setor.delete(id);
                    session.setAttribute("msg", "Setor excluído com sucesso!");
                    response.sendRedirect("../views/setores.jsp");
                }
                
                
            }
    
            if(request.getParameter("funcao").equals("editar")){
                String id = "../views/editarSetor.jsp?id="+request.getParameter("id");
                response.sendRedirect(id);
            }
            
            if(request.getParameter("funcao").equals("alterar")){
                int id = Integer.parseInt(request.getParameter("id"));
                String nome = request.getParameter("nome");
                String descricao = request.getParameter("descricao");
                String codigo = request.getParameter("codigo");
                Setor.editar(nome, codigo, descricao, id);
                session.setAttribute("msg", "Setor editado com sucesso!");
                response.sendRedirect("../views/setores.jsp");
                
            }
            
        }catch(Exception e){
            out.println(e);
        }

%>
