<%-- 
    Document   : editar_comercios
    Created on : 09-08-2021, 02:34:44 PM
    Author     : AdminCis
--%>

<%-- 
    Document   : editar_comercios
    Created on : 09-08-2021, 11:43:51 AM
    Author     : AdminCis
--%>

<%@page import="sucursal.modelo.Comercios"%>
<%@page import="java.util.List"%>
<%@page import="sucursal.controlador.ComercioController"%>



<%
   ComercioController consulta = new ComercioController();
   Comercios comercio = new Comercios();
   comercio = consulta.ObtenerUnComercio(request.getParameter("id"));
%>

<div class="col-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Elementos básico</h4>
            <p class="card-description"> Modificación básica de comercio </p>
            <form class="forms-sample" action="SESSION-ADMIN/acciones/accion_comercio.jsp" method="POST">
               
                   <div class="form-group">
                    <label for="exampleInputName1">Nombre Completo:</label>
                    <input type="text" value="<%=comercio.getNombre()%>" class="form-control" id="exampleInputName1" placeholder="Nombre comercio" name="nombre_c">
                   </div>
                <!--estudio-->
       
                
                <input type="hidden" name="id" value="<%=comercio.getId()%>"> 
                <button type="submit" class="btn btn-primary mr-2"  value="modificar" name="accion" >Modificiar</button>
                 <a href="MAdmin.jsp?panel=vistas/regi_vista_comercio" class="btn btn-google">Cancelar</a>
            </form>
        </div>
    </div>
</div>