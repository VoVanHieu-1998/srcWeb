package com.cdweb.service;

import com.cdweb.entity.Pagging;
import com.cdweb.entity.Product;

import java.util.List;

public interface IProductService {
    List<Product> listproduct(int CatalogId, int Status,int begin);

    Product getProductId(int id);
    Product getProductByCode(String code);

    List<Product> listAll();

    List<Product> searchProduct(String keys);
    List<Product> searchProductbyKey(String keys);

    boolean create(Product object);
    Product getListPDBySanPham(int productId);
    // update
    void update(Product object);

    // delete
    void delete(Product object);


    // load list by nav
   List<Product> getListNav(int start, int limit);

    // total item
   long totalItem();

    List<Product> listStatus();

    List<Product> listProductPerPape(Pagging p);


}
