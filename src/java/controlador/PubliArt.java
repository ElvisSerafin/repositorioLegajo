/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import com.google.gson.Gson;
import dao.PubliArtiDAO;
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
public class PubliArt extends HttpServlet {
private PubliArtiDAO pdao = new PubliArtiDAO();
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
            if(opc.equals("listaArti")){
            ArrayList<Map<String,?>>listaArti=pdao.listaArti();
            rpta.put("lista", listaArti);
            }
            if (opc.equals("addArti")){
            String idp, año, tipp, tit, nomb, edi, is, np, lug;
        idp = request.getSession().getAttribute("idPersona").toString();
        año = request.getParameter("año");
        tipp = request.getParameter("tipp");
        tit = request.getParameter("tit");
        nomb = request.getParameter("nomb");
        edi = request.getParameter("edi");
        is = request.getParameter("is");
        np = request.getParameter("np");
        lug = request.getParameter("lug");
        
        Map<String, Object> a= new HashMap<String, Object>();
        a.put("idp", idp);
        a.put("año", año);
        a.put("tipp", tipp);
        a.put("tit", tit);
        a.put("nomb", nomb);
        a.put("edi", edi);
        a.put("is", is);
        a.put("np", np);
        a.put("lug", lug);
        boolean r= pdao.addArti(a);
        rpta.put("addArti", r);
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
