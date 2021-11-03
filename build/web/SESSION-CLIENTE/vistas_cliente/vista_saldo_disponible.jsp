<%-- 
    Document   : vista_saldo_disponible
    Created on : 09-09-2021, 02:39:49 PM
    Author     : AdminCis
--%>

<%@page import="sucursal.modelo.Cuentas"%>
<%@page import="java.util.List"%>
<%@page import="sucursal.controlador.CuentaController"%>



<%
   CuentaController consulta = new CuentaController();
   Cuentas cliente = new Cuentas();
   cliente = consulta.ObtenerCuentasSaldo(request.getParameter("idcliente"));
%>

<div class="col-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h1 class="card-title">Tu Saldo en tu Cuenta</h1> 
            <h1 class="card-title">La Cantidad en Lempiras es de: <%=cliente.getSaldo()%></h1> 
            
        </div>
    </div>
</div>

