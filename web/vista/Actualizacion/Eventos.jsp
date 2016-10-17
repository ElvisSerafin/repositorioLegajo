<%-- 
    Document   : Eventos
    Created on : 25/06/2016, 10:45:16 PM
    Author     : GABY
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/stilo1.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>JSP Page</title>
    </head>
    <body>
          <div class="container">
            <div class="well">
                <div class="row">
                    <div class="col col-lg-12">
                        <form id="forminsert">
                            <div class="col col-lg-4 col-sm-6 col-md-6 col-xs-12">
                                <div class="form-group">
                                    <label for="fecha">Fecha</label>
                                    <input class="form-control" type="date" id="fecha" name="fecha">
                                </div> 
                            </div>
                            <div class="col col-lg-4 col-sm-6 col-md-6 col-xs-12">
                                <div class="form-group">
                                    <label for="even">Evento</label>
                                    <input class="form-control" type="text" id="even" name="even">
                                </div> 
                            </div>
                             <div class="col col-lg-4 col-sm-6 col-md-6 col-xs-12">
                                <div class="form-group">
                                    <label for="asi">Tipo Asistencia</label>
                                    <select id="asi" name="asi" class="form-control">
                                        <option>[Seleccione Grado]</option>
                                        <option>Asistente</option>
                                        <option>Ponente</option>
                                        <option>Jurado</option>
                                    </select>
                                </div> 
                            </div>
                             
                           <div class="col col-lg-4 col-sm-6 col-md-6 col-xs-12">
                                <div class="form-group">
                                    <label for="tipoeven">Tipo Evento</label>
                                    <input class="form-control" type="text" id="tipoeven" name="tipoeven">
                                </div> 
                            </div>
                           <div class="col col-lg-4 col-sm-6 col-md-6 col-xs-12">
                                <div class="form-group">
                                    <label for="entidad">Entidad Organica</label>
                                    <input class="form-control" type="text" id="entidad" name="entidad">
                                </div> 
                            </div>
                             <div class="col col-lg-4 col-sm-6 col-md-6 col-xs-12">
                                <div class="form-group">
                                    <label for="horascre">Horas Creditos</label>
                                    <input class="form-control" type="text" id="horascre" name="horascre">
                                </div> 
                            </div>
                             <div class="col col-lg-4 col-sm-6 col-md-6 col-xs-12">
                                <div class="form-group">
                                    <label for="lugar">Lugar</label>
                                    <input class="form-control" type="text" id="lugar" name="lugar"><br>
                                    <input type="submit" class="btn btn-primary pull-right" id="insertFA" value="Guardar" style="background: #8f1656"><br>
                                </div> 
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="tbcont">
                <table class="table table-bordered table-hover" id="tablaFa">
                    <thead>
                        <tr>
                            <th>Fecha</th>
                            <th>Evento</th>
                            <th>Tipo Asistencia</th>
                            <th>Tipo Evento</th>
                            <th>Entidad Organica</th>
                            <th>Horas Creditos</th>
                            <th>Lugar</th>
                        </tr>
                    </thead>
                    <tbody id="tbodys">
                    </tbody>
                </table>
            </div>

        </div>
         <script src="../../js/jquery-1.12.3.js" type="text/javascript"></script>
        <script src="../../js/dataTables.bootstrap.min.js" type="text/javascript"></script>
        <script src="../../js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script>
          $(document).ready(function () {
                $('#tablaFa').dataTable();
                listar();
                $('#insertFA').click(function (evt) {
                    var data = $('#forminsert').serialize();
                    var url = "../../cursoseven?opc=add";
                    $.post(url, data, function (objJson) {
                        alert(objJson.addC)
                        listar();
                    });

                    evt.preventDefault();
                });
                function listar() {
                    var tb = '<table class="table table-bordered table-hover" id="tablaFa">';
                    tb += '<thead><tr><th>Fecha</th><th>Evento</th><th>Tipo Asistencia</th><th>Tipo Evento</th>';
                    tb += '<th>Entidad Organizadora</th><th>Horas Creditos</th><th>Lugar</th><th>Acciones</th></tr></thead><tbody id="tbodys"></tbody></table>';
                    var t = "";
                    var url = "../../cursoseven?opc=listar";
                    $.post(url, function (objJson) {
                        var list = objJson.lista;
                        if (list.length > 0) {

                            for (var i = 0; i < list.length; i++) {
                                t += "<tr>";
                                t += "<td>" + list[i].fecha + "</td>";
                                t += "<td>" + list[i].even + "</td>";
                                t += "<td>" + list[i].asi + "</td>";
                                t += "<td>" + list[i].tipoeven + "</td>";
                                t += "<td>" + list[i].entidad + "</td>";
                                t += "<td>" + list[i].horascre + "</td>";
                                t += "<td>" + list[i].lugar+ "</td>";
                                t += "<td><a class='btn btn-primary'>Editar</a><a class='btn btn-danger'>Eliminar</a></td>";
                                t += "</tr>";
                            }
                            $('.tbcont').empty();
                            $('.tbcont').append(tb);

                            $('#tbodys').empty();
                            $('#tbodys').append(t);
                            $('#tablaFa').dataTable();

                        }
                    });

                }
            });  
        </script>
    </body>
</html>
