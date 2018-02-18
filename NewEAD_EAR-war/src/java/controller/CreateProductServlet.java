/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import java.io.PrintWriter;
import java.nio.file.Paths;
import java.util.List;
import java.util.StringTokenizer;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.Products;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author quocq
 */
@WebServlet(name = "CreateProductServlet", urlPatterns = {"/CreateProductServlet"})
public class CreateProductServlet extends HttpServlet {

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
            out.println("<title>Servlet CreateProductServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CreateProductServlet at " + request.getContextPath() + "</h1>");
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
    private sb.ProductsFacadeLocal pfacade;
    
    @EJB
    private sb.ManufacturersFacadeLocal mfacade;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.println(mfacade.findAll().size());
        request.setAttribute("manu", mfacade.findAll());
        
        request.getRequestDispatcher("views/create.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */   
    private final String UPLOAD_DIRECTORY = "/uploads";
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String temp = "";
        response.setContentType("text/html;charset=UTF-8");
        
        String appPath = request.getServletContext().getRealPath("");
        appPath = appPath.replace('\\', '/');
        System.out.println(appPath);
        Products p = new Products();
        if (ServletFileUpload.isMultipartContent(request)) {
            try {
                System.out.println("true");
                List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                System.out.println(multiparts.toString());
                for (FileItem item : multiparts) {
                    System.out.println(item.toString());
                    System.out.println(item.isFormField());
                    if (!item.isFormField()) {
                        String name = new File(item.getName()).getName();
                        System.out.println(name);
                        item.write(new File(appPath + UPLOAD_DIRECTORY + File.separator + name));
                        System.out.println("app path" + appPath + UPLOAD_DIRECTORY + File.separator + name);
                        p.setProductImage(name);
                    }
                    else
                    {
                        temp += item.getString() + "/";
                        
                    }
                }
                System.out.println(temp);
               String[] rs = temp.split("/");
               
               
                p.setProductId(rs[0]);
                p.setProductName(rs[1]);
//                p.setProductImage(rs[2]);

                p.setProductPrice(Integer.parseInt(rs[2]));
                p.setProductDetail(rs[3]);
                p.setManufacturerId(mfacade.find(Integer.parseInt(rs[4])));
                pfacade.create(p);
                
//               p.setProduct_id(rs[0]);
//               p.setProduct_name(rs[1]);
//               p.setProduct_price(rs[2]);
//               p.setProduct_detail(rs[3]);
//               p.setManufacturer_id(Integer.valueOf(rs[4]));
               
             
               
            } catch (Exception ex) {
                    
               
            }
        } else {
            System.out.println("bbb");
                    
        }
        
//        Products p = new Products();
//        p.setProductId(request.getParameter("productId"));
//        p.setProductName(request.getParameter("productName"));
//        p.setProductImage(request.getParameter("productImage"));
//        p.setProductPrice(Integer.parseInt(request.getParameter("productPrice")));
//        p.setProductDetail(request.getParameter("productDetail"));
//        p.setManufacturerId(mfacade.find(Integer.parseInt(request.getParameter("manu_id"))));
//        pfacade.create(p);
        
        //request.setAttribute("list", pfacade.findAll());
        //request.getRequestDispatcher("views/index.jsp").forward(request, response);
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
