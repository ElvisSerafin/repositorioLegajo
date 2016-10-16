/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import conf.conexion;
import interfaces.InterfaceTic;
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
public class TicDao implements InterfaceTic{
     private String sql;
    private Connection cn;
    private PreparedStatement ps;
    private ResultSet rs;

    @Override
    public ArrayList<Map<String, ?>> listaTic() {
        sql = "SELECT * FROM tic";
        ArrayList<Map<String, ?>> listTic = new ArrayList<Map<String, ?>>();
        try {
            cn = conexion.getConnection();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> m = new HashMap<String, Object>();
                m.put("a", rs.getString("Curso"));
                m.put("b", rs.getString("Dominio"));
                m.put("c", rs.getString("Modalidad"));
                m.put("d", rs.getString("Institucion"));
                m.put("e", rs.getString("Certificado"));
          
                listTic.add(m);

            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;

        }
        return listTic; 
        
    }

    @Override
    public boolean addTic(Object o) {
        
        sql="INSERT INTO tic(idPersona,Curso,Dominio,Modalidad,Institucion,"
                + "Certificado) VALUES(?,?,?,?,?,?)";
        Map<String,Object> m= (Map<String,Object>) o;
        try {
            cn=conexion.getConnection();
            ps=cn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(m.get("idp").toString()));
            ps.setString(2, m.get("cur").toString());
            ps.setString(3, m.get("domi").toString());
            ps.setString(4, m.get("mod").toString());
            ps.setString(5, m.get("insti").toString());
            ps.setString(6, m.get("cert").toString());
           
            int r = ps.executeUpdate();
            return r > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return  false;
        }
        
        
    }
    
}
