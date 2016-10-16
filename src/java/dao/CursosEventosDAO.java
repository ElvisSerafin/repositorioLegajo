/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;


import conf.conexion;
import interfaces.CursoInterface;
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
public class CursosEventosDAO  implements CursoInterface{
      private String sql;
    private Connection cn;
    private PreparedStatement ps;
    private ResultSet rs;

    @Override
    public boolean add(Object o) {
         sql ="INSERT INTO cursoseventos(idPersona,"
                + "Anho,Evento,TAsistencia, TipoEvento, EntidadOrganiza, Horas_Creditos, Lugar) VALUES(?,?,?,?,?,?,?,?)";
        Map <String, Object> m=(Map <String, Object>) o;
         try {
            cn= conexion.getConnection();
            ps= cn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(m.get("idp").toString()));
            ps.setString(2, m.get("fecha").toString());
            ps.setString(3, m.get("even").toString());
            ps.setString(4, m.get("asi").toString());
            ps.setString(5, m.get("tipoeven").toString());
            ps.setString(6, m.get("entidad").toString());
            ps.setString(7, m.get("horascre").toString());
            ps.setString(8, m.get("lugar").toString());
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
        sql="SELECT * FROM CURSOSEVENTOS";
        ArrayList<Map<String, ?>> lista=new ArrayList<Map<String,?>>();
         
        try {
            cn= conexion.getConnection();
            ps=cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while(rs.next()){
            Map<String,Object> m= new HashMap<String,Object>();
            m.put("fecha", rs.getString("Anho"));
            m.put("even", rs.getString("Evento"));
            m.put("asi", rs.getString("TAsistencia"));
            m.put("tipoeven", rs.getString("TipoEvento"));
            m.put("entidad", rs.getString("EntidadOrganiza"));
            m.put("horascre", rs.getString("Horas_Creditos"));
            m.put("lugar", rs.getString("Lugar"));
            lista.add(m);
            }
        } catch (Exception e) {
            e.printStackTrace();
        
          return null;
        
           }
    return lista;
    
}
}