/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import com.google.gson.Gson;
import dao.CursosEventosDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kiefer
 */
public class CursosEventos extends HttpServlet {

    private CursosEventosDAO curdao = new CursosEventosDAO();
    Map<String, Object> rpta = new HashMap<String,Object>();
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String opc = request.getParameter("opc");
        try {
             if (opc.equals("listar")) {
                ArrayList<Map<String, ?>> lista = curdao.lista();
                rpta.put("lista", lista);
            }
              if (opc.equals("add")) {
                String idp, fecha, even, asi, tipoeven, entidad, horascre, lugar;
                idp = request.getSession().getAttribute("idPersona").toString();
                fecha = request.getParameter("fecha");
                even = request.getParameter("even");
                asi = request.getParameter("asi");
                tipoeven = request.getParameter("tipoeven");
                entidad = request.getParameter("entidad");
                horascre = request.getParameter("horascre");
                lugar = request.getParameter("lugar");

                Map<String, Object> a = new HashMap<String, Object>();
                a.put("idp", idp);
                a.put("fecha", fecha);
                a.put("even", even);
                a.put("asi", asi);
                a.put("tipoeven", tipoeven);
                a.put("entidad", entidad);
                a.put("horascre", horascre);
                a.put("lugar", lugar);
                boolean r = curdao.add(a);
                rpta.put("addC", r);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        Gson gson = new Gson();
        out.println(gson.toJson(rpta));
        out.flush();
        out.close();
    

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
