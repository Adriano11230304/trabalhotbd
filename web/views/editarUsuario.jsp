<%-- 
    Document   : editarUsuario
    Created on : 28 de mar. de 2023, 11:05:16
    Author     : ppgant
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<script src="../javascript/script.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" crossorigin="anonymous" async></script>
<jsp:include page = "header.jsp" />
<%@ page language="Java" import="model.Setor"%>
<%@ page language="Java" import="model.Usuario"%>
<%@ page language="Java" import="java.util.List"%>
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
            
            int id = Integer.parseInt(request.getParameter("id"));
            Usuario user = Usuario.getById(id);
     %>
            <div class="col-md-10">
                <div class="container">
                    <h4 class="m-2">Alterando Usuário</h4>
                </div>
                <form class="py-3 col-6 m-3 border" action="../controllers/usuariosController.jsp?funcao=alterar&id=<%=user.getId()%>" method="post">
                    <div class="form-group">
                        <label>Nome</label>
                        <input type="text" class="form-control" name="nome" value="<%=user.getNome()%>" required>
                    </div>
                    <div class="form-group">
                        <label>Senha</label>
                        <input type="password" class="form-control" name="senha" id="password" value="<%=user.getSenha()%>" required>
                    </div>
                    <div class="form-group">
                        <input type="checkbox" name="inputpassword" id="inputpassword" onclick="mostrarpassword()">
                        <label>Mostrar Senha</label>
                    </div>
                    <div class="form-group">
                        <label>E-mail do usuário</label>
                        <input type="email" class="form-control" name="email" value="<%=user.getEmail()%>" required>
                    </div>
                    <div class="form-group">
                        <label>Código do Usuário</label>
                        <input type="text" class="form-control" maxlength="6" minlength="6" name="codigo" value="<%=user.getCodigo()%>" required>
                    </div>
                    <div class="form-group">
                        <label>Setor</label>
                        <select class="custom-select" name="setor" id="setor">
                            <% 
                                List<Setor> list = Setor.listAll();
                                for(Setor s: list){
                                    if(s.getId() == user.getSetor().getId()){
                                        out.println("<option value='"+s.getId()+"' selected>");
                                        out.println(s.getNome());
                                        out.println("</option>");
                                    }else{
                                        out.println("<option value='"+s.getId()+"'>");
                                        out.println(s.getNome());
                                        out.println("</option>");
                                    }
                                    
                                }
                                
                            %>
                        </select>
                            
                    </div>
                    <button class="btn btn-outline-dark" type="submit">Alterar usuario</button>
                </form>
            </div>
        </div>
        </div>
        
    </body>
</html>