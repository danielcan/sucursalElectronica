<%-- 
    Document   : accion_cliente
    Created on : 08-31-2021, 11:20:49 AM
    Author     : AdminCis
--%>

<%@page import="sucursal.controlador.UsuarioController"%>
<%@page import="java.sql.*"%>
<%@page import="sucursal.controlador.Conexion"%>
<%@page import="sucursal.modelo.*"%>
<%@page import="sucursal.encriptacion.EncriptadorAES"%>

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
                    String claveEncriptada = encriptador.encriptar(request.getParameter("contra_a"),claveEncriptacion);
                     
                    db.conectar();
                    db.query.executeUpdate("insert into tblusuario"
                            + "(id,rol,login,contrasenia,idcliente) "
                            + "values(USUARIO_SEQ.nextval "   
                            + ",1" 
                            + ",'" + request.getParameter("nombre_a") + "'" 
                            + ",'" + claveEncriptada + "'" 
                            + ",null)");  
                            
                    int contador = 1;
                    if (contador == 1) {
                        out.println("<script>alert('Usuario administrador se publico correctamente'); </script>"); 
                        
                  //  panel = "vistas/regi_vista_carrera";
                    response.sendRedirect("../../MAdmin.jsp?panel=vistas/regi_vista_usuario_a");
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
                out.print("<script>alert(\"Se elimino el usuario administrador del sistema. ! \");window.location.href='../../MAdmin.jsp?panel=vistas/regi_vista_usuario_a';</script>");
               // response.sendRedirect("../../registro.jsp?panel=vistas/regi_vista_carrera");
            } else {
                 out.print("<script>alert(\"No pudimos eliminar Administrador, verifica la informacion proporcionada. ! \");</script>");
            }
            break;
            
        case "modificar":
            if (request.getParameter("accion") != null) {
                 String panel = "session_inicio";  
               try {
                   
                    Conexion db = new Conexion();
                    
                    db.conectar();
                       int contador = db.query.executeUpdate("UPDATE tblusuario "
                            + " SET rol = " + "1" +"," 
                            +" login = '" + request.getParameter("nombre_a") + "'" +","        
                            +" contrasenia = " + "'" + request.getParameter("contra_a") + "'" +","
                            +" idcliente = null "             
                            + "WHERE id = "  + request.getParameter("id"));
              
                  //  int contador = 1;
                    if (contador == 1) {
                        out.println("<script>alert('Usuario Administradorse modifico correctamente'); </script>"); 
                        
                  //  panel = "vistas/regi_vista_carrera";
                    response.sendRedirect("../../MAdmin.jsp?panel=vistas/regi_vista_usuario_a");
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

