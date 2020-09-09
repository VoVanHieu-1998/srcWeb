package com.cdweb.service;

import com.cdweb.entity.Warranty;

import java.util.List;

public interface IWarrantyService {
    public List<Warranty> listAll();
    public Warranty getWarrantyId(int Id);
}
