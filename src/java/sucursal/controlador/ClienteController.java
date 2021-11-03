/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sucursal.controlador;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import sucursal.modelo.Cliente;

/**
 *
 * @author AdminCis
 */
public class ClienteController {
     Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    
    public Cliente ObtenerUnCliente(String idcliente) {
        String sql = "select idcliente,nombreC,fechaIngreso,telefono,identidad from tblcliente where idcliente =" + idcliente;
                
       // List<Carrera> tabla = new ArrayList<>();
       Cliente care = new Cliente();
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                 care = new Cliente(rs.getInt(1), rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5));
                //tabla.add(carrera);
            }
            rs.close();
            ps.close();
            cn.desconectar();
            return care;

        } catch (SQLException e) {
            System.out.println("error:" + e);
            return null;
        }

    }
    
     public Cliente ObtenerClienteNombre(String namecliente) {
        String sql = "select idcliente,nombreC,fechaIngreso,telefono,identidad from tblcliente where idcliente='" + namecliente + "'";
                
       // List<Carrera> tabla = new ArrayList<>();
       Cliente care = new Cliente();
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                 care = new Cliente(rs.getInt(1), rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5));
                //tabla.add(carrera);
            }
            rs.close();
            ps.close();
            cn.desconectar();
            return care;

        } catch (SQLException e) {
            System.out.println("error:" + e);
            return null;
        }

    }
  /*  
      public int ObtenerCarreraNombre2(String namecliente) {
        String sql = "select id,descripcion from tblcliente WHERE descripcion = '" + namecliente+"'";

          int id = 0;      
       // List<Carrera> tabla = new ArrayList<>();
       Cliente care = new Cliente();
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                 care = new Cliente(rs.getInt(1), rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5));
                 id = rs.getInt(1);
                //tabla.add(carrera);
            }
            System.out.println("id carrera:"+id);
            rs.close();
            ps.close();
            cn.desconectar();
            return id;

        } catch (SQLException e) {
            System.out.println("error:" + e);
            return id;
        }

    }
     
 */    

    public List ObtenerCliente() {
        String sql = "select idcliente,nombreC,fechaIngreso,telefono,identidad from tblcliente order by idcliente asc";
                
        List<Cliente> tabla = new ArrayList<>();
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Cliente cliente = new Cliente(rs.getInt(1), rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5));
                tabla.add(cliente);
            }
            rs.close();
            ps.close();
            cn.desconectar();
            return tabla;

        } catch (SQLException e) {
            System.out.println("error:" + e);
            return null;
        }

    }
    
    
       public boolean guardarCliente(Cliente cliente) {
        String sql = "INSERT INTO TBLCliente(id,descripcion) VALUES(?,?)";
        int contador;
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            
            //ps.setInt(1, usuario.getId());
            ps.setString(1, "secu_carrera.nextval");
           // ps.setString(2, carrera.getDescripcion());
           

            contador = ps.executeUpdate();
            cn.desconectar();
            if (contador == 1) {
                System.out.println("Se guardo Correctamente");
                return true;
            }
            cn.desconectar();
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
        return false;

    }
     
     
     public boolean eliminaCliente(String idcliente) throws SQLException {
        String sql;
        sql = "delete from tblcliente WHERE id = " + idcliente;
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            ps.close();
            cn.desconectar();

            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        ps.close();
        cn.desconectar();
        return false;
    }

    
     
     
     public boolean cambiarCarrera(String idcarrera, String newcarrera) throws SQLException {
        int contador = 0;
        Boolean respuesta = false;
        String sql = "UPDATE TBLCarrera SET descripcion= "+ newcarrera + "WHERE id="+ idcarrera;
       
        try {
           con = cn.conectar();
            ps = con.prepareStatement(sql);
            ps.executeUpdate();
            ps.close();
            cn.desconectar();
            return true;
        } catch (Exception e) {
            System.out.println(e.getCause());
        }
        ps.close();
        cn.desconectar();
        return false;

    }
     
}
