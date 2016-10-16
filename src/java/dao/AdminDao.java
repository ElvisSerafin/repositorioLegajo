/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import conf.conexion;
import interfaces.InterfaceExpAdmi;
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
public class AdminDao implements InterfaceExpAdmi{
private String sql;
    private Connection cn;
    private PreparedStatement ps;
    private ResultSet rs;
    @Override
    public ArrayList<Map<String, ?>> listaradm() {
         sql="SELECT * FROM EXP_ADMINISTRATIVA";
        ArrayList<Map<String, ?>> listaradm= new ArrayList<Map<String, ?>>();
        try {
             cn = conexion.getConnection();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Map<String,Object> m = new HashMap<String, Object>();
                m.put("a", rs.getString("Institucion"));
                m.put("b", rs.getString("Cargo"));
                m.put("c", rs.getString("Regimen"));
                m.put("d", rs.getDate("Fechaini"));
                m.put("e", rs.getDate("Fechafin"));
                m.put("f", rs.getString("Resolucion"));
                m.put("g", rs.getString("Lugar"));
                m.put("h", rs.getString("DocumentAdjunt"));
                listaradm.add(m);
            }
        } catch (Exception e) {
             e.printStackTrace();
            return null;
        }
        return listaradm;
    }

    @Override
    public boolean addAdm(Object o) {
        sql="INSERT INTO exp_administrativa(idPersona,Institucion,Cargo,Regimen,Fechaini,"
                + "Fechafin,Resolucion,Lugar,DocumentAdjunt) VALUES(?,?,?,?,?,?,?,?,?)";
        Map<String,Object> m= (Map<String,Object>) o;
        try {
            cn=conexion.getConnection();
            ps=cn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(m.get("idp").toString()));
            ps.setString(2, m.get("insti").toString());
            ps.setString(3, m.get("car").toString());
            ps.setString(4, m.get("reg").toString());
            ps.setString(5, m.get("fe1").toString());
            ps.setString(6, m.get("fe2").toString());
            ps.setString(7, m.get("reso").toString());
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
