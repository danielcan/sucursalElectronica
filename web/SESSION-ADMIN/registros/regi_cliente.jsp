<%-- 
    Document   : regi_cliente
    Created on : 08-30-2021, 03:59:02 PM
    Author     : AdminCis
--%>

<div class="col-12 grid-margin stretch-card">
    <div class="card">
        <div class="card-body">
            <h4 class="card-title">Nuevo cliente</h4>
            <p class="card-description"> Formulario básico de datos de un cliente nuevo.</p>
            <form class="forms-sample" action="SESSION-ADMIN/acciones/accion_cliente.jsp" method="POST">
                <div class="form-group">
                    <label for="exampleInputName1">Nombre Completo:</label>
                    <input type="text" class="form-control" id="exampleInputName1" placeholder="Nombre completo" name="nombre_a">
                </div>
                <!--estudio-->
         

                <div class="form-group">
                    <label for="exampleInputEmail3">Fecha Ingreso:</label>
                    <input type="date" class="form-control" id="exampleInputEmail3" name="fechaI_a">
                </div>

                <div class="form-group">
                    <label for="exampleInputEmail3">Telefono:</label>
                    <input type="text" class="form-control" id="exampleInputEmail3" placeholder="2222-2222" name="telefono_a">
                </div>


                <div class="form-group">
                    <label for="exampleInputEmail4">Identidad:</label>
                    <input type="text" class="form-control" id="exampleInput14" placeholder="0801-9999-20201" name="identidad_a">
                </div>


                <button type="submit" class="btn btn-gradient-primary mr-2 btn-primary" value="agregar" name="accion">Agregar</button>
              
                <a href="MAdmin.jsp?panel=session_inicio" class="btn btn-secondary">Cancelar</a>
            </form>
        </div>
    </div>
</div>