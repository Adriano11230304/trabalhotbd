<%-- 
    Document   : novoUsuario
    Created on : 24 de mar. de 2023, 13:42:22
    Author     : ppgant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="javascript/script.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" crossorigin="anonymous" async></script>
<jsp:include page = "header.jsp" />
<%@ page language="Java" import="model.Setor"%>
<%@ page language="Java" import="model.Usuario"%>
<%@ page language="Java" import="java.util.List"%>
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
            <div class="col-md-10">
                <div class="container">
                    <h4 class="m-2">Novo Usuário</h4>
                </div>
                <form class="py-3 col-6 m-3 border" action="../controllers/usuariosController.jsp?funcao=add" method="post">
                    <div class="form-group">
                        <label>Nome</label>
                        <input type="text" class="form-control" name="nome" id="nome" placeholder="Escreva o nome" required>
                    </div>
                    <div class="form-group">
                        <label>Senha</label>
                        <input type="password" class="form-control" name="senha" id="password" placeholder="Escreva a senha" required>
                    </div>
                    <div class="form-group">
                        <input type="checkbox" name="inputpassword" id="inputpassword" onclick="mostrarpassword()">
                        <label>Mostrar Senha</label>
                    </div>
                    <div class="form-group">
                        <label>E-mail do usuário</label>
                        <input type="email" class="form-control" name="email" placeholder="Escreva o email do usuário" required>
                    </div>
                    <div class="form-group">
                        <label>Código do Usuário</label>
                        <input type="text" class="form-control" maxlength="6" minlength="6" name="codigo" placeholder="Escreva o codigo do usuario" required>
                    </div>
                    <div class="form-group">
                        <label>Setor</label>
                        <select class="custom-select" name="setor" id="setor">
                            <% 
                                List<Setor> list = Setor.listAll();
                                for(Setor s: list){
                                    out.println("<option value='"+s.getId()+"'>");
                                    out.println(s.getNome());
                                    out.println("</option>");
                                }
                                
                            %>
                        </select>
                            
                    </div>
                    <button class="btn btn-outline-dark" type="submit">Gerar novo usuario</button>
                </form>
            </div>
        </div>
        </div>
        
    </body>
</html>