<%-- 
    Document   : accion_producto
    Created on : 09-08-2021, 03:34:15 PM
    Author     : AdminCis
--%>


<%@page import="sucursal.controlador.ProductosController"%>
<%@page import="java.sql.*"%>
<%@page import="sucursal.controlador.Conexion"%>
<%@page import="sucursal.modelo.*"%>

<%
    String accion = request.getParameter("accion");
    Productos cliente = new Productos();
    ProductosController control = new ProductosController();
   
    switch (accion) {
        case "agregar":
            if (request.getParameter("accion") != null) {
                 String panel = "session_inicio";  
               try {
                   
                    Conexion db = new Conexion();
                    
                    db.conectar();
                    db.query.executeUpdate("insert into tblproducto"
                            + "(id,nombre,comercio) "
                            + "values(PRODUCTO_SEQ.nextval "   
                            + ",'" + request.getParameter("nombre_a") + "'" 
                            + ",'" + request.getParameter("comercio_t") + "')");  
                            
                    int contador = 1;
                    if (contador == 1) {
                        out.println("<script>alert('Producto se publico correctamente'); </script>"); 
                        
                  //  panel = "vistas/regi_vista_carrera";
                    response.sendRedirect("../../MAdmin.jsp?panel=vistas/regi_vista_producto");
                    db.desconectar();
                    }
                } catch (Exception e) {
                    out.println("An exception occurred: " + e.getMessage());
                    out.print("<script>alert('Error al ingresar un producto error de query');</script>");
                    e.printStackTrace();
                } 
            }
           
            break;
        case "eliminar":
            //clase para subir archivos a disco
            String idcliente = request.getParameter("id");
            //String idcandidato = request.getParameter("idcandidato");
            if (control.eliminaProductos(idcliente)) {
                //out.println("<script>alert(\"La carrera se elimino satisfactoriamente ! \");</script>");
                out.print("<script>alert(\"Se elimino el producto del sistema. ! \");window.location.href='../../MAdmin.jsp?panel=vistas/regi_vista_producto';</script>");
               // response.sendRedirect("../../registro.jsp?panel=vistas/regi_vista_carrera");
            } else {
                 out.print("<script>alert(\"No pudimos eliminar el producto, verifica la informacion proporcionada. ! \");</script>");
            }
            break;
            
        case "modificar":
            if (request.getParameter("accion") != null) {
                 String panel = "session_inicio";  
               try {
                   
                    Conexion db = new Conexion();
                    
                    db.conectar();
                      int contador = db.query.executeUpdate("UPDATE tblproducto "
                            + " SET nombre = " + "'" + request.getParameter("nombre_a") + "'" +"," 
                            +" comercio = " + "'" + request.getParameter("comercio_a") + "'"       
                            + "WHERE id = "  + request.getParameter("id"));
              
                  //  int contador = 1;
                    if (contador == 1) {
                        out.println("<script>alert('Producto se publico correctamente'); </script>"); 
                        
                  //  panel = "vistas/regi_vista_carrera";
                    response.sendRedirect("../../MAdmin.jsp?panel=vistas/regi_vista_producto");
                    db.desconectar();
                    }
                } catch (Exception e) {
                    out.println("An exception occurred: " + e.getMessage());
                    out.print("<script>alert('Error no da, error de query');</script>");
                    e.printStackTrace();
                } 
            }
            break;
        default:
            out.print("<script>alert(\"Upps Algo Salio mal ! no se puedo completar la accion solicitada ! \");window.location.href='MAdmin.jsp?panel=session_inicio';</script>");
            break;
    }
%>

