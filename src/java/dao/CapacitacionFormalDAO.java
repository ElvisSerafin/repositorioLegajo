/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import conf.conexion;
import interfaces.CapacitacionFormal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author GABY
 */
public class CapacitacionFormalDAO implements CapacitacionFormal{

     private String sql;
    private Connection cn;
    private PreparedStatement ps;
    private ResultSet rs;
    
    @Override
    public boolean add(Object o) {
         sql ="INSERT INTO capacitacionformaldocencia(idPersona,"
                + "Anho,Tipo, Titulo, Institucion, FechaIni, FechaFin,Horas,Lugar) VALUES(?,?,?,?,?,?,?,?,?)";
        Map <String, Object> m=(Map <String, Object>) o;
         try {
            cn= conexion.getConnection();
            ps= cn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(m.get("idp").toString()));
            ps.setString(2, m.get("an").toString());
            ps.setString(3, m.get("tip").toString());
            ps.setString(4, m.get("tit").toString());
            ps.setString(5, m.get("ins").toString());
            ps.setString(6, m.get("feci").toString());
            ps.setString(7, m.get("fecf").toString());
            ps.setInt(8, Integer.parseInt(m.get("ho").toString()));
            ps.setString(9, m.get("lu").toString());
            int r= ps.executeUpdate();
            return r>0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean edit(Object o) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean remove(Object o) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public ArrayList<Map<String, ?>> lista() {
 sql="SELECT * FROM capacitacionformaldocencia";
        ArrayList<Map<String, ?>> lista=new ArrayList<Map<String,?>>();
         
        try {
            cn= conexion.getConnection();
            ps=cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
            Map<String,Object> m= new HashMap<String,Object>();
            m.put("an", rs.getString("Anho"));
            m.put("tip", rs.getString("Tipo"));
            m.put("tit", rs.getString("Titulo"));
            m.put("ins", rs.getString("Institucion"));
            m.put("feci", rs.getString("FechaIni"));
            m.put("fecf", rs.getString("FechaFin"));     
            m.put("ho", rs.getInt("Horas"));     
            m.put("lu", rs.getString("Lugar"));
            lista.add(m);
            }
        } catch (Exception e) {
            e.printStackTrace();
        
          return null;
        
           }
    return lista;
    }
    
}
