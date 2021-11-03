<%-- 
    Document   : accion_cliente
    Created on : 08-31-2021, 11:20:49 AM
    Author     : AdminCis
--%>

<%@page import="sucursal.controlador.ClienteController"%>
<%@page import="java.sql.*"%>
<%@page import="sucursal.controlador.Conexion"%>
<%@page import="sucursal.modelo.*"%>

<%
    String accion = request.getParameter("accion");
    Cliente cliente = new Cliente();
    ClienteController control = new ClienteController();
   
    switch (accion) {
        case "agregar":
            if (request.getParameter("accion") != null) {
                 String panel = "session_inicio";  
               try {
                   
                    Conexion db = new Conexion();
                    
                    db.conectar();
                    db.query.executeUpdate("insert into tblcliente"
                            + "(idcliente,nombreC,fechaIngreso,telefono,identidad) "
                            + "values(CLIENTE_SEQ.nextval "   
                            + ",'" + request.getParameter("nombre_a") + "'" 
                            + ",'" + request.getParameter("fechaI_a") + "'" 
                            + ",'" + request.getParameter("telefono_a") + "'" 
                            + ",'" + request.getParameter("identidad_a") + "')");  
                            
                    int contador = 1;
                    if (contador == 1) {
                        out.println("<script>alert('Cliente se publico correctamente'); </script>"); 
                        
                  //  panel = "vistas/regi_vista_carrera";
                    response.sendRedirect("../../MAdmin.jsp?panel=vistas/regi_vista_cliente");
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
            if (control.eliminaCliente(id)) {
                //out.println("<script>alert(\"La carrera se elimino satisfactoriamente ! \");</script>");
                out.print("<script>alert(\"Se elimino el cliente del sistema. ! \");window.location.href='../../MAdmin.jsp?panel=vistas/regi_vista_cliente';</script>");
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
                      int contador = db.query.executeUpdate("UPDATE tblcliente "
                            + " SET nombreC = " + "'" + request.getParameter("nombre_a") + "'" +"," 
                            +" fechaIngreso = " + "'" + request.getParameter("fechaI_a") + "'" +","        
                            +" telefono = " + "'" + request.getParameter("telefono_a") + "'" +","
                            +" identidad = " + "'" + request.getParameter("identidad_a") + "'"             
                            + "WHERE idcliente = "  + request.getParameter("idcliente"));
              
                  //  int contador = 1;
                    if (contador == 1) {
                        out.println("<script>alert('Cliente se publico correctamente'); </script>"); 
                        
                  //  panel = "vistas/regi_vista_carrera";
                    response.sendRedirect("../../MAdmin.jsp?panel=vistas/regi_vista_cliente");
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

