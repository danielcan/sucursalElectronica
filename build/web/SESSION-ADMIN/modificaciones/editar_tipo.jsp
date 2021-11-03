<%-- 
    Document   : editar_tipo
    Created on : 09-05-2021, 03:40:21 PM
    Author     : PC-LITE
--%>
<%@page import="sucursal.modelo.Tipo"%>
<%@page import="java.util.List"%>
<%@page import="sucursal.controlador.TipotController"%>
<%@page import="sucursal.modelo.Tipo"%>


<%
   TipotController consulta = new TipotController();
   Tipo tipo = new Tipo();
   tipo = consulta.ObtenerUnTipo(request.getParameter("id"));
%>

<div class="col-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Elementos básico</h4>
            <p class="card-description"> Modificación básico de Tipo de tarjeta </p>
            <form class="forms-sample" action="SESSION-ADMIN/acciones/accion_tipo.jsp" method="POST">
               
                   <div class="form-group">
                    <label for="exampleInputName1">Tipo:</label>
                    <input type="text" value="<%=tipo.getTipo()%>" class="form-control" id="exampleInputName1" placeholder="Tipo de tarjeta" name="tipo_a">
                   </div>
                <!--estudio-->
         
                
                <input type="hidden" name="id" value="<%=tipo.getId()%>"> 
                <button type="submit" class="btn btn-primary mr-2"  value="modificar" name="accion" >Modificiar</button>
                 <a href="MAdmin.jsp?panel=vistas/regi_vista_tipo" class="btn btn-google">Cancelar</a>
            </form>
        </div>
    </div>
</div>

