<%-- 
    Document   : regi_cuenta
    Created on : 09-04-2021, 04:03:26 PM
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
            <p class="card-description"> Formulario básico de Cuenta </p>
            <form class="forms-sample" action="SESSION-ADMIN/acciones/accion_cuenta.jsp" method="POST">
                
               <div class="form-group">
                    <label for="exampleInputName1">Saldo</label>
                    <input type="text" class="form-control" id="exampleInputClase" placeholder="Numeros" name="saldo_t">
                </div>
                
            
                <div class="form-group"  required>
                    <label for="carreraN">ID Cliente</label>
                    <select class="form-control" id="carreraN" name="idcliente_t">
                        <option selected>seleccione cuenta</option>
                        <% if (lista_cliente.size() >= 1) {
                        for (int i = 0; i < lista_cliente.size(); i++) {
                        %>
                        <option value="<%=lista_cliente.get(i).getId()%>"><%=lista_cliente.get(i).getId() %></option>
                       
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