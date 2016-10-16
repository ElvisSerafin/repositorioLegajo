/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import com.google.gson.Gson;
import dao.IdiomaDao;
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
public class Idioma extends HttpServlet {
    private IdiomaDao udao = new IdiomaDao();
 Map<String, Object> rpta = new HashMap<String, Object>();

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
            if(opc.equals("listaIdi")){
                ArrayList<Map<String,?>> listaIdioma= udao.listaIdioma();
                rpta.put("listaIdio", listaIdioma);
                
            }
            
            if (opc.equals("addIdi")) {
                String idp, idi,niv, domi,fecha,insti,cert;
                
                idp = request.getSession().getAttribute("idPersona").toString();
                idi = request.getParameter("idi");
                niv = request.getParameter("niv");
                domi = request.getParameter("domi");
                insti = request.getParameter("insti");
                fecha =request.getParameter("fecha");
                cert =request.getParameter("cert");
                

                Map<String, Object> a = new HashMap<String, Object>();
                a.put("idp", idp);
                a.put("idi", idi);
                a.put("niv", niv);
                a.put("domi", domi);
                a.put("insti", insti);
                a.put("fecha", fecha);
                a.put("cert", cert);
               
                boolean r = udao.addIdioma(a);
                rpta.put("addIdioma", r);
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
