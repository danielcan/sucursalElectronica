<%-- 
    Document   : vistas_detalle_movimiento
    Created on : 09-11-2021, 02:40:51 PM
    Author     : PC-LITE
--%>

<%@page import="sucursal.modelo.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="sucursal.controlador.ClienteController"%>


<%
   ClienteController consulta = new ClienteController();
   List<Cliente> lista_cliente = consulta.ObtenerCliente();
%>



<div class="col-lg-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Registro de Clientes</h4>

            </p>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th data-editable="false"> ID </th>
                        <th data-editable="false"> Nombre Completo </th>
                        <th data-editable="false"> Fecha Ingreso </th>
                        <th data-editable="false"> Telefono </th>
                        <th data-editable="false"> Identidad </th>
                    </tr>
                </thead>
                <tbody> 
                    <% if (lista_cliente.size() >= 1) {
                        for (int i = 0; i < lista_cliente.size(); i++) {
                    %>

                    <tr>   
                        <td><%=lista_cliente.get(i).getId()%></td>
                        <td><%=lista_cliente.get(i).getNombreC() %></td>
                        <td><%=lista_cliente.get(i).getFechaIngreso() %></td>
                        <td><%=lista_cliente.get(i).getTelefono() %></td>
                        <td><%=lista_cliente.get(i).getIdentidad() %></td>
                        <td> 
                     
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