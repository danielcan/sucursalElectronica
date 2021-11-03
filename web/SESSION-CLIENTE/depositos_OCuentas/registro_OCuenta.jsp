<%-- 
    Document   : registro_OCuenta
    Created on : 09-15-2021, 11:26:25 AM
    Author     : PC-LITE
--%>

<div class="col-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Verificacion destino</h4>
            <form class="forms-sample" action="SESSION-CLIENTE/acciones/depositos_OCuentas/accion_verificacion_destino.jsp" method="POST">
                <div class="form-group">
                    <label for="exampleInputName1">Cuenta Destino</label>
                    <input type="text" class="form-control" id="exampleInputName1" placeholder="cuenta" name="cuenta_a">
                </div>
                <!--estudio-->

                <button type="submit" class="btn btn-gradient-primary mr-2 btn-primary" value="verificar" name="accion">Agregar</button>
               <input type="hidden" name="idcuentaO" value="<%=session.getAttribute("idcuentaO")%>"> 
                <a href="MCliente.jsp?panel=session_inicio" class="btn btn-secondary">Cancelar</a>
            </form>
        </div>
    </div>
</div>