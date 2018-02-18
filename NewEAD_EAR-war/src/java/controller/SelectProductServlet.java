/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sb.ProductsFacadeLocal;

/**
 *
 * @author quocq
 */
@WebServlet(name = "SelectProductServlet", urlPatterns = {"/SelectProductServlet"})
public class SelectProductServlet extends HttpServlet {

    final int NUM = 8;
    

    @EJB
    private ProductsFacadeLocal productsFacade;
    
   
    
    List<Integer> page = new ArrayList<>();
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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ProductSelectServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductSelectServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
    
//    @EJB
//    private sb.ProductsFacade testFacade;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
//        request.setAttribute("list", testFacade.findAll()) ;
//        request.setAttribute("list", productsFacade.findAll());
//        int i = productsFacade.findAll().size()/NUM;
//        for(int j = 1; j <= i; j++)
//        {
//            page.add(j);
//            System.out.println(j);
//        }
//        request.setAttribute("PageNum", page);
        
//        request.setAttribute("list", productsFacade.findRange(new int[]{0,9}));

        request.setAttribute("list", productsFacade.findRange(new int[]{0,3}));
        
        request.getRequestDispatcher("views/index.jsp").forward(request, response);
        
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
