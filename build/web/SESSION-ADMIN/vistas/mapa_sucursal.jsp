<%-- 
    Document   : mapa_sucursal
    Created on : 09-26-2021, 01:20:16 PM
    Author     : PC-LITE
--%>

<html>
    <head>
        <title>Manejo de Mapas</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="https://maps.google.com/maps/api/js?sensor=true"></script>
        <script type="text/javascript">
            function mostrar_mapa(centinela){
                //Ubicación inicial del mapa.
                var ubicacion = new google.maps.LatLng(14.6203, -87.644); //Latitud y Longitud
                //Parámetros Iniciales
                var opciones={zoom:7, //acercamiento
                    center: ubicacion,
                    mapTypeId: google.maps.MapTypeId.ROADMAP //Las posibles opciones son ROADMAP/SATELLITE/HYBRID/TERRA                    
                };
            
                //Creacion del mapa
                var map = new google.maps.Map(document.getElementById("mapa"),opciones);
                
                
              //recuperar ubicacion donde hago click
                var iw = new google.maps.InfoWindow(
                            {content: 'Haga click sobre el mapa <br> para ver Latitud y Longitud!', 
                             position: ubicacion});
                iw.open(map);
                // configurar evento click sobre el mapa
                map.addListener('click', function(mapsMouseEvent) {                 
                  iw.close();
                  iw = new google.maps.InfoWindow({position: mapsMouseEvent.latLng});
                  iw.setContent(mapsMouseEvent.latLng.toString());
                  iw.open(map);
                });
                

                if (centinela==1){
                    //Colocar una marca sobre el Mapa
                    mi_ubicacion = new google.maps.Marker({
                       position: new google.maps.LatLng(14.104173, -87.186145),//Posición de la marca
                       icon: 'persona.jpg', //Imagen que aparecerá en la marca, debe estar en el server
                       map: map, //Mapa donde estará la marca
                       title: 'Osman Mejía' //Título all hacer un mouseover
                    });

                    //Mostrar Información al hacer click en la marca
                    var infowindow = new google.maps.InfoWindow({
                        content: 'Elaborado Por: Osman Mejía<br/>Clase: DAW<br/>Tipo: Ejemplo'
                    });

                    google.maps.event.addListener(mi_ubicacion, 'click',function(){
                        //Calling the open method of the InfoWindow
                       infowindow.open(map, mi_ubicacion);
                    });
                };
            }  
            
            function mostrar_triangulo(){
                //Ubicación inicial del mapa
                var ubicacion = new google.maps.LatLng(24.886436490187712, -70.2685546875);
                //Parámetros iniciales
                var opciones = {zoom: 5,
                    center: ubicacion,
                    mapTypeId: google.maps.MapTypeId.ROADMAP
                };

                var map = new google.maps.Map(document.getElementById("mapa"),opciones);
                var bermudaTriangle;
                var triangleCoords = [
                    new google.maps.LatLng(25.774252, -80.190262),
                    new google.maps.LatLng(18.466465, -66.118292),
                    new google.maps.LatLng(32.321384, -64.75737),
                    new google.maps.LatLng(25.774252, -80.190262),
                ];
                
                //Crear Polígono
                bermudaTriangle = new google.maps.Polygon({
                    paths: triangleCoords,
                    strokeColor: "#FF0000",
                    strokeOpacity: 0.8,
                    strokeWeight: 2,
                    fillColor:"FF0000",
                    fillOpacity: 0.35
                });
                
                bermudaTriangle.setMap(map);
            

            }
            
            
        </script>       
    </head>
    <center>
        <body onload="mostrar_mapa(1)">

            <div id="mapa" style="width: 900px; height: 500px; border: 5px groove #006600;"></div>
            <input type="button" value="Mostrar Ubicacion Sucursal" onclick="mostrar_mapa(1)"/>
           
        </body>
    </center>
</html>