/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import com.google.gson.Gson;
import dao.DocenciaDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kiefer
 */
@WebServlet(name = "Docencia", urlPatterns = {"/doc"})
public class Docencia extends HttpServlet {
    private DocenciaDao udao = new DocenciaDao();
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
            if(opc.equals("listaDoc")){
                ArrayList<Map<String,?>> listaDoc= udao.listaDocU();
                rpta.put("listaDoc", listaDoc);
                
            }
            
            if (opc.equals("addDoc")) {
                String idp, insti, categoria, fe1, fe2,tiemp,lugar;
                
                idp = request.getSession().getAttribute("idPersona").toString();
                insti = request.getParameter("insti");
                categoria = request.getParameter("cat");
                fe1 = request.getParameter("fe1");
                fe2 = request.getParameter("fe2");
                tiemp = request.getParameter("tiem");
                lugar = request.getParameter("lugar");
                

                Map<String, Object> a = new HashMap<String, Object>();
                a.put("idp", idp);
                a.put("insti", insti);
                a.put("cat", categoria);
                a.put("fe1", fe1);
                a.put("fe2", fe2);
                a.put("tiem", tiemp);
                a.put("lugar", lugar);
               
                boolean r = udao.addDocU(a);
                rpta.put("addDoc", r);
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
