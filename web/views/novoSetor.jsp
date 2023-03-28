<%-- 
    Document   : novoSetor
    Created on : 24 de mar. de 2023, 12:24:01
    Author     : ppgant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="javascript/script.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" crossorigin="anonymous" async></script>
<jsp:include page = "header.jsp" />
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
                    <h4 class="m-2">Novo Setor</h4>
                </div>
                <form class="py-3 col-6 m-3 border" action="../controllers/setorController.jsp?funcao=add" method="post">
                    <div class="form-group">
                        <label>Nome</label>
                        <input type="text" class="form-control" name="nome" id="nome" placeholder="Escreva o nome do setor" required>
                    </div>
                    <div class="form-group">
                        <label>Código do Setor</label>
                        <input type="text" class="form-control" maxlength="6" minlength="6" name="codigo" placeholder="Escreva o codigo do setor" required>
                    </div>
                     <div class="form-group">
                        <label>Descrição</label>
                        <textarea class="form-control" name="descricao" id="descricao" required></textarea>
                    </div>
                    
                    <button class="btn btn-outline-dark" type="submit">Gerar novo setor</button>

                </form>
            </div>
        </div>
        </div>
        
    </body>
</html>

