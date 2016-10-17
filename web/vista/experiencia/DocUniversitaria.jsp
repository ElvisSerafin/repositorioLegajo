<%-- 
    Document   : DocUniversitaria
    Created on : 28/06/2016, 06:35:23 PM
    Author     : Kiefer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/stilo1.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/responsive.dataTables.min.css" rel="stylesheet" type="text/css"/>
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
                                    <label for="insti">Institucion</label>
                                    <input class="form-control" type="text" id="insti" name="insti">
                                </div> 
                            </div>
                            <div class="col col-lg-4 col-sm-6 col-md-6 col-xs-12">
                                <div class="form-group">
                                    <label for="cat">Categoria</label>
                                    <select id="cat" name="cat" class="form-control">
                                        <option>Seleccione Categoria...</option>
                                        <option>Auxiliar</option>
                                        <option>Asociado</option>
                                        <option>Principal</option>
                                    </select>
                                </div> 
                            </div>
                            
                            <div class="col col-lg-4 col-sm-6 col-md-6 col-xs-12">
                                <div class="form-group">
                                    <label for="fe1">Fecha Inicio</label>
                                    <input class="form-control" type="date" id="fe1" name="fe1">
                                </div> 
                            </div>
                            <div class="col col-lg-4 col-sm-6 col-md-6 col-xs-12">
                                <div class="form-group">
                                    <label for="fe2">Fecha Fin</label>
                                    <input class="form-control" type="date" id="fe2" name="fe2">
                                </div> 
                            </div>
                            <div class="col col-lg-4 col-sm-6 col-md-6 col-xs-12">
                                <div class="form-group">
                                    <label for="tiem">Total Tiempo</label>
                                    <input class="form-control" type="text" id="tiem" name="tiem">
                                </div> 
                            </div>
                            <div class="col col-lg-4 col-sm-6 col-md-6 col-xs-12">
                                <div class="form-group">
                                    <label for="docum">Lugar</label>
                                    <input  class="form-control"type="text" name="lugar" id="lugar"><br>
                                    <input type="submit" class="btn btn-primary pull-right" id="insertDoc" value="Guardar"style="background: #8f1656">
                                </div> 
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="tbcont">
                <table class="table table-bordered table-hover display responsive nowrap" id="tablaDoc">
                    <thead>
                        <tr>
                            <th>Institucion</th>
                            <th>Categoria</th>
                            <th>Fecha Inicio</th>
                            <th>Fecha Fin</th>
                            <th>Total Tiempo</th>
                            <th>Lugar</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody id="tbodys">
                    </tbody>
                </table>
            </div>

             
        </div>
        <script src="../../js/jquery-1.12.3.js" type="text/javascript"></script>
        <script src="../../js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script src="../../js/dataTables.responsive.min.js" type="text/javascript"></script>
        <script src="../../js/dataTables.bootstrap.min.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                $('#tablaDoc').dataTable();
                listar();
                $('#insertDoc').click(function (evt) {
                    var data = $('#forminsert').serialize();
                    var url = "../../doc?opc=addDoc";
                    $.post(url, data, function (objJson) {
                        alert(objJson.addDoc)
                     listar();
                    });

                    evt.preventDefault();
                });
                function listar() {
                    var tb = '<table class="table table-bordered table-hover display responsive nowrap" id="tablaDoc" width="100%">';
                    tb += '<thead><tr><th>Institucion</th><th>Categoria</th>';
                    tb += '<th>Fecha Inicio</th><th>Fecha Fin</th><th>Total Tiempo</th><th>Lugar</th>';
                    tb += '<th>Acciones</th></tr></thead><tbody id="tbodys"></tbody></table>';
                    var t = "";
                    var url = "../../doc?opc=listaDoc";
                     $.post(url, function (objJson) {
                        var list = objJson.listaDoc;
                        if (list.length > 0) {

                            for (var i = 0; i < list.length; i++) {
                                t += "<tr>";
                                t += "<td>" + list[i].a + "</td>";
                                t += "<td>" + list[i].b + "</td>";
                                t += "<td>" + list[i].c + "</td>";
                                t += "<td>" + list[i].d + "</td>";
                                t += "<td>" + list[i].e + "</td>";
                                t += "<td>" + list[i].f + "</td>";
                                t += "<td><a class='btn btn-primary btn-sm'>Editar</a><a class='btn btn-danger btn-sm'>Eliminar</a></td>";
                                t += "</tr>";
                            }
                            $('.tbcont').empty();
                            $('.tbcont').append(tb);

                            $('#tbodys').empty();
                            $('#tbodys').append(t);
                            $('#tablaDoc').dataTable();

                        }
                    });

                }
            });
        </script>
    </body>
</html>
