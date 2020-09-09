package com.cdweb.service.impl;

import com.cdweb.entity.Brand;
import com.cdweb.repo.IBrand;
import com.cdweb.service.IBrandService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class BrandServiceimpl implements IBrandService {
    @Autowired
    IBrand iBrand;
    @Override
    public Brand getBranId(int Id) {
        return iBrand.getBranId(Id);
    }

    @Override
    public List<Brand> listAll() {
        return iBrand.listAll();
    }
}
