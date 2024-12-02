package Modelo;

public class Clientes {

    int idCliente;
    String Dni, nom, direccion, estado;

    public Clientes() {
    }

    public Clientes(int idCliente, String Dni, String nom, String direccion, String estado) {
        this.idCliente = idCliente;
        this.Dni = Dni;
        this.nom = nom;
        this.direccion = direccion;
        this.estado = estado;
    }

    public String getDni() {
        return Dni;
    }

    public void setDni(String Dni) {
        this.Dni = Dni;
    }

    public int getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(int idCliente) {
        this.idCliente = idCliente;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
}
