<%-- 
    Document   : ExProfesional
    Created on : 25/06/2016, 09:55:20 PM
    Author     : Kiefer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/stilo1.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
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
                                    <select id="insti" name="insti" class="form-control">
                                        <option>Seleccione Institucion</option>
                                        <option>BBVA Continental</option>
                                        <option>BCP</option>
                                        <option>Rimac Seguros</option>
                                    </select>
                                </div> 
                            </div>
                            <div class="col col-lg-4 col-sm-6 col-md-6 col-xs-12">
                                <div class="form-group">
                                    <label for="car">Cargo</label>
                                    <select id="car" name="car" class="form-control">
                                        <option>Seleccione Cargo...</option>
                                        <option>Administrador Financiero</option>
                                        <option>Director TI</option>
                                        <option>Gerente Financiero</option>
                                    </select>
                                </div> 
                            </div>
                            <div class="col col-lg-4 col-sm-6 col-md-6 col-xs-12">
                                <div class="form-group">
                                    <label for="tip">Tipo</label>
                                    <select id="tip" name="tip" class="form-control">
                                        <option>Seleccione Tipo...</option>
                                        <option>Tiempo parcial</option>
                                        <option>Tiempo completo</option>
                                        <option>Dedicacion exclusiva</option>
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
                                    <input class="form-control" type="text" disabled="" id="tiem" name="tiem">
                                </div> 
                            </div>
                            <div class="col col-lg-4 col-sm-6 col-md-6 col-xs-12">
                                <div class="form-group">
                                    <label for="lugar">Lugar</label>
                                    <select id="lugar" name="lugar" class="form-control">
                                        <option>Seleccione el Lugar </option>
                                        <option>Lima </option>
                                        <option>Chiclayo</option>
                                        <option>Cusco</option>
                                        <option>Extranjero</option>
                                    </select>
                                </div> 
                            </div>
                            <div class="col col-lg-12 col-sm-12 col-md-12 col-xs-12">
                                <div class="form-group">
                                    <label for="docum">Documentacion</label>
                                    <input type="file" name="docum" id="docum">
                                    <input type="submit" class="btn btn-primary pull-right" id="insertExp" value="Guardar"style="background: #8f1656">
                                </div> 
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="tbcont">
                <table class="table table-bordered table-hover display responsive nowrap" id="tablaExpro">
                    <thead>
                        <tr>
                            <th>Institucion</th>
                            <th>Cargo desempeñado</th>
                            <th>Tipo</th>
                            <th>Fecha Inicio</th>
                            <th>Fecha Fin</th>
                            <th>Total Tiempo</th>
                            <th>Lugar</th>
                            <th>Documentacion</th>
                            <th>Acciones</th>
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
        <script src="../../js/dataTables.responsive.min.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                $('#tablaExpro').dataTable();
                listar();
                $('#insertExp').click(function (evt) {
                    var data = $('#forminsert').serialize();
                    data += "&docum=" + $('#docum').val();
                    var url = "../../exp?opc=addexp";
                    $.post(url, data, function (objJson) {
                        alert(objJson.addexp)
                     listar();
                    });

                    evt.preventDefault();
                });
                function listar() {
                    var tb = '<table class="table table-bordered table-hover display responsive nowrap" id="tablaExpro" width="100%">';
                    tb += '<thead><tr><th>Institucion</th><th>Cargo</th><th>Tipo</th>';
                    tb += '<th>Fecha Inicio</th><th>Fecha Fin</th><th>Total Tiempo</th><th>Lugar</th>';
                    tb += '<th>Documentacion</th><th>Acciones</th></tr></thead><tbody id="tbodys"></tbody></table>';
                    var t = "";
                    var url = "../../exp?opc=listaexp";
                    $.post(url, function (objJson) {
                        var list = objJson.lista;
                        if (list.length > 0) {

                            for (var i = 0; i < list.length; i++) {
                                t += "<tr>";
                                t += "<td>" + list[i].a + "</td>";
                                t += "<td>" + list[i].b + "</td>";
                                t += "<td>" + list[i].c + "</td>";
                                t += "<td>" + list[i].d + "</td>";
                                t += "<td>" + list[i].e + "</td>";
                                t += "<td>" + list[i].f + "</td>";
                                t += "<td>" + list[i].g + "</td>";
                                t += "<td>" + list[i].h + "</td>";
                                t += "<td><a class='btn btn-primary btn-sm'>Editar</a><a class='btn btn-danger btn-sm'>Eliminar</a></td>";
                                t += "</tr>";
                            }
                            $('.tbcont').empty();
                            $('.tbcont').append(tb);

                            $('#tbodys').empty();
                            $('#tbodys').append(t);
                            $('#tablaExpro').dataTable();

                        }
                    });

                }
            });
        </script>
    </body>
</html>
