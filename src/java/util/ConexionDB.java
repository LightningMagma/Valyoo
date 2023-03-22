/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package util;

import com.mysql.jdbc.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author xJuanDa
 */
public class ConexionDB {
    private String driver, user, password, urlDB, port, nameDB;
    private Connection conexion;

    public ConexionDB() {
        //2.Asignar valores
        driver = "com.mysql.jdbc.Driver";
        user = "root";
        password = "";
        nameDB = "valyoodb";
        port = "3306";
        urlDB = "jdbc:mysql://localhost:" + port + "/" + nameDB;

        try {
            Class.forName(driver).newInstance();
            conexion = (Connection)DriverManager.getConnection(urlDB, user, password);
            System.out.println("Conexion OK!");
        } catch (Exception e) {
            System.out.println("Error al conectarse " + e.toString());
        }
    }
    
    public Connection obtenerConexion(){
        return conexion;
    }
    public Connection cerrarConexion() throws SQLException{
        conexion.close();
        conexion=null; 
        return conexion;
    }
     public static void main(String[] args) {
        new ConexionDB();
    }
    
}
