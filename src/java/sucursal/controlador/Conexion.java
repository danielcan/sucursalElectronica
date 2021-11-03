/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sucursal.controlador;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
 /*
 * @author PC-lite
 */
public class Conexion {
   private Connection conexion;
    public Statement query;
    
    private static Connection conn = null;
    private static String login = "ELECTRONICA";
    private static String clave = "12345";
    private static String url = "jdbc:oracle:thin:@localhost:1521:xe";

    public static void main(String[] args){
        Conexion obconeccion = new Conexion();
        obconeccion.conectar();
    }

   

    public Connection conectar() {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");    
             conn = DriverManager.getConnection(url, login, clave);
           //se prepara la creacion de un nuevo query
             query = conn.createStatement();
             //conn.setAutoCommit(false);
             if(conn != null){
                 System.out.println("Conexion Exitosa");
             }else{
                 System.out.println("Conexion es erronea");
             }
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("conexion fallida");
        }
        return conn;
    }

    
    public void desconectar() {
        try {
            conn.commit();
            conn.close();
        } catch (SQLException e) {
            System.out.println("fallida desconexion");
        }

    }
 
     public void commit(){
       try{
           conn.commit();
       }catch(Exception e){
           e.printStackTrace();
       }
   }
    
}
