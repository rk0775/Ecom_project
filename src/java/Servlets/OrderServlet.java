/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlets;

import Entities.orders;
import Entities.Product;
import Entities.User;
import Hibernate.FactoryProvider;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;
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
public class OrderServlet extends HttpServlet {

    //post methode handle here
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
        HttpSession httpSession = req.getSession();

        Session session = FactoryProvider.getFactory().openSession();
        User user = (User) httpSession.getAttribute("loginUser");
        Random random = new Random();
        String name = req.getParameter("Uname");
        String phone = req.getParameter("phone");
        String country = req.getParameter("country");
        String state = req.getParameter("state");
        String city = req.getParameter("city");
        String postalCode = req.getParameter("postalCode");
        String addr1 = req.getParameter("addr1");
        String addr2 = req.getParameter("addr2");
        String addr3 = req.getParameter("addr3");
        double totalPrice = Double.parseDouble(req.getParameter("totalAmt"));
        String paymentType = req.getParameter("paymentType");

        Date d = new Date();
        String cart = req.getParameter("cart");

        String array[] = cart.subSequence(1, cart.length() - 1).toString().split(",");
        List<Product> products = new ArrayList<>();
        orders order = new orders();

        for (String str : array) {
            Query query = session.createQuery("from Product where Product_ref_id='" + str.subSequence(1, str.length() - 1) + "'");
            Product ptr = (Product) query.list().get(0);
            products.add(ptr);
        }

        //set all data to the order
        order.setChannel_order_id(random.nextInt() + "_Id_2022");
        order.setSold_price(totalPrice);
        order.setStatus("pending");
        order.setRemark("new order");
        order.setBuyer_name(user.getUser_name());
        order.setBuyer_id(user.getUser_id());
        order.setBuyer_phone_no(phone);
        order.setRecepient_name(name);
        order.setShiping_addr1(addr1);
        if (addr2.length() > 0) {
            order.setShiping_addr2(addr2);
        }
        if (addr3.length() > 0) {
            order.setShiping_addr3(addr3);
        }
        order.setShip_city(city);
        order.setShip_state(state);
        order.setShip_contry(country);
        order.setShip_date(d + "");
        order.setPayment_method(paymentType);
        order.setShip_postal_code(postalCode);
        order.setProducts(products);

        session.close();
        
        //try to save the order in database
        try {
            Session s = FactoryProvider.getFactory().openSession();
            Transaction tx = s.beginTransaction();
            s.save(order);
            tx.commit();

            Query orderQuery = s.createQuery("from orders where buyer_id='" + user.getUser_id() + "'");
            httpSession.setAttribute("orders", orderQuery.list());
            s.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        
    }

}
