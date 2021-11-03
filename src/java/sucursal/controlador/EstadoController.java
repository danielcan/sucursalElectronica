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
import sucursal.modelo.EstadoC;

/**
 *
 * @author PC-LITE
 */
public class EstadoController {
        Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;

    public EstadoController() {
    }
      
    public EstadoC ObtenerUnEstado(String idcliente) {
      String sql = "select id,subtotal,total,fecha,idcliente from tblestadoc where idcliente=" + idcliente;
                
       // List<Carrera> tabla = new ArrayList<>();
       EstadoC care = new EstadoC();
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                 care = new EstadoC(rs.getInt(1), rs.getInt(2),rs.getInt(3),rs.getString(4),rs.getInt(5));
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
    
    
        public List ObtenerUnEstado1(String idcliente) {
        String sql = "select id,subtotal,total,fecha,idcliente from tblestadoc where idcliente = "+ idcliente ;
                
        List<EstadoC> tabla = new ArrayList<>();
        
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                EstadoC cliente = new EstadoC(rs.getInt(1), rs.getInt(2),rs.getInt(3),rs.getString(4),rs.getInt(5));
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
    
    
    
}
