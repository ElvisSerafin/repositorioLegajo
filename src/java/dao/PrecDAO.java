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
public class PrecDAO implements interfaces.InterfacePrec{
    private String sql;
    private Connection cn;
    private PreparedStatement ps;
    private ResultSet rs; 

    @Override
    public ArrayList<Map<String, ?>> listaPrec() {
      sql="SELECT * FROM premiosrec";
   ArrayList<Map<String, ?>> listaPrec= new ArrayList<Map<String, ?>>();
        try {
           cn= conexion.getConnection();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Map<String,Object> a = new HashMap<String, Object>();
                a.put("a", rs.getDate("Fecha"));
                a.put("b", rs.getString("Institucion"));
                a.put("c", rs.getString("Reconocimiento"));
                a.put("d", rs.getString("Lugar"));
                listaPrec.add(a); 
            }
        } catch (Exception e) {
                e.printStackTrace();
               return null;
                }
        
   return listaPrec; 
    }

    @Override
    public boolean addPrec(Object o) {
        sql="Insert into premiosrec(idPersona, Fecha, Institucion, Reconocimiento," 
            + "Lugar) VALUES(?,?,?,?,?)"; 
    Map<String,Object> a= (Map<String,Object>) o;
        try {
           cn=conexion.getConnection();
            ps=cn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(a.get("idp").toString()));
            ps.setString(2, a.get("fec").toString()); 
            ps.setString(3, a.get("inst").toString()); 
            ps.setString(4, a.get("reco").toString()); 
            ps.setString(5, a.get("lug").toString()); 
            int r = ps.executeUpdate();
            return r > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return  false;
        } }

}
