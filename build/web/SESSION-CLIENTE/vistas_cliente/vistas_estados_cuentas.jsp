<%-- 
    Document   : vistas_estados_cuentas
    Created on : 09-11-2021, 02:42:12 PM
    Author     : PC-LITE
--%>


<%@page import="sucursal.modelo.EstadoC"%>
<%@page import="java.util.List"%>
<%@page import="sucursal.controlador.EstadoController"%>


<%
   EstadoController consulta = new EstadoController();
   List<EstadoC> lista_cliente = consulta.ObtenerUnEstado1("2");
%>



<div class="col-lg-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Estado de Cuenta</h4>

            </p>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th data-editable="false"> SubTotal </th>
                        <th data-editable="false"> Total </th>
                        <th data-editable="false"> Fecha </th>
                    </tr>
                </thead>
                <tbody> 
                    <% if (lista_cliente.size() >= 1) {
                        for (int i = 0; i < lista_cliente.size(); i++) {
                    %>                                    
                    <tr>   
                        <td><%=lista_cliente.get(i).getSubtotal()%></td>
                        <td><%=lista_cliente.get(i).getTotal()%></td>
                        <td><%=lista_cliente.get(i).getFecha()%></td
                        <td>
                            <a href="SESSION-CLIENTE/acciones/exportpdf/estado_cuentapdf.jsp?subtotal=<%=lista_cliente.get(i).getSubtotal()%>&total=<%=lista_cliente.get(i).getTotal()%>&fecha=<%=lista_cliente.get(i).getFecha()%>">generar pdf</a>
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