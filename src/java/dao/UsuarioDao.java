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
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Kiefer
 */
public class UsuarioDao {

    private String sql;
    private Connection cn;
    private PreparedStatement ps;
    private ResultSet rs;

    public Map<String, Object> validar(String user, String clave) {
        sql="SELECT U.*,P.* FROM USUARIO U, PERSONA P WHERE USUARIO=? AND CLAVE=? AND u.Persona_idPersona =p.idPersona";
        Map<String, Object> rpta = new HashMap<String, Object>();
        try {
            cn = conexion.getConnection();
            ps = cn.prepareStatement(sql);
            ps.setString(1, user);
            ps.setString(2, clave);
            rs = ps.executeQuery();
            int cont=0;
            while (rs.next()) {                
                cont =cont+1;
                rpta.put("idUsuario", rs.getInt("idUsuario"));
                rpta.put("idPersona", rs.getInt("Persona_idPersona"));
                rpta.put("Usuario", rs.getString("Usuario"));
                rpta.put("tipoUsuario", rs.getString("tipoUsuario"));
                rpta.put("nom", rs.getString("Nombres"));
                rpta.put("apell", rs.getString("Apellidos"));
            }
            if (cont<=1) {
                return rpta;
            }else{
                return null;
            }
                        
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

}
