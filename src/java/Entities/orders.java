/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entities;

import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

/**
 *
 * @author Rohit
 */
@Entity
public class orders {
    
    @Id
    String Channel_order_id;
    
    String status;
    double Sold_price;
    String remark;
    String buyer_name;
    int buyer_id; 
    String buyer_phone_no;
    String Recepient_name;
    String shiping_addr1;
    String shiping_addr2;
    String shiping_addr3;
    String ship_city;
    String ship_state;
    String ship_postal_code;
    String ship_contry;
    String Payment_method;
    String ship_date;
    
    @OneToMany (mappedBy="order",fetch=FetchType.EAGER,cascade=CascadeType.ALL)
    List<Product> products;
    
    public orders(){
        
    }
    
    public String getChannel_order_id() {
        return Channel_order_id;
    }

    public void setChannel_order_id(String Channel_order_id) {
        this.Channel_order_id = Channel_order_id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public double getSold_price() {
        return Sold_price;
    }

    public void setSold_price(double Sold_price) {
        this.Sold_price = Sold_price;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getBuyer_name() {
        return buyer_name;
    }

    public void setBuyer_name(String buyer_name) {
        this.buyer_name = buyer_name;
    }

    public String getBuyer_phone_no() {
        return buyer_phone_no;
    }

    public void setBuyer_phone_no(String buyer_phone_no) {
        this.buyer_phone_no = buyer_phone_no;
    }

    public String getRecepient_name() {
        return Recepient_name;
    }

    public void setRecepient_name(String Recepient_name) {
        this.Recepient_name = Recepient_name;
    }

    public String getShiping_addr1() {
        return shiping_addr1;
    }

    public void setShiping_addr1(String shiping_addr1) {
        this.shiping_addr1 = shiping_addr1;
    }

    public String getShiping_addr2() {
        return shiping_addr2;
    }

    public void setShiping_addr2(String shiping_addr2) {
        this.shiping_addr2 = shiping_addr2;
    }

    public String getShiping_addr3() {
        return shiping_addr3;
    }

    public void setShiping_addr3(String shiping_addr3) {
        this.shiping_addr3 = shiping_addr3;
    }

    public String getShip_city() {
        return ship_city;
    }

    public void setShip_city(String ship_city) {
        this.ship_city = ship_city;
    }

    public String getShip_state() {
        return ship_state;
    }

    public void setShip_state(String ship_state) {
        this.ship_state = ship_state;
    }

    public String getShip_postal_code() {
        return ship_postal_code;
    }

    public void setShip_postal_code(String ship_postal_code) {
        this.ship_postal_code = ship_postal_code;
    }

    public String getShip_contry() {
        return ship_contry;
    }

    public void setShip_contry(String ship_contry) {
        this.ship_contry = ship_contry;
    }

    public String getPayment_method() {
        return Payment_method;
    }

    public void setPayment_method(String Payment_method) {
        this.Payment_method = Payment_method;
    }

    public String getShip_date() {
        return ship_date;
    }

    public void setShip_date(String ship_date) {
        this.ship_date = ship_date;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    public int getBuyer_id() {
        return buyer_id;
    }

    public void setBuyer_id(int buyer_id) {
        this.buyer_id = buyer_id;
    }
}
