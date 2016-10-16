/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import conf.conexion;
import interfaces.InterfaceDocenciaU;
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
public class DocenciaDao implements InterfaceDocenciaU{
    private String sql;
    private Connection cn;
    private PreparedStatement ps;
    private ResultSet rs;

    @Override
    public ArrayList<Map<String, ?>> listaDocU() {
        sql = "SELECT * FROM docencia_univers";
        ArrayList<Map<String, ?>> listcat = new ArrayList<Map<String, ?>>();
        try {
            cn = conexion.getConnection();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> m = new HashMap<String, Object>();
                m.put("a", rs.getString("Institucion"));
                m.put("b", rs.getString("Categoria"));
                m.put("c", rs.getDate("FECHA_INI"));
                m.put("d", rs.getDate("FECHA_FIN"));
                m.put("e", rs.getString("TotalTiempo"));
                m.put("f", rs.getString("Lugar"));

                listcat.add(m);

            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;

        }
        return listcat;
        
    }

    @Override
    public boolean addDocU(Object o) {
        sql="INSERT INTO docencia_univers(idPersona,Institucion,Categoria,FECHA_INI,"
                + "FECHA_FIN,TotalTiempo,Lugar) VALUES(?,?,?,?,?,?,?)";
        Map<String,Object> m= (Map<String,Object>) o;
        try {
            cn=conexion.getConnection();
            ps=cn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(m.get("idp").toString()));
            ps.setString(2, m.get("insti").toString());
            ps.setString(3, m.get("cat").toString());
            ps.setString(4, m.get("fe1").toString());
            ps.setString(5, m.get("fe2").toString());
            ps.setString(6, m.get("tiem").toString());
            ps.setString(7, m.get("lugar").toString());
            int r = ps.executeUpdate();
            return r > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return  false;
        }
        
    }
    
    
}
