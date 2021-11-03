<%-- 
    Document   : accion_retiros
    Created on : 15-sep-2021, 22:54:36
    Author     : Javier
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
            //clase para subir archivos a disco
            String cantidad= " "; 
            cantidad = request.getParameter("monto_a");
            int monto = 0;
            monto = Integer.parseInt(cantidad); 
          
            String cuent = request.getParameter("idcuentaO");
           
      
         //out.println(request.getParameter("idcuentaO"));
         
            if (control.cuentaMontoVerifica(cuent,cantidad)) {
                //out.println("<script>alert(\"La carrera se elimino satisfactoriamente ! \");</script>");
               
             
                //saldo de cuenta origen
                int saldonuevoOri = 0;
                int obtensaldoOri = 0;

                obtensaldoOri = control.obtenerSaldo(cuent);
                //nuevo saldo destino
             
                //nuevo saldo origen
                saldonuevoOri = obtensaldoOri - monto; 
                
                 try {
                   
                    Conexion db = new Conexion();
                    
                    db.conectar();
                  
                      //query de saldo origen
                      int contadorOri = db.query.executeUpdate("UPDATE tblcuenta "
                            + " SET saldo = " + "'" + String.valueOf(saldonuevoOri) + "'"        
                            + "WHERE id = "  + cuent);

                        db.query.executeUpdate("insert into tbldepositos"
                            + "(id,cantidad,cuentaEnvio,cuentaRecibido,iddeta)"
                            + "values(DEPOSIS_SEQ.nextval "   
                            + ",'" + request.getParameter("monto_a") + "'" 
                            + ",'" + cuent + "'" 
                            + ",null" 
                            + ",'" + "2" + "')"); 
                      
                  //  int contador = 1;
                    if (contadorOri == 1) {
                        
                        out.print("<script>alert(\"Retiro exitoso ! \");window.location.href='../../../MCliente.jsp?panel=vistas_cliente/vista_saldo_disponible&idcliente="+request.getParameter("idcliente")+"';</script>"); 
                        
                  //  panel = "vistas/regi_vista_carrera";
                   
                        db.desconectar();
                    }else {
                    out.print("<script>alert(\"No fue exitoso el retiro. ! \");window.location.href='../../../MCliente.jsp?panel=session_inicio';</script>");
                    }
                } catch (Exception e) {
                    out.println("An exception occurred: " + e.getMessage());
                    out.print("<script>alert('Error en el query');</script>");
                    e.printStackTrace();
                } 
                

                
                
               // response.sendRedirect("../../registro.jsp?panel=vistas/regi_vista_carrera");
            } else {
        out.print("<script>alert(\"¡¡NO existe la cuenta en la sucursal!! \");window.location.href='../../../MCliente.jsp?panel=session_inicio';</script>"); 
                    
            }
            break;
            
              default:
            out.print("<script>alert(\"Upps Algo Salio mal ! no se puedo completar la accion solicitada ! \");window.location.href='../../../MCliente.jsp?panel=session_inicio';</script>");
            break;
    }
%>
