/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conf;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Kiefer
 */
public class conexion {
     private static final String url = "jdbc:mysql://localhost:3306/bd_legajos";
    private static final String driver = "com.mysql.jdbc.Driver";
    private static final String user = "root";
    private static final String clave = "root";
    private static Connection conn = null;
     
    
    public static Connection getConnection(){
        try {
            Class.forName(driver);
            if (conn==null){
                conn=DriverManager.getConnection(url,user,clave);
                
            }
        } catch (SQLException e) {
            System.out.println("error: "+e);
        }catch(ClassNotFoundException c){
            System.out.println("error");
        }
 return conn;
    
}
    
}
