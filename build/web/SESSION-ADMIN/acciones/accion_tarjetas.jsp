<%-- 
    Document   : accion_tarjetas
    Created on : 09-08-2021, 10:01:56 PM
    Author     : PC-LITE
--%>

<%@page import="sucursal.controlador.TarjetasController"%>
<%@page import="java.sql.*"%>
<%@page import="sucursal.controlador.Conexion"%>
<%@page import="sucursal.modelo.*"%>

<%
    String accion = request.getParameter("accion");
    Tarjetas cliente = new Tarjetas();
    TarjetasController control = new TarjetasController();
   
    switch (accion) {
        case "agregar":
            if (request.getParameter("accion") != null) {
                 String panel = "session_inicio";  
               try {
                   
                    Conexion db = new Conexion();
                    
                    db.conectar();
                    db.query.executeUpdate("insert into tbltarjeta"
                            + "(id,nombre,fechaVen,numero,tipo,cuenta) "
                            + "values(TARJETA_SEQ.nextval"   
                            + ",'" + request.getParameter("nombre_t") + "'" 
                            + ",'" + request.getParameter("fecha_t") + "'" 
                            + ",'" + request.getParameter("numero_t") + "'" 
                            + ",'" + request.getParameter("tipo_t") + "'"         
                            + ",'" + request.getParameter("cuenta_t") + "')");  
                            
                    int contador = 1;
                    if (contador == 1) {
                        out.println("<script>alert('Tarjeta se publico correctamente'); </script>"); 
                        
                  //  panel = "vistas/regi_vista_carrera";
                    response.sendRedirect("../../MAdmin.jsp?panel=vistas/regi_vista_tarjetas");
                    db.desconectar();
                    }
                } catch (Exception e) {
                    out.println("An exception occurred: " + e.getMessage());
                    out.print("<script>alert('Error al ingresar una tarjeta, error query');</script>");
                    e.printStackTrace();
                } 
            }
           
            break;
        case "eliminar":
            //clase para subir archivos a disco
            String id = request.getParameter("id");
            //String idcandidato = request.getParameter("idcandidato");
            if (control.eliminaTarjetas(id)) {
                //out.println("<script>alert(\"La carrera se elimino satisfactoriamente ! \");</script>");
                out.print("<script>alert(\"Se elimino el Tarjetas del sistema. ! \");window.location.href='../../MAdmin.jsp?panel=vistas/regi_vista_tarjetas';</script>");
               // response.sendRedirect("../../registro.jsp?panel=vistas/regi_vista_carrera");
            } else {
                 out.print("<script>alert(\"No pudimos eliminar la tarjeta, verifica la informacion proporcionada. ! \");</script>");
            }
            break;
            
        case "modificar":
            if (request.getParameter("accion") != null) {
                 String panel = "session_inicio";  
               try {
                   
                    Conexion db = new Conexion();
                    
                    db.conectar();
                        int contador = db.query.executeUpdate("UPDATE tbltarjeta "
                            + " SET nombre = " + "'" + request.getParameter("nombre_a") + "'" +"," 
                            +" fechaVen = '" + request.getParameter("fecha_a") + "'" +","
                            +" numero = '" + request.getParameter("numero_a") + "'" +"," 
                            +" tipo = " + request.getParameter("tipo_a") + "," 
                            +" cuenta = " + request.getParameter("cuenta_a")           
                            + " WHERE id = "  + request.getParameter("id"));
              
                  //  int contador = 1;
                    if (contador == 1) {
                        out.println("<script>alert('Tarjeta se publico correctamente'); </script>"); 
                        
                  //  panel = "vistas/regi_vista_carrera";
                    response.sendRedirect("../../MAdmin.jsp?panel=vistas/regi_vista_tarjetas");
                    db.desconectar();
                    }
                } catch (Exception e) {
                    out.println("An exception occurred: " + e.getMessage());
                    out.print("<script>alert('Error en el query');</script>");
                    e.printStackTrace();
                } 
            }
            break;
        default:
            out.print("<script>alert(\"Upps Algo Salio mal ! no se puedo completar la accion solicitada ! \");window.location.href='MAdmin.jsp?panel=session_inicio';</script>");
            break;
    }
%>

