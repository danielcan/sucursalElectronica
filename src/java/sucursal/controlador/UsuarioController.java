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
import sucursal.modelo.Usuarios;
/**
 *
 * @author PC-LITE
 */
public class UsuarioController {
    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    
    public Usuarios ObtenerUnUsuario(String idUsuario) {
        String sql = "select id,rol,login,contrasenia,idcliente from tblusuario where id =" + idUsuario;
                
       // List<Carrera> tabla = new ArrayList<>();
       Usuarios care = new Usuarios();
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                 care = new Usuarios(rs.getInt(1), rs.getInt(2),rs.getString(3),rs.getString(4),rs.getInt(5));
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
    
     public Usuarios ObtenerUsuariosNombre(String nameusuario) {
        String sql = "select id,rol,login,contrasenia,idcliente from tblusuario where id='" + nameusuario + "'";
                
       // List<Carrera> tabla = new ArrayList<>();
       Usuarios care = new Usuarios();
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                 care = new Usuarios(rs.getInt(1), rs.getInt(2),rs.getString(3),rs.getString(4),rs.getInt(5));
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


      
       public List ObtenerUnUsuarioAdmin() {
        String sql = "select id,rol,login,contrasenia,idcliente from tblusuario where rol = 1";
                
        List<Usuarios> tabla = new ArrayList<>();
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Usuarios usuario = new Usuarios(rs.getInt(1), rs.getInt(2),rs.getString(3),rs.getString(4),rs.getInt(5));
                tabla.add(usuario);
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
    
     public List ObtenerUnUsuarioClient() {
        String sql = "select id,rol,login,contrasenia,idcliente from tblusuario where rol = 2";
                
        List<Usuarios> tabla = new ArrayList<>();
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Usuarios usuario = new Usuarios(rs.getInt(1), rs.getInt(2),rs.getString(3),rs.getString(4),rs.getInt(5));
                tabla.add(usuario);
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
       
      

    public List ObtenerUsuario() {
        String sql = "select id,rol,login,contrasenia,idcliente from tblusuario order by id asc";
                
        List<Usuarios> tabla = new ArrayList<>();
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Usuarios usuario = new Usuarios(rs.getInt(1), rs.getInt(2),rs.getString(3),rs.getString(4),rs.getInt(5));
                tabla.add(usuario);
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
    
    
    
    
    
       public boolean guardarUsuarios(Usuarios usuarios) {
        String sql = "INSERT INTO TBLusuario(id,descripcion) VALUES(?,?)";
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
     
     
     public boolean eliminaUsuarios(String idusuario) throws SQLException {
        String sql;
        sql = "delete from tblusuario WHERE id=" + idusuario;
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

    
     
     
     public boolean cambiarUsuario(String idusuario, String newcarrera) throws SQLException {
        int contador = 0;
        Boolean respuesta = false;
        String sql = "UPDATE TBLCarrera SET descripcion= "+ newcarrera + "WHERE id="+ idusuario;
       
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
