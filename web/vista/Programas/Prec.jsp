<%-- 
    Document   : Prec
    Created on : 29/06/2016, 10:53:04 PM
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
                        <div class="col col-lg-3 col-sm-6 col-md-6 col-xs-12">
                            <div class="form-group">
                                <label for="año">Fecha</label>
                            </div> 
                            <span>
                                <select id="dia" name="dia" class="form-control-static" onblur="validaDatos();">
                                    <option value="">Día</option>
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
                                </select>/
                                <select id="mes" name="mes" class="form-control-static" onblur="validaDatos();">
                                    <option value="">Mes</option>

                                    <option value="1">
                                        Enero
                                    </option>

                                    <option value="2">
                                        Febrero
                                    </option>

                                    <option value="3">
                                        Marzo
                                    </option>

                                    <option value="4">
                                        Abril
                                    </option>

                                    <option value="5">
                                        Mayo
                                    </option>

                                    <option value="6">
                                        Junio
                                    </option>

                                    <option value="7">
                                        Julio
                                    </option>

                                    <option value="8">
                                        Agosto
                                    </option>

                                    <option value="9">
                                        Septiembre
                                    </option>

                                    <option value="10">
                                        Octubre
                                    </option>

                                    <option value="11">
                                        Noviembre
                                    </option>

                                    <option value="12">
                                        Diciembre
                                    </option>

                                </select>/

                                <select name="anio" id="anio" class="form-control-static" onblur="validaDatos();">
                                    <option value="">Año</option>


                                    <option value="2006">2016</option>
                                    <option value="2006">2015</option>
                                    <option value="2006">2014</option>
                                    <option value="2006">2013</option>
                                    <option value="2006">2012</option>
                                    <option value="2006">2011</option>
                                    <option value="2006">2010</option>
                                    <option value="2006">2009</option>
                                    <option value="2006">2008</option>
                                    <option value="2006">2007</option>
                                    <option value="2006">2006</option>
                                    <option value="2005">2005</option>
                                    <option value="2004">2004</option>
                                    <option value="2003">2003</option>
                                    <option value="2002">2002</option>
                                    <option value="2001">2001</option>
                                    <option value="2000">2000</option>
                                    <option value="1999">1999</option>
                                    <option value="1998">1998</option>
                                    <option value="1997">1997</option>
                                    <option value="1996">1996</option>
                                    <option value="1995">1995</option>
                                    <option value="1994">1994</option>
                                    <option value="1993">1993</option>
                                    <option value="1992">1992</option>
                                    <option value="1991">1991</option>
                                    <option value="1990">1990</option>
                                    <option value="1989">1989</option>
                                    <option value="1988">1988</option>
                                    <option value="1987">1987</option>
                                    <option value="1986">1986</option>
                                    <option value="1985">1985</option>
                                    <option value="1984">1984</option>
                                    <option value="1983">1983</option>
                                    <option value="1982">1982</option>
                                    <option value="1981">1981</option>
                                    <option value="1980">1980</option>
                                    <option value="1979">1979</option>
                                    <option value="1978">1978</option>
                                    <option value="1977">1977</option>
                                    <option value="1976">1976</option>
                                    <option value="1975">1975</option>
                                    <option value="1974">1974</option>
                                    <option value="1973">1973</option>
                                    <option value="1972">1972</option>
                                    <option value="1971">1971</option>
                                    <option value="1970">1970</option>
                                    <option value="1969">1969</option>
                                    <option value="1968">1968</option>
                                    <option value="1967">1967</option>
                                    <option value="1966">1966</option>
                                    <option value="1965">1965</option>
                                    <option value="1964">1964</option>
                                    <option value="1963">1963</option>
                                    <option value="1962">1962</option>
                                    <option value="1961">1961</option>
                                    <option value="1960">1960</option>
                                    <option value="1959">1959</option>
                                    <option value="1958">1958</option>
                                    <option value="1957">1957</option>
                                    <option value="1956">1956</option>
                                    <option value="1955">1955</option>
                                    <option value="1954">1954</option>
                                    <option value="1953">1953</option>
                                    <option value="1952">1952</option>
                                    <option value="1951">1951</option>
                                    <option value="1950">1950</option>
                                    <option value="1949">1949</option>
                                    <option value="1948">1948</option>
                                    <option value="1947">1947</option>
                                    <option value="1946">1946</option>
                                    <option value="1945">1945</option>
                                    <option value="1944">1944</option>
                                    <option value="1943">1943</option>
                                    <option value="1942">1942</option>
                                    <option value="1941">1941</option>
                                    <option value="1940">1940</option>
                                    <option value="1939">1939</option>
                                    <option value="1938">1938</option>
                                    <option value="1937">1937</option>
                                    <option value="1936">1936</option>
                                    <option value="1935">1935</option>
                                    <option value="1934">1934</option>
                                    <option value="1933">1933</option>
                                    <option value="1932">1932</option>
                                    <option value="1931">1931</option>
                                    <option value="1930">1930</option>
                                    <option value="1929">1929</option>
                                    <option value="1928">1928</option>
                                    <option value="1927">1927</option>
                                    <option value="1926">1926</option>
                                    <option value="1925">1925</option>
                                    <option value="1924">1924</option>
                                    <option value="1923">1923</option>
                                    <option value="1922">1922</option>
                                    <option value="1921">1921</option>
                                    <option value="1920">1920</option>
                                </select>

                                <input type="hidden" name="nacimiento" id="nacimiento" value="">





                            </span>
                        </div>
                          <div class="col col-lg-4 col-sm-6 col-md-6 col-xs-12">
                                <label for="año">Institución</label>
                                <br>
                                <br>
                                <select name="anio" id="anio" class="form-control">
                                    <option value="">Seleccionar Institución</option>
                                    <option value="2006">Universidad Alas Perunas</option>
                                    <option value="2006">Universidad San Ignacio de Loyola</option>
                                    <option value="2006">Universidad Peruana Unión</option>
                                    <option value="2006">Universidad Científica del sur</option>
                                </select>
                            </div>
                        <div class="col col-lg-3 col-sm-6 col-md-6 col-xs-12">
                            <div class="form-group">
                                <label for="tit">Reconocimiento</label>
                                <br>
                                <br>
                                <input class="form-control" type="text" id="reco" name="reco">
                            </div> 
                        </div>

                        <div class="col col-lg-2 col-sm-6 col-md-6 col-xs-12">
                            <div class="form-group">
                                <label for="nomb">Lugar</label>
                                <br>
                                <br>
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
                        <th>Fecha</th>
                        <th>Institucion</th>
                        <th>Reconocimiento</th>
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
                                            var url = "../../Prec?opc=addPrec";
                                            $.post(url, data, function (objJson) {
                                                alert(objJson.addPrec)
                                                listar();
                                            });

                                            evt.preventDefault();
                                        });
                                        function listar() {
                                            var tb = '<table class="table table-bordered table-hover" id="tablaFa">';
                                            tb += '<thead><tr><th>Fecha</th><th>Institucion</th><th>Reconocimiento</th>';
                                            tb += '<th>Lugar</th>';
                                            tb += ' <th>Acciones</th></tr></thead><tbody id="tbodys"></tbody></table>';
                                            var t = "";
                                            var url = "../../Prec?opc=listaPrec";
                                            $.post(url, function (objJson) {
                                                var list = objJson.lista;
                                                if (list.length > 0) {

                                                    for (var i = 0; i < list.length; i++) {
                                                        t += "<tr>";
                                                        t += "<td>" + list[i].a + "</td>";
                                                        t += "<td>" + list[i].b + "</td>";
                                                        t += "<td>" + list[i].c + "</td>";
                                                        t += "<td>" + list[i].d + "</td>";
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
