<%-- 
    Document   : editarSetor.jsp
    Created on : 26 de mar. de 2023, 17:12:29
    Author     : adriano
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="javascript/script.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" crossorigin="anonymous" async></script>
<jsp:include page = "header.jsp" />
<%@ page language="Java" import="model.Setor"%>
    <%
            String email = (String) session.getAttribute("email");
            if(email == null){
                session.setAttribute("msg", "Você não tem está logado. Por favor, faça o login!");
                response.sendRedirect("index.jsp");
            }else{
                String msg = (String) session.getAttribute("msg");
                if(msg != null){
                    out.println("<div class='col-md-10'>");
                    out.println("<h5 class='alert alert-success'>"+msg+"</h5>");
                    session.setAttribute("msg", null);
                }
            
            }
            
            int id = Integer.parseInt(request.getParameter("id"));
            Setor s = Setor.getById(id);
     %>
            <div class="col-md-10">
                <div class="container">
                    <h4 class="m-2">Novo Setor</h4>
                </div>
                <%
                out.println("<form class='py-3 col-6 m-3 border' action='setorController.jsp?funcao=alterar&id="+s.getId()+"' method='post'>");
                %>
                    <div class="form-group">
                        <label>Nome</label>
                        <%
                        out.println("<input type='text' class='form-control' name='nome' id='nome' value='"+s.getNome()+"' required>");
                        %>
                    </div>
                    <div class="form-group">
                        <label>Código do Setor</label>
                        <%
                        out.println("<input type='text' class='form-control' maxlengthvalue='"+s.getNome()+"'='6' minlength='6' name='codigo' value='"+s.getCodigo()+"'  required>");
                        %>
                    </div>
                     <div class="form-group">
                        <label>Descrição</label>
                        <%
                        out.println("<textarea class='form-control' name='descricao' id='descricao' required>"+s.getDescricao()+"</textarea>");
                        %>
                    </div>
                    
                    <button class="btn btn-outline-dark" type="submit">Alterar setor</button>

                </form>
            </div>
        </div>
        </div>
        
    </body>
</html>
