<%-- 
    Document   : regi_Tipot
    Created on : 09-04-2021, 04:04:21 PM
    Author     : PC-LITE
--%>
<div class="col-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Nuevo cliente</h4>
            <p class="card-description"> Formulario básico de tipo Tarjeta.</p>
            <form class="forms-sample" action="SESSION-ADMIN/acciones/accion_tipo.jsp" method="POST">
                <div class="form-group">
                    <label for="exampleInputName1">Ingrese tipo de tarjeta:</label>
                    <input type="text" class="form-control" id="exampleInputName1" placeholder="Tipo" name="tipo_a">
                </div>
                <!--estudio-->
                <button type="submit" class="btn btn-gradient-primary mr-2 btn-primary" value="agregar" name="accion">Agregar</button>
              
                <a href="MAdmin.jsp?panel=session_inicio" class="btn btn-secondary">Cancelar</a>
            </form>
        </div>
    </div>
</div>