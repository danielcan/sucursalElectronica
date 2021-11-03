<%-- 
    Document   : regi_vista_usuario_a
    Created on : 09-05-2021, 05:21:39 PM
    Author     : PC-LITE
--%>

<%@page import="sucursal.modelo.Usuarios"%>
<%@page import="java.util.List"%>
<%@page import="sucursal.controlador.UsuarioController"%>


<%
   UsuarioController consulta = new UsuarioController();
   List<Usuarios> lista_usuario = consulta.ObtenerUnUsuarioAdmin();
%>



<div class="col-lg-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Registro de Usuarios Administradores</h4>

            </p>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th data-editable="false"> ID </th>
                        <th data-editable="false"> Login </th>
                        <th data-editable="false"> Contraseņa </th>
                    </tr>
                </thead>
                <tbody> 
                    <% if (lista_usuario.size() >= 1) {
                        for (int i = 0; i < lista_usuario.size(); i++) {
                    %>

                    <tr>   
                        <td><%=lista_usuario.get(i).getId()%></td>
                        <td><%=lista_usuario.get(i).getLogin() %></td>
                        <td><%=lista_usuario.get(i).getContrasenia() %></td>
                        <td> 
                      
                           <form method="post" action="SESSION-ADMIN/acciones/accion_usuario_admin.jsp" style="display: inline-block;">
                                <input type="hidden" name="id" value="<%=lista_usuario.get(i).getId()%>">
                                <button type="submit" class="btn btn-info"  name="accion" value="eliminar"><i class="far fa-trash-alt"></i> Eliminar</button>
                            </form>
                            
                             
                            <a href="MAdmin.jsp?panel=modificaciones/editar_usuario_admin&id=<%=lista_usuario.get(i).getId()%>" class="btn btn-danger" >Modificar</a>
                        </td>
                    </tr>

                    <%
                            }
                        }
                    %>
                </tbody>
            </table>
        </div>
    </div>
</div>