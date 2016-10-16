/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import conf.conexion;
import interfaces.InterfaceIdioma;
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
public class IdiomaDao implements InterfaceIdioma{
    private String sql;
    private Connection cn;
    private PreparedStatement ps;
    private ResultSet rs;
    @Override
    public ArrayList<Map<String, ?>> listaIdioma() {
        sql="SELECT * FROM idioma";
        ArrayList<Map<String, ?>> listaId= new ArrayList<Map<String, ?>>();
        try {
             cn = conexion.getConnection();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Map<String,Object> m = new HashMap<String, Object>();
                m.put("a", rs.getString("Idioma"));
                m.put("b", rs.getString("Nivel"));
                m.put("c", rs.getString("Dominio"));
                m.put("d", rs.getString("Insititucion"));
                m.put("e", rs.getDate("Anho"));
                m.put("f", rs.getString("Cerificado"));
           
                listaId.add(m);
                
                
            }
        } catch (Exception e) {
             e.printStackTrace();
            return null;
            
        }
        return listaId;
    }

    @Override
    public boolean addIdioma(Object o) {
        sql="INSERT INTO idioma(idPersona,Idioma,Nivel,Dominio,Insititucion,"
                + "Anho,Cerificado) VALUES(?,?,?,?,?,?,?)";
        Map<String,Object> m= (Map<String,Object>) o;
        try {
            cn=conexion.getConnection();
            ps=cn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(m.get("idp").toString()));
            ps.setString(2, m.get("idi").toString());
            ps.setString(3, m.get("niv").toString());
            ps.setString(4, m.get("domi").toString());
            ps.setString(5, m.get("insti").toString());
            ps.setString(6, m.get("fecha").toString());
            ps.setString(7, m.get("cert").toString());
             int r = ps.executeUpdate();
            return r > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return  false;
        }
        
    }
}
    

