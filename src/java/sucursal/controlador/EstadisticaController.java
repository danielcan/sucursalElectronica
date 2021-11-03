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
import sucursal.modelo.Compra;
/**
 *
 * @author PC-LITE
 */
public class EstadisticaController {
     Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    
        public String ResultadosCompra() {
        String query = "select idcliente, count(idcliente) as total from tblcompra group by idcliente";
        String resultado = "";
        try {
            con = cn.conectar();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                resultado += "{name:" + "'" + rs.getString(1) + "'" + ",y:" + rs.getString(2) + "},";
            }
            rs.close();
            ps.close();
            cn.desconectar();
        } catch (SQLException e) {
            resultado = null;
        } finally {

            return resultado;
        }

    }
}
