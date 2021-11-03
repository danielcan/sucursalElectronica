<%-- 
    Document   : regi_retiros
    Created on : 15-sep-2021, 22:51:56
    Author     : Javier
--%>


<%@page import="sucursal.modelo.Cuentas"%>
<%@page import="java.util.List"%>
<%@page import="sucursal.controlador.CuentaController"%>

  <%
    CuentaController consulta = new CuentaController();
    List<Cuentas> lista_cuenta = consulta.ObtenerLasCuenta(request.getParameter("idcliente"));
    %>

<div class="col-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Retiro</h4>
            <form class="forms-sample" action="SESSION-CLIENTE/acciones/retiros/accion_retiros.jsp" method="POST">
                <div class="form-group">
                    <label for="exampleInputName1">Cantidad </label>
                    <input type="text" class="form-control" id="exampleInputName1" placeholder="cantidad" name="monto_a">
                </div>
                
    
                
                <div class="form-group"  required>
                    <select class="form-control" id="carreraN" name="idcuentaO">
                        <option selected>seleccione cuenta</option>
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
                
                
                 <input type="hidden" name="idcliente" value="<%=session.getAttribute("idcliente")%> "> 
                <button type="submit" class="btn btn-gradient-primary mr-2 btn-primary" value="agregar" name="accion">Agregar</button>
              
                <a href="MAdmin.jsp?panel=session_inicio" class="btn btn-secondary">Cancelar</a>
            </form>
        </div>
    </div>
</div>