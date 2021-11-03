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
import sucursal.modelo.Comercios;
/**
 *
 * @author PC-LITE
 */
public class ComercioController {
       Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    
    public Comercios ObtenerUnComercio(String id) {
        String sql = "select id, nombre from tblcomercio where id =" + id;
                
       // List<Carrera> tabla = new ArrayList<>();
       Comercios care = new Comercios();
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                 care = new Comercios(rs.getInt(1), rs.getString(2));
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
    
     public Comercios ObtenerComercioNombre(String id) {
        String sql = "select id, nombre from tblcomercio where id='" + id + "'";
                
       // List<Carrera> tabla = new ArrayList<>();
       Comercios care = new Comercios();
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                 care = new Comercios(rs.getInt(1), rs.getString(2));
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

     

    public List ObtenerComercios() {
        String sql = "select id, nombre from tblcomercio order by id asc";
                
        List<Comercios> tabla = new ArrayList<>();
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Comercios cliente = new Comercios(rs.getInt(1), rs.getString(2));
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
    
    
   
     
     public boolean eliminaComercio(String id) throws SQLException {
        String sql;
        sql = "delete from tblcomercio WHERE id=" + id;
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

    
     
     
    
     
}
