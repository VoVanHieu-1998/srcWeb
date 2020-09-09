package com.cdweb.service.impl;

import com.cdweb.entity.Pagging;
import com.cdweb.entity.Product;
import com.cdweb.repo.IProductRepo;
import com.cdweb.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService implements IProductService {
    @Autowired
    IProductRepo productRepo;

    @Override
    public List<Product> listproduct(int CatalogId, int Status,int begin) {
        return productRepo.listproduct(CatalogId, Status,begin);
    }

    @Override
    public Product getProductId(int id) {
        return productRepo.getProductId(id);
    }

    @Override
    public Product getProductByCode(String code) {
        return productRepo.getProductByCode(code);
    }

    @Override
    public List<Product> listAll() {
        return productRepo.listAll();
    }

    @Override
    public List<Product> searchProduct(String keys) {
        return productRepo.searchProduct(keys);
    }

    @Override
    public List<Product> searchProductbyKey(String keys) {
        return productRepo.searchProductbyKey(keys);
    }

    @Override
    public boolean create(Product object) {
        return productRepo.create(object);
    }

    @Override
    public Product getListPDBySanPham(int productId) {
        return productRepo.getListPDBySanPham(productId);
    }

    @Override
    public void update(Product object) {
        productRepo.update(object);
    }

    @Override
    public void delete(Product object) {
        productRepo.update(object);
    }

    @Override
    public List<Product> getListNav(int start, int limit) {
        return productRepo.getListNav(start,limit);
    }

    @Override
    public long totalItem() {
        return productRepo.totalItem();
    }

    @Override
    public List<Product> listStatus() {
        return productRepo.listStatus();
    }

    @Override
    public List<Product> listProductPerPape(Pagging p) {
        return productRepo.listProductPerPape(p);
    }


}
