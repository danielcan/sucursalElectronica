<%-- 
    Document   : editar_usuario_admin
    Created on : 09-07-2021, 12:01:56 PM
    Author     : AdminCis
--%>

<%@page import="sucursal.modelo.Usuarios"%>
<%@page import="java.util.List"%>
<%@page import="sucursal.controlador.UsuarioController"%>



<%
   UsuarioController consulta = new UsuarioController();
   Usuarios usua = new Usuarios();
   usua = consulta.ObtenerUnUsuario(request.getParameter("id"));
%>

<div class="col-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Elementos básico</h4>
            <p class="card-description"> Modificación básico de Usuario Administrador </p>
            <form class="forms-sample" action="SESSION-ADMIN/acciones/accion_usuario_admin.jsp" method="POST">
               
                   <div class="form-group">
                    <label for="exampleInputName1">Login:</label>
                    <input type="text" value="<%=usua.getLogin()%>" class="form-control" id="exampleInputName1" placeholder="Nombre completo" name="nombre_a">
                   </div>
                <!--estudio-->
         

                <div class="form-group">
                    <label for="exampleInputEmail3">Contraseña:</label>
                    <input type="text" value="<%=usua.getContrasenia()%>" class="form-control" id="exampleInputEmail3" name="contra_a">
                </div>
                
                <input type="hidden" name="id" value="<%=usua.getId()%>"> 
                <button type="submit" class="btn btn-primary mr-2"  value="modificar" name="accion" >Modificiar</button>
                 <a href="../../MAdmin.jsp?panel=vistas/regi_vista_usuario_a" class="btn btn-google">Cancelar</a>
            </form>
        </div>
    </div>
</div>

