package com.cdweb.service.impl;

import com.cdweb.entity.Catalog;
import com.cdweb.repo.ICatalog;
import com.cdweb.service.ICatalogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class CatalogServiceimpl implements ICatalogService {
    @Autowired
    ICatalog iCatalog;
    @Override
    public List<Catalog> listCatalogParent() {
        return iCatalog.listCatalogParent();
    }

    @Override
    public List<Catalog> listCatalog(int Id) {
        return iCatalog.listCatalog(Id);
    }

    @Override
    public Catalog getCatalogId(int Id) {
        return iCatalog.getCatalogId(Id);
    }
}
