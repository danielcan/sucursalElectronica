<%-- 
    Document   : accion_depositos
    Created on : 09-15-2021, 03:21:32 PM
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
            //clase para subir archivos a disco
            String cantidad= " "; 
            cantidad = request.getParameter("monto_a");
            int monto = 0;
            monto = Integer.parseInt(cantidad); 
          
            String cuent = request.getParameter("idcuentaO");
            String cuentD = request.getParameter("idcuentaD");
      
         //out.println(request.getParameter("idcuentaO"));
         
            if (control.cuentaMontoVerifica(cuent,cantidad)) {
                //out.println("<script>alert(\"La carrera se elimino satisfactoriamente ! \");</script>");
                //saldo de cuenta destino
                int saldonuevo = 0; 
                int obtensaldo = 0;
                //saldo de cuenta origen
                int saldonuevoOri = 0;
                int obtensaldoOri = 0;
                        
                obtensaldo =  control.obtenerSaldo(cuentD);
                obtensaldoOri = control.obtenerSaldo(cuent);
                //nuevo saldo destino
                saldonuevo = monto + obtensaldo;
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
                            + ",'" + cuentD + "'" 
                            + ",'" + "3" + "')"); 
                      
                  //  int contador = 1;
                    if (contadorOri == 1) {
                        out.print("<script>alert(\"Deposito exitoso ! \");window.location.href='../../MAdmin.jsp?panel=vistas/regi_vista_depositos';</script>"); 
                        
                  //  panel = "vistas/regi_vista_carrera";
                   
                        db.desconectar();
                    }
                } catch (Exception e) {
                    out.println("An exception occurred: " + e.getMessage());
                    out.print("<script>alert('Error en el query');</script>");
                    e.printStackTrace();
                } 
                

                
                out.print("<script>alert(\"Si existe la cuenta; a?ade el monto del deposito de la cuenta. ! \");window.location.href='../../../MCliente.jsp?panel=depositos_OCuentas/monto';</script>");
               // response.sendRedirect("../../registro.jsp?panel=vistas/regi_vista_carrera");
            } else {
                
            }
            break;
            
              default:
            out.print("<script>alert(\"Upps Algo Salio mal ! no se puedo completar la accion solicitada ! \");window.location.href='MCliente.jsp?panel=session_inicio';</script>");
            break;
    }
%>

