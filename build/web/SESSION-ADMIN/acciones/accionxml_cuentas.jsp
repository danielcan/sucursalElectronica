<%-- 
    Document   : accionxml_cuentas
    Created on : 09-17-2021, 04:01:41 PM
    Author     : AdminCis
--%>

<%@page import="org.jdom.output.XMLOutputter"%>
<%@page import="org.jdom.output.Format"%>
<%@page import="backboard.controlador.Conexion"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.IOException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.util.List"%>
<%@page import="org.jdom.Element"%>
<%@page import="org.jdom.Document"%>
<%@page import="org.jdom.input.SAXBuilder"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSetMetaData"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

            <%//exportar todo a xml
if(request.getParameter("bt_exportar")!= null){
    Document doc = new Document();
    Element raiz = new Element("CUENTAS");
    doc.setRootElement(raiz);
    
    try{
        Conexion db = new Conexion();
        db.conectar();
        db.query.execute("select * from TBLcuenta where rol = 3");
        ResultSet rs = db.query.getResultSet();
        ResultSetMetaData rsmd = rs.getMetaData();
        
        int numcols = rsmd.getColumnCount();
        while(rs.next()){
            List elmts = new ArrayList();
            for (int i=1; i<=numcols; i++){
                String colname=rsmd.getColumnName(i);
                String colval = rs.getString(i);
                Element elmt = new Element(colname);
                elmt.setText(colval);
                elmts.add(elmt);
            }
            Element row = new Element("CUENTAS");
            row.setContent(elmts);
            raiz.addContent(row);
        }
        
        rs.close();
        
        XMLOutputter outputter = new XMLOutputter(Format.getPrettyFormat());
        try{
            File fichero = new File(application.getRealPath("")+"cuentas.xml");
            FileOutputStream fos = new FileOutputStream(fichero.getPath());
            outputter.output(doc, fos);
            fos.close();
            out.print("<script>alert('El archivo XML ha sido creado exitosamente');window.location.href='../../MAdmin.jsp?panel=vistas/expor_impor_alumno';</script>");
        }
        catch(IOException e){
            e.printStackTrace();
        }
    }
    catch (SQLException e){
        e.printStackTrace();
    }
}

%>


