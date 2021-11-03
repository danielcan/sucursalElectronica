<%-- 
    Document   : salir
    Created on : 08-30-2021, 12:11:37 PM
    Author     : AdminCis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
 request.getSession().invalidate();
 request.getRequestDispatcher("index.jsp").forward(request, response);
%>