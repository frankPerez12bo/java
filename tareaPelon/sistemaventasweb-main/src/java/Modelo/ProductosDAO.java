package Modelo;
import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
public class ProductosDAO {
    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;
    
    public Productos buscar(int id){
        Productos p = new Productos();
       String sql="select * from producto where IdProducto="+id;
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                p.setIdProducto(rs.getInt(1));
                p.setNombres(rs.getString(2));
                p.setPrecio(rs.getString(3));
                p.setStock(rs.getInt(4));
                p.setEstado(rs.getString(5));
            }
        } catch (Exception e) {
            System.out.println("error en buscar productosdao");
        }
        return p;
    }
    public int actualizarstock(int id, int stock){
        String sql="update producto set Stock=? where IdProducto=?";
        try {
            con=cn.Conexion();
            ps=con.prepareStatement(sql);
            ps.setInt(1, stock);
            ps.setInt(2, id);
            r = ps.executeUpdate();
        } catch (Exception e) {
            System.out.println("error en actualizar stock productosdao");
        }
        return r;
    }
    //operaciones crud
    public List listar() {
        System.out.println("ingreso a listar");
        String sql = "select * from producto ";
        List<Productos> lista = new ArrayList<>();
        try {
            System.out.println("ingreso a try listar");
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                System.out.println("carga registros");
                Productos pro = new Productos();
                pro.setIdProducto(rs.getInt(1));
                pro.setNombres(rs.getString(2));
                pro.setPrecio(rs.getString(3));
                pro.setStock(rs.getInt(4));
                pro.setEstado(rs.getString(5));
                lista.add(pro);
            }
        } catch(SQLException ex){
            System.out.println("error2 en driver EmpleadoDAO listar: " + ex.getMessage());
        }
        return lista;
    }
    public int Agregar(Productos pro) {
        String sql = "insert into producto(Nombres, Precio, Stock, Estado)values(?,?,?,?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, pro.getNombres());
            ps.setString(2, pro.getPrecio());
            ps.setInt(3, pro.getStock());
            ps.setString(4, pro.getEstado());

            ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("error2 en agregar productodao: " + ex.getMessage());
        }
        return r;
    }
    public Productos listarId(int id){
        Productos pro = new Productos();
        String sql="select* from producto where IdProducto="+id;
        try{
            con=cn.Conexion();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                pro.setNombres(rs.getString(2));
                pro.setPrecio(rs.getString(3));
                pro.setStock(rs.getInt(4));
                pro.setEstado(rs.getString(5));
            }
        }catch(SQLException ex){
            System.out.println("error2 en driver productosdao listar: " + ex.getMessage());
        }
        return pro;
    }
    public int actualizar(Productos pro) {
        System.out.println("ingreso a actualizar");
String sql="update producto set Nombres=?, Precio=?, Stock=?, Estado=? where IdProducto=?";
        try{
            con=cn.Conexion();
            ps=con.prepareStatement(sql);
            ps.setString(1, pro.getNombres());
            ps.setString(2, pro.getPrecio());
            ps.setInt(3, pro.getStock());
            ps.setString(4, pro.getEstado());
            ps.setInt(5, pro.getIdProducto());
            ps.executeUpdate();
            System.out.println("actualizado");
        }catch(SQLException ex){
            System.out.println("error2 en driver productosdao actualizar: " + ex.getMessage());
        }
        return r;
    }
    public void delete(int id) {
        String sql="delete from producto where IdProducto="+id;
        try{
            con=cn.Conexion();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(SQLException ex){
            System.out.println("error2 en driver productosdao delete: " + ex.getMessage());
        }
    }
}
