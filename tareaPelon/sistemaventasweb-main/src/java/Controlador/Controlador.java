/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import Modelo.ClientesDAO;
import config.GenerarSerie;
import Modelo.Clientes;
import Modelo.Productos;
import Modelo.ProductosDAO;
import Modelo.Venta;
import Modelo.Empleado;
import Modelo.EmpleadoDAO;
import Modelo.VentaDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author usuario
 */
public class Controlador extends HttpServlet {

    Empleado em = new Empleado();
    Clientes cli = new Clientes();
    Productos pro = new Productos();
    EmpleadoDAO edao = new EmpleadoDAO();
    ClientesDAO cdao = new ClientesDAO();
    ProductosDAO pdao = new ProductosDAO();
    VentaDAO vdao = new VentaDAO();
    Venta v = new Venta();
    List<Venta> lista = new ArrayList<>();
    int item, cod, cant;
    String descripcion, numeroserie;
    double precio, subtotal, totalpagar;
    int ide, idec;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String menu = request.getParameter("menu");
        String accion = request.getParameter("accion");
        if (menu.equals("Principal")) {
            request.getRequestDispatcher("Principal.jsp").forward(request, response);
        }
        if (menu.equals("Empleado")) {
            switch (accion) {
                case "Listar" -> {
                    System.out.println("ingreso a switch");
                    List lista = edao.listar();
                    request.setAttribute("empleados", lista);
                    request.getRequestDispatcher("Empleado.jsp").forward(request, response);
                }
                case "Agregar" -> {
                    String dni = request.getParameter("txtDni");
                    String nom = request.getParameter("txtNombre");
                    String tel = request.getParameter("txtTel");
                    String est = request.getParameter("txtEstado");
                    String user = request.getParameter("txtUser");
                    em.setDni(dni);
                    em.setNom(nom);
                    em.setTel(tel);
                    em.setEstado(est);
                    em.setUser(user);
                    edao.Agregar(em);
                    request.getRequestDispatcher("Controlador?menu=Empleado&accion=Listar").forward(request, response);
                }
                case "Editar" -> {
                    ide = Integer.parseInt(request.getParameter("id"));
                    Empleado e = edao.listarId(ide);
                    request.setAttribute("empleado", e);
                    request.getRequestDispatcher("Controlador?menu=Empleado&accion=Listar").forward(request, response);
                }
                case "Actualizar" -> {
                    String dni1 = request.getParameter("txtDni");
                    String nom1 = request.getParameter("txtNombre");
                    String tel1 = request.getParameter("txtTel");
                    String est1 = request.getParameter("txtEstado");
                    String user1 = request.getParameter("txtUser");
                    em.setDni(dni1);
                    em.setNom(nom1);
                    em.setTel(tel1);
                    em.setEstado(est1);
                    em.setUser(user1);
                    em.setId(ide);
                    edao.actualizar(em);
                    request.getRequestDispatcher("Controlador?menu=Empleado&accion=Listar").forward(request, response);
                }
                case "Delete" -> {
                    ide = Integer.parseInt(request.getParameter("id"));
                    edao.delete(ide);
                    request.getRequestDispatcher("Controlador?menu=Empleado&accion=Listar").forward(request, response);
                }

            }
            request.getRequestDispatcher("Empleado.jsp").forward(request, response);
        }
        if (menu.equals("Clientes")) {
            switch (accion) {
                case "Listar" -> {
                    System.out.println("ingreso a switch");
                    List lista = cdao.listar();
                    request.setAttribute("clientes", lista);
                    request.setAttribute("nserie", numeroserie);
                    request.getRequestDispatcher("Clientes.jsp").forward(request, response);
                }
                case "Agregar" -> {
                    String Dni = request.getParameter("txtDni");
                    String Nombre = request.getParameter("txtNombres");
                    String Direccion = request.getParameter("txtDir");
                    String Estado = request.getParameter("txtEstado");
                    cli.setDni(Dni);
                    cli.setNom(Nombre);
                    cli.setDireccion(Direccion);
                    cli.setEstado(Estado);
                    request.setAttribute("nserie", numeroserie);
                    cdao.Agregar(cli);
                    request.getRequestDispatcher("Controlador?menu=Clientes&accion=Listar").forward(request, response);
                }
                case "Editar" -> {
                    idec = Integer.parseInt(request.getParameter("idCliente"));
                    Clientes c = cdao.listarId(idec);
                    request.setAttribute("cliente", c);
                    request.getRequestDispatcher("Controlador?menu=Clientes&accion=Listar").forward(request, response);
                }
                case "Actualizar" -> {
                    String dni1 = request.getParameter("txtDni");
                    String nom1 = request.getParameter("txtNombres");
                    String Dirl = request.getParameter("txtDir");
                    String est1 = request.getParameter("txtEstado");
                    cli.setDni(dni1);
                    cli.setNom(nom1);
                    cli.setDireccion(Dirl);
                    cli.setEstado(est1);
                    cli.setIdCliente(idec);
                    cdao.actualizar(cli);
                    request.getRequestDispatcher("Controlador?menu=Clientes&accion=Listar").forward(request, response);
                }
                case "Delete" -> {
                    idec = Integer.parseInt(request.getParameter("idCliente"));
                    cdao.delete(idec);
                    request.getRequestDispatcher("Controlador?menu=Clientes&accion=Listar").forward(request, response);
                }
            }
        }
        if (menu.equals("Producto")) {
            switch (accion) {
                case "Listar" -> {
                    System.out.println("ingreso a switch");
                    List lista = pdao.listar();
                    request.setAttribute("productos", lista);
                    request.getRequestDispatcher("Producto.jsp").forward(request, response);
                }
                case "Agregar" -> {
                    String Nombres = request.getParameter("txtNombres");
                    String Precio = request.getParameter("txtPrecio");
                    int Stock = Integer.parseInt(request.getParameter("txtStock"));
                    String Estado = request.getParameter("txtEstado");
                    pro.setNombres(Nombres);
                    pro.setPrecio(Precio);
                    pro.setStock(Stock);
                    pro.setEstado(Estado);
                    pdao.Agregar(pro);
                    request.getRequestDispatcher("Controlador?menu=Producto&accion=Listar").forward(request, response);
                }
                case "Editar" -> {
                    idec = Integer.parseInt(request.getParameter("idProducto"));
                    Productos p = pdao.listarId(idec);
                    request.setAttribute("producto", p);
                    request.getRequestDispatcher("Controlador?menu=Producto&accion=Listar").forward(request, response);
                }
                case "Actualizar" -> {
                    String noml = request.getParameter("txtNombres");
                    String preciol = request.getParameter("txtPrecio");
                    int stockl = Integer.parseInt(request.getParameter("txtStock"));
                    String est1 = request.getParameter("txtEstado");
                    pro.setNombres(noml);
                    pro.setPrecio(preciol);
                    pro.setStock(stockl);
                    pro.setEstado(est1);
                    pro.setIdProducto(idec);
                    pdao.actualizar(pro);
                    request.getRequestDispatcher("Controlador?menu=Producto&accion=Listar").forward(request, response);
                }
                case "Delete" -> {
                    idec = Integer.parseInt(request.getParameter("idProducto"));
                    pdao.delete(idec);
                    request.getRequestDispatcher("Controlador?menu=Producto&accion=Listar").forward(request, response);
                }
            }

        }

        if (menu.equals("RegistrarVenta")) {
            switch (accion) {
                case "BuscarCliente":
                    String dni = request.getParameter("codigocliente");
                    cli.setDni(dni);
                    cli = cdao.buscar(dni);
                    request.setAttribute("cli", cli);

                    break;
                case "BuscarProducto":
                    int id = Integer.parseInt(request.getParameter("codigoproducto"));
                    pro = pdao.listarId(id);
                    pro.setIdProducto(id);
                    request.setAttribute("producto", pro);
                    request.setAttribute("lista", lista);
                    request.setAttribute("totalpagar", totalpagar);
                    request.setAttribute("cli", cli);
                    request.setAttribute("nserie", numeroserie);
                    break;
                case "Agregar":

                    request.setAttribute("cli", cli);
                    totalpagar = 0.0;
                    item = item + 1;
                    cod = pro.getIdProducto();
                    descripcion = request.getParameter("nombresproducto");
                    precio = Double.parseDouble(request.getParameter("precio"));
                    cant = Integer.parseInt(request.getParameter("cant"));
                    subtotal = precio * cant;
                    v = new Venta();
                    v.setItem(item);
                    v.setIdproducto(cod);
                    v.setDescripcionP(descripcion);
                    v.setPrecio(precio);
                    v.setCantidad(cant);
                    v.setSubtotal(subtotal);
                    lista.add(v);

                    for (int i = 0; i < lista.size(); i++) {
                        totalpagar = totalpagar + lista.get(i).getSubtotal();
                    }
                    request.setAttribute("totalpagar", totalpagar);
                    request.setAttribute("lista", lista);
                    request.setAttribute("cli", cli);
                    request.setAttribute("nserie", numeroserie);
                    break;
                case "GenerarVenta":

                    //Guardar Venta
                    v.setIdcliente(cli.getIdCliente());
                    v.setIdempleado(2);
                    v.setNumserie(numeroserie);
                    v.setFecha("2023-10-31");
                    v.setMonto(totalpagar);
                    v.setEstado("1");
                    vdao.guardarVenta(v);
                    //Guardar Detalle Ventas
                    int idv = Integer.parseInt(vdao.IdVentas());
                    
                    for (int i = 0; i < lista.size(); i++) {
                        Venta detalleVenta = new Venta(); // Crear una nueva instancia en cada iteración
                        detalleVenta.setId(idv); // Asignar el ID de la venta
                        System.out.println("idproducto =" + lista.get(i).getIdproducto());
                        detalleVenta.setIdproducto(lista.get(i).getIdproducto());
                        detalleVenta.setCantidad(lista.get(i).getCantidad());
                        detalleVenta.setPrecio(lista.get(i).getPrecio());
                        vdao.guardarDetalleVentas(detalleVenta);

                    }

                    //actualizacion del stock
                    for (int i = 0; i < lista.size(); i++) {
                        Productos pr = new Productos();
                        int cantidad = lista.get(i).getCantidad();
                        int idproducto = lista.get(i).getIdproducto();
                        ProductosDAO ao = new ProductosDAO();
                        pr = ao.buscar(idproducto);
                        int sac = pr.getStock() - cantidad;
                        System.out.println("Stock actualizado=" + sac);
                        ao.actualizarstock(idproducto, sac);
                    }
                    break;
                default:
                    numeroserie = vdao.GenerarSerie();
                    if (numeroserie == null) {
                        numeroserie = "000000010";
                        request.setAttribute("nserie", numeroserie);
                    } else {
                        int incrementar = Integer.parseInt(numeroserie);
                        GenerarSerie gs = new GenerarSerie();
                        numeroserie = gs.NumeroSerie(incrementar);
                        request.setAttribute("nserie", numeroserie);
                    }
                    System.out.println("numeroserie=" + numeroserie);
            }
            request.getRequestDispatcher("RegistrarVenta.jsp").forward(request, response);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
