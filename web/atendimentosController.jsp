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
                response.sendRedirect("index.jsp");
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
                    response.sendRedirect("atendimentos.jsp");
                }else{
                    session.setAttribute("msg", "Você não é o criador desse atendimento e, portanto, não poderá excluí-lo!");
                    response.sendRedirect("todosAtendimentos.jsp");
                }
            }
    
            if(request.getParameter("funcao").equals("editar")){
                out.println("<script>console.log('entrou');</script>");
            }
    
            if(request.getParameter("funcao").equals("add")){
                Atendimento a = new Atendimento();
                a.setNomepaciente(request.getParameter("nomepaciente"));
                a.setEmail(request.getParameter("email"));
                a.setCodigo(request.getParameter("codigo"));
                a.setData(request.getParameter("data"));
                a.setUsuario(user);
                a.setObservacoes(request.getParameter("observacoes"));
                a.setDiagnostico(request.getParameter("diagnostico"));
                a.setData("2023-10-03 12:00:00");
                a.setSituacao("pendente");
                a.create();
                session.setAttribute("msg", "Atendimento adicionado com sucesso!");
                response.sendRedirect("atendimentos.jsp");
            }
            
        }catch(Exception e){
            out.println(e);
        }

%>
