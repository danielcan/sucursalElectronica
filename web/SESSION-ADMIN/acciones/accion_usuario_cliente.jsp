<%-- 
    Document   : accion_usuario_cliente
    Created on : 09-07-2021, 11:10:01 PM
    Author     : PC-LITE
--%>

<%@page import="sucursal.controlador.UsuarioController"%>
<%@page import="java.sql.*"%>
<%@page import="sucursal.controlador.Conexion"%>
<%@page import="sucursal.modelo.*"%>
<%@page import="encriptacion.EncriptadorAES"%>

<%
    String accion = request.getParameter("accion");
    Usuarios cliente = new Usuarios();
    UsuarioController control = new UsuarioController();
   
    switch (accion) {
        case "agregar":
            if (request.getParameter("accion") != null) {
                 String panel = "session_inicio";  
               try {
                   
                    Conexion db = new Conexion();
                    EncriptadorAES encriptador = new EncriptadorAES();
                    final String claveEncriptacion = "ceutecProject";
                    //usuario.setClearPassword(request.getParameter("pass_a"));
                    String claveEncriptada = encriptador.encriptar(request.getParameter("contra_a"));
                    
                    db.conectar();
                    db.query.executeUpdate("insert into tblusuario"
                            + "(id,rol,login,contrasenia,idcliente) "
                            + "values(USUARIO_SEQ.nextval "   
                            + ",2" 
                            + ",'" + request.getParameter("nombre_a") + "'" 
                            + ",'" + claveEncriptada + "'" 
                            + ",'"+request.getParameter("cliente_t") +"')");  
                            
                    int contador = 1;
                    if (contador == 1) {
                        out.println("<script>alert('Usuario administrador se publico correctamente'); </script>"); 
                        
                  //  panel = "vistas/regi_vista_carrera";
                    response.sendRedirect("../../MAdmin.jsp?panel=vistas/regi_vista_usuario_c");
                    db.desconectar();
                    }
                } catch (Exception e) {
                    out.println("An exception occurred: " + e.getMessage());
                    out.print("<script>alert('Error al inscribir a un usuario administrador');</script>");
                    e.printStackTrace();
                } 
            }
           
            break;
        case "eliminar":
            //clase para subir archivos a disco
            String id = request.getParameter("id");
            //String idcandidato = request.getParameter("idcandidato");
            if (control.eliminaUsuarios(id)) {
                //out.println("<script>alert(\"La carrera se elimino satisfactoriamente ! \");</script>");
                out.print("<script>alert(\"Se elimino el usuario del sistema. ! \");window.location.href='../../MAdmin.jsp?panel=vistas/regi_vista_usuario_c';</script>");
               // response.sendRedirect("../../registro.jsp?panel=vistas/regi_vista_carrera");
            } else {
                 out.print("<script>alert(\"No pudimos eliminar , verifica la informacion proporcionada. ! \");</script>");
            }
            break;
            
        case "modificar":
            if (request.getParameter("accion") != null) {
                 String panel = "session_inicio";  
               try {
                   
                    Conexion db = new Conexion();
                    
                    db.conectar();
                       int contador = db.query.executeUpdate("UPDATE tblusuario "
                            + " SET rol = " + "2" +"," 
                            +" login = '" + request.getParameter("nombre_a") + "'" +","        
                            +" contrasenia = " + "'" + request.getParameter("contra_a") + "'" +","
                            +" idcliente = "+ "'" + request.getParameter("idcliente_a") +"'"             
                            + "WHERE id = "  + request.getParameter("id"));
              
                  //  int contador = 1;
                    if (contador == 1) {
                        out.println("<script>alert('Usuario Administradorse modifico correctamente'); </script>"); 
                        
                  //  panel = "vistas/regi_vista_carrera";
                    response.sendRedirect("../../MAdmin.jsp?panel=vistas/regi_vista_usuario_c");
                    db.desconectar();
                    }
                } catch (Exception e) {
                    out.println("An exception occurred: " + e.getMessage());
                    out.print("<script>alert('Error al modificar el usuario administrador');</script>");
                    e.printStackTrace();
                } 
            }
            break;
        default:
            out.print("<script>alert(\"Upps Algo Salio mal ! no se puedo completar la accion solicitada ! \");window.location.href='MAdmin.jsp?panel=session_inicio';</script>");
            break;
    }
%>

