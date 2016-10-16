/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import conf.conexion;
import interfaces.InterfaceLibro;
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
public class PubliLibroDAO implements InterfaceLibro{
        private String sql;
    private Connection cn;
    private PreparedStatement ps;
    private ResultSet rs;

    @Override
    public ArrayList<Map<String, ?>> listaLibro() {
       sql="SELECT * FROM publiclibros";
   ArrayList<Map<String, ?>> listaLibro= new ArrayList<Map<String, ?>>();
        try {
            cn= conexion.getConnection();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Map<String,Object> a = new HashMap<String, Object>();
                a.put("a", rs.getString("Nlibros"));
                a.put("b", rs.getString("Titulo"));
                a.put("c", rs.getString("TipoLibro"));
                a.put("d", rs.getString("Comentario"));
                a.put("e", rs.getDate("Anho"));
                listaLibro.add(a);
            }
            } catch (Exception e) {
                    e.printStackTrace();
               return null;
        
    }
        return listaLibro;  }

    @Override
    public boolean addLibro(Object o) {
       sql="Insert into publiclibros(idPersona, Nlibros, Titulo, TipoLibro," 
            + "Comentario, Anho) VALUES(?,?,?,?,?,?)"; 
    Map<String,Object> a= (Map<String,Object>) o;
        try {
           cn=conexion.getConnection();
            ps=cn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(a.get("idp").toString()));
            ps.setString(2, a.get("nlib").toString()); 
            ps.setString(3, a.get("tit").toString()); 
            ps.setString(4, a.get("tipl").toString()); 
            ps.setString(5, a.get("com").toString()); 
            ps.setString(6, a.get("an").toString()); 
            int r = ps.executeUpdate();
            return r > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return  false;
        } }
}
