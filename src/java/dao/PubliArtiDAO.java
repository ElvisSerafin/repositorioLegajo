/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import conf.conexion;
import interfaces.InterfaceArti;
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
public class PubliArtiDAO implements InterfaceArti{
    private String sql;
    private Connection cn;
    private PreparedStatement ps;
    private ResultSet rs;  

    @Override
    public ArrayList<Map<String, ?>> listaArti() {
            sql="SELECT * FROM publicaart";
   ArrayList<Map<String, ?>> listaArti= new ArrayList<Map<String, ?>>();
        try {
           cn= conexion.getConnection();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
                Map<String,Object> a = new HashMap<String, Object>();
                a.put("a", rs.getDate("Anho"));
                a.put("b", rs.getString("TipoPublica"));
                a.put("c", rs.getString("Titulo"));
                a.put("d", rs.getString("NombreMedio"));
                a.put("e", rs.getString("Editorial"));
                a.put("f", rs.getString("ISBN_ISNN"));
                a.put("g", rs.getString("Npaginas"));
                a.put("h", rs.getString("Lugar"));
                listaArti.add(a); 
            }
        } catch (Exception e) {
                e.printStackTrace();
               return null;
                }
        
   return listaArti; 
    }

    @Override
    public boolean addArti(Object o) {
        sql="Insert into publicaart(idPersona, Anho, TipoPublica, Titulo," 
            + "NombreMedio, Editorial, ISBN_ISNN, Npaginas, Lugar) VALUES(?,?,?,?,?,?,?,?,?)"; 
    Map<String,Object> a= (Map<String,Object>) o;
        try {
           cn=conexion.getConnection();
            ps=cn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(a.get("idp").toString()));
            ps.setString(2, a.get("año").toString()); 
            ps.setString(3, a.get("tipp").toString()); 
            ps.setString(4, a.get("tit").toString()); 
            ps.setString(5, a.get("nomb").toString()); 
            ps.setString(6, a.get("edi").toString()); 
            ps.setString(7, a.get("is").toString()); 
            ps.setInt(8, Integer.parseInt(a.get("np").toString())); 
            ps.setString(9, a.get("lug").toString()); 
            int r = ps.executeUpdate();
            return r > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return  false;
        } }

}
