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
            
            if(request.getParameter("funcao").equals("excluir")){
                int id = Integer.parseInt(request.getParameter("id"));
                Atendimento a = Atendimento.getById(id);
                if(user.getId() == a.getUsuario().getId()){
                    Atendimento.delete(id);
                    session.setAttribute("msg", "Atendimento excluído com sucesso!");
                    response.sendRedirect("../views/atendimentos.jsp");
                }else{
                    session.setAttribute("msg", "Você não é o criador desse atendimento e, portanto, não poderá excluí-lo!");
                    response.sendRedirect("../views/todosAtendimentos.jsp");
                }
            }
    
            if(request.getParameter("funcao").equals("editar")){
                String id = "../views/editarAtendimento.jsp?id="+request.getParameter("id");
                response.sendRedirect(id);
            }
            
            if(request.getParameter("funcao").equals("alterar")){
                int id = Integer.parseInt(request.getParameter("id"));
                String nome = request.getParameter("nomepaciente");
                String emailPaciente = request.getParameter("email");
                String situacao = request.getParameter("situacao");
                String codigo = request.getParameter("codigo");
                String observacoes = request.getParameter("observacoes");
                String diagnostico = request.getParameter("diagnostico");
                Atendimento.editar(nome, codigo, observacoes, diagnostico, situacao, email, id);
                
                session.setAttribute("msg", "Atendimento editado com sucesso!");
                response.sendRedirect("../views/atendimentos.jsp");
            }
    
            if(request.getParameter("funcao").equals("add")){
                Atendimento a = new Atendimento();
                a.setNomepaciente(request.getParameter("nomepaciente"));
                a.setEmail(request.getParameter("email"));
                a.setCodigo(request.getParameter("codigo"));
                String datahora = request.getParameter("data") + " " + request.getParameter("hora"); 
                a.setData(datahora);
                a.setUsuario(user);
                a.setObservacoes(request.getParameter("observacoes"));
                a.setDiagnostico(request.getParameter("diagnostico"));
                a.setSituacao("pendente");
                a.create();
                session.setAttribute("msg", "Atendimento adicionado com sucesso!");
                response.sendRedirect("../views/atendimentos.jsp");
            }
            
        }catch(Exception e){
            out.println(e);
        }

%>
