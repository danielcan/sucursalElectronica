<%-- 
    Document   : mapa_clientes
    Created on : 09-26-2021, 05:24:38 PM
    Author     : PC-LITE
--%>



<%@page import="sucursal.controlador.ClienteController"%>
<%@page import="java.sql.*"%>
<%@page import="sucursal.controlador.Conexion"%>
<%@page import="sucursal.modelo.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Manejo de Mapas</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="https://maps.google.com/maps/api/js?sensor=true"></script>
        <script type="text/javascript">
            function mostrar_amigos() {
                var ubicacion = new google.maps.LatLng(14.6203, -87.644);
                var opciones = {zoom: 7,
                    center: ubicacion,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                };
                var map = new google.maps.Map(document.getElementById("mapa"), opciones);

            <%
                    String ami = "", lat = "", lon = "", info = "";
                    int cont=1;
                    try {
                          Conexion db = new Conexion();
                          Connection con;   
                          con = db.conectar();
                          PreparedStatement ps;
                          ps = con.prepareStatement("select id,posicionx,posiciony from ubicacionb");
                          ResultSet rs = ps.executeQuery();
            
            
                        while (rs.next()) {
                            ami = rs.getString(1);
                            lat = rs.getString(2);
                            lon = rs.getString(3);
                            
            %>
                mi_ubicacion<%=cont%> = new google.maps.Marker({
                    position: new google.maps.LatLng(<%=lat%>, <%=lon%>),
                    map: map,
                    title: '<%=ami%>'
                });

               

                google.maps.event.addListener(mi_ubicacion<%=cont%>, 'click', function () {
                    infowindow<%=cont%>.open(map, mi_ubicacion<%=cont%>);
                });

            <%
                           cont++;     
                        }
                        db.desconectar();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }


            %>

            }



        </script>       
    </head>
    <center>
        <body onload="mostrar_mapa(0)">
            <div id="mapa" style="width: 900px; height: 500px; border: 5px groove #006600;"></div>
            <input type="button" value="amigos" onclick="mostrar_amigos()"/>
        </body>
    </center>
</html>