<%-- 
    Document   : monto
    Created on : 09-11-2021, 11:14:13 PM
    Author     : PC-LITE
--%>

<div class="col-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Monto a transferir</h4>
            <form class="forms-sample" action="SESSION-CLIENTE/acciones/depositos_cuentas/accion_monto.jsp" method="POST">
                <div class="form-group">
                    <label for="exampleInputName1">Cuenta Destino</label>
                    <input type="text" class="form-control" id="exampleInputName1" placeholder="monto" name="monto_a">
                </div>
                <!--estudio-->

                <button type="submit" class="btn btn-gradient-primary mr-2 btn-primary" value="verificar" name="accion">siguiente</button>
              <input type="hidden" name="idcuentaO" value="<%=session.getAttribute("idcuentaO")%>">
              <input type="hidden" name="idcuentaD" value="<%=session.getAttribute("idcuentaD")%>">
                <a href="../../../MCliente.jsp?panel=session_inicio" class="btn btn-secondary">Cancelar</a>
            </form>
        </div>
    </div>
</div>