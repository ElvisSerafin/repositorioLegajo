<%-- 
    Document   : InfAcademica
    Created on : 24/06/2016, 04:19:31 PM
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
                                        <option>[Seleccione Institucion]</option>
                                        <option>Universidad Peruana Unión</option>
                                        <option>Universidad Nacional de Ingeniería</option>
                                        <option>Pontificia Universidad Católica del Perú</option>
                                        <option>Universidad Nacional de Piura</option>
                                        
                                    </select>
                                </div> 
                            </div>
                            <div class="col col-lg-4 col-sm-6 col-md-6 col-xs-12">
                                <div class="form-group">
                                    <label for="gra">Grado</label>
                                    <select id="gra" name="gra" class="form-control">
                                        <option value="0">[Seleccione Grado]</option>
                                        <option>Titulo</option>
                                        <option>Maestria</option>
                                        <option>Doctorado</option>
                                    </select>
                                </div> 
                            </div>
                            <div class="col col-lg-4 col-sm-6 col-md-6 col-xs-12">
                                <div class="form-group">
                                    <label for="esp">Especialidad</label>
                                    <select id="esp" name="esp" class="form-control">
                                        <option value="0">[Seleccione Especialidad]</option>
                                        <option>Ingeniería de Sistemas</option>
                                        <option>Gestión de TI</option>
                                        <option>Gestión de Procesos</option>
                                        <option>Ingeniero en Redes</option>
                                        <option>Redes Cisco</option>
                                        <option>Especialidad en Oracle</option>
                                        <option>Especialidad en Java, C++</option>
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
                                    <label for="est">Estado</label>
                                    <select id="est" name="est" class="form-control">
                                        <option value="0">[Seleccione Estado]</option>
                                        <option>En curso</option>
                                        <option>Terminado</option>

                                    </select>
                                </div> 
                            </div>
                            <div class="col col-lg-12 col-sm-12 col-md-12 col-xs-12">
                                <div class="form-group">
                                    <label for="docum">Documentacion</label>
                                    <input type="file" name="docum" id="docum">
                                    <input type="submit" class="btn btn-primary pull-right" id="insertFA" value="Guardar"style="background: #8f1656">
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
                            <th>Institucion</th>
                            <th>Grado</th>
                            <th>Especialidad</th>
                            <th>Fecha Inicio</th>
                            <th>Fecha Fin</th>
                            <th>Estado</th>
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
                var id = 0;
                var file = "";
                var typeBtn = 0;

                $('#tablaFa').dataTable();
                listar();
                $('#insertFA').click(function (evt) {

                    if (typeBtn == 1) {
                        var data = $('#forminsert').serialize();
                        var file2 = $('#docum').val();
                        if (file2.length > 0) {
                            file = file2;
                        }
                        data += "&docum=" + file;
                        data += "&id=" + id;
                        var url = "../../form?opc=editForm";
                        $.post(url, data, function (objJson) {
                            listar();
                            typeBtn = 0;
                            $('#insertFA').val("Guardar");
                            $('#insti').val('');
                            $('#gra').val('0');
                            $('#esp').val('');
                            $('#fe1').removeAttr('value');
                            $('#fe2').removeAttr('value');
                            $('#est').val('0');
                            $('#docum').val('');
                            alert(objJson.editform);

                        });
                    } else {
                        var data = $('#forminsert').serialize();
                        data += "&docum=" + $('#docum').val();
                        var url = "../../form?opc=addForm";
                        $.post(url, data, function (objJson) {
                            listar();
                            alert(objJson.addform);
                        });
                    }

                    evt.preventDefault();
                });
                function listar() {
                    var tb = '<table class="table table-bordered table-hover display responsive nowrap" id="tablaFa" width="100%"> ';
                    tb += '<thead><tr><th>Acciones</th><th>Institucion</th><th>Grado</th><th>Especialidad</th>';
                    tb += '<th>Fecha Inicio</th><th>Fecha Fin</th><th>Estado</th>';
                    tb += '<th>Documentacion</th></tr></thead><tbody id="tbodys"></tbody></table>';
                    var t = "";
                    var url = "../../form?opc=listForm";
                    $.post(url, function (objJson) {
                        var list = objJson.listForm;
                        if (list.length > 0) {

                            for (var i = 0; i < list.length; i++) {
                                t += "<tr>";
                                t += "<td id='" + list[i].id + "'><a id='" + i + "' class='btn btn-primary btn-sm btnEditar'>Editar</a><a class='btn btn-danger btn-sm btnEliminar'>Eliminar</a></td>";
                                t += "<td class='tdinsti" + i + "'>" + list[i].a + "</td>";
                                t += "<td class='tdgrado" + i + "'>" + list[i].b + "</td>";
                                t += "<td class='tdesp" + i + "'>" + list[i].c + "</td>";
                                t += "<td class='tdfe1" + i + "'>" + getFormattedDate(new Date(list[i].d)) + "</td>";
                                t += "<td class='tdfe2" + i + "'>" + getFormattedDate(new Date(list[i].e)) + "</td>";
                                t += "<td class='tdest" + i + "'>" + list[i].f + "</td>";
                                t += "<td class='tddocum" + i + "'>" + list[i].g + "</td>";
                                t += "</tr>";
                            }
                            $('.tbcont').empty();
                            $('.tbcont').append(tb);

                            $('#tbodys').empty();
                            $('#tbodys').append(t);
                            $('#tablaFa').dataTable();

                            $('.btnEditar').click(function () {
                                id = $(this).parent().attr('id');
                                var nro = $(this).attr('id');
                                $('#insti').val($('.tdinsti' + nro).text());
                                $('#gra').val($('.tdgrado' + nro).text());
                                $('#esp').val($('.tdesp' + nro).text());
                                $('#fe1').attr('value', changeDate($('.tdfe1' + nro).text()));
                                $('#fe2').attr('value', changeDate($('.tdfe2' + nro).text()));
                                $('#est').val($('.tdest' + nro).text());
                                file = $('.tddocum' + nro).text();
                                $('#insertFA').val("Editar");
                                typeBtn = 1;
                            });

                            $('.btnEliminar').click(function () {
                                id = $(this).parent().attr('id');
                                var url = "../../form?opc=deleteform&id="+id;
                                $.post(url, function (objJson) {
                                    listar();
                                    alert(objJson.deleteform);
                                });
                            });

                        }
                    });

                }
                function getFormattedDate(date) {
                    var year = date.getFullYear();
                    var month = (1 + date.getMonth()).toString();
                    month = month.length > 1 ? month : '0' + month;
                    var day = date.getDate().toString();
                    day = day.length > 1 ? day : '0' + day;
                    return day + '-' + month + '-' + year;
                }

                function changeDate(date) {
                    var arr = date.split('-');
                    var day = arr[0];
                    var month = arr[1];
                    var year = arr[2];
                    return year + '-' + month + '-' + day;
                }
            });
        </script>
    </body>
</html>
