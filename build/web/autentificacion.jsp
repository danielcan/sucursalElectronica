<%-- 
    Document   : autenticacion
    Created on : 29-agos-2021, 1:05:48
    Author     : Dan
--%>


<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="sucursal.controlador.Conexion"%>
<%-- <%@page import="backboard.controlador.Encriptacion"%>--%>
<%@page session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.util.logging.Level"%>
<%@page import="java.io.UnsupportedEncodingException"%>
<%--@page import="encriptacion.EncriptadorAES"--%>
<%@page import="java.security.InvalidKeyException"%>
<%@page import="java.security.NoSuchAlgorithmException"%>
<%@page import="java.util.logging.Level"%>
<%@page import="java.util.logging.Logger"%>
<%@page import="javax.crypto.BadPaddingException"%>
<%@page import="javax.crypto.IllegalBlockSizeException"%>
<%@page import="javax.crypto.NoSuchPaddingException"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page session="true"%>
<%@page import="sucursal.encriptacion.EncriptadorAES"%>
<%@page import="sucursal.modelo.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="sucursal.controlador.ClienteController"%>
<%@page import="sucursal.modelo.Cliente"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Autenticacion</title>
    </head>
          
    <body>
    
  <%
        
        try{
           
         Conexion db = new Conexion();
          Connection con;   
         con = db.conectar();
         PreparedStatement ps;
            ps = con.prepareStatement("select login,contrasenia,rol,idcliente from TBLusuario");
            ResultSet rs = ps.executeQuery();
            boolean encontrado = false;
            int rol = 0;
            String usuario = null;
            String nombre = "";
            String cuenta = "";
            String centinela = "n";
            String carrera = "";
            String idcliente = "";
            String nombrec = "";
           
           while (rs.next()) {
                if (request.getParameter("usern").equals(rs.getString(1))
                        && (request.getParameter("passw")).equals(rs.getString(2))) {
                    encontrado = true; 
                    rol = Integer.parseInt(rs.getString(3));
                    idcliente = rs.getString(4);
                    break;
                }
            }
             if (encontrado) {
  
                 session.setAttribute("login", usuario);
                session.setAttribute("login", request.getParameter("usern"));
                session.setAttribute("contra", request.getParameter("passw"));
                session.setAttribute("rol", rol);
                
          
                if (rol==1) {
                    nombre = "Administrador";
                    session.setAttribute("nombre",nombre);
                    response.sendRedirect("MAdmin.jsp?panel=session_inicio");
                } else if (rol==2) {
                    nombre = "Cliente";
                    session.setAttribute("login", usuario);
                    session.setAttribute("nombre",nombre);
                    session.setAttribute("idcliente",idcliente); 
                    
                    ClienteController consulta = new ClienteController();
                    Cliente cliente = new Cliente();
                    cliente = consulta.ObtenerUnCliente(idcliente); 
                    nombrec = cliente.getNombreC();
                    
                    session.setAttribute("nombrec", nombrec);
                   response.sendRedirect("MCliente.jsp?panel=session_inicio");
                  // out.print("<script>window.location.href='MCliente.jsp?panel= session_inicio ";</script>");

                } 
            } else {
                session.setAttribute("login", null);
                session.setAttribute("contra", null);
                out.println("<script>alert(\"Usuario o Password incorrecto\");</script>");
                out.println("<script>location.href='index.jsp';</script>");
            }
        } catch (Exception e) {
          out.println("An exception occurred: " + e.getMessage()); 
                  out.print("Problema de conexion de libreria");
                    e.printStackTrace();      
        }  
    %> 
   </body>
</html>