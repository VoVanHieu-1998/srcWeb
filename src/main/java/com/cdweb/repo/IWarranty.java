package com.cdweb.repo;

import com.cdweb.entity.Brand;
import com.cdweb.entity.Warranty;

import java.util.List;

public interface IWarranty {
    public List<Warranty> listAll();
    public Warranty getWarrantyId(int Id);
}
