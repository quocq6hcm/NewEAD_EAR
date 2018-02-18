/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Products;

/**
 *
 * @author quocq
 */
@WebServlet(name = "UpdateProductServlet", urlPatterns = {"/UpdateProductServlet"})
public class UpdateProductServlet extends HttpServlet {

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
            out.println("<title>Servlet UpdateProductServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UpdateProductServlet at " + request.getContextPath() + "</h1>");
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
    
    @EJB
    private sb.ManufacturersFacadeLocal mfacade;
    
    @EJB
    private sb.ProductsFacadeLocal pfacade;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String id = request.getParameter("productId").trim();
        model.Products p = new Products();
        p = pfacade.find(id);
        
        request.setAttribute("productId", p.getProductId());
        request.setAttribute("productName", p.getProductName());
        request.setAttribute("productPrice", p.getProductPrice());
        request.setAttribute("productDetail", p.getProductDetail());
        request.setAttribute("productImage", p.getProductImage());
        request.setAttribute("manufacturerId", p.getManufacturerId().getManufacturerId());
        
        request.setAttribute("manu", mfacade.findAll());
        
        request.getRequestDispatcher("views/update.jsp").forward(request, response);
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
        model.Products p = new Products();
        p.setProductId(request.getParameter("productId"));
        p.setProductName(request.getParameter("productName"));
        p.setProductImage(request.getParameter("productImage"));
        p.setProductPrice(Integer.parseInt(request.getParameter("productPrice")));
        p.setProductDetail(request.getParameter("productDetail"));
        p.setManufacturerId(mfacade.find(Integer.parseInt(request.getParameter("manu_id"))));
        
        pfacade.edit(p);
        response.sendRedirect("SelectProductServlet");
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
