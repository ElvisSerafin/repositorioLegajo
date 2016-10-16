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
public class ProgDAO implements interfaces.InterfaceProg {
    private String sql;
    private Connection cn;
    private PreparedStatement ps;
    private ResultSet rs;

    @Override
    public ArrayList<Map<String, ?>> listaProg() {
   sql="SELECT * FROM programas";
   ArrayList<Map<String, ?>> listaProg= new ArrayList<Map<String, ?>>();
        try {
           cn= conexion.getConnection();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Map<String,Object> a = new HashMap<String, Object>();
                a.put("a", rs.getDate("Anho"));
                a.put("c", rs.getString("Titulo"));
                a.put("d", rs.getInt("Beneficiarios"));
                a.put("g", rs.getInt("Nparticipante"));
                a.put("h", rs.getString("Lugar"));
                listaProg.add(a); 
            }
        } catch (Exception e) {
                e.printStackTrace();
               return null;
                }
        
   return listaProg; 
    }

    @Override
    public boolean addProg(Object o) {
      sql="Insert into programas(idPersona, Anho, Titulo," 
            + "Beneficiarios,Nparticipante, Lugar) VALUES(?,?,?,?,?,?)"; 
    Map<String,Object> a= (Map<String,Object>) o;
        try {
           cn=conexion.getConnection();
            ps=cn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(a.get("idp").toString()));
            ps.setString(2, a.get("año").toString()); 
            ps.setString(3, a.get("tit").toString()); 
            ps.setInt(4, Integer.parseInt(a.get("bene").toString())); 
            ps.setInt(5, Integer.parseInt( a.get("npar").toString())); 
            ps.setString(6, a.get("lug").toString()); 
            int r = ps.executeUpdate();
            return r > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return  false;
        } }

}
