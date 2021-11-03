<%-- 
    Document   : regi_informacion
    Created on : 08-30-2021, 02:54:52 PM
    Author     : AdminCis
--%>




<div class="col-12 grid-margin stretch-card">

    
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Nuevo alumno</h4>
            <p class="card-description"> Formulario básico de datos de un alumno nuevo.</p>
            <form class="forms-sample" action="SESSION-ADMIN/acciones/accion_informacion.jsp" method="POST">

                <div class="form-group">
                    <label>Imagen de Perfil:</label>
                    <input type="file" name="img" class="file-upload-default">
                    <div class="input-group col-xs-12"> 
                        <span class="input-group-append">
                            <input type="file" class="form-control file-upload-info"  placeholder="Upload Image"  id="imgg" name="imgg">     
                        </span>
                    </div>
                </div>

                <button type="submit" class="btn btn-gradient-primary mr-2" value="agregar" name="accion">Agregar</button>
                <button class="btn btn-light">Cancel</button>
            </form>
        </div>
    </div>
</div>

