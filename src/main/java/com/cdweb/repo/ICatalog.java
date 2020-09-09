package com.cdweb.repo;

import com.cdweb.entity.Catalog;
import com.cdweb.entity.Product;

import java.util.List;

public interface ICatalog {
    public List<Catalog> listCatalogParent();
    public List<Catalog> listCatalog(int Id);
    public Catalog getCatalogId(int Id);
}
