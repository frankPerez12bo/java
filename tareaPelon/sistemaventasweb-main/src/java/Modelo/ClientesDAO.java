/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import config.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class ClientesDAO {

    Conexion cn = new Conexion();
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int r;
public Clientes buscar(String dni){
    Clientes c = new Clientes();
    String sql="select * from cliente where Dni="+dni;
    try{
        con=cn.Conexion();
        ps=con.prepareStatement(sql);
        rs=ps.executeQuery();
        while(rs.next()){
            c.setIdCliente(rs.getInt(1));
            c.setDni(rs.getString(2));
            c.setNom(rs.getNString(3));
            c.setDireccion(rs.getNString(4));
            c.setEstado(rs.getNString(5));
        }
    }catch(Exception e){
        
    }
    return c;
}
    public List listar() {
        System.out.println("ingreso a listar");
        String sql = "select * from cliente ";
        List<Clientes> lista = new ArrayList<>();
        try {
            System.out.println("ingreso a try listar");
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                System.out.println("carga registros");
                Clientes cli = new Clientes();
                cli.setIdCliente(rs.getInt(1));
                cli.setDni(rs.getString(2));
                cli.setNom(rs.getString(3));
                cli.setDireccion(rs.getString(4));
                cli.setEstado(rs.getString(5));
                lista.add(cli);
            }
        } catch (SQLException ex) {
            System.out.println("error2 en driver EmpleadoDAO listar: " + ex.getMessage());
        }
        return lista;
    }

    public int Agregar(Clientes cli) {
        String sql = "insert into cliente(Dni, Nombres, Direccion, Estado)values(?,?,?,?)";
        try {
            con = cn.Conexion();
            ps = con.prepareStatement(sql);
            ps.setString(1, cli.getDni());
            ps.setString(2, cli.getNom());
            ps.setString(3, cli.getDireccion());
            ps.setString(4, cli.getEstado());

            ps.executeUpdate();

        } catch (SQLException ex) {
            System.out.println("error2 en driver EmpleadoDAO agregar: " + ex.getMessage());
        }
        return r;
    }
    
    public Clientes listarId(int id){
        Clientes cli = new Clientes();
        String sql="select* from cliente where IdCliente="+id;
        try{
            con=cn.Conexion();
            ps=con.prepareStatement(sql);
            rs=ps.executeQuery();
            while(rs.next()){
                cli.setDni(rs.getNString(2));
                cli.setNom(rs.getNString(3));
                cli.setDireccion(rs.getNString(4));
                cli.setEstado(rs.getNString(5));
            }
        }catch(SQLException ex){
            System.out.println("error2 en driver EmpleadoDAO listar: " + ex.getMessage());
        }
        return cli;
    }
    
    public int actualizar(Clientes cli) {
        System.out.println("ingreso a actualizar");
String sql="update cliente set Dni=?, Nombres=?, Direccion=?, Estado=? where IdCliente=?";
        try{
            con=cn.Conexion();
            ps=con.prepareStatement(sql);
            ps.setString(1, cli.getDni());
            ps.setString(2, cli.getNom());
            ps.setString(3, cli.getDireccion());
            ps.setString(4, cli.getEstado());
            ps.setInt(5, cli.getIdCliente());
            ps.executeUpdate();
            System.out.println("actualizado");
        }catch(SQLException ex){
            System.out.println("error2 en driver EmpleadoDAO actualizar: " + ex.getMessage());
        }
        return r;
    }
    
    public void delete(int id) {
        String sql="delete from cliente where IdCliente="+id;
        try{
            con=cn.Conexion();
            ps=con.prepareStatement(sql);
            ps.executeUpdate();
        }catch(SQLException ex){
            System.out.println("error2 en driver ClientesDAO delete: " + ex.getMessage());
        }
    }
}
