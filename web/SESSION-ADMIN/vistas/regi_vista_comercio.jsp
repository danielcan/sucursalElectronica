<%-- 
    Document   : regi_vista_comercio
    Created on : 09-05-2021, 05:29:47 PM
    Author     : PC-LITE
--%>


<%@page import="sucursal.modelo.Comercios"%>
<%@page import="java.util.List"%>
<%@page import="sucursal.controlador.ComercioController"%>


<%
   ComercioController consulta = new ComercioController();
   List<Comercios> lista_comercios = consulta.ObtenerComercios();
%>



<div class="col-lg-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Registro de Comercios</h4>

            </p>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th data-editable="false"> ID </th>
                        <th data-editable="false"> Nombre Comercio </th>
                       
                    </tr>
                </thead>
                <tbody> 
                    <% if (lista_comercios.size() >= 1) {
                        for (int i = 0; i < lista_comercios.size(); i++) {
                    %>

                    <tr>   
                        <td><%=lista_comercios.get(i).getId()%></td>
                        <td><%=lista_comercios.get(i).getNombre() %></td>
                      
                        <td> 
                      
                           <form method="post" action="SESSION-ADMIN/acciones/accion_comercio.jsp" style="display: inline-block;">
                                <input type="hidden" name="id" value="<%=lista_comercios.get(i).getId()%>">
                                <button type="submit" class="btn btn-info"  name="accion" value="eliminar"><i class="far fa-trash-alt"></i> Eliminar</button>
                            </form>
                            
                             
                            <a href="MAdmin.jsp?panel=modificaciones/editar_comercios&id=<%=lista_comercios.get(i).getId()%>" class="btn btn-danger" >Modificar</a>
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