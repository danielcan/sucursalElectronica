<%-- 
    Document   : editar_productos
    Created on : 09-08-2021, 10:15:48 PM
    Author     : PC-LITE
--%>

<%@page import="java.util.List"%>
<%@page import="sucursal.modelo.Productos"%>
<%@page import="sucursal.controlador.ProductosController"%>
<%@page import="sucursal.modelo.Tipo"%>
<%@page import="sucursal.controlador.TipotController"%>
<%@page import="sucursal.modelo.Cuentas"%>
<%@page import="sucursal.controlador.CuentaController"%>

<%
   ProductosController consultat = new ProductosController();
   Productos tarjeta = new Productos();
   tarjeta = consultat.ObtenerUnProducto(request.getParameter("id"));
%>



<div class="col-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Elementos básico</h4>
            <p class="card-description"> Modificación básico de productos </p>
            <form class="forms-sample" action="SESSION-ADMIN/acciones/accion_producto.jsp" method="POST">
               
                   <div class="form-group">
                    <label for="exampleInputName1">Nombre Completo:</label>
                    <input type="text" value="<%=tarjeta.getNombre()%>" class="form-control" id="exampleInputName1" placeholder="Nombre completo" name="nombre_a">
                   </div>
                <!--estudio-->
                  <div class="form-group">
                    <label for="exampleInputName1">Comercio:</label>
                    <input type="text" value="<%=tarjeta.getComercio()%>" class="form-control" id="exampleInputName1" placeholder="Nombre completo" name="comercio_a">
                  </div>
 
                <input type="hidden" name="id" value="<%=tarjeta.getId()%>"> 
                <button type="submit" class="btn btn-primary mr-2"  value="modificar" name="accion" >Modificiar</button>
                 <a href="MAdmin.jsp?panel=vistas/regi_vista_producto" class="btn btn-google">Cancelar</a>
            </form>
        </div>
    </div>
</div>

