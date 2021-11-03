<%-- 
    Document   : regi_vista_tarjetas
    Created on : 09-05-2021, 06:05:17 PM
    Author     : PC-LITE
--%>

<%@page import="sucursal.modelo.Tarjetas"%>
<%@page import="java.util.List"%>
<%@page import="sucursal.controlador.TarjetasController"%>


<%
   TarjetasController consulta = new TarjetasController();
   List<Tarjetas> lista_tarjeta = consulta.ObtenerTarjetas();
%>



<div class="col-lg-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Registro de Tarjetas</h4>

            </p>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th data-editable="false"> ID </th>
                        <th data-editable="false"> Nombre  </th>
                        <th data-editable="false"> Fecha Vencimiento </th>
                        <th data-editable="false"> Numero </th>
                        <th data-editable="false"> Tipo </th>
                        <th data-editable="false"> Cuenta </th>
                    </tr>
                </thead>
                <tbody> 
                    <% if (lista_tarjeta.size() >= 1) {
                        for (int i = 0; i < lista_tarjeta.size(); i++) {
                    %>

                    <tr>   
                        <td><%=lista_tarjeta.get(i).getId()%></td>
                        <td><%=lista_tarjeta.get(i).getNombre() %></td>
                        <td><%=lista_tarjeta.get(i).getFechaVen() %></td>
                        <td><%=lista_tarjeta.get(i).getNumero() %></td>
                        <td><%=lista_tarjeta.get(i).getTipo() %></td>
                         <td><%=lista_tarjeta.get(i).getCuenta() %></td>
                        <td> 
       
                             
                            <a href="MAdmin.jsp?panel=modificaciones/editar_tarjeta&id=<%=lista_tarjeta.get(i).getId()%>" class="btn btn-danger" >Modificar</a>
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