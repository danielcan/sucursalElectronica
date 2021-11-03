<%-- 
    Document   : regi_vista_depositos
    Created on : 09-15-2021, 03:03:16 PM
    Author     : PC-LITE
--%>


<%@page import="sucursal.modelo.Depositos"%>
<%@page import="java.util.List"%>
<%@page import="sucursal.controlador.DepositosController"%>


<%
   DepositosController consulta = new DepositosController();
   List<Depositos> lista_comercios = consulta.ObtenerDepositostb("3");
%>



<div class="col-lg-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">registro de Todos los Depositos</h4>

            </p>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th data-editable="false"> Numero de Recibo </th>
                        <th data-editable="false"> Cantidad </th>
                        <th data-editable="false"> Cuenta de Envio </th>
                        <th data-editable="false"> Cuenta Recibido </th>
                      
                       
                    </tr>
                </thead>
                <tbody> 
                    <% if (lista_comercios.size() >= 1) {
                        for (int i = 0; i < lista_comercios.size(); i++) {
                    %>

                    <tr>   
                        <td><%=lista_comercios.get(i).getId()%></td>
                        <td><%=lista_comercios.get(i).getCantidad()%></td>
                        <td><%=lista_comercios.get(i).getCuentaEnvio()%></td>
                        <td><%=lista_comercios.get(i).getCuentaRecibido()%></td>
                        
                      
                      
                        <td> 
                      
                           
                        </td>
                    </tr>

                    <%
                            }
                        }
                    %>
                </tbody>
            </table>
                <a href="MAdmin.jsp?panel=session_inicio" class="btn btn-google">Regresar</a>
        </div>
    </div>
</div>