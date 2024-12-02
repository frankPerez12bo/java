<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Modelo.Clientes"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="d-flex">
            <div class="card col-sm-4">
                <div class="card-body">
                    <form action="Controlador?menu=Clientes" method="POST">
                        <div class="form-group">
                            <label>Dni</label>
                            <input type="text" value="${cliente.getDni()}" name="txtDni" class="form-control">
                        </div>  
                        <div class="form-group">
                            <label>Nombre</label>
                            <input type="text" value="${cliente.getNom()}" name="txtNombres" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>Direccion</label>
                            <input type="text" value="${cliente.getDireccion()}" name="txtDir" class="form-control">
                        </div class="form-group">
                        <div class="form-group">
                            <label>Estado</label>
                            <input type="text" value="${cliente.getEstado()}" name="txtEstado" class="form-control">
                        </div class="form-group">
                            <input type="submit" name="accion" value="Agregar" class="btn btn-info">
                            <input type="submit" name="accion" value="Actualizar" class="btn btn-success">
                    </form>
                </div>
            </div> 
            <div class="col-sm-8">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>ID </th>
                            <th>DNI </th>
                            <th>NOMBRES </th>
                            <th>DIRECCION </th>
                            <th>ESTADO </th>
                            <th>ACCIONES </th>
                        </tr>
                    </thead>
                    <c:forEach var="cli" items="${clientes}">
                        <tbody>
                            <tr>
                                <td>${cli.getIdCliente()}</td>
                                <td>${cli.getDni()}</td>
                                <td>${cli.getNom()}</td>
                                <td>${cli.getDireccion()}</td>
                                <td>${cli.getEstado()}</td>
                                <td>
                                    <a class="btn btn-warning" href="Controlador?menu=Clientes&accion=Editar&idCliente=${cli.getIdCliente()}"> Editar</a>
                                    <a class="btn btn-danger" href="Controlador?menu=Clientes&accion=Delete&idCliente=${cli.getIdCliente()}">Eliminar</a>
                                </td>
                            </tr>
                        </tbody>
                    </c:forEach>
                </table>   
            </div>
        </div>
    </body>
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</html>
