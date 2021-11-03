<%-- 
    Document   : editar_informacion
    Created on : 09-08-2021, 10:46:17 PM
    Author     : PC-LITE
--%>

<%@page import="java.util.List"%>
<%@page import="sucursal.modelo.Banco"%>
<%@page import="sucursal.controlador.BancoController"%>

<%@page import="sucursal.modelo.Tipo"%>
<%@page import="sucursal.controlador.TipotController"%>
<%@page import="sucursal.modelo.Cuentas"%>
<%@page import="sucursal.controlador.CuentaController"%>

<%
   BancoController consultat = new BancoController();
   Banco tarjeta = new Banco();
   tarjeta = consultat.ObtenerUnBanco(request.getParameter("id"));
%>



<div class="col-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Elementos básico</h4>
            <p class="card-description"> Modificación básico de cuenta </p>
            <form class="forms-sample" action="SESSION-ADMIN/acciones/accion_tarjetas.jsp" method="POST">
               
                   <div class="form-group">
                    <label for="exampleInputName1">Nombre Completo:</label>
                    <input type="text" value="<%=tarjeta.getNombre()%>" class="form-control" id="exampleInputName1" placeholder="Nombre completo" name="nombre_a">
                   </div>
                <!--estudio-->
                  <div class="form-group">
                    <label for="exampleInputName1">Fecha de vencimiento:</label>
                    <input type="text" value="<%=tarjeta.getFechaVen()%>" class="form-control" id="exampleInputName1" placeholder="Nombre completo" name="nombre_a">
                  </div>
                  
                  <div class="form-group">
                    <label for="exampleInputName1">Numero:</label>
                    <input type="text" value="<%=tarjeta.getNumero()%>" class="form-control" id="exampleInputName1" placeholder="Nombre completo" name="nombre_a">
                  </div>
                  
                   <div class="form-group">
                    <label for="exampleInputName1">Tipo de tarjeta:</label>
                    <input type="text" value="<%=tarjeta.getTipo()%>" class="form-control" id="exampleInputName1" placeholder="Nombre completo" name="nombre_a">
                  </div>
                  
                   <div class="form-group">
                    <label for="exampleInputName1">Cuenta:</label>
                    <input type="text" value="<%=tarjeta.getCuenta()%>" class="form-control" id="exampleInputName1" placeholder="Nombre completo" name="nombre_a">
                  </div>
           
                
                <input type="hidden" name="id" value="<%=tarjeta.getId()%>"> 
                <button type="submit" class="btn btn-primary mr-2"  value="modificar" name="accion" >Modificiar</button>
                 <a href="MAdmin.jsp?panel=vistas/regi_vista_tarjetas" class="btn btn-google">Cancelar</a>
            </form>
        </div>
    </div>
</div>

