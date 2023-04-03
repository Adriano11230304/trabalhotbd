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
<%@ page language="Java" import="java.util.List"%>

<%
        try{
            if(request.getParameter("funcao").equals("add")){
                Usuario useradd = new Usuario();
                useradd.setNome(request.getParameter("nome"));
                useradd.setSenha(request.getParameter("senha"));
                useradd.setEmail(request.getParameter("email"));
                useradd.setCodigo(request.getParameter("codigo"));
                Setor s = Setor.getById(Integer.parseInt(request.getParameter("setor")));
                useradd.setSetor(s);
                
                
                useradd.create();
                session.setAttribute("msg","Usuario adicionado com sucesso!");
                response.sendRedirect("../index.jsp");
            }
            
            if(request.getParameter("funcao").equals("excluir")){
                int id = Integer.parseInt(request.getParameter("id"));
                Usuario userdelete = Usuario.getById(id);
                List<Atendimento> list = Atendimento.listAllUser(userdelete);
                    if(list.size() > 0){
                        session.setAttribute("msg", "Exclua os atendimentos desse usuário para depois excluir o usuário!");
                        response.sendRedirect("../views/usuarios.jsp");
                    }else{
                        Usuario.delete(id);
                        session.setAttribute("msg", "Usuário excluído com sucesso!");
                        response.sendRedirect("../views/usuarios.jsp");
                    }
                    
                
            }
    
            if(request.getParameter("funcao").equals("editar")){
                String id = "../views/editarUsuario.jsp?id="+request.getParameter("id");
                response.sendRedirect(id);
            }
            
            if(request.getParameter("funcao").equals("alterar")){
                int id = Integer.parseInt(request.getParameter("id"));
                String nome = request.getParameter("nome");
                String senhaUser = request.getParameter("senha");
                String emailUser = request.getParameter("email");
                String codigo = request.getParameter("codigo");
                int s = Integer.parseInt(request.getParameter("setor"));
                Setor setor = Setor.getById(s);
                Usuario.editar(nome, senhaUser, codigo, emailUser, setor,  id);
                session.setAttribute("msg", "usuario editado com sucesso!");
                response.sendRedirect("../views/usuarios.jsp");
            }
            
        }catch(Exception e){
            out.println(e);
        }

%>
