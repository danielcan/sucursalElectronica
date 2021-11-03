<%-- 
    Document   : accion_tipo
    Created on : 09-04-2021, 04:06:46 PM
    Author     : PC-LITE
--%>
<%@page import="sucursal.controlador.TipotController"%>
<%@page import="java.sql.*"%>
<%@page import="sucursal.controlador.Conexion"%>
<%@page import="sucursal.modelo.*"%>

<%
    String accion = request.getParameter("accion");
    Tipotarjetas tipot = new Tipotarjetas();
    TipotController control = new TipotController();
   
    switch (accion) {
        case "agregar":
            if (request.getParameter("accion") != null) {
                 String panel = "session_inicio";  
               try {
                   
                    Conexion db = new Conexion();
                    
                    db.conectar();
                    db.query.executeUpdate("insert into tblttarjeta"
                            + "(id,tipo) "
                            + "values(TIPO_SEQ.nextval "   
                            + ",'" + request.getParameter("tipo_a") + "')");  
                            
                    int contador = 1;
                    if (contador == 1) {
                        out.println("<script>alert('Tipo tarjeta se publico correctamente'); </script>"); 
                        
                  //  panel = "vistas/regi_vista_carrera";
                    response.sendRedirect("../../MAdmin.jsp?panel=vistas/regi_vista_tipo");
                    db.desconectar();
                    }
                } catch (Exception e) {
                    out.println("An exception occurred: " + e.getMessage());
                    out.print("<script>alert('Error al ingresar');</script>");
                    e.printStackTrace();
                } 
            }
           
            break;
        case "eliminar":
            //clase para subir archivos a disco
            String id = request.getParameter("id");
            //String idcandidato = request.getParameter("idcandidato");
            if (control.eliminaTipo(id)) {
                //out.println("<script>alert(\"La carrera se elimino satisfactoriamente ! \");</script>");
                out.print("<script>alert(\"Se elimino el tipo de tarjeta del sistema. ! \");window.location.href='../../MAdmin.jsp?panel=vistas/regi_vista_tipo';</script>");
               // response.sendRedirect("../../registro.jsp?panel=vistas/regi_vista_carrera");
            } else {
                 out.print("<script>alert(\"No pudimos eliminar tipo de tarjeta, verifica la informacion proporcionada. ! \");</script>");
            }
            break;
            
        case "modificar":
            if (request.getParameter("accion") != null) {
                 String panel = "session_inicio";  
               try {
                   
                    Conexion db = new Conexion();
                    
                    db.conectar();
                      int contador = db.query.executeUpdate("UPDATE tblttarjeta "
                            + " SET tipo = " + "'" + request.getParameter("tipo_a") + "'"         
                            + "WHERE id = "  + request.getParameter("id"));
              
                  //  int contador = 1;
                    if (contador == 1) {
                        out.println("<script>alert('Tipo de tarjeta se publico correctamente'); </script>"); 
                        
                  //  panel = "vistas/regi_vista_carrera";
                    response.sendRedirect("../../MAdmin.jsp?panel=vistas/regi_vista_tipo");
                    db.desconectar();
                    }
                } catch (Exception e) {
                    out.println("An exception occurred: " + e.getMessage());
                    out.print("<script>alert('Error no se pudo ingresar');</script>");
                    e.printStackTrace();
                } 
            }
            break;
        default:
            out.print("<script>alert(\"Upps Algo Salio mal ! no se puedo completar la accion solicitada ! \");window.location.href='MAdmin.jsp?panel=session_inicio';</script>");
            break;
    }
%>

