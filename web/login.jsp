<%-- 
    Document   : login
    Created on : 24/06/2016, 05:31:31 PM
    Author     : Kiefer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="css/loguin.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
    </head>
    <body>
    
  
        
        <form action="Login" class="col-lg-4" id="login" method="post" >
           <h3 class="page-header">LEGAJO DOCENTE UPeU</h3>
           
           <input type="text" name="usuario" placeholder="usuario" class="form-control"><br>
            <input type="password" name="clave" placeholder="clave" class="form-control"><br>
            <input type="hidden" name="opc" value="validar" class="form-control"><br>
            <input type="submit" value="Enviar" class="btn btn-warning">
        </form>
    
    </body>
</html>
