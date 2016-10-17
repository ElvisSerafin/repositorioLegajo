<%-- 
    Document   : index
    Created on : 18/06/2016, 12:31:27 PM
    Author     : Elvis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="width: 100%;height: 100%">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        
        <title>JSP Page Persona</title>
    </head>
    <body style="width: 100%;height: 100%">
        <nav class="navbar navbar-default" style="background: #8f1656; ">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">Legajo</a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false" style="color: #fff; ">InformacionPersonal <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="vista/Informacion/DatosPersonales.jsp" target="myFrame">Informacion Personal</a></li>
                                <li><a href="#">Another action</a></li>
                                <li><a href="#">Something else here</a></li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" style="color: #fff;" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Formacion Academica y Profesional <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="vista/experiencia/FAcademica.jsp" target="myFrame" >Formacion Academica</a></li>
                                <li><a href="vista/experiencia/ExProfesional.jsp" target="myFrame">Experiencia Profesional</a></li>
                                <li><a href="vista/experiencia/ExAdministrativa.jsp" target="myFrame">Experiencia Administrativa</a></li>
                                <li><a href="vista/experiencia/DocUniversitaria.jsp" target="myFrame">Docencia Universitaria</a></li>
                                <li><a href="vista/experiencia/Idioma.jsp" target="myFrame">Idiomas</a></li>
                                <li><a href="vista/experiencia/Tic.jsp" target="myFrame">TIC</a></li>
                                
                                
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" style="color: #fff;" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Actualizacion<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="vista/Actualizacion/Capformal.jsp" target="myFrame" >Capacitacion Formal</a></li>
                                <li><a href="vista/Actualizacion/Eventos.jsp" target="myFrame">Cursos Eventos</a></li>
                                
                                                                                            
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" style="color: #fff;" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Investigaciones<span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="vista/investigacion/PubliArti.jsp" target="myFrame" >Publicacion de Articulo</a></li>
                                <li><a href="vista/investigacion/Investigacion.jsp" target="myFrame">Investigacion</a></li>
                                <li><a href="vista/investigacion/Asesoria.jsp" target="myFrame">Asesoria</a></li>
                                <li><a href="vista/investigacion/PubliLibro.jsp" target="myFrame">Publicacion de Libro</a></li>
                                                                                            
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a href="#" style="color: #fff;" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Programas y Proyeccion Social <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="vista/Programas/Psoc.jsp" target="myFrame" >Proyeccion Social</a></li>
                                <li><a href="vista/Programas/Prog.jsp" target="myFrame">Programas</a></li>
                                <li><a href="vista/Programas/Prec.jsp" target="myFrame">Premios y Reconocimientos</a></li>
                                
                            </ul>
                        </li>
                        
                    </ul>
                    
                    <ul class="nav navbar-nav navbar-right">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" style="color: #fff;" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                <%=request.getSession().getAttribute("Nombre").toString()
                                        + " " + request.getSession().getAttribute("Apellido").toString()%>
                                <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Action</a></li>
                                <li><a href="#">Another action</a></li>
                                <li><a href="#">Cambiar Contraseña</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="Login?opc=salir" class="cerrar">Cerrar Sesion</a></li>
                            </ul>
                        </li>
                    </ul>
                </div><!-- /.navbar-collapse -->
            </div><!-- /.container-fluid -->
        </nav>
                               
        <iframe name="myFrame" style="border: none; width: 100%;height: 100%"></iframe>

        <script src="js/jquery-3.0.0.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <script>
            
        </script>
    </body>
</html>
