<%-- 
    Document   : regi_vista_cuenta
    Created on : 09-06-2021, 02:35:10 PM
    Author     : AdminCis
--%>


<%@page import="sucursal.modelo.Cuentas"%>
<%@page import="java.util.List"%>
<%@page import="sucursal.controlador.CuentaController"%>


<%
   CuentaController consulta = new CuentaController();
   List<Cuentas> lista_cuenta = consulta.ObtenerCuenta();
%>



<div class="col-lg-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Registro de Cuenta</h4>

            </p>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th data-editable="false"> ID </th>
                        <th data-editable="false"> Saldo </th>
                        <th data-editable="false"> Cuenta Cliente </th>
                    </tr>
                </thead>
                <tbody> 
                    <% if (lista_cuenta.size() >= 1) {
                        for (int i = 0; i < lista_cuenta.size(); i++) {
                    %>

                    <tr>   
                        <td><%=lista_cuenta.get(i).getId()%></td>
                        <td><%=lista_cuenta.get(i).getSaldo() %></td>
                        <td><%=lista_cuenta.get(i).getIdCliente() %></td>
                      
                        <td> 
                      
                           <form method="post" action="SESSION-ADMIN/acciones/accion_cuenta.jsp" style="display: inline-block;">
                                <input type="hidden" name="id" value="<%=lista_cuenta.get(i).getId()%>">
                                <button type="submit" class="btn btn-info"  name="accion" value="eliminar"><i class="far fa-trash-alt"></i> Eliminar</button>
                            </form>
                            
                             
                            <a href="MAdmin.jsp?panel=modificaciones/editar_cuenta&id=<%=lista_cuenta.get(i).getId()%>" class="btn btn-danger" >Modificar</a>
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