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
 * @author MARICUCHA
 */
public class InvestigacionDAO implements interfaces.InterfaceInv{
     private String sql;
    private Connection cn;
    private PreparedStatement ps;
    private ResultSet rs;

    @Override
    public ArrayList<Map<String, ?>> listaInv() {
    sql="SELECT * FROM investigacion";
     ArrayList<Map<String, ?>> listaInv= new ArrayList<Map<String, ?>>();
        try {
            cn= conexion.getConnection();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Map<String,Object> a = new HashMap<String, Object>();
                a.put("a", rs.getDate("Anho"));
                a.put("b", rs.getString("Titulo"));
                a.put("c", rs.getString("Nresolucion"));
                listaInv.add(a);
            }
        } catch (Exception e) {
            e.printStackTrace();
               return null;
        }
        return listaInv;
    }

    @Override
    public boolean addInv(Object o) {
    sql="Insert into investigacion(idPersona, Anho, Titulo,Nresolucion)VALUES(?,?,?,?)";
    Map<String,Object> a= (Map<String,Object>) o;   
        try {
          cn=conexion.getConnection();
            ps=cn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(a.get("idp").toString()));
            ps.setString(2, a.get("año").toString()); 
            ps.setString(3, a.get("tit").toString()); 
            ps.setString(4, a.get("reso").toString());    
            int r = ps.executeUpdate();
            return r > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return  false;
        }
    }
    
}
