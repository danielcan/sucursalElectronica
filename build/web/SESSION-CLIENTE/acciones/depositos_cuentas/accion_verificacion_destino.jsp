<%-- 
    Document   : accion_verificacion_destino
    Created on : 09-12-2021, 12:36:46 PM
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
                   id = request.getParameter("cuenta_a");
           session.setAttribute("idcuentaD", request.getParameter("cuenta_a"));
             
            //String idcandidato = request.getParameter("idcandidato");
            if (control.cuentaExistente(id)) {
                //out.println("<script>alert(\"La carrera se elimino satisfactoriamente ! \");</script>");
             
                out.print("<script>alert(\"Si existe la cuenta, añade el monto del deposito de la cuenta. ! \");window.location.href='../../../MCliente.jsp?panel=depositos_cuentas/monto';</script>");
               // response.sendRedirect("../../registro.jsp?panel=vistas/regi_vista_carrera");
            } else {
                 out.print("<script>alert(\"Cuenta no Existe. ! \");window.location.href='../../../MCliente.jsp?panel=session_inicio';</script>");
            }
            break;
            
              default:
            out.print("<script>alert(\"Upps Algo Salio mal ! no se puedo completar la accion solicitada ! \");window.location.href='MCliente.jsp?panel=session_inicio';</script>");
            break;
    }
%>

