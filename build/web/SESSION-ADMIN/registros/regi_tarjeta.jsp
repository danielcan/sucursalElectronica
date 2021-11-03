<%-- 
    Document   : regi_tarjeta
    Created on : 09-05-2021, 04:06:11 PM
    Author     : PC-LITE
--%>

<%@page import="sucursal.modelo.Tipo"%>
<%@page import="sucursal.modelo.Cuentas"%>
<%@page import="java.util.List"%>
<%@page import="sucursal.controlador.TipotController"%>
<%@page import="sucursal.controlador.CuentaController"%>

<div class="col-12 grid-margin stretch-card">
     <%
    TipotController consulta = new TipotController();
    List<Tipo> lista_tipo = consulta.ObtenerTipo();
    %>
     <%
    CuentaController consultal = new CuentaController();
    List<Cuentas> lista_cuenta = consultal.ObtenerCuenta();
    %>
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Elementos básico</h4>
            <p class="card-description"> Formulario básico de Tarjeta </p>
            <form class="forms-sample" action="SESSION-ADMIN/acciones/accion_tarjetas.jsp" method="POST">
                <div class="form-group">
                    <label for="exampleInputName1">Nombre de la Tarjeta</label>
                    <input type="text" class="form-control" id="exampleInputClase" placeholder="Nombre" name="nombre_t">
                </div>
                
                <div class="form-group">
                    <label for="exampleInputName1">fecha de vencimiento</label>
                    <input type="date" class="form-control" id="exampleInputClase" placeholder="Fecha" name="fecha_t">
                </div>
                
                <div class="form-group">
                    <label for="exampleInputName1">numero de la tarjeta</label>
                    <input type="text" class="form-control" id="exampleInputClase" placeholder="Numero" name="numero_t">
                </div>
                
                <div class="form-group"  required>
                    <label for="carreraN">Ingrese el tipo de Tarjeta</label>
                    <select class="form-control" id="carreraN" name="tipo_t">
                        <option selected>seleccione la Tipo</option>
                        <% if (lista_tipo.size() >= 1) {
                        for (int i = 0; i < lista_tipo.size(); i++) {
                        %>
                        <option value="<%=lista_tipo.get(i).getId()%>"><%=lista_tipo.get(i).getTipo() %></option>
                       
                        <%
                                }
                            }
                        %>

                    </select>
                </div>

                 <div class="form-group"  required>
                    <label for="cuenta_t">Busque la Cuenta cliente</label>
                    <select class="form-control" id="carreraN" name="cuenta_t">
                        <option selected>seleccione la cuenta</option>
                        <% if (lista_cuenta.size() >= 1) {
                        for (int i = 0; i < lista_cuenta.size(); i++) {
                        %>
                        <option value="<%=lista_cuenta.get(i).getId()%>"><%=lista_cuenta.get(i).getId() %></option>
                       
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