<%-- 
    Document   : Idioma
    Created on : 29/06/2016, 12:12:23 AM
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
                                    <label for="niv">Idioma</label>
                                    <select id="niv" name="niv" class="form-control">
                                        <option>Seleccione Idioma...</option>
                                        <option>Albanés</option>
                                        <option>Aleman</option>
                                        <option>Árabe</option>
                                        <option>Bislama</option>
                                        <option>Bosnio</option>
                                        <option>Búlgaro</option>
                                        <option>Croata</option>
                                        <option>Coreano</option>
                                        <option>Checo</option>
                                        <option>Danés</option>
                                        <option>Escocés</option>
                                        <option>Eslovaco</option>
                                        <option>Español</option>
                                        <option>Filipino</option>
                                        <option>Frances</option>
                                        <option>Griego</option>
                                        <option>Guarani</option>
                                        <option>Hebreo</option>
                                        <option>Ingles</option>
                                        <option>Islandes</option>
                                        <option>Italiano</option>
                                        <option>Japonés</option>
                                    </select>
                                </div> 
                            </div>
                            <div class="col col-lg-4 col-sm-6 col-md-6 col-xs-12">
                                <div class="form-group">
                                    <label for="niv">Nivel</label>
                                    <select id="niv" name="niv" class="form-control">
                                        <option>Seleccione Nivel...</option>
                                        <option>Basico</option>
                                        <option>Intermedio</option>
                                        <option>Avanzado</option>
                                    </select>
                                </div> 
                            </div>
                            <br>                                                 
                            <div class="col col-lg-4 col-sm-6 col-md-6 col-xs-12">
                                <div class="form-group">
                                    <label for="domi">Dominio:</label>
                                    <br>
                                    <label class="checkbox-inline"><input type="checkbox" value="">Lee</label>
                                    <label class="checkbox-inline"><input type="checkbox" value="">Habla</label>
                                    <label class="checkbox-inline"><input type="checkbox" value="">Escribe</label>
                                </div> 
                            </div>
                            <br>
                            <br>
                            <br>
                            <br>
                            <div class="col col-lg-4 col-sm-6 col-md-6 col-xs-12">
                                <div class="form-group">
                                    <label for="niv">Idioma</label>
                                    <select id="niv" name="niv" class="form-control">
                                        <option>Seleccione Idioma...</option>
                                        <option>Albanés</option>
                                        <option>Aleman</option>
                                        <option>Árabe</option>
                                        <option>Bislama</option>
                                        <option>Bosnio</option>
                                        <option>Búlgaro</option>
                                        <option>Croata</option>
                                        <option>Coreano</option>
                                        <option>Checo</option>
                                        <option>Danés</option>
                                        <option>Escocés</option>
                                        <option>Eslovaco</option>
                                        <option>Español</option>
                                        <option>Filipino</option>
                                        <option>Frances</option>
                                        <option>Griego</option>
                                        <option>Guarani</option>
                                        <option>Hebreo</option>
                                        <option>Ingles</option>
                                        <option>Islandes</option>
                                        <option>Italiano</option>
                                        <option>Japonés</option>
                                    </select>
                                </div> 
                            </div>
                            <div class="col col-lg-4 col-sm-6 col-md-6 col-xs-12">
                                <label for="año">Institución</label>
                                <select name="anio" id="anio" class="form-control">
                                    <option value="">Seleccionar Institución</option>
                                    <option value="2006">Universidad Alas Perunas</option>
                                    <option value="2006">Universidad San Ignacio de Loyola</option>
                                    <option value="2006">Universidad Peruana Unión</option>
                                    <option value="2006">Universidad Científica del sur</option>
                                </select>
                            </div>

                            <div class="col col-lg-4 col-sm-6 col-md-6 col-xs-12">
                                <div class="form-group">
                                    <label for="cert">Certificado</label>
                                    <input type="file" name="cert" id="cert"<br>
                                </div> 
                                <input type="submit" class="btn btn-primary pull-right" id="insertIdi" value="Guardar">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <div class="tbcont">
                <table class="table table-bordered table-hover display responsive nowrap" id="tablaIdi">
                    <thead>
                        <tr>
                            <th>Idioma</th>
                            <th>Nivel</th>
                            <th>Dominio</th>
                            <th>Institucion</th>
                            <th>Año</th>
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
        <script src="../../js/dataTables.bootstrap.min.js" type="text/javascript"></script>
        <script src="../../js/dataTables.responsive.min.js" type="text/javascript"></script>

        <script src="../../js/jquery.dataTables.min.js" type="text/javascript"></script>

        <script>
            $(document).ready(function () {
                $('#tablaIdi').dataTable();
                listar();
                $('#insertIdi').click(function (evt) {
                    var data = $('#forminsert').serialize();
                    data += "&cert=" + $('#cert').val();
                    var url = "../../idio?opc=addIdi";
                    $.post(url, data, function (objJson) {
                        alert(objJson.addIdioma)
                        listar();
                    });

                    evt.preventDefault();
                });
                function listar() {
                    var tb = '<table class="table table-bordered table-hover display responsive nowrap" id="tablaIdi" width="100%">';
                    tb += '<thead><tr><th>Idioma</th><th>Nivel</th>';
                    tb += '<th>Dominio</th><th>Insititucion</th><th>Año</th><th>Certificado</th>';
                    tb += '<th>Acciones</th></tr></thead><tbody id="tbodys"></tbody></table>';
                    var t = "";
                    var url = "../../idio?opc=listaIdi";
                    $.post(url, function (objJson) {
                        var list = objJson.listaIdio;
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
                            $('#tablaIdi').dataTable();

                        }
                    });

                }
            });
        </script>


    </body>
</html>
