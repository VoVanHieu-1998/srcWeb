package com.cdweb.service.impl;

import com.cdweb.entity.Warranty;
import com.cdweb.repo.IWarranty;
import com.cdweb.service.IWarrantyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class WarrantyServiceimpl implements IWarrantyService {
    @Autowired
    IWarranty iWarranty;
    @Override
    public List<Warranty> listAll() {
        return iWarranty.listAll();
    }

    @Override
    public Warranty getWarrantyId(int Id) {
        return iWarranty.getWarrantyId(Id);
    }
}
