<%-- 
    Document   : PubliArti
    Created on : 29/06/2016, 07:36:19 AM
    Author     : MARICUCHA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link href="../../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/stilo1.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/dataTables.bootstrap.min.css" rel="stylesheet" type="text/css"/>
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
                                    <label for="año">Año</label>
                                    <input class="form-control" type="date" id="año" name="año">
                                </div> 
                            </div>
                            <div class="col col-lg-4 col-sm-6 col-md-6 col-xs-12">
                                <div class="form-group">
                                    <label for="tipp">Tipo Publicidad</label>
                                    <input class="form-control" type="text" id="tipp" name="tipp">
                                </div> 
                            </div>
                            <div class="col col-lg-4 col-sm-6 col-md-6 col-xs-12">
                                <div class="form-group">
                                    <label for="tit">Titulo</label>
                                    <input class="form-control" type="text" id="tit" name="tit">
                                </div> 
                            </div>
                            
                           <div class="col col-lg-4 col-sm-6 col-md-6 col-xs-12">
                                <div class="form-group">
                                    <label for="nomb">Nombre Medio</label>
                                    <input class="form-control" type="text" id="nomb" name="nomb">
                                </div> 
                            </div>
                           <div class="col col-lg-4 col-sm-6 col-md-6 col-xs-12">
                                <div class="form-group">
                                    <label for="edi">Editorial</label>
                                    <input class="form-control" type="text" id="edi" name="edi">
                                </div> 
                            </div>
                             <div class="col col-lg-4 col-sm-6 col-md-6 col-xs-12">
                                <div class="form-group">
                                    <label for="is">ISBN_ISNN</label>
                                    <input class="form-control" type="text" id="is" name="is">
                                </div> 
                            </div>
                             <div class="col col-lg-4 col-sm-6 col-md-6 col-xs-12">
                                <div class="form-group">
                                    <label for="np">N° Paginas</label>
                                    <input class="form-control" type="text" id="np" name="np">
                                </div> 
                            </div>
                            <div class="col col-lg-4 col-sm-6 col-md-6 col-xs-12">
                                <div class="form-group">
                                    <label for="lug">Lugar</label>
                                    <input class="form-control" type="text" id="lug" name="lug">
                                    
                                    <br><input type="submit" class="btn btn-primary pull-right" id="insertFA" value="Guardar"><br>
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
                            <th>Año</th>
                            <th>Tipo Publicidad</th>
                            <th>Titulo</th>
                            <th>Nombre Medio</th>
                            <th>Editorial</th>
                            <th>ISBN_ISNN</th>
                            <th>N° Paginas</th>
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
                     var url = "../../publi?opc=addArti";
                    $.post(url, data, function (objJson) {
                        alert(objJson.addArti)
                        listar();
                    });

                    evt.preventDefault();
                });
                function listar() {
                    var tb = '<table class="table table-bordered table-hover" id="tablaFa">';
                    tb += '<thead><tr><th>Año</th><th>Tipo Publicidad</th><th>Titulo</th>';
                    tb += '<th>Nombre Medio</th><th>Editorial</th><th>ISBN_ISNN</th><th>N° Paginas</th><th>Lugar</th>';
                    tb += '</tr></thead><tbody id="tbodys"></tbody></table>';
                    var t = "";
                    var url = "../../publi?opc=listaArti";
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
