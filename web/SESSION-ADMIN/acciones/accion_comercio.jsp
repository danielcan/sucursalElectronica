<%-- 
    Document   : accion_comercio
    Created on : 09-07-2021, 11:10:38 PM
    Author     : PC-LITE
--%>

<%@page import="sucursal.controlador.ComercioController"%>
<%@page import="java.sql.*"%>
<%@page import="sucursal.controlador.Conexion"%>
<%@page import="sucursal.modelo.*"%>

<%
    String accion = request.getParameter("accion");
    Comercios cliente = new Comercios();
    ComercioController control = new ComercioController();
   
    switch (accion) {
        case "agregar":
            if (request.getParameter("accion") != null) {
                 String panel = "session_inicio";  
               try {
                   
                    Conexion db = new Conexion();
                    
                    db.conectar();
                    db.query.executeUpdate("insert into tblcomercio"
                            + "(id,nombre) "
                            + "values(COMERCIO_SEQ.nextval "   
                            + ",'" + request.getParameter("nombre_c") + "')");  
                            
                    int contador = 1;
                    if (contador == 1) {
                        out.println("<script>alert('Comercio se publico correctamente'); </script>"); 
                        
                  //  panel = "vistas/regi_vista_carrera";
                    response.sendRedirect("../../MAdmin.jsp?panel=vistas/regi_vista_comercio");
                    db.desconectar();
                    }
                } catch (Exception e) {
                    out.println("An exception occurred: " + e.getMessage());
                    out.print("<script>alert('Error al ingresar un cliente');</script>");
                    e.printStackTrace();
                } 
            }
           
            break;
        case "eliminar":
            //clase para subir archivos a disco
            String id = request.getParameter("id");
            //String idcandidato = request.getParameter("idcandidato");
            if (control.eliminaComercio(id)) {
                //out.println("<script>alert(\"La carrera se elimino satisfactoriamente ! \");</script>");
                out.print("<script>alert(\"Se elimino el comercio del sistema. ! \");window.location.href='../../MAdmin.jsp?panel=vistas/regi_vista_comercio';</script>");
               // response.sendRedirect("../../registro.jsp?panel=vistas/regi_vista_carrera");
            } else {
                 out.print("<script>alert(\"No pudimos eliminar cliente, verifica la informacion proporcionada. ! \");</script>");
            }
            break;
            
        case "modificar":
            if (request.getParameter("accion") != null) {
                 String panel = "session_inicio";  
               try {
                   
                    Conexion db = new Conexion();
                    
                    db.conectar();
                      int contador = db.query.executeUpdate("UPDATE tblcomercio "
                            + " SET nombre = " + "'" + request.getParameter("nombre_c") + "'" 
                            + "WHERE id = "  + request.getParameter("id"));
              
                  //  int contador = 1;
                    if (contador == 1) {
                        out.println("<script>alert('Comercio se publico correctamente'); </script>"); 
                        
                  //  panel = "vistas/regi_vista_carrera";
                    response.sendRedirect("../../MAdmin.jsp?panel=vistas/regi_vista_comercio");
                    db.desconectar();
                    }
                } catch (Exception e) {
                    out.println("An exception occurred: " + e.getMessage());
                    out.print("<script>alert('Error no da');</script>");
                    e.printStackTrace();
                } 
            }
            break;
        default:
            out.print("<script>alert(\"Upps Algo Salio mal ! no se puedo completar la accion solicitada ! \");window.location.href='MAdmin.jsp?panel=session_inicio';</script>");
            break;
    }
%>

