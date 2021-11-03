<%-- 
    Document   : estado_cuentapdf
    Created on : 09-26-2021, 03:32:23 PM
    Author     : PC-LITE
--%>

<%@page import="java.io.StringReader"%>
<%@page import="com.lowagie.text.html.simpleparser.HTMLWorker"%>
<%@page import="com.lowagie.text.pdf.PdfWriter"%>
<%@page import="com.lowagie.text.*"%>
<%@page import="com.lowagie.text.pdf.PdfPTable"%>
<%@page import="java.io.IOException"%>
<%@page import="java.util.Date"%>
<%@page import="lista.*"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

<%
    //configurar el header y el tipo
    response.setContentType("application/pdf");
    response.setHeader("Content-Disposition", 
            "attachment; filename=\"reporte.pdf\"");
    try {
        //crear y abrir documento tipo pdf
        Document documentoPDF = new Document();
        PdfWriter.getInstance(documentoPDF, response.getOutputStream());
        documentoPDF.open();       

        //algunos parametros
       // documentoPDF.addAuthor(request.getParameter("nombre1"));
       
        documentoPDF.addSubject("Documento de prueba");
        documentoPDF.addCreationDate();
        documentoPDF.addTitle("DAW-PDF");

        //agregar parrafos
       // documentoPDF.add(new Paragraph(request.getParameter("clasesocial")));
       // documentoPDF.add(new Paragraph(request.getParameter("nombre1")));
        //documentoPDF.add(new Paragraph(new Date().toString()));
        documentoPDF.add(new Paragraph("\n"));
        

        //agregar una tabla
        PdfPTable table = new PdfPTable(2);        
        table.addCell("Estado de cuenta con descuento para pagó.");
        table.addCell("Datos");

        
        table.addCell("total");
        table.addCell(request.getParameter("subtotal"));
        table.addCell("subtotal");
        table.addCell(request.getParameter("subtotal"));
        table.addCell("fecha");
        table.addCell(request.getParameter("fecha"));
        table.addCell("Estudio");
       
        
        
        
        documentoPDF.add(table);
        //documentoPDF.close();
                
        //colocar imagen
       
        //documentoPDF.close();
        
        //insertar html
        HTMLWorker htmlWorker = new HTMLWorker(documentoPDF);
     
        // cerrar el documento
        documentoPDF.close();
    } catch (DocumentException de) {
        throw new IOException(de.getMessage());
    }
%>

