/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import com.google.gson.Gson;
import dao.FormDao;
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
@WebServlet(name = "Formacion", urlPatterns = {"/form"})
public class Formacion extends HttpServlet {
    private FormDao fodao= new FormDao();
    Map<String,Object> rpta= new HashMap<String, Object>();
            
    

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
            if(opc.equals("listForm")){
                ArrayList<Map<String,?>> listForm= fodao.listForm();
              rpta.put("listForm", listForm);
                
                
            }
            if (opc.equals("addForm")) {
                String idp, insti, grado, esp, fe1, fe2,est,docu;
                
                idp = request.getSession().getAttribute("idPersona").toString();
                insti = request.getParameter("insti");
                grado = request.getParameter("gra");
                esp = request.getParameter("esp");
                fe1 = request.getParameter("fe1");
                fe2 = request.getParameter("fe2");
                est = request.getParameter("est");
                docu = request.getParameter("docum");
                

                Map<String, Object> a = new HashMap<String, Object>();
                a.put("idp", idp);
                a.put("insti", insti);
                a.put("gra", grado);
                a.put("esp", esp);
                a.put("fe1", fe1);
                a.put("fe2", fe2);
                a.put("est", est);
                a.put("docum", docu);
                
                boolean r = fodao.addform(a);
                rpta.put("addform", r);
            }
            
            if (opc.equals("editForm")) {
                String idp, insti, grado, esp, fe1, fe2,est,docu,id;
                
                idp = request.getSession().getAttribute("idPersona").toString();
                insti = request.getParameter("insti");
                grado = request.getParameter("gra");
                esp = request.getParameter("esp");
                fe1 = request.getParameter("fe1");
                fe2 = request.getParameter("fe2");
                est = request.getParameter("est");
                docu = request.getParameter("docum");
                id = request.getParameter("id");

                Map<String, Object> a = new HashMap<String, Object>();
                a.put("idp", idp);
                a.put("insti", insti);
                a.put("gra", grado);
                a.put("esp", esp);
                a.put("fe1", fe1);
                a.put("fe2", fe2);
                a.put("est", est);
                a.put("docum", docu);
                a.put("id", id);
                boolean r = fodao.editform(a);
                rpta.put("editform", r);
            }
            if (opc.equals("deleteform")) {
                String id = request.getParameter("id");
                Map<String, Object> a = new HashMap<String, Object>();
                a.put("id", id);
                boolean r = fodao.deleteform(a);
                rpta.put("deleteform", r);
            }
            
        } catch (Exception e) {
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
