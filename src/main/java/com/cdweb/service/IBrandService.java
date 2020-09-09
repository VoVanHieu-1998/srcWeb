package com.cdweb.service;

import com.cdweb.entity.Brand;

import java.util.List;

public interface IBrandService {
    public Brand getBranId(int Id);
    public List<Brand> listAll();
}
