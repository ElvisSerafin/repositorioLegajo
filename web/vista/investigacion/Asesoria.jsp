<%-- 
    Document   : Asesoria
    Created on : 28/06/2016, 06:26:38 PM
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
                                    <label for="niv">Nivel</label>
                                    <select id="niv" name="niv" class="form-control">
                                        <option>[Seleccione Nivel]</option>
                                        <option>Titulo</option>
                                        <option>Maestria</option>
                                        <option>Doctorado</option>
                                    </select>
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
                                    <label for="aut">Autor</label>
                                    <input class="form-control" type="text" id="aut" name="aut">
                                </div> 
                            </div>
                           <div class="col col-lg-4 col-sm-6 col-md-6 col-xs-12">
                                <div class="form-group">
                                    <label for="esp">Especialidad</label>
                                    <input class="form-control" type="text" id="esp" name="esp">
                                </div> 
                            </div>
                            <div class="col col-lg-4 col-sm-6 col-md-6 col-xs-12">
                                <div class="form-group">
                                    <label for="reso">Resolucion</label>
                                    <input class="form-control" type="text" id="reso" name="reso">
                                    
                                    <br><input type="submit" class="btn btn-primary pull-right" id="insertFA" value="Guardar"style="background: #8f1656"><br>
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
                            <th>Nivel</th>
                            <th>Titulo</th>
                            <th>Autor</th>
                            <th>Especialidad</th>
                            <th>Resolucion</th>
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
                     var url = "../../Ase?opc=addAsesoria";
                    $.post(url, data, function (objJson) {
                        alert(objJson.addAse)
                        listar();
                    });

                    evt.preventDefault();
                });
                function listar() {
                    var tb = '<table class="table table-bordered table-hover" id="tablaFa">';
                    tb += '<thead><tr><th>Año</th><th>Nivel</th><th>Titulo</th>';
                    tb += '<th>Autor</th><th>Especialidad</th><th>Resolucion</th>';
                    tb += '</tr></thead><tbody id="tbodys"></tbody></table>';
                    var t = "";
                    var url = "../../Ase?opc=listaAsesoria";
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
