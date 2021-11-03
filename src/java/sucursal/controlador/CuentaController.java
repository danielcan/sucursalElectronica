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
import sucursal.modelo.Cuentas;

/**
 *
 * @author PC-LITE
 */
public class CuentaController {
    Connection con;
    Conexion cn = new Conexion();
    PreparedStatement ps;
    ResultSet rs;
    
    public Cuentas ObtenerUnCuenta(String idcliente) {
        String sql = "select id,saldo,idcliente from tblcuenta where id =" + idcliente;
           
       // List<Carrera> tabla = new ArrayList<>();
       Cuentas care = new Cuentas();
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                 care = new Cuentas(rs.getInt(1),rs.getInt(2),rs.getInt(3));
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
    
     public Cuentas ObtenerCuentasNombre(String namecliente) {
        String sql = "select id,saldo,idcliente from tblcuenta where id='" + namecliente + "'";
                
       // List<Carrera> tabla = new ArrayList<>();
       Cuentas care = new Cuentas();
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                 care = new Cuentas(rs.getInt(1),rs.getInt(2),rs.getInt(3));
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
public Cuentas ObtenerCuentasSaldo(String namecliente) {
        String sql = "select id,saldo,idcliente from tblcuenta where idcliente = " + namecliente ;
                
       // List<Carrera> tabla = new ArrayList<>();
       Cuentas care = new Cuentas();
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                 care = new Cuentas(rs.getInt(1),rs.getInt(2),rs.getInt(3));
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

    public List ObtenerCuenta() {
        String sql = "select id, saldo, idcliente from tblcuenta order by id asc";
                
        List<Cuentas> tabla = new ArrayList<>();
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Cuentas cliente = new Cuentas(rs.getInt(1),rs.getInt(2),rs.getInt(3));
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
    
    
        public List ObtenerLasCuenta(String clientes) {
        String sql = "select id, saldo, idcliente from tblcuenta where idcliente = " + clientes ;
                
        List<Cuentas> tabla = new ArrayList<>();
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Cuentas cliente = new Cuentas(rs.getInt(1),rs.getInt(2),rs.getInt(3));
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
    
    
    public boolean verificarCuenta(String idcliente) {
        String sql = "select id,saldo,idcliente from tblcuenta where id = " + idcliente;
         boolean p = false;       
       // List<Carrera> tabla = new ArrayList<>();
       Cuentas care = new Cuentas();
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                
                care = new Cuentas(rs.getInt(1),rs.getInt(2),rs.getInt(3));

                if(care.getSaldo()>0){
                p = true;
                }
                
            }
            rs.close();
            ps.close();
            cn.desconectar();
       

        } catch (SQLException e) {
            System.out.println("error:" + e);
            
        }
    return p;
    }
    
      public int obtenerSaldo(String id) {
        String sql = "select id,saldo,idcliente from tblcuenta where id =" + id;
        int saldoInicial = 0;   
       // List<Carrera> tabla = new ArrayList<>();
       Cuentas care = new Cuentas();
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                 care = new Cuentas(rs.getInt(1),rs.getInt(2),rs.getInt(3));
                //tabla.add(carrera);
                saldoInicial = care.getSaldo();
                return saldoInicial;
            }
            rs.close();
            ps.close();
            cn.desconectar();
            

        } catch (SQLException e) {
            System.out.println("error:" + e);
            
        }
        return saldoInicial;
    }
    
    
    
    
     public boolean cuentaMontoVerifica(String idcliente,String monto) {
        String sql = "select id,saldo,idcliente from tblcuenta where id = " + idcliente;
         boolean p = false;       
       // List<Carrera> tabla = new ArrayList<>();
       Cuentas care = new Cuentas();
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                
                care = new Cuentas(rs.getInt(1),rs.getInt(2),rs.getInt(3));

                if(care.getSaldo()>= Integer.parseInt(monto)){   
                 p = true;   
                }
                
            }
            rs.close();
            ps.close();
            cn.desconectar();
       

        } catch (SQLException e) {
            System.out.println("error:" + e);
            
        }
    return p;
    }
    
     
     
    
    
    
    
      public boolean cuentaExistente(String idcliente) {
        String sql = "select id,saldo,idcliente from tblcuenta where id = " + idcliente;
         boolean p = false;       
       // List<Carrera> tabla = new ArrayList<>();
       Cuentas care = new Cuentas();
        try {
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                care = new Cuentas(rs.getInt(1),rs.getInt(2),rs.getInt(3));
                p = true;
            }
            rs.close();
            ps.close();
            cn.desconectar();

        } catch (SQLException e) {
            System.out.println("error:" + e);
            
        }
    return p;
    }
     
     
     public boolean eliminaCuenta(String idcliente) throws SQLException {
        String sql;
        sql = "delete from tblcuenta WHERE id=" + idcliente;
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
     
       public boolean verificaSaldoCuenta(String idcuenta) throws SQLException {
        String sql;
        sql = "select id, saldo, idcliente from tblcuenta where idcliente = " + idcuenta;
        try {
            int s = 0;
            con = cn.conectar();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Cuentas cliente = new Cuentas(rs.getInt(1),rs.getInt(2),rs.getInt(3));
                System.out.println(cliente.getSaldo());
                if(cliente.getSaldo() < 0){
                    return true;
                }
               
            }
            rs.close();
            ps.close();
            cn.desconectar();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        ps.close();
        cn.desconectar();
        return false;
    }


    
     
     
     public boolean cambiarCuentas(String idcarrera, String newcarrera) throws SQLException {
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
