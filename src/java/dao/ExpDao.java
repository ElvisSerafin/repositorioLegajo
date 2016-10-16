/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import conf.conexion;
import interfaces.InterfaceExp;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;





/**
 *
 * @author Kiefer
 */
public class ExpDao implements InterfaceExp{
    private String sql;
    private Connection cn;
    private PreparedStatement ps;
    private ResultSet rs;

    @Override
    public ArrayList<Map<String, ?>> listaexp() {
        sql="SELECT * FROM EXP_PROFESIONAL";
        ArrayList<Map<String, ?>> listaexp= new ArrayList<Map<String, ?>>();
        try {
             cn = conexion.getConnection();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Map<String,Object> m = new HashMap<String, Object>();
                m.put("a", rs.getString("Institucion"));
                m.put("b", rs.getString("Cargo"));
                m.put("c", rs.getString("Tipo"));
                m.put("d", rs.getDate("Fecha_INIC"));
                m.put("e", rs.getDate("Fecha_fin"));
                m.put("f", rs.getString("Total_Tiempo"));
                m.put("g", rs.getString("Lugar"));
                m.put("h", rs.getString("Documentacion"));
           
                listaexp.add(m);
                
                
            }
        } catch (Exception e) {
             e.printStackTrace();
            return null;
            
        }
        return listaexp;
        
    }

    @Override
    public boolean addexp(Object o) {
        sql="INSERT INTO exp_profesional(idPersona,Institucion,Cargo,Tipo,Fecha_INIC,"
                + "Fecha_fin,Total_Tiempo,Lugar,Documentacion) VALUES(?,?,?,?,?,?,?,?,?)";
        Map<String,Object> m= (Map<String,Object>) o;
        try {
            cn=conexion.getConnection();
            ps=cn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(m.get("idp").toString()));
            ps.setString(2, m.get("insti").toString());
            ps.setString(3, m.get("car").toString());
            ps.setString(4, m.get("tip").toString());
            ps.setString(5, m.get("fe1").toString());
            ps.setString(6, m.get("fe2").toString());
            ps.setString(7, m.get("tiem").toString());
            ps.setString(8, m.get("lugar").toString());
            ps.setString(9, m.get("docum").toString());
            int r = ps.executeUpdate();
            return r > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return  false;
        }
        
    }
 
 
    
}
