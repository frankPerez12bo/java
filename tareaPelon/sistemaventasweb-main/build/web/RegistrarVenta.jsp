<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page import="Modelo.Clientes"%>
<%@page import="Modelo.Productos"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
        <title>VENTAS</title>
        <style>
            @media print {
                .parte01,  .btn, .accion{
                    display: none;
                }
            }
        </style>
    </head>
    <body>
        <div class="d-flex">
            <div class="col-sm-4 parte01" >
                <div class="card">
                    <form action="Controlador?menu=RegistrarVenta" method="POST"> 
                        <div class="card-body">
                            <div class="form-group">
                                <label>Datos del cliente</label> 
                            </div>

                            <div class="form-group d-flex">
                                <div class="col-sm-6 d-flex">
                                    <input type="text" name="codigocliente" value="${cli.getDni()}" class="form-control" placeholder="Codigo">
                                    <input type="submit" name="accion" value="BuscarCliente" class="form-control">
                                </div>
                                <div class="col-sm-6">
                                    <input type="text" name="nombresclientes" value="${cli.getNom()}" placeholder="Datos Cliente" class="form-control">
                                </div>
                            </div>
                            <div>
                                <label>Datos producto</label>
                            </div>
                            <div class="form-group d-flex">
                                <div class="col-sm-6 d-flex">
                                    <input type="text" name="codigoproducto" class="form-control" placeholder="Codigo">
                                    <button type="submit" name="accion" value="BuscarProducto" class="btn btn-outline-info">Buscar</button>
                                </div>
                                <div class="col-sm-6">
                                        <input type="text" name="nombresproducto" value="${producto.getNombres()}" placeholder="Datos Producto" class="form-control">
                                </div>
                            </div>
                            <div class="form-group d-flex">
                                <div class="col-sm-6 d-flex">
                                    <input type="text" name="precio" value="${producto.getPrecio()}" placeholder="S/.0.00" class="form-control">
                                </div>
                                <div class="col-sm-3 d-flex">
                                    <input type="number" name="cant" value="1" placeholder="" class="form-control">
                                </div>
                                <div class="col-sm-3 d-flex">
                                    <input type="text" name="stock" value="${producto.getStock()}" placeholder="stock" class="form-control">
                                </div>
                            </div>
                            <div class="form-group"> 
                                <button type="submit" name="accion" value="Agregar" class="btn btn-outline-info">Agregar Producto </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-sm-7">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex col-sm-6 ml-auto">
                            <label>NumeroSerie</label>
                            <input type="text" name="NroSerie" value="${nserie}" class="form-control">
                        </div> 
                        <br>
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <td>Nro</td>
                                    <td>Codigo</td>
                                    <td>Descripcion</td>
                                    <td>Precio</td>
                                    <td>Cantidad</td>
                                    <td>SubTotal</td>
                                    <td class="accion">Acciones</td>
                                </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="list" items="${lista}" >
                                        <tr>
                                            <td>${list.getItem()}</td>
                                            <td>${list.getIdproducto()}</td>
                                            <td>${list.getDescripcionP()}</td>
                                            <td>${list.getPrecio()}</td>
                                            <td>${list.getCantidad()}</td>
                                            <td>${list.getSubtotal()}</td>
                                            <td class="d-flex">
                                                <a class="btn btn-warning">Editar</a>
                                                <a class="btn btn-danger" style="margin-left: 10px">Delete</a>
                                            </td>
                                        </tr> 
                                    </c:forEach>
                                </tbody>
                            </table>
                        
                    </div>
                    <div class="card-footer d-flex" >
                        <div class="col-sm-6">
                            <a href="Controlador?menu=RegistrarVenta&accion=GenerarVenta" onclick="print()" class="btn btn-success">Generar Venta</a>
                            
                            <button type="submit " name="accion" value="Cancelar" class="btn btn-danger">Cancelar </button>
                        </div>
                        <div class="col-sm-4 ml-auto">
                            <input type="text" name="txtTotal" value="S/. ${totalpagar}" class="form-control"<
                        </div>
                        
                    </div>
                </div>

            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    </body>
</html>
