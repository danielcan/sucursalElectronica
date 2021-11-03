<%-- 
    Document   : regi_usuario_admin
    Created on : 09-04-2021, 03:33:15 PM
    Author     : PC-LITE
--%>


<div class="col-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Nuevo Usuario Administrador</h4>
            <p class="card-description"> Formulario básico de datos de usuario Administrador.</p>
            <form class="forms-sample" action="SESSION-ADMIN/acciones/accion_usuario_admin.jsp" method="POST">
                
                <div class="form-group">
                    <label for="exampleInputName1">Login:</label>
                    <input type="text" class="form-control" id="exampleInputName1" placeholder="Login" name="nombre_a">
                </div>
                
                <div class="form-group">
                    <label for="exampleInputEmail3">contraseña:</label>
                    <input type="text" class="form-control" id="exampleInputEmail3" name="contra_a" placeholder="****">
                </div>

                <button type="submit" class="btn btn-gradient-primary mr-2 btn-primary" value="agregar" name="accion">Agregar</button>
              
                <a href="MAdmin.jsp?panel=session_inicio" class="btn btn-secondary">Cancelar</a>
            </form>
        </div>
    </div>
</div>