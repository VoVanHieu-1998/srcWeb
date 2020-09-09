package com.cdweb.repo;

import com.cdweb.entity.Pagging;
import com.cdweb.entity.Product;
import org.springframework.stereotype.Repository;

import java.util.List;


public interface IProductRepo {
    List<Product> listproduct(int CatalogId, int Status,int begin);

    Product getProductId(int id);

    Product getProductByCode(String code);

    List<Product> listAll();

    List<Product> listStatus();

    List<Product> listProductPerPape(Pagging p);

    List<Product> searchProduct(String keys);

    List<Product> searchProductbyKey(String keys);

    Product getListPDBySanPham(int productId);
    boolean create(Product object);

    // update
    void update(Product object);

    // delete
    void delete(Product object);



    // load list by nav
     List<Product> getListNav(int start, int limit);

    // total item
     long totalItem();

}
