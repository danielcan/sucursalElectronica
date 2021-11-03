<%-- 
    Document   : accion_verificacion_origen
    Created on : 09-15-2021, 11:24:31 AM
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
     
        case "verificar":
            //clase para subir archivos a disco
            String id= " "; 
                   id = request.getParameter("idcuenta_t");
           
             out.print(id);
            //String idcandidato = request.getParameter("idcandidato");
            if (control.verificarCuenta(id)) {
                //out.println("<script>alert(\"La carrera se elimino satisfactoriamente ! \");</script>");
                session.setAttribute("idcuentaO", request.getParameter("idcuenta_t"));
                out.print("<script>alert(\"Cuenta con saldo verifica la cuenta destino. ! \");window.location.href='../../../MCliente.jsp?panel=depositos_OCuentas/registro_OCuenta';</script>");
               // response.sendRedirect("../../registro.jsp?panel=vistas/regi_vista_carrera");
            } else {
                 out.print("<script>alert(\"Cuenta no tiene dinero. ! \");window.location.href='../../../MCliente.jsp?panel=session_inicio';</script>");
            
            }
            break;
            
              default:
            out.print("<script>alert(\"Upps Algo Salio mal ! no se puedo completar la accion solicitada ! \");window.location.href='MCliente.jsp?panel=session_inicio';</script>");
            break;
    }
%>

