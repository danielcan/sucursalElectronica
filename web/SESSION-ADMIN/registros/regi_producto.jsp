<%-- 
    Document   : regi_producto
    Created on : 09-08-2021, 03:09:35 PM
    Author     : AdminCis
--%>

<%@page import="sucursal.modelo.Comercios"%>
<%@page import="java.util.List"%>
<%@page import="sucursal.controlador.ComercioController"%>

 <%
    ComercioController consulta = new ComercioController();
    List<Comercios> lista_comercio = consulta.ObtenerComercios();
    %>


<div class="col-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Elementos básico</h4>
            <p class="card-description"> Formulario básico de producto </p>
            <form class="forms-sample" action="SESSION-ADMIN/acciones/accion_producto.jsp" method="POST">
                
               <div class="form-group">
                    <label for="exampleInputName1">Nombre de Producto</label>
                    <input type="text" class="form-control" id="exampleInputClase" placeholder="Nombre" name="nombre_a">
                </div>
                
            
                <div class="form-group"  required>
                    <label for="carreraN">ID Comercio</label>
                    <select class="form-control" id="carreraN" name="comercio_t">
                        <option selected>seleccione comercio: </option>
                        <% if (lista_comercio.size() >= 1) {
                        for (int i = 0; i < lista_comercio.size(); i++) {
                        %>
                        <option value="<%=lista_comercio.get(i).getId()%>"><%=lista_comercio.get(i).getId() %>   <%=lista_comercio.get(i).getNombre() %></option>
                       
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