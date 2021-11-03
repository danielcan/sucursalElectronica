<%-- 
    Document   : accion_cuenta
    Created on : 09-07-2021, 11:10:16 PM
    Author     : PC-LITE
--%>


<%@page import="sucursal.controlador.CuentaController"%>
<%@page import="java.sql.*"%>
<%@page import="sucursal.controlador.Conexion"%>
<%@page import="sucursal.modelo.*"%>

<%
    String accion = request.getParameter("accion");
    Cuentas cliente = new Cuentas();
    CuentaController control = new CuentaController();
   
    switch (accion) {
        case "agregar":
            if (request.getParameter("accion") != null) {
                 String panel = "session_inicio";  
               try {
                   
                    Conexion db = new Conexion();
                    
                    db.conectar();
                    db.query.executeUpdate("insert into tblcuenta"
                            + "(id,saldo,idcliente) "
                            + "values(CUENTA_SEQ.nextval "   
                            + ",'" + request.getParameter("saldo_t") + "'" 
                            + ",'" + request.getParameter("idcliente_t") + "')");  
                            
                    int contador = 1;
                    if (contador == 1) {
                        out.println("<script>alert('Cuenta se publico correctamente'); </script>"); 
                        
                  //  panel = "vistas/regi_vista_carrera";
                    response.sendRedirect("../../MAdmin.jsp?panel=vistas/regi_vista_cuenta");
                    db.desconectar();
                    }
                } catch (Exception e) {
                    out.println("An exception occurred: " + e.getMessage());
                    out.print("<script>alert('Error al ingresar un cuenta');</script>");
                    e.printStackTrace();
                } 
            }
           
            break;
        case "eliminar":
            //clase para subir archivos a disco
            String id = request.getParameter("id");
            //String idcandidato = request.getParameter("idcandidato");
            if (control.eliminaCuenta(id)) {
                //out.println("<script>alert(\"La carrera se elimino satisfactoriamente ! \");</script>");
                out.print("<script>alert(\"Se elimino el Cuenta del sistema. ! \");window.location.href='../../MAdmin.jsp?panel=vistas/regi_vista_cuenta';</script>");
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
                      int contador = db.query.executeUpdate("UPDATE tblcuenta "
                            + " SET saldo = " + "'" + request.getParameter("saldo_t") + "'" +"," 
                            +" idcliente = " + "'" + request.getParameter("idcliente_t") + "'"         
                            + "WHERE id = "  + request.getParameter("id"));
              
                  //  int contador = 1;
                    if (contador == 1) {
                        out.println("<script>alert('Cuenta se publico correctamente'); </script>"); 
                        
                  //  panel = "vistas/regi_vista_carrera";
                    response.sendRedirect("../../MAdmin.jsp?panel=vistas/regi_vista_cuenta");
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

