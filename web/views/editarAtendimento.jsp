<%-- 
    Document   : editarAtendimento
    Created on : 27 de mar. de 2023, 14:59:05
    Author     : ppgant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="javascript/script.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" crossorigin="anonymous" async></script>
<jsp:include page = "header.jsp" />
<%@ page language="Java" import="model.Atendimento"%>
    <%
            String email = (String) session.getAttribute("email");
            if(email == null){
                session.setAttribute("msg", "Você não tem está logado. Por favor, faça o login!");
                response.sendRedirect("../index.jsp");
            }else{
                String msg = (String) session.getAttribute("msg");
                if(msg != null){
                    out.println("<div class='col-md-10'>");
                    out.println("<h5 class='alert alert-success'>"+msg+"</h5>");
                    session.setAttribute("msg", null);
                }
            
            }
     %>
            <div class="col-md-10">
                <div class="container">
                    <h4 class="m-2">Alterar Atendimento</h4>
                </div>
                <%
                    int id = Integer.parseInt(request.getParameter("id"));
                    Atendimento a = Atendimento.getById(id);
                out.println("<form class='py-3 col-6 m-3 border' action='../controllers/atendimentosController.jsp?funcao=alterar&id="+a.getId()+"' method='post'>");
                %>
                    <div class="form-group">
                        <label>Nome do paciente</label>
                        <%
                        out.println("<input type='text' class='form-control' name='nomepaciente' id='nomepaciente' value='"+a.getNomepaciente()+"' required>");
                        %>
                    </div>
                    <div class="form-group">
                        <label>E-mail do paciente</label>
                        <%
                        out.println("<input type='email' class='form-control' name='email' id='email' value='"+a.getEmail()+"' required>");
                        %>
                    </div>
                    <div class="form-group">
                        <label>Código do Atendimento</label>
                        <%
                        out.println("<input type='text' class='form-control' maxlength='6' minlength='6' name='codigo' value='"+a.getCodigo()+"' required>");
                        %>
                    </div>
                     <div class="form-group">
                        <label>Observações</label>
                        <%
                        out.println("<textarea class='form-control' name='observacoes' id='observacoes'>"+a.getObservacoes()+"</textarea>");
                        %>    
                    </div>
                    <div class="form-group">
                        <label>Diagnóstico</label>
                        <%
                        out.println("<textarea class='form-control' name='diagnostico' id='diagnostico'>"+a.getDiagnostico()+"</textarea>");
                        %>
                    </div>
                    <div class="form-group">
                        <label>Situação</label>
                        <select class="custom-select" name="situacao">
                            <option value="pendente" selected>Pendente</option>
                            <option value="concluido">Concluído</option>
                        </select>
                    </div>
                    
                    
                    
                    <button class="btn btn-outline-dark" type="submit">Alterar atendimento</button>

                </form>
            </div>
        </div>
        </div>
        
    </body>
</html>
