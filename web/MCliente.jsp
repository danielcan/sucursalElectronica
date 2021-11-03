<%-- 
    Document   : MCliente
    Created on : 08-22-2021, 02:24:13 PM
    Author     : PC-LITE
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!-- NO BACK -->
<% 
if(session.getAttribute("nombre")==null){
    request.getRequestDispatcher("index.jsp");
    out.print("<script>location.replace('index.jsp');</script>");
}
%>



<!DOCTYPE html>
<html lang="es">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Banca Cliente</title>
        <!-- plugins:css -->
        <link rel="stylesheet" href="assets/vendors/iconfonts/mdi/css/materialdesignicons.min.css">
        <link rel="stylesheet" href="assets/vendors/iconfonts/ionicons/dist/css/ionicons.css">
        <link rel="stylesheet" href="assets/vendors/iconfonts/flag-icon-css/css/flag-icon.min.css">
        <link rel="stylesheet" href="assets/vendors/css/vendor.bundle.base.css">
        <link rel="stylesheet" href="assets/vendors/css/vendor.bundle.addons.css">
        <link rel="stylesheet" href="assets/css/templatemo-style.css">
        <!-- endinject -->
        <!-- plugin css for this page -->
        <!-- End plugin css for this page -->
        <!-- inject:css -->
        <link rel="stylesheet" href="assets/css/shared/style.css">
        <!-- endinject -->
        <!-- Layout styles -->
        <link rel="stylesheet" href="assets/css/demo_1/style.css">
        <!-- End Layout styles -->
        <link rel="shortcut icon" href="assets/images/favicon.ico" />
         <link rel="shortcut icon" href="assets/images/right_image.jpg" />
         
         
         <link rel="stylesheet" href="assets/css/style.css">
   
    </head>
    <body>
        <div class="container-scroller">
            <!-- partial:partials/_navbar.html -->
            <nav class="navbar default-layout col-lg-12 col-12 p-0 fixed-top d-flex flex-row">
                <div class="text-center navbar-brand-wrapper d-flex align-items-top justify-content-center">
                    <a class="navbar-brand brand-logo" href="index.html">
                        <!--<img src="assets/images/logo.svg" alt="logo" /> </a> -->   
                        <a class="navbar-brand brand-logo-mini" href="index.html">
                            <!-- -->  <img src="assets/images/logo-mini.svg" alt="logo" /> </a>
                </div>
                     <div class="navbar-menu-wrapper d-flex align-items-center">
          <ul class="navbar-nav">
          </ul>
          <ul class="navbar-nav ml-auto">
            <li class="nav-item dropdown d-none d-xl-inline-block user-dropdown">
              <a class="nav-link dropdown-toggle" id="UserDropdown" href="#" data-toggle="dropdown" aria-expanded="false">
                <img class="img-xs rounded-circle" src="assets/images/faces/face8.jpg" alt="Profile image"> </a>
              <div class="dropdown-menu dropdown-menu-right navbar-dropdown" aria-labelledby="UserDropdown">
                <div class="dropdown-header text-center">
                  <img class="img-md rounded-circle" src="assets/images/faces/face8.jpg" alt="Profile image">
                  <p class="mb-1 mt-3 font-weight-semibold"><%=session.getAttribute("nombrec")%></p>
                </div>
                <a class="dropdown-item">Mi perfil <span class="badge badge-pill badge-danger">1</span><i class="dropdown-item-icon ti-dashboard"></i></a>
                <a class="dropdown-item">Mensajes<i class="dropdown-item-icon ti-comment-alt"></i></a>
                <a class="dropdown-item">Actividad<i class="dropdown-item-icon ti-location-arrow"></i></a>
                <a class="dropdown-item">Configuración<i class="dropdown-item-icon ti-help-alt"></i></a>
                <a class="dropdown-item" href="salir.jsp">Salir<i class="dropdown-item-icon ti-power-off"></i></a>
              </div>
            </li>
          </ul>
          <button class="navbar-toggler navbar-toggler-right d-lg-none align-self-center" type="button" data-toggle="offcanvas">
            <span class="mdi mdi-menu"></span>
          </button>
        </div>
            </nav>
            <!-- partial -->
            <div class="container-fluid page-body-wrapper">
                <!-- partial:partials/_sidebar.html -->
                <nav class="sidebar sidebar-offcanvas" id="sidebar">
                    <ul class="nav">
                        <li class="nav-item nav-profile">
                            <a href="#" class="nav-link">
                                <div class="profile-image">
                                    <img class="img-xs rounded-circle" src="assets/images/faces/face8.jpg" alt="profile image">
                                    <div class="dot-indicator bg-success"></div>
                                </div>
                                <div class="text-wrapper">
                                    <p class="profile-name">Usuario</p>
                                    <p class="designation">Cliente</p>
                                </div>
                            </a>
                        </li>
                        <li class="nav-item nav-category">Menu principal</li>
                        <li class="nav-item">
                            <a class="nav-link" href="MCliente.jsp?panel=depositos_cuentas/verificacion_origen&idcliente=<%=session.getAttribute("idcliente")%>">
                                <i class="menu-icon typcn typcn-document-text"></i>
                                <span class="menu-title">Depositos entre cuentas</span>
                            </a>
                        </li>
                       <li class="nav-item">
                            <a class="nav-link" href="MCliente.jsp?panel=depositos_OCuentas/verificacion_origen&idcliente=<%=session.getAttribute("idcliente")%>">
                                <i class="menu-icon typcn typcn-document-text"></i>
                                <span class="menu-title">Depositos a otra cuentas</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="MCliente.jsp?panel=registro-cliente/compras_tar">
                                <i class="menu-icon typcn typcn-shopping-bag"></i>
                                <span class="menu-title">Compras con tarjetas </span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="MCliente.jsp?panel=vistas_cliente/vistas_pagos_tarjetas">
                                <i class="menu-icon typcn typcn-th-large-outline"></i>
                                <span class="menu-title">Pagos de tarjetas</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="MCliente.jsp?panel=vistas_cliente/vistas_estados_cuentas&idcliente=<%=session.getAttribute("idcliente")%>">
                                <i class="menu-icon typcn typcn-bell"></i>
                                <span class="menu-title">Ver estado de cuenta</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="MCliente.jsp?panel=vistas_cliente/vista_saldo_disponible&idcliente=<%=session.getAttribute("idcliente")%>"
                                <i class="menu-icon typcn typcn-user-outline"></i>
                                <span class="menu-title">Saldo disponible</span>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="MCliente.jsp?panel=vistas_cliente/vistas_detalle_movimiento">
                                <i class="menu-icon typcn typcn-user-outline"></i>
                                <span class="menu-title">Detalle de movimiento</span>
                            </a>
                        </li>
                        
                         <li class="nav-item">
                            <a class="nav-link" href="MCliente.jsp?panel=retiros/regi_retiros&idcliente=<%=session.getAttribute("idcliente")%>">
                                <i class="menu-icon typcn typcn-user-outline"></i>
                                <span class="menu-title">Retiro</span>
                            </a>
                        </li>


                    </ul>
                </nav>
                <!-- partial -->
                <!--aqui-->
                <!--panel principal-->
                <div class="main-panel">
                    <div class="content-wrapper">
                        <div class="row">
                            <div class="col-lg-12 grid-margin">
                                <div class="card">
                                    <div class="card-body">

                                        <%
                                        String panel = "session_inicio";
                                        if (request.getParameter("panel") != null) {
                                            panel = request.getParameter("panel").toString().trim();
                                        }
                                        %>
                                        <jsp:include page='<%="SESSION-CLIENTE/"+ panel + ".jsp"%>'/>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>      
                <!-- main-panel ends -->
            </div>
            <!-- page-body-wrapper ends -->
        </div>
        <!-- container-scroller -->
        <!-- plugins:js -->
        <script src="assets/vendors/js/vendor.bundle.base.js"></script>

        <!-- endinject
         <script src="assets/vendors/js/vendor.bundle.addons.js"></script> -->
        <!-- Plugin js for this page-->
        <!-- End plugin js for this page-->
        <!-- inject:js -->

        <!-- endinject -->
        <!-- Custom js for this page-->

    </body>
</html>