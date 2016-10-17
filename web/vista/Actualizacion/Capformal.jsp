<%-- 
    Document   : Capformal
    Created on : 29/06/2016, 01:21:53 PM
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
                                    <label for="an">Fecha</label>
                                    <input class="form-control" type="date" id="an" name="an">
                                </div> 
                            </div>
                            <div class="col col-lg-4 col-sm-6 col-md-6 col-xs-12">
                                <div class="form-group">
                                    <label for="tip">Tipo</label>
                                    <input class="form-control" type="text" id="tip" name="tip">
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
                                    <label for="ins">Institucion</label>
                                    <input class="form-control" type="text" id="ins" name="ins">
                                </div> 
                            </div>
                           <div class="col col-lg-4 col-sm-6 col-md-6 col-xs-12">
                                <div class="form-group">
                                    <label for="feci">Fecha Inicio</label>
                                    <input class="form-control" type="date" id="feci" name="feci">
                                </div> 
                            </div>
                            <div class="col col-lg-4 col-sm-6 col-md-6 col-xs-12">
                                <div class="form-group">
                                    <label for="fecf">Fecha Fin</label>
                                    <input class="form-control" type="date" id="fecf" name="fecf">
                                </div> 
                            </div>
                            <div class="col col-lg-4 col-sm-6 col-md-6 col-xs-12">
                                <div class="form-group">
                                    <label for="ho">Hora</label>
                                    <input class="form-control" type="text" id="ho" name="ho">
                                </div> 
                            </div>
                             <div class="col col-lg-4 col-sm-6 col-md-6 col-xs-12">
                                <div class="form-group">
                                    <label for="lu">Lugar</label>
                                    <input class="form-control" type="text" id="lu" name="lu">
                                    <br> <input type="submit" class="btn btn-primary pull-right" id="insertFA" value="Guardar"style="background: #8f1656">
                               
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
                            <th>Tipo</th>
                            <th>Titulo</th>
                            <th>Institucion</th>
                            <th>Fecha Inicio</th>
                            <th>Fecha Fin</th>
                            <th>Hora</th>
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
        <script src="../../js/dataTables.bootstrap.min.js" type="text/javascript"></script>
        <script src="../../js/jquery.dataTables.min.js" type="text/javascript"></script>
        <script>
              $(document).ready(function () {
                $('#tablaFa').dataTable();
                listar();
                $('#insertFA').click(function (evt) {
                    var data = $('#forminsert').serialize();
                    var url = "../../Cap?opc=add";
                    $.post(url, data, function (objJson) {
                        alert(objJson.addCapa)
                        listar();
                    });

                    evt.preventDefault();
                });
                function listar() {
                    var tb = '<table class="table table-bordered table-hover" id="tablaFa">';
                    tb += '<thead><tr><th>Fecha</th><th>Tipo</th><th>Titulo</th>';
                    tb += '<th>Institucion</th><th>Fecha Inicio</th><th>Fecha Fin</th><th>Hora</th><th>Lugar</th><th>Acciones</th></tr></thead><tbody id="tbodys"></tbody></table>';
                    var t = "";
                    var url = "../../Cap?opc=listar1";
                    $.post(url, function (objJson) {
                        var list = objJson.listaC;
                        if (list.length > 0) {

                            for (var i = 0; i < list.length; i++) {
                                t += "<tr>";
                                t += "<td>" + list[i].an + "</td>";
                                t += "<td>" + list[i].tip + "</td>";
                                t += "<td>" + list[i].tit + "</td>";
                                t += "<td>" + list[i].ins + "</td>";
                                t += "<td>" + list[i].feci + "</td>";
                                t += "<td>" + list[i].fecf + "</td>";
                               t += "<td>" + list[i].ho + "</td>";
                                t += "<td>" + list[i].lu+ "</td>";
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
