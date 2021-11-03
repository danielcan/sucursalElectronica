<%-- 
    Document   : editar_cuenta
    Created on : 09-08-2021, 09:31:10 PM
    Author     : PC-LITE
--%>

<%@page import="sucursal.modelo.Cuentas"%>
<%@page import="java.util.List"%>
<%@page import="sucursal.controlador.CuentaController"%>
<%@page import="sucursal.modelo.Cliente"%>
<%@page import="sucursal.controlador.ClienteController"%>

<%
   CuentaController consulta = new CuentaController();
   Cuentas cuenta = new Cuentas();
   cuenta = consulta.ObtenerUnCuenta(request.getParameter("id"));
%>

 <%
    ClienteController consultal = new ClienteController();
    List<Cliente> lista_cliente = consultal.ObtenerCliente();
    %>

<div class="col-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Elementos básico</h4>
            <p class="card-description"> Modificación básico de cuenta </p>
            <form class="forms-sample" action="SESSION-ADMIN/acciones/accion_cuenta.jsp" method="POST">
               
                   <div class="form-group">
                    <label for="exampleInputName1">Nombre Completo:</label>
                    <input type="text" value="<%=cuenta.getSaldo()%>" class="form-control" id="exampleInputName1" placeholder="Nombre completo" name="saldo_t">
                   </div>
                <!--estudio-->
         
                 <div class="form-group">
                    <label for="exampleInputName1">Nombre Completo:</label>
                    <input type="text" value="<%=cuenta.getIdCliente()%>" class="form-control" id="exampleInputName1" placeholder="Nombre completo" name="idcliente_t">
                   </div>
                
                <input type="hidden" name="id" value="<%=cuenta.getId()%>"> 
                <button type="submit" class="btn btn-primary mr-2"  value="modificar" name="accion" >Modificiar</button>
                 <a href="MAdmin.jsp?panel=vistas/regi_vista_cuenta" class="btn btn-google">Cancelar</a>
            </form>
        </div>
    </div>
</div>

