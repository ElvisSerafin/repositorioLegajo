/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import conf.conexion;
import interfaces.InterfaceLink;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Diego Arturo
 */
public class LinkDAO implements InterfaceLink{
  private String sql;
    private Connection cn;
    private PreparedStatement ps;
    private ResultSet rs;
    @Override
    public boolean add(Object o) {
        sql ="INSERT INTO link(LINK,"
                + "ICON, ORDEN, ESTADO) VALUES(?,?,?,?)";
        Map <String, Object> m=(Map <String, Object>) o;
         try {
            cn= conexion.getConnection();
            ps= cn.prepareStatement(sql);
            ps.setString(1, m.get("link").toString());
            ps.setString(2, m.get("ic").toString());
            ps.setInt(3, Integer.parseInt(m.get("ord").toString()));
            ps.setString(4, m.get("est").toString());
            
            int r= ps.executeUpdate();
            return r>0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        
         }
    @Override
    public boolean edit(Object o) {
         sql = "UPDATE link SET LINK=?,"
                + "ICON=?,ORDEN=?,ESTADO=? WHERE idLINK=?";
        Map<String, Object> m = (Map<String, Object>) o;
        try {
            cn = conexion.getConnection();
            ps = cn.prepareStatement(sql);
            ps.setString(1, m.get("link").toString());
            ps.setString(2, m.get("ic").toString());
            ps.setString(3, m.get("ord").toString());
            ps.setString(4, m.get("est").toString());
            ps.setString(5, m.get("id").toString());
            
            int r = ps.executeUpdate();
            return r > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }


    @Override
    public boolean remove(Object o) {
       sql = "DELETE FROM Link WHERE idLink=?";
        Map<String, Object> m = (Map<String, Object>) o;
        try {
            cn = conexion.getConnection();
            ps = cn.prepareStatement(sql);
            ps.setString(1, m.get("id").toString());
            int r = ps.executeUpdate();
            return r > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public ArrayList<Map<String, ?>> lista() {
        sql = "SELECT * FROM Link";
        ArrayList<Map<String, ?>> listform = new ArrayList<Map<String, ?>>();
        try {
            cn = conexion.getConnection();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> m = new HashMap<String, Object>();

                m.put("id", rs.getString("idLink"));
                m.put("a", rs.getString("link"));
                m.put("b", rs.getString("ic"));
                m.put("c", rs.getString("ord"));
                m.put("d", rs.getDate("est"));
                
                listform.add(m);

            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;

        }
        return listform;

    }
    
}
