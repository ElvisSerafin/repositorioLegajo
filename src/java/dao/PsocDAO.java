/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import conf.conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Wild
 */
public class PsocDAO implements interfaces.InterfacePsoc {
    private String sql;
    private Connection cn;
    private PreparedStatement ps;
    private ResultSet rs;  

    @Override
    public ArrayList<Map<String, ?>> listaPsoc() {
         sql="SELECT * FROM proysocialextension";
   ArrayList<Map<String, ?>> listaPsoc= new ArrayList<Map<String, ?>>();
        try {
           cn= conexion.getConnection();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Map<String,Object> a = new HashMap<String, Object>();
                a.put("a", rs.getDate("Anho"));
                a.put("b", rs.getString("TituloActividad"));
                a.put("c", rs.getInt("Poblacion"));
                a.put("d", rs.getString("Lugar"));
                a.put("e", rs.getString("TipoActiv"));
                listaPsoc.add(a); 
            }
        } catch (Exception e) {
                e.printStackTrace();
               return null;
                }
        
   return listaPsoc; 
    
    }

    @Override
    public boolean addPsoc(Object o) {
   sql="Insert into proysocialextension(idPersona, Anho, TituloActividad, Poblacion," 
            + "Lugar, TipoActiv) VALUES(?,?,?,?,?,?)"; 
    Map<String,Object> a= (Map<String,Object>) o;
        try {
           cn=conexion.getConnection();
            ps=cn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(a.get("idp").toString()));
            ps.setString(2, a.get("año").toString()); 
            ps.setString(3, a.get("tia").toString()); 
            ps.setInt(4, Integer.parseInt(a.get("pob").toString())); 
            ps.setString(5, a.get("lug").toString()); 
            ps.setString(6, a.get("tipa").toString()); 
            int r = ps.executeUpdate();
            return r > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return  false;
        } }

}
