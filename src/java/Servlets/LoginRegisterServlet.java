/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Entities.User;
import HelperClasses.Message;
import Hibernate.FactoryProvider;
import java.io.IOException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author Rohit
 */
public class LoginRegisterServlet extends HttpServlet {

    HttpSession httpSession;

    //post methode handle here
    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String requestType = req.getParameter("reqType");
        httpSession = req.getSession();
        
        //if request is register then this codindition work...
        if (requestType.equalsIgnoreCase("register")) {
            Session session = FactoryProvider.getFactory().openSession();
            try {
                String name = req.getParameter("Uname");
                String email = req.getParameter("Uemail");
                String phone = req.getParameter("Uphone");
                String password = req.getParameter("Upassword");

                //save the user in database here
                User user = new User(name, email, phone, "normal_user", password);
                Transaction tx = session.beginTransaction();
                session.save(user);
                tx.commit();
                session.close();

                httpSession.setAttribute("message", new Message("Register successfull !", "Registration successfull. Please login with credential", "alert-success"));
                res.sendRedirect("login.jsp");

            } catch (Exception e) {
                httpSession.setAttribute("message", new Message("Register Error!", "Your registration is not successfull !!", "alert-error"));
                res.sendRedirect("register.jsp");
                e.printStackTrace();
            }
            
        } else if (requestType.equalsIgnoreCase("login")) {
            //if request is login user then this codindition work...
            Session session = FactoryProvider.getFactory().openSession();

            String email = req.getParameter("email");
            String password = req.getParameter("password");
            
            Query query = session.createQuery("from User where user_email='" + email + "' and user_password='" + password + "'");
            User user = (User) query.list().get(0);

            httpSession.setAttribute("loginUser", user);
            
            //identify the user is admin or normal and serve the page according type.
            if (user.getUser_type().equalsIgnoreCase("normal_user")) {
                //get the user place order
                Query orderQuery = session.createQuery("from orders where buyer_id='" + user.getUser_id() + "'");
                httpSession.setAttribute("orders", orderQuery.list());

                res.sendRedirect("userPage.jsp");
            } else if (user.getUser_type().equalsIgnoreCase("admin_user")) {
                res.sendRedirect("addProduct.jsp");
            }
        }
        
    }
    
    //get method handle here
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws IOException {
        String requestType = req.getParameter("reqType");
        //if user logout remove the session store user
        if (requestType.equalsIgnoreCase("logout")) {
            req.getSession().removeAttribute("loginUser");
            req.getSession().setAttribute("message", new Message("success", "you are logout is successfully.", "alert-success"));
            res.sendRedirect("login.jsp");
        }
    }
    
}
