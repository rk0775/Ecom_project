/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entities;

import java.util.List;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

/**
 *
 * @author Rohit
 */

@Entity
public class Product {
    @Id
    String Product_ref_id;
    
    
    String title;
    int quantity;
    double mrp;
    String brand;
    String chanel_id;
    String material;
    String color;
    @Column(length=3000)
    String discription;
   
    @ManyToOne
    orders order;
    
    
    @OneToMany (mappedBy="product",fetch=FetchType.EAGER,cascade=CascadeType.ALL)
    List<Images> images;

    public Product(){
    }

    public String getProduct_ref_id() {
        return Product_ref_id;
    }

    public void setProduct_ref_id(String Product_ref_id) {
        this.Product_ref_id = Product_ref_id;
    }

   

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getMrp() {
        return mrp;
    }

    public void setMrp(double mrp) {
        this.mrp = mrp;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getChanel_id() {
        return chanel_id;
    }

    public void setChanel_id(String chanel_id) {
        this.chanel_id = chanel_id;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getDiscription() {
        return discription;
    }

    public void setDiscription(String discription) {
        this.discription = discription;
    }

    public List<Images> getImages() {
        return images;
    }

    public void setImages(List<Images> images) {
        this.images = images;
    }

    

    /*public Orders getOrder() {
    return order;
    }
    
    public void setOrder(Orders order) {
    this.order = order;
    }
    */
    
    
}
