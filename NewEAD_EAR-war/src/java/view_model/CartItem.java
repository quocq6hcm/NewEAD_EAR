/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package view_model;

/**
 *
 * @author quocq
 */
public class CartItem {
    String name;
    String description;
    String price;
    String picture;
    String quantity;
    String total;

    public CartItem() {
    }

    public CartItem(String name, String description, String price, String picture, String quantity, String total) {
        this.name = name;
        this.description = description;
        this.price = price;
        this.picture = picture;
        this.quantity = quantity;
        this.total = total;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPrice() {
        return price;
    }

    public void setPrice(String price) {
        this.price = price;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    public String getQuantity() {
        return quantity;
    }

    public void setQuantity(String quantity) {
        this.quantity = quantity;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    @Override
    public String toString() {
        return "CartItem{" + "name=" + name + ", description=" + description + ", price=" + price + ", picture=" + picture + ", quantity=" + quantity + ", total=" + total + '}';
    }

    
    
}
