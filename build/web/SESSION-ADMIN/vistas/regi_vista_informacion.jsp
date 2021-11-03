<%-- 
    Document   : regi_vista_informacion
    Created on : 08-30-2021, 03:42:06 PM
    Author     : AdminCis
--%>


<%@page import="sucursal.modelo.Banco"%>
<%@page import="java.util.List"%>
<%@page import="sucursal.controlador.BancoController"%>


<%
   BancoController consulta = new BancoController();
   List<Banco> lista_banco = consulta.ObtenerBanco();
%>



<div class="col-lg-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Registro de Banco</h4>

            </p>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th data-editable="false"> ID </th>
                        <th data-editable="false"> Mision </th>
                        <th data-editable="false"> Vision </th>
                        <th data-editable="false"> politica </th>
                    </tr>
                </thead>
                <tbody> 
                    <% if (lista_banco.size() >= 1) {
                        for (int i = 0; i < lista_banco.size(); i++) {
                    %>

                    <tr>   
                        <td><%=lista_banco.get(i).getId()%></td>
                        <td><%=lista_banco.get(i).getMision() %></td>
                        <td><%=lista_banco.get(i).getVision() %></td>
                        <td><%=lista_banco.get(i).getPoliticas() %></td>
                        <td> 
                      
                           <form method="post" action="SESSION-ADMIN/acciones/accion_informacion.jsp" style="display: inline-block;">
                                <input type="hidden" name="id" value="<%=lista_banco.get(i).getId()%>">
                                <button type="submit" class="btn btn-info"  name="accion" value="eliminar"><i class="far fa-trash-alt"></i> Eliminar</button>
                            </form>
                            
                             
                            <a href="MAdmin.jsp?panel=modificaciones/editar_informacion&id=<%=lista_banco.get(i).getId()%>" class="btn btn-danger" >Modificar</a>
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