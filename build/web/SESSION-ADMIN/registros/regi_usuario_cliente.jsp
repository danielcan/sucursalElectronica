<%-- 
    Document   : regi_usuario_cliente
    Created on : 09-04-2021, 03:33:29 PM
    Author     : PC-LITE
--%>


<%@page import="sucursal.modelo.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="sucursal.controlador.ClienteController"%>

 <%
    ClienteController consulta = new ClienteController();
    List<Cliente> lista_cliente = consulta.ObtenerCliente();
    %>


<div class="col-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Elementos básico</h4>
            <p class="card-description"> Formulario básico de login de Usuario Cliente </p>
            <form class="forms-sample" action="SESSION-ADMIN/acciones/accion_usuario_cliente.jsp" method="POST">
                
               <div class="form-group">
                    <label for="exampleInputName1">Login usuario cliente</label>
                    <input type="text" class="form-control" id="exampleInputClase" placeholder="Nombre" name="nombre_a">
                </div>
                
                <div class="form-group">
                    <label for="exampleInputName1">Contraseña</label>
                    <input type="text" class="form-control" id="exampleInputClase" placeholder="Nombre" name="contra_a">
                </div>
                
            
                <div class="form-group"  required>
                    <label for="carreraN">ID cliente</label>
                    <select class="form-control" id="carreraN" name="cliente_t">
                        <option selected>seleccione comercio: </option>
                        <% if (lista_cliente.size() >= 1) {
                        for (int i = 0; i < lista_cliente.size(); i++) {
                        %>
                        <option value="<%=lista_cliente.get(i).getId()%>"><%=lista_cliente.get(i).getId() %>   <%=lista_cliente.get(i).getNombreC() %></option>
                       
                        <%
                                }
                            }
                        %>

                    </select>
                </div>
                                
                <button type="submit" class="btn btn-primary mr-2"  value="agregar" name="accion" >Agregar</button>
                
                <a href="MAdmin.jsp?panel=session_inicio" class="btn btn-google" >Cancelar</a>
                
            </form>
        </div>
    </div>
</div>