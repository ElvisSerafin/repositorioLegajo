/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import conf.conexion;
import interfaces.InterfaceDetRol;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Map;

/**
 *
 * @author Diego Arturo
 */
public class DetRolDAO implements InterfaceDetRol{
    private String sql;
    private Connection cn;
    private PreparedStatement ps;
    private ResultSet rs;
    @Override
    public boolean add(Object o) {
      sql ="INSERT INTO det_rol(idRol,"
                + "Persona_idPersona, idUsuario) VALUES(?,?,?)";
        Map <String, Object> m=(Map <String, Object>) o;
         try {
            cn= conexion.getConnection();
            ps= cn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(m.get("idrol").toString()));
            ps.setInt(2, Integer.parseInt(m.get("idper").toString()));
            ps.setInt(2, Integer.parseInt(m.get("idUsu").toString()));
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
        sql = "DELETE FROM det_rol WHERE idDET_ROL=?";
        Map<String, Object> m = (Map<String, Object>) o;
        try {
            cn = conexion.getConnection();
            ps = cn.prepareStatement(sql);
            ps.setString(1, m.get("iddetrol").toString());
            int r = ps.executeUpdate();
            return r > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public ArrayList<Map<String, ?>> lista() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
