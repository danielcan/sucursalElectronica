<%-- 
    Document   : expor_import_cliente
    Created on : 09-17-2021, 02:57:54 PM
    Author     : AdminCis
--%>


<div class="card">
    <div class="card-body">
        <center>
            <form action="SESSION-ADMIN/acciones/accionxml_clientes.jsp" method="POST">
                <h1>Exportar Cliente </h1>
                <br><br>
                <label>Exportar Cliente a XML</label> <br>
                <input type="submit" value="Exportar" name="bt_exportar"  class="btn btn-info"/>
            </form>
        </center>
    </div>
</div>

<div class="card">
    <div class="card-body">
        <center>
            <form action="session-r/vistas/mostrar_importacion_alumno.jsp" method="POST">
                
                <h1>Importar Cliente </h1>
                <br><br>
                
                 <div class="form-group">
                     
                  
               
                    <input type="file" name="img" class="file-upload-default">
                  
                       <center>
                        <span class="input-group-append">
                            <input type="file" class="form-control file-upload-info"  placeholder="Upload Image"  id="imgg" name="imgg">     
                        </span>
                       </center>

                </div>

                <label>Importar XML</label> <br>
                
                
                 <a href="registro.jsp?panel=vistas/mostrar_importacion_alumno" class="btn btn-gradient-primary mr-2">Agregar</a>
            </form>
        </center>     
    </div>
</div>