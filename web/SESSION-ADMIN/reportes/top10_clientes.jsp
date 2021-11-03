<%-- 
    Document   : top10_clientes
    Created on : 09-26-2021, 05:26:59 PM
    Author     : PC-LITE
--%>

<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="sucursal.controlador.Conexion"%>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="sucursal.controlador.Conexion"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

        <!-- Importa las librerias de jQuery y las de Highcharts -->
        <script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="js/highcharts.js"></script>
        <script type="text/javascript" src="js/exporting.js"></script>



        <%
            String mes="", vta="";
            int po=5;
            try {
                
                 Conexion db = new Conexion();
          Connection con;   
         con = db.conectar();
         PreparedStatement ps;
            ps = con.prepareStatement("select idcliente, count(idcliente) from tblcompra group by idcliente ");
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
           
                
                while(rs.next()){ 
                    mes+=""+rs.getString(1)+",";
                    vta+=""+rs.getInt(2)+",";
                       po = 70000;
                    out.print(Integer.parseInt(rs.getString(2)));
                  //  vtes+=""+rs.getString(3)+",";
                  //  pag+=""+rs.getString(4)+",";                    
                }
                db.desconectar();
                //quitar la ultima coma de las cadenas
             
                mes=mes.substring(0, mes.length());
               // vta=vta.substring(0, vta.length() );
              //  vtes=vtes.substring(0, vtes.length()-1);
             //   pag=pag.substring(0, pag.length()-1);                
                
            } catch (Exception e) {
                e.printStackTrace();
            }

            

        %>



        <!-- Creo la gráfica -->
        <script type="text/javascript">
            var chart;
            $(document).ready(function () {

                chart = new Highcharts.Chart({
                    chart: {
                        renderTo: 'graficaLineal', // Le doy el nombre a la gráfica
                        type: 'column'  // Pongo que tipo de gráfica es
                    },
                    title: {
                        text: 'Estasdisticas'	// Titulo (Opcional)
                    },
                    subtitle: {
                        text: 'El cliente que más gasto'				// Subtitulo (Opcional)
                    },
                    // Pongo los datos en el eje de las 'X'
                  
                    yAxis: {
                        // Pongo el título para el eje de las 'Y'
                        title: {
                            text: 'Nº Cantidad que gasto'
                        }
                    },
                    // Doy formato al la "cajita" que sale al pasar el ratón por encima de la gráfica
                    tooltip: {
                        enabled: true,
                        formatter: function () {
                            return '<b>' + this.series.name + '</b><br/>' +
                                    this.x + ': ' + this.y + ' ' + this.series.name;
                        }
                    },
                    // Doy opciones a la gráfica
                    plotOptions: {
                        line: {
                            dataLabels: {
                                enabled: true
                            },
                            enableMouseTracking: true
                        }
                    },
                    // Doy los datos de la gráfica para dibujarlas
                    series: [{
                            name: 'Cliente con el valor más alto en compra',
                            //poner visitas desde la base de datos
                           data: [7000,5000,4000,3000,1000,700,500,400,300,50]
                        }
                        ],
                });


            });

        </script>

    </head>
    <body>
        <!-- "Llamo" a la gráfica y la pinto en el cuerpo de la página -->
        <div id="graficaLineal" style="width: 100%; height: 500px; margin: 0 auto"></div>		
    </body>
</html>
