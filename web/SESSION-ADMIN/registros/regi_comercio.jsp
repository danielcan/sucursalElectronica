<%-- 
    Document   : regi_comercio
    Created on : 09-05-2021, 05:30:16 PM
    Author     : PC-LITE
--%>

<div class="col-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Nuevo Comercios</h4>
            <p class="card-description"> Formulario básico de datos de Comercio.</p>
            <form class="forms-sample" action="SESSION-ADMIN/acciones/accion_comercio.jsp" method="POST">
                <div class="form-group">
                    <label for="exampleInputName1">Nombre del Comercio </label>
                    <input type="text" class="form-control" id="exampleInputName1" placeholder="Nombre Comercio" name="nombre_c">
                </div>
                <!--estudio-->
         

                <button type="submit" class="btn btn-gradient-primary mr-2 btn-primary" value="agregar" name="accion">Agregar</button>
              
                <a href="MAdmin.jsp?panel=session_inicio" class="btn btn-secondary">Cancelar</a>
            </form>
        </div>
    </div>
</div>