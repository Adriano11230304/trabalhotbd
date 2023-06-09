<%-- 
    Document   : atendimentos
    Created on : 21 de mar. de 2023, 14:55:07
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
        
        
        %>
            <div class="container">
            <h4 class="m-2">Seus Atendimentos - Para verificar observações e diagnóstico visualize o atendimento</h4>
            </div>
            <div class="container">
                <a class="btn btn-outline-dark" href="novoatendimento.jsp">Adicionar um novo atendimento</a>
            </div>
            <div id="loading">Carregando...</div>
            <div class="container fluid" id="table">
                        <%
                            try{
                            String email = (String) session.getAttribute("email");
                            String senha = (String) session.getAttribute("senha");
                           
                            Usuario user = Usuario.getUser(email, senha);
                            List<Atendimento> list = Atendimento.listAllUser(user);
                            
                            if(list.size() > 0){
                            
                        %>
                            
                           <table class="table table-borderless table-hover mt-3">
                                <thead class="thead-dark text-md-center">
                                   <tr>
                                       <th scope="col">Nome do Paciente</th>
                                       <th scope="col">Código</th>
                                       <th scope="col">Data de criação</th>
                                       <th scope="col">Situação</th>
                                       <th scope="col">Ações</th>
                                    </tr>
                                </thead>
                                <tbody class="text-md-center">
                        <%for(int i = 0; i < list.size(); i++){
                                    out.println("<tr>");
                                    out.println("<td>"+list.get(i).getNomepaciente()+"</td>");
                                    out.println("<td>"+list.get(i).getCodigo()+"</td>");
                                    out.println("<td>"+list.get(i).getData()+"</td>");    
                                    out.println("<td>"+list.get(i).getSituacao()+"</td>");  
                                    out.println("<td>");
                                    out.println("<a class='btn btn-outline-dark' href='../controllers/atendimentosController.jsp?funcao=excluir&id="+list.get(i).getId()+"'>");
                                    out.println("<img src='../img/excluir.png' title='excluir atendimento' width='20px' height='20px'>");
                                    out.println("</a>");
                                    out.println("<a class='btn btn-outline-dark' href='../controllers/atendimentosController.jsp?funcao=editar&id="+list.get(i).getId()+"'>");
                                    out.println("<img src='../img/editar.png' title='editar atendimento' width='20px' height='20px'>");
                                    out.println("</a>");
                                    out.println("<a class='btn btn-outline-dark' href='detalheAtendimento.jsp?id="+list.get(i).getId()+"'>");
                                    out.println("<img src='../img/informacao.png' title='detalhar atendimento' width='20px' height='20px'>");
                                    out.println("</a>");
                                    out.println("</td>");
                                    out.println("</tr>");
                        }
                        }else{%>
                            <h4 class='m-2' align='center'>Nenhum atendimento encontrado!</h4>
                        <%}%>
                    </tbody>
                </table>
            </div>
                    <%
                            }catch(Exception e){
                                out.println(e);
                            }%>
        </div>
                        
    </div>
    </div>
    </body>
</html>
