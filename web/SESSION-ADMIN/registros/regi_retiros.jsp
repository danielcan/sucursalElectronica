<%-- 
    Document   : regi_retiros
    Created on : 09-15-2021, 03:00:46 PM
    Author     : PC-LITE
--%>

<div class="col-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Nuevo Deposito</h4>
            <p class="card-description"> Formulario de nuevo Deposito.</p>
            <form class="forms-sample" action="SESSION-ADMIN/acciones/accion_retiros.jsp" method="POST">
                <div class="form-group">
                    <label for="exampleInputName1">Cantidad </label>
                    <input type="text" class="form-control" id="exampleInputName1" placeholder="cantidad" name="monto_a">
                </div>
                
                 <div class="form-group">
                    <label for="exampleInputName1">Cuenta: </label>
                    <input type="text" class="form-control" id="exampleInputName1" placeholder="cuenta origen" name="idcuentaO">
                </div>
                

                <button type="submit" class="btn btn-gradient-primary mr-2 btn-primary" value="agregar" name="accion">Agregar</button>
              
                <a href="MAdmin.jsp?panel=session_inicio" class="btn btn-secondary">Cancelar</a>
            </form>
        </div>
    </div>
</div>