<%-- 
    Document   : Psoc
    Created on : 29/06/2016, 08:42:36 PM
    Author     : Wild
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
        
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
                                    <label for="año">Fecha de la Actividad</label>
                                    <br>
                                        <select id="dia" name="dia" class="form-control-static">
                                           
                                            <option value>Dia</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                            <option value="6">6</option>
                                            <option value="7">7</option>
                                            <option value="8">8</option>
                                            <option value="9">9</option>
                                            <option value="10">10</option>
                                            <option value="11">11</option>
                                            <option value="12">12</option>
                                            <option value="13">13</option>
                                            <option value="14">14</option>
                                            <option value="15">15</option>
                                            <option value="16">16</option>
                                            <option value="17">17</option>
                                            <option value="18">18</option>
                                            <option value="19">19</option>
                                            <option value="20">20</option>
                                            <option value="21">21</option>
                                            <option value="22">22</option>
                                            <option value="23">23</option>
                                            <option value="24">24</option>
                                            <option value="25">25</option>
                                            <option value="26">26</option>
                                            <option value="27">27</option>
                                            <option value="28">28</option>
                                            <option value="29">29</option>
                                            <option value="30">30</option>
                                            <option value="31">31</option>
                                        </select>
                                        <select id="mes" name="mes" class="form-control-static">
                                            <option value>Mes</option>
                                            <option value="1">Enero</option>
                                            <option value="2">Febrero</option>
                                            <option value="3">Marzo</option>
                                            <option value="4">Abril</option>
                                            <option value="5">Mayo</option>
                                            <option value="6">Junio</option>
                                            <option value="7">Julio</option>
                                            <option value="8">Agosto</option>
                                            <option value="9">Setiembre</option>
                                            <option value="10">Octubre</option>
                                            <option value="11">Noviembre</option>
                                            <option value="12">Diciembre</option>
                                        </select>
                                         <select id="anio" name="anio" class="form-control-static">
                                             <option value>Año</option>
                                             <option value="1">2006</option>
                                             <option value="2">2005</option>
                                             <option value="2">2004</option>
                                             <option value="2">2003</option>
                                             <option value="2">2002</option>
                                             <option value="2">2001</option>
                                             <option value="2">2000</option>
                                             <option value="2">1999</option>
                                             <option value="2">1998</option>
                                             <option value="2">1997</option>
                                             <option value="2">1996</option>
                                             <option value="2">1995</option>
                                             <option value="2">1994</option>
                                             <option value="2">1993</option>
                                             <option value="2">1992</option>
                                             <option value="2">1991</option>
                                             <option value="2">1990</option>
                                             <option value="2">1989</option>
                                             <option value="2">1988</option>
                                             <option value="2">1987</option>
                                             <option value="2">1986</option>
                                             <option value="2">1985</option>
                                             <option value="2">1984</option>
                                             <option value="2">1983</option>
                                             <option value="2">1982</option>
                                             <option value="2">1981</option>
                                             <option value="2">1980</option>
                                             <option value="2">1979</option>
                                             <option value="2">1978</option>
                                             <option value="2">1977</option>
                                             <option value="2">1976</option>
                                             <option value="2">1975</option>
                                             <option value="2">1974</option>
                                             <option value="2">1973</option>
                                             <option value="2">1972</option>
                                             <option value="2">1971</option>
                                             <option value="2">1970</option>
                                             <option value="2">1969</option>
                                             <option value="2">1968</option>
                                             <option value="2">1967</option>
                                             <option value="2">1966</option>
                                             <option value="2">1965</option>
                                             <option value="2">1964</option>
                                             <option value="2">1963</option>
                                             <option value="2">1962</option>
                                             <option value="2">1961</option>
                                             <option value="2">1960</option>
                                             <option value="2">1959</option>
                                             <option value="2">1958</option>
                                             <option value="2">1957</option>
                                             <option value="2">1956</option>
                                             <option value="2">1955</option>
                                             <option value="2">1954</option>
                                             <option value="2">1953</option>
                                             <option value="2">1952</option>
                                             <option value="2">1951</option>
                                             <option value="2">1950</option>
                                             <option value="2">1949</option>
                                             <option value="2">1948</option>
                                             <option value="2">1947</option>
                                             <option value="2">1946</option>
                                             <option value="2">1945</option>
                                             <option value="2">1944</option>
                                             <option value="2">1943</option>
                                             <option value="2">1942</option>
                                             <option value="2">1941</option>
                                             <option value="2">1939</option>
                                             <option value="2">1939</option>
                                             <option value="2">1938</option>
                                             <option value="2">1937</option>
                                             <option value="2">1936</option>
                                             <option value="2">1935</option>
                                             <option value="2">1934</option>
                                             <option value="2">1933</option>
                                             <option value="2">1932</option>
                                             <option value="2">1931</option>
                                             <option value="2">1930</option>
                                             <option value="2">1929</option>
                                             <option value="2">1928</option>
                                             <option value="2">1927</option>
                                             <option value="2">1926</option>
                                             <option value="2">1925</option>
                                             <option value="2">1924</option>
                                             <option value="2">1923</option>
                                             <option value="2">1922</option>
                                             <option value="2">1921</option>
                                             <option value="2">1920</option>
                                         </select>
                                  
                                </div> 
                            </div>
                             <div class="col col-lg-4 col-sm-6 col-md-6 col-xs-12">
                            
                            <div class="form-group">
                                    <label for="asi">Tipo Actividad</label>
                                    <select id="asi" name="asi" class="form-control">
                                        <option>[Seleccione Actividad]</option>
                                        <option>Proyectos de proyección social</option>
                                        <option>Programa de extención cultural</option>
                                       
                                    </select>
                                </div> 
                                     
                            </div>
                            
                             
                            <div class="col col-lg-4 col-sm-6 col-md-6 col-xs-12">
                                <div class="form-group">
                                    <label for="tipp">Titulo Actividad</label>
                                    <input class="form-control" type="text" id="tia" name="tia">
                                </div> 
                            </div>
                            <div class="col col-lg-4 col-sm-6 col-md-6 col-xs-12">
                                <div class="form-group">
                                    <label for="tit">Poblacion</label>
                                    <input class="form-control" type="text" id="pob" name="pob">
                                </div> 
                            </div>
                            
                        
                           <div class="col col-lg-4 col-sm-6 col-md-6 col-xs-12">
                                <div class="form-group">
                                    <label for="edi">Lugar</label>
                                    <input class="form-control" type="text" id="lug" name="lug">
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
                            <th>Titulo Actividad</th>
                            <th>Poblacion</th>
                            <th>Lugar</th>
                            <th>TipoActiv</th>
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
                     var url = "../../Psocial?opc=addPsoc";
                    $.post(url, data, function (objJson) {
                        alert(objJson.addP)
                        listar();
                    });

                    evt.preventDefault();
                });
                function listar() {
                    var tb = '<table class="table table-bordered table-hover" id="tablaFa">';
                    tb += '<thead><tr><th>Año</th><th>Titulo Actividad</th><th>Poblacion</th>';
                    tb += '<th>Lugar</th><th>TipoActiv</th>';
                    tb += '<th>Acciones</th></tr></thead><tbody id="tbodys"></tbody></table>';
                    var t = "";
                    var url = "../../Psocial?opc=listaPsoc";
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
