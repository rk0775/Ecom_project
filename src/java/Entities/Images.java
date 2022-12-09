/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

/**
 *
 * @author Rohit
 */
@Entity
public class Images {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)  
     int image_id;
     String imageUrl;

    public Images(String imageUrl, Product product) {
        this.imageUrl = imageUrl;
        this.product = product;
    }
    public Images(){}
    
    @ManyToOne
    Product product;

    public int getImage_id() {
        return image_id;
    }

    public void setImage_id(int image_id) {
        this.image_id = image_id;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    } 
}
