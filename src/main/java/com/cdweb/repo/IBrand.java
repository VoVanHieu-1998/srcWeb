package com.cdweb.repo;

import com.cdweb.entity.Brand;
import com.cdweb.entity.Product;

import java.util.List;

public interface IBrand {
    public Brand getBranId(int Id);
    public List<Brand> listAll();
}
