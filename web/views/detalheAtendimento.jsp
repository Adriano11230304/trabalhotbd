<%-- 
    Document   : detalheAtendimento
    Created on : 28 de mar. de 2023, 10:34:33
    Author     : ppgant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page = "header.jsp" />
<%@ page language="Java" import="model.Usuario"%>
<%@ page language="Java" import="model.Connection"%>
<%@ page language="Java" import="java.util.List"%>
<%@ page language="Java" import="java.util.ArrayList"%>
<%@ page language="Java" import="model.Setor"%>
<%@ page language="Java" import="model.Atendimento"%>
        
        
        <div class="col-md-10">
            <%
        try{
            String email = (String) session.getAttribute("email");
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
        }catch(Exception e){
            out.println(e);
        }
        
        int id = Integer.parseInt(request.getParameter("id"));
        Atendimento a = Atendimento.getById(id);
                
        %>
            <div class="container">
                <a class="btn btn-outline-dark m-2" href="novoatendimento.jsp">Adicionar um novo atendimento</a>
            </div>
            <div class="container">
            <h4 class="m-2">Atendimento - Código - <%=a.getCodigo()%></h4>
            </div>
            
            <div class="container fluid">
                        <%
                            try{
                                String email = (String) session.getAttribute("email");
                                String senha = (String) session.getAttribute("senha");
                           
                                Usuario user = Usuario.getUser(email, senha);
                               %>
                               <br/>
                                <div class="flex-container m-2">
                                    <h4>Nome do paciente: <%=a.getNomepaciente()%></h4>
                                </div>
                                <div class="flex-container m-2">
                                    <h6>Data de criação do atendimento: <%=a.getData()%></h6>
                                </div>
                                <br/>
                                <div class="flex-container m-2">
                                    <h5>Situação do Atendimento: <%=a.getSituacao()%></h5>
                                </div>
                                <br/><br/>
                                <div class="flex-container m-2">
                                    <h5>Observações: <%=a.getObservacoes()%></h5>
                                </div>
                                <br/><br/>
                                <div class="flex-container m-2">
                                    <h5>Diagnóstico: <%=a.getDiagnostico()%></h5>
                                </div>
                         
                            <%}catch(Exception e){
                                out.println(e);
                            }%>
                            <br/>
                           <div class="container">
                                <a class="btn btn-outline-dark m-2" href="atendimentos.jsp">Voltar</a>
                            </div>
        </div>
                        
    </div>
    </div>
    </body>
</html>
