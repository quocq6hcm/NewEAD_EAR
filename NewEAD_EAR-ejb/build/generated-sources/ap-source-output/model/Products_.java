package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Manufacturers;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-02-11T18:47:10")
@StaticMetamodel(Products.class)
public class Products_ { 

    public static volatile SingularAttribute<Products, String> productImage;
    public static volatile SingularAttribute<Products, String> productId;
    public static volatile SingularAttribute<Products, String> productDetail;
    public static volatile SingularAttribute<Products, Manufacturers> manufacturerId;
    public static volatile SingularAttribute<Products, String> productName;
    public static volatile SingularAttribute<Products, Integer> productPrice;

}