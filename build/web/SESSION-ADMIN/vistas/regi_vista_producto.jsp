<%-- 
    Document   : regi_vista_producto
    Created on : 09-05-2021, 05:53:38 PM
    Author     : PC-LITE
--%>


<%@page import="sucursal.modelo.Productos"%>
<%@page import="java.util.List"%>
<%@page import="sucursal.controlador.ProductosController"%>


<%
   ProductosController consulta = new ProductosController();
   List<Productos> lista_producto = consulta.ObtenerProductos();
%>



<div class="col-lg-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Registro de Productos</h4>

            </p>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th data-editable="false"> ID </th>
                        <th data-editable="false"> Nombre Completo </th>
                        <th data-editable="false"> ID comercio </th>

                    </tr>
                </thead>
                <tbody> 
                    <% if (lista_producto.size() >= 1) {
                        for (int i = 0; i < lista_producto.size(); i++) {
                    %>

                    <tr>   
                        <td><%=lista_producto.get(i).getId()%></td>
                        <td><%=lista_producto.get(i).getNombre() %></td>
                        <td><%=lista_producto.get(i).getComercio() %></td>
                       
                        <td> 
                      
                           <form method="post" action="SESSION-ADMIN/acciones/accion_producto.jsp" style="display: inline-block;">
                                <input type="hidden" name="id" value="<%=lista_producto.get(i).getId()%>">
                                <button type="submit" class="btn btn-info"  name="accion" value="eliminar"><i class="far fa-trash-alt"></i> Eliminar</button>
                            </form>
                            
                             
                            <a href="MAdmin.jsp?panel=modificaciones/editar_productos&id=<%=lista_producto.get(i).getId()%>" class="btn btn-danger" >Modificar</a>
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