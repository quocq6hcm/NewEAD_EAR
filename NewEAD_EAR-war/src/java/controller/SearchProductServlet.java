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
import java.util.Iterator;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ProductSearchResult;
import model.Products;

/**
 *
 * @author quocq
 */
@WebServlet(name = "SearchProductServlet", urlPatterns = {"/SearchProductServlet"})
public class SearchProductServlet extends HttpServlet {

    public List<model.ProductSearchResult> rss = new ArrayList<>();
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
            out.println("<title>Servlet SearchProductServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchProductServlet at " + request.getContextPath() + "</h1>");
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
    private sb.ProductsFacadeLocal pFacade;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("okaaa");
        String text = request.getParameter("searchText");
        String type = request.getParameter("searchType");

        System.out.println("text: " + text);

        System.out.println("type: " + type);

        String priceFrom = request.getParameter("priceFrom");

        String priceTo = request.getParameter("priceTo");

        List<model.ProductSearchResult> rs = new ArrayList<>();

       // rss = new ArrayList<>();

        if (type.equalsIgnoreCase("Name")) {
            System.out.println("run nameeeee");
            for (Products p : pFacade.findAll()) {
                if (p.getProductName().contains(text)) {
                    rs.add(new ProductSearchResult(
                            p.getProductId(),
                            p.getProductName(),
                            p.getProductImage(),
                            p.getProductPrice().toString(),
                            p.getProductDetail(),
                            p.getManufacturerId().getManufacturerName()
                    ));

                }
            }
        } else if (type.equalsIgnoreCase("Manufacturer")) {
            for (Products p : pFacade.findAll()) {
                if (p.getManufacturerId().getManufacturerName().contains(text)) {
                    rs.add(new ProductSearchResult(
                            p.getProductId(),
                            p.getProductName(),
                            p.getProductImage(),
                            p.getProductPrice().toString(),
                            p.getProductDetail(),
                            p.getManufacturerId().getManufacturerName()
                    ));
                }
            }
        }


        rss = rs;
        if (priceFrom.length() > 0 && priceTo.length() > 0) {
            rss = new ArrayList<>();
            for (model.ProductSearchResult psr : rs) {
                if (Integer.parseInt(psr.getProductPrice()) >= Integer.parseInt(priceFrom) && Integer.parseInt(psr.getProductPrice()) <= Integer.parseInt(priceTo)) {
                    rss.add(psr);
                }

            }
        }
       

        String json;
        
        json = new Gson().toJson(rss);
        response.setContentType("application/json");

        request.setAttribute("txtSearch", text);

        response.getWriter().println(json);

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
       
        String max = (rss.size()==0)?max=pFacade.findAll().size()+"":rss.size()+"";
        
        String unit = "4";
        System.out.println(max);
        List<String> max_unit;
        max_unit = new ArrayList<>();
        max_unit.add(max);
        max_unit.add(unit);
        
        String json = new Gson().toJson(max_unit);
        
        response.setContentType("application/json");

       

        response.getWriter().println(json);
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
