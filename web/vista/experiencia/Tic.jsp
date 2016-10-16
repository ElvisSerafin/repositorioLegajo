<%-- 
    Document   : Tic
    Created on : 29/06/2016, 12:12:41 AM
    Author     : Kiefer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/responsive.dataTables.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/stilo1.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
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
                                    <label for="cur">Curso o Certificación</label>
                                    <input class="form-control" type="text" id="cur" name="cur">
                                </div> 
                            </div>
                            <div class="col col-lg-4 col-sm-6 col-md-6 col-xs-12">
                                <div class="form-group">
                                    <label for="domi"> Nivel de Dominio</label>
                                    <select id="domi" name="domi" class="form-control">
                                        <option>Seleccione Dominio...</option>
                                        <option>Basico</option>
                                        <option>Intermedio</option>
                                        <option>Avanzado</option>
                                    </select>
                                </div> 
                            </div>
                            <div class="col col-lg-4 col-sm-6 col-md-6 col-xs-12">
                                <div class="form-group">
                                    <label for="mod">Modalidad Educativa</label>
                                    <select id="mod" name="mod" class="form-control">
                                        <option>Seleccione Modalidad...</option>
                                        <option>Presencial</option>
                                        <option>Semi-Presencial</option>
                                        <option>Virtual</option>
                                     </select>
                                </div> 
                            </div>
                            
                            <div class="col col-lg-4 col-sm-6 col-md-6 col-xs-12">
                                <div class="form-group">
                                    <label for="insti">Institucion</label>
                                      <select id="mod" name="mod" class="form-control">
                                        <option>Seleccione Institucion...</option>
                                        <option>Universidad Peruana Union</option>
                                        <option>Universidad Catolica</option>
                                        <option>Universidad Peruana los Andes</option>
                                        <option>Universidad Cesar Vallejo</option>
                                        <option>Universidad del Centro</option>
                                        <option>Universidad Cientifica del Sur</option>
                                        <option>Otros(Agregar)</option>
                                     </select>
                                       </div> 
                            </div>
                            <div class="col col-lg-4 col-sm-6 col-md-6 col-xs-12">
                                <div class="form-group">
                                    <label for="cert">Certificado</label>
                                    <input type="file" name="cert" id="cert"<br>
                                    <input type="submit" class="btn btn-primary pull-right" id="insertT" value="Guardar">
                                </div> 
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="tbcont">
                <table class="table table-bordered table-hover display responsive nowrap" id="tablaT">
                    <thead>
                        <tr>
                            <th>Curso</th>
                            <th>Dominio</th>
                            <th>Modalidad</th>
                            <th>Institucion</th>
                            <th>Certificado</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody id="tbodys">
                    </tbody>
                </table>
            </div>
            </div>
        <script src="../../js/jquery-1.12.3.js" type="text/javascript"></script>
        <script src="../../js/dataTables.responsive.min.js" type="text/javascript"></script>
        <script src="../../js/dataTables.bootstrap.min.js" type="text/javascript"></script>
        <script src="../../js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script>
            $(document).ready(function () {
                $('#tablaT').dataTable();
                listar();
                $('#insertT').click(function (evt) {
                    var data = $('#forminsert').serialize();
                    data += "&cert=" + $('#cert').val();
                    var url = "../../tic?opc=addT";
                    $.post(url, data, function (objJson) {
                        alert(objJson.addTic)
                     listar();
                    });

                    evt.preventDefault();
                });
                function listar() {
                    var tb = '<table class="table table-bordered table-hover display responsive nowrap" id="tablaT" width="100%">';
                    tb += '<thead><tr><th>Curso</th><th>Dominio</th>';
                    tb += '<th>Modalidad</th><th>Insititucion</th><th>Certificado</th>';
                    tb += '<th>Acciones</th></tr></thead><tbody id="tbodys"></tbody></table>';
                    var t = "";
                    var url = "../../tic?opc=listatic";
                    $.post(url, function (objJson) {
                        var list = objJson.listaT;
                        if (list.length > 0) {

                            for (var i = 0; i < list.length; i++) {
                                t += "<tr>";
                                t += "<td>" + list[i].a + "</td>";
                                t += "<td>" + list[i].b + "</td>";
                                t += "<td>" + list[i].c + "</td>";
                                t += "<td>" + list[i].d + "</td>";
                                t += "<td>" + list[i].e + "</td>";
                                t += "<td><a class='btn btn-primary btn-sm'>Editar</a><a class='btn btn-danger btn-sm'>Eliminar</a></td>";
                                t += "</tr>";
                            }
                            $('.tbcont').empty();
                            $('.tbcont').append(tb);

                            $('#tbodys').empty();
                            $('#tbodys').append(t);
                            $('#tablaT').dataTable();

                        }
                    });

                }
            });
        </script>
    </body>
</html>
