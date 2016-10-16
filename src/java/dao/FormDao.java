/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import conf.conexion;
import interfaces.InterfaceForm;
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
public class FormDao implements InterfaceForm {

    private String sql;
    private Connection cn;
    private PreparedStatement ps;
    private ResultSet rs;

    @Override
    public ArrayList<Map<String, ?>> listForm() {
        sql = "SELECT * FROM formacionacadeprofe";
        ArrayList<Map<String, ?>> listform = new ArrayList<Map<String, ?>>();
        try {
            cn = conexion.getConnection();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, Object> m = new HashMap<String, Object>();

                m.put("id", rs.getString("idFormacionAcadeProfe"));
                m.put("a", rs.getString("Institucion"));
                m.put("b", rs.getString("Grado"));
                m.put("c", rs.getString("Especialidad"));
                m.put("d", rs.getDate("FechaInicio"));
                m.put("e", rs.getDate("FchaFin"));
                m.put("f", rs.getString("Estado"));
                m.put("g", rs.getString("Documentacion"));

                listform.add(m);

            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;

        }
        return listform;

    }

    @Override
    public boolean addform(Object o) {
        sql = "INSERT INTO formacionacadeprofe(idPersona,Institucion,Grado,Especialidad,FechaInicio,"
                + "FchaFin,Estado,Documentacion) VALUES(?,?,?,?,?,?,?,?)";
        Map<String, Object> m = (Map<String, Object>) o;
        try {
            cn = conexion.getConnection();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, Integer.parseInt(m.get("idp").toString()));
            ps.setString(2, m.get("insti").toString());
            ps.setString(3, m.get("gra").toString());
            ps.setString(4, m.get("esp").toString());
            ps.setString(5, m.get("fe1").toString());
            ps.setString(6, m.get("fe2").toString());
            ps.setString(7, m.get("est").toString());
            ps.setString(8, m.get("docum").toString());
            int r = ps.executeUpdate();
            return r > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }

    }

    @Override
    public boolean editform(Object o) {
        sql = "UPDATE formacionacadeprofe SET Institucion=?,Grado=?,Especialidad=?,FechaInicio=?,"
                + "FchaFin=?,Estado=?,Documentacion=? WHERE idFormacionAcadeProfe=?";
        Map<String, Object> m = (Map<String, Object>) o;
        try {
            cn = conexion.getConnection();
            ps = cn.prepareStatement(sql);
            ps.setString(1, m.get("insti").toString());
            ps.setString(2, m.get("gra").toString());
            ps.setString(3, m.get("esp").toString());
            ps.setString(4, m.get("fe1").toString());
            ps.setString(5, m.get("fe2").toString());
            ps.setString(6, m.get("est").toString());
            ps.setString(7, m.get("docum").toString());
            ps.setString(8, m.get("id").toString());
            int r = ps.executeUpdate();
            return r > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean deleteform(Object o) {
        sql = "DELETE FROM formacionacadeprofe WHERE idFormacionAcadeProfe=?";
        Map<String, Object> m = (Map<String, Object>) o;
        try {
            cn = conexion.getConnection();
            ps = cn.prepareStatement(sql);
            ps.setString(1, m.get("id").toString());
            int r = ps.executeUpdate();
            return r > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

}
