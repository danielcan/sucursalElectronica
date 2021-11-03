<%-- 
    Document   : regi_vista_tipo
    Created on : 09-04-2021, 04:14:31 PM
    Author     : PC-LITE
--%>


<%@page import="sucursal.modelo.Tipo"%>
<%@page import="java.util.List"%>
<%@page import="sucursal.controlador.TipotController"%>


<%
   TipotController consulta = new TipotController();
   List<Tipo> lista_tipo = consulta.ObtenerTipo();
%>



<div class="col-lg-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Registro de Tipo de tarjeta</h4>

            </p>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th data-editable="false"> ID </th>
                        <th data-editable="false"> TIPO </th>
                       
                    </tr>
                </thead>
                <tbody> 
                    <% if (lista_tipo.size() >= 1) {
                        for (int i = 0; i < lista_tipo.size(); i++) {
                    %>

                    <tr>   
                        <td><%=lista_tipo.get(i).getId()%></td>
                        <td><%=lista_tipo.get(i).getTipo() %></td>
                        
                        <td> 
                      
                           <form method="post" action="SESSION-ADMIN/acciones/accion_tipo.jsp" style="display: inline-block;">
                                <input type="hidden" name="id" value="<%=lista_tipo.get(i).getId()%>">
                                <button type="submit" class="btn btn-info"  name="accion" value="eliminar"><i class="far fa-trash-alt"></i> Eliminar</button>
                            </form>

                            <a href="MAdmin.jsp?panel=modificaciones/editar_tipo&id=<%=lista_tipo.get(i).getId()%>" class="btn btn-danger" >Modificar</a>
    
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