<%-- 
    Document   : regi_vista_retiros
    Created on : 09-15-2021, 03:04:10 PM
    Author     : PC-LITE
--%>

<%@page import="sucursal.modelo.Depositos"%>
<%@page import="java.util.List"%>
<%@page import="sucursal.controlador.DepositosController"%>


<%
   DepositosController consulta = new DepositosController();
   List<Depositos> lista_comercios = consulta.ObtenerDepositostb("2");
%>



<div class="col-lg-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Registro de todos los retiros</h4>

            </p>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th data-editable="false"> ID </th>
                        <th data-editable="false"> Cantidad</th>
                        <th data-editable="false"> Cuenta del retiro</th>
                       
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