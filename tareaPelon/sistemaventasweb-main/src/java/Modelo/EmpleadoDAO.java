package Modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EmpleadoDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;

    public Empleado validar(String user, String dni) {
        Empleado em = new Empleado();
        String sql = "select * from empleado WHERE User=? AND Dni=?";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, dni);
            rs = ps.executeQuery();
            while (rs.next()) {
                em.setId(rs.getInt("IdEmpleado"));
                em.setUser(rs.getString("User"));
                em.setDni(rs.getString("Dni"));
                em.setNom(rs.getString("Nombres"));
            }
        } catch(SQLException ex){
            System.out.println("error2 en driver EmpleadoDAO validar: " + ex.getMessage());
        }
        return em;
    }

    //operaciones crud
    public List listar() {
        System.out.println("ingreso a listar");
        String sql = "select * from empleado ";
        List<Empleado> lista = new ArrayList<>();
        try {
            System.out.println("ingreso a try listar");
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                System.out.println("carga registros");
                Empleado em = new Empleado();
                em.setId(rs.getInt(1));
                em.setDni(rs.getString(2));
                em.setNom(rs.getString(3));
                em.setTel(rs.getString(4));
                em.setEstado(rs.getString(5));
                em.setUser(rs.getString(6));
                lista.add(em);
            }
        } catch(SQLException ex){
            System.out.println("error2 en driver EmpleadoDAO listar: " + ex.getMessage());
        }
        return lista;
    }

    public int Agregar(Empleado em) {
        String sql="insert into empleado(Dni, Nombres, Telefono, Estado, User)values(?,?,?,?,?)";
        try{
            con=cn.Conexion();
            ps=con.prepareStatement(sql);
            ps.setString(1, em.getDni());
            ps.setString(2, em.getNom());
            ps.setString(3, em.getTel());
            ps.setString(4, em.getEstado());
            ps.setString(5, em.getUser());
            
            ps.executeUpdate();
            System.out.println("nombre es " + em.getNom());
        }catch(SQLException ex){
            System.out.println("error2 en driver EmpleadoDAO agregar: " + ex.getMessage());
        }
        return r;
    }
    public Empleado listarId(int id){
        Empleado emp= new Empleado();
        String sql="select* from empleado where IdEmpleado="+id;
        try{
            con=cn.Conexion();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                emp.setDni(rs.getNString(2));
                emp.setNom(rs.getNString(3));
                emp.setTel(rs.getNString(4));
                emp.setEstado(rs.getNString(5));
                emp.setUser(rs.getNString(6));
            }
        }catch(SQLException ex){
            System.out.println("error2 en driver EmpleadoDAO listar: " + ex.getMessage());
        }
        return emp;
    }
    public int actualizar(Empleado em) {
String sql="update empleado set Dni=?, Nombres=?, Telefono=?, Estado=?, User=? where idEmpleado=?";
        try{
            con=cn.Conexion();
            ps=con.prepareStatement(sql);
            ps.setString(1, em.getDni());
            ps.setString(2, em.getNom());
            ps.setString(3, em.getTel());
            ps.setString(4, em.getEstado());
            ps.setString(5, em.getUser());
            ps.setInt(6, em.getId());
            ps.executeUpdate();
        }catch(SQLException ex){
            System.out.println("error2 en driver EmpleadoDAO actualizar: " + ex.getMessage());
        }
        return r;
    }

    public void delete(int id) {
        String sql="delete from empleado where IdEmpleado="+id;
        try{
            con=cn.Conexion();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(SQLException ex){
            System.out.println("error2 en driver EmpleadoDAO delete: " + ex.getMessage());
        }
    }
}
