<%-- 
    Document   : verificacion_origen
    Created on : 09-11-2021, 11:13:38 PM
    Author     : PC-LITE
--%>

<%@page import="sucursal.modelo.Cuentas"%>
<%@page import="java.util.List"%>
<%@page import="sucursal.controlador.CuentaController"%>

  <%
    CuentaController consulta = new CuentaController();
    List<Cuentas> lista_cuenta = consulta.ObtenerLasCuenta(request.getParameter("idcliente"));
    %>
  
<div class="col-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Verifica cuenta:</h4>
            <form class="forms-sample" action="SESSION-CLIENTE/acciones/depositos_cuentas/accion_verificacion_origen.jsp" method="POST">
                <div class="form-group"  required>
                    <select class="form-control" id="carreraN" name="idcuenta_t">
                        <option selected>seleccione cuenta</option>
                        <% if (lista_cuenta.size() >= 1) {
                        for (int i = 0; i < lista_cuenta.size(); i++) {
                        %>
                        <option value="<%=lista_cuenta.get(i).getId()%>"><%=lista_cuenta.get(i).getId() %></option>
                       
                        <%
                                }
                            }
                        %>

                    </select>
                </div>
                         
                <button type="submit" class="btn btn-primary mr-2"  value="verificar" name="accion" >Agregar</button>
                
                <a href="MAdmin.jsp?panel=session_inicio" class="btn btn-google" >Cancelar</a>
                
            </form>
        </div>
    </div>
</div>