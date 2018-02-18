/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author quocq
 */
public class ProductSearchResult {
    private String productId;
    private String productName;
    private String productImage;
    private String productPrice;
    private String productDetail;
    private String manufacturerName;

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getProductImage() {
        return productImage;
    }

    public void setProductImage(String productImage) {
        this.productImage = productImage;
    }

    public String getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(String productPrice) {
        this.productPrice = productPrice;
    }

    public String getProductDetail() {
        return productDetail;
    }

    public void setProductDetail(String productDetail) {
        this.productDetail = productDetail;
    }

    public String getManufacturerName() {
        return manufacturerName;
    }

    public void setManufacturerName(String manufacturerName) {
        this.manufacturerName = manufacturerName;
    }

    public ProductSearchResult() {
    }

    public ProductSearchResult(String productId, String productName, String productImage, String productPrice, String productDetail, String manufacturerName) {
        this.productId = productId;
        this.productName = productName;
        this.productImage = productImage;
        this.productPrice = productPrice;
        this.productDetail = productDetail;
        this.manufacturerName = manufacturerName;
    }

    @Override
    public String toString() {
        return "ProductSearchResult{" + "productId=" + productId + ", productName=" + productName + ", productImage=" + productImage + ", productPrice=" + productPrice + ", productDetail=" + productDetail + ", manufacturerName=" + manufacturerName + '}';
    }
    
    
}
