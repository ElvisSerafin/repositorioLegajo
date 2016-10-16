/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import com.google.gson.Gson;
import dao.CapacitacionFormalDAO;
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
public class CapacitacionFormal extends HttpServlet {
    
    private CapacitacionFormalDAO capdao = new CapacitacionFormalDAO();
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
             if (opc.equals("listar1")) {
                ArrayList<Map<String, ?>> lista = capdao.lista();
                rpta.put("listaC", lista);
            }
              if (opc.equals("add")) {
                String idp, an, tip, tit, ins, feci, fecf,ho,lu;
                idp = request.getSession().getAttribute("idPersona").toString();
                an = request.getParameter("an");
                tip = request.getParameter("tip");
                tit = request.getParameter("tit");
                ins = request.getParameter("ins");
                feci = request.getParameter("feci");
                fecf = request.getParameter("fecf");
                ho = request.getParameter("ho");
                lu = request.getParameter("lu");

                Map<String, Object> a = new HashMap<String, Object>();
                a.put("idp", idp);
                a.put("an",an);
                a.put("tip", tip);
                a.put("tit", tit);
                a.put("ins", ins);
                a.put("feci", feci);
                a.put("fecf", fecf);
                a.put("ho", ho);
                a.put("lu", lu);
                boolean r = capdao.add(a);
                rpta.put("addCapa", r);
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
