package com.cdweb.service;

import com.cdweb.entity.Catalog;

import java.util.List;

public interface ICatalogService {
    public List<Catalog> listCatalogParent();
    public List<Catalog> listCatalog(int Id);
    public Catalog getCatalogId(int Id);
}
