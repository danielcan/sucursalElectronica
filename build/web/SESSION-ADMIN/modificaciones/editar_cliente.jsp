<%-- 
    Document   : editar_cliente
    Created on : 08-31-2021, 03:48:51 PM
    Author     : AdminCis
--%>
<%-- 
    Document   : editar_cliente
    Created on : 08-31-2021, 03:48:51 PM
    Author     : AdminCis
--%>

<%@page import="sucursal.modelo.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="sucursal.controlador.ClienteController"%>
<%@page import="sucursal.modelo.Cliente"%>


<%
   ClienteController consulta = new ClienteController();
   Cliente cliente = new Cliente();
   cliente = consulta.ObtenerUnCliente(request.getParameter("idcliente"));
%>

<div class="col-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Elementos básico</h4>
            <p class="card-description"> Modificación básico de cliente </p>
            <form class="forms-sample" action="SESSION-ADMIN/acciones/accion_cliente.jsp" method="POST">
               
                   <div class="form-group">
                    <label for="exampleInputName1">Nombre Completo:</label>
                    <input type="text" value="<%=cliente.getNombreC()%>" class="form-control" id="exampleInputName1" placeholder="Nombre completo" name="nombre_a">
                   </div>
                <!--estudio-->
         

                <div class="form-group">
                    <label for="exampleInputEmail3">Fecha Ingreso:</label>
                    <input type="text" value="<%=cliente.getFechaIngreso()%>" class="form-control" id="exampleInputEmail3" name="fechaI_a">
                </div>

                <div class="form-group">
                    <label for="exampleInputEmail3">Telefono:</label>
                    <input type="text" value="<%=cliente.getTelefono()%>" class="form-control" id="exampleInputEmail3" placeholder="2222-2222" name="telefono_a">
                </div>


                <div class="form-group">
                    <label for="exampleInputEmail4">Identidad:</label>
                    <input type="text" value="<%=cliente.getIdentidad()%>" class="form-control" id="exampleInput14" placeholder="0801-9999-20201" name="identidad_a">
                </div>

                
                
                
                <input type="hidden" name="idcliente" value="<%=cliente.getId()%>"> 
                <button type="submit" class="btn btn-primary mr-2"  value="modificar" name="accion" >Modificiar</button>
                 <a href="MAdmin.jsp?panel=vistas/regi_vista_cliente" class="btn btn-google">Cancelar</a>
            </form>
        </div>
    </div>
</div>

