<%-- 
    Document   : cliente
    Created on : 21 de mar. de 2023, 16:52:07
    Author     : ppgant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="javascript/script.js"></script>
<jsp:include page = "header.jsp" />
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
     %>
                <form class="py-3 col-6 m-3 border" action="" method="post">
                    <div class="form-group">
                        <label>Nome do paciente</label>
                        <input type="text" class="form-control" name="nomepaciente" onkeyup="teste()" placeholder="Escreva o nome do paciente" required>
                    </div>
                    <div class="form-group">
                        <label>E-mail do paciente</label>
                        <input type="email" class="form-control" name="nomepaciente" placeholder="Escreva o email do paciente">
                    </div>
                     <div class="form-group">
                        <label>Observações</label>
                        <textarea class="form-control">
                            
                        </textarea>
                    </div>
                    <div class="form-group">
                        <label>Diagnóstico</label>
                        <textarea class="form-control">
                            
                        </textarea>
                    </div>
                    
                    <button class="btn btn-outline-dark" type="submit">Gerar novo atendimento</button>

                </form>
            </div>
        </div>
        </div>
        
    </body>
</html>
