/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Entities.Images;
import Entities.Product;
import Entities.User;
import HelperClasses.ImageOperations;
import HelperClasses.Message;
import Hibernate.FactoryProvider;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Rohit
 */
@MultipartConfig
public class ProductServlet extends HttpServlet {

    int pageLimit = 8;//page limit is set how many data display to per page
    //this is path to save the images 
    String path = "D:\\document\\softwares\\netbeans\\netbeansProject\\EcomService\\web\\Files\\Images";

    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        HttpSession httpSession = req.getSession();
        User user = (User) httpSession.getAttribute("loginUser");
        String action = req.getParameter("action");
        
        //if condition work when admin user try to add new product
        if (action.equalsIgnoreCase("add")) {
            Random random = new Random();
            
            try {
                //fetch the data from request
                String title = req.getParameter("pName");
                String brand = req.getParameter("pBrand");
                double price = Double.parseDouble(req.getParameter("pPrice"));
                int quantity = Integer.parseInt(req.getParameter("pQuantity"));
                String color = req.getParameter("pColor");
                String desc = req.getParameter("pDiscription");
                List<Part> part = (List) req.getParts();
                Product product = new Product();
                
                //set the data to product
                product.setProduct_ref_id(random.nextInt() + "_ID_2022");
                product.setTitle(title);
                product.setBrand(brand);
                product.setMrp(price);
                product.setQuantity(quantity);
                product.setColor(color);
                product.setDiscription(desc);
                

                List<Images> photos = new ArrayList<Images>();

                //store the multiple image acording to product
                for (Part p : part) {
                    if (p.getSize() > 1500) {
                        String name = "Product-" + random.nextInt() + ".jpg";
                        Images img = new Images();
                        img.setProduct(product);;
                        img.setImageUrl(name);
                        photos.add(img);
                        //save photo to folder
                        ImageOperations.saveTheImageToFolder(path + File.separator + name, p);
                    }
                }
                
                product.setImages(photos);
                //try to save the data
                Session session = FactoryProvider.getFactory().openSession();
                Transaction tx = session.beginTransaction();
                session.save(product);
                tx.commit();
                session.close();
               
                //set the message
                httpSession.setAttribute("message", new Message("success", "Product successfully added to the database.", "alert-success"));
                res.sendRedirect("addProduct.jsp");

            } catch (Exception e) {
                e.printStackTrace();
                httpSession.setAttribute("message", new Message("success", "product not added.Something went wrong...", "alert-danger"));
                res.sendRedirect("addProduct.jsp");
            }
        }

    }

    //get methode handle here
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String action = req.getParameter("action");
        
        //if user fetch the all product
        if (action.equalsIgnoreCase("fetchAll")) {
            int pageNo = Integer.parseInt(req.getParameter("pno"));
            int offset = (pageNo - 1) * pageLimit;

            List resultListData;
            Session s = FactoryProvider.getFactory().openSession();
            Query query = (Query) s.createQuery("from Product");
           
            //fetch total number of records for the pagination
            int totalProductCount = query.list().size();
            
            //fetch the limitade data from database
            query.setFirstResult(offset);
            query.setMaxResults(pageLimit);
            resultListData = query.list();
            s.close();

            HttpSession httpSession = req.getSession();
            httpSession.setAttribute("totalProductCount", totalProductCount);
            httpSession.setAttribute("purPageLimit", pageLimit);
            httpSession.setAttribute("products", resultListData);
            res.sendRedirect("product.jsp?pageNo=" + pageNo);
            
        } else if (action.equalsIgnoreCase("fetchSingle")) {
            //fetch the single product
            String id = req.getParameter("id");
            Session s = FactoryProvider.getFactory().openSession();
            Query query = (Query) s.createQuery("from Product where Product_ref_id='" + id + "'");
            HttpSession httpSession = req.getSession();
            httpSession.setAttribute("product", query.list().get(0));
            s.close();

            res.sendRedirect("singleProduct.jsp");
            
        } else if (action.equalsIgnoreCase("search")) {
            //if user search the product
            String key = req.getParameter("key");
            Session s = FactoryProvider.getFactory().openSession();
            Query query = (Query) s.createQuery("from Product where title like '%" + key + "%' or brand like '%" + key + "%'");
            HttpSession httpSession = req.getSession();
            httpSession.setAttribute("products", query.list());
            s.close();
            res.sendRedirect("product.jsp?pageNo=1");
        }
    }
}
