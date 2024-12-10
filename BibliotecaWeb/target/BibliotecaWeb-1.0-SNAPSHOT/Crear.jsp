<%@page import="java.sql.*"%>
<%@page import="com.mysql.cj.jdbc.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Insertar Editorial</title>
    </head>
    <body>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
                    <form>
                        <div class="mb-3">
                            <label for="nombre" class="form-label">Nombre de Editorial</label>
                            <input type="text" class="form-control" id="nombre" name="nombre" aria-describedby="emailHelp">                            
                        </div>
                        <div class="mb-3">
                            <label for="direccion" class="form-label">Dirección de Editorial</label>
                            <input type="text" class="form-control" id="direccion" name="direccion" aria-describedby="emailHelp">                            
                        </div>
                        <div class="mb-3">
                            <label for="telefono" class="form-label">Teléfono de la Editorial</label>
                            <input type="text" class="form-control" id="telefono" name="telefono" aria-describedby="emailHelp">                            
                        </div>


                        <button type="submit" class="btn btn-primary">Cancelar</button>
                        <button name="enviar" type="submit" class="btn btn-danger">Grabar</button>
                    </form>

                </div>

            </div>

        </div>
        <% 
            String db="biblioteca";
            String url="jdbc:mysql://localhost:3309/";
            String user="root";
            String password="";
            String driver="com.mysql.cj.jdbc.Driver";
            Connection con=null;
            Statement st=null;
            ResultSet rs=null;
            
            
            if(request.getParameter("enviar")!= null){
            String nombre = request.getParameter("nombre");
            String direccion = request.getParameter("direccion");
            String telefono= request.getParameter("telefono");

            try{
            Class.forName(driver);
            con=DriverManager.getConnection(url+db,user,password);
            st=con.createStatement();
            st.executeUpdate("insert into editorial(NombreEditorial,Direccion, Telefono) values('"+nombre+"','"+direccion+"','"+telefono+"');");
            request.getRequestDispatcher("index.jsp").forward(request,response);
            
            }catch(Exception e){
                out.print(e);
            }
        };
        %>
    </body>
</html>
