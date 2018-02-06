package model;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import model.Products;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2018-02-06T11:16:53")
@StaticMetamodel(Manufacturers.class)
public class Manufacturers_ { 

    public static volatile ListAttribute<Manufacturers, Products> productsList;
    public static volatile SingularAttribute<Manufacturers, String> manufacturerName;
    public static volatile SingularAttribute<Manufacturers, Integer> manufacturerId;

}