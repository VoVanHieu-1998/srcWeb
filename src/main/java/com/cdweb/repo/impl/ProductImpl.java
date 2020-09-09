package com.cdweb.repo.impl;

import com.cdweb.entity.Pagging;
import com.cdweb.entity.Product;
import com.cdweb.repo.IProductRepo;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

@Repository
public class ProductImpl implements IProductRepo {
    @Autowired
    SessionFactory sessionFactory;

    @Override
    @Transactional
    public List<Product> listproduct(int CatalogId, int Status,int begin) {
        Session session = sessionFactory.getCurrentSession();
        List<Product> list= new ArrayList<>();
        if(begin<0){
            list = session.createQuery("from product where catalog.catalogId=" + CatalogId + "and Status=" + Status + "ORDER BY Top ASC ").getResultList();
            for (Product item : list) {
                item.setImageArr();
            }
        }else{
            list = session.createQuery("from product where catalog.catalogId=" + CatalogId + "and Status=" + Status + "ORDER BY Top ASC ").setFirstResult(begin).setMaxResults(5).getResultList();
            for (Product item : list) {
                item.setImageArr();
            }
        }
        return list;
    }

    @Override
    @Transactional
    public Product getProductId(int id) {
        Session session = sessionFactory.getCurrentSession();
        Product product = (Product) session.createQuery("from product where productId=" + id).getSingleResult();
        product.setImageArr();
        return product;
    }

    @Override
    @Transactional
    public Product getProductByCode(String code) {
        try {
            Session session = sessionFactory.getCurrentSession();
            Product product = (Product) session.createQuery("from product where productCode='" + code + "'").getSingleResult();
            product.setImageArr();
            System.out.println("query product by code");
//        System.out.println(product.getImageArr().length);
            return product;
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    @Transactional
    public List<Product> listAll() {
        Session session = sessionFactory.getCurrentSession();
        List<Product> list = session.createQuery("from product").getResultList();
        for (Product item : list) {
            item.setImageArr();
        }
        return list;
    }

    @Override
    @Transactional
    public List<Product> listStatus() {
        Session session = sessionFactory.getCurrentSession();
        List<Product> list = session.createQuery("from product where status=1 or status=0").getResultList();
        for (Product item : list) {
            item.setImageArr();
        }
        return list;
    }

    @Override
    @Transactional
    public List<Product> listProductPerPape(Pagging p) {
        Session session = sessionFactory.getCurrentSession();
        List<Product> list = session.createQuery("from product where status=1 or status=0").setFirstResult(p.getOffset()).setMaxResults(p.getRecordPerPage()).getResultList();
        for (Product item : list) {
            item.setImageArr();
        }
        return list;
    }

    @Override
    @Transactional
    public List<Product> searchProduct(String keys) {
        // Tiền xử lý query
        System.out.println("keys: ");
        System.out.println(keys);
        StringBuilder sql = new StringBuilder("FROM product WHERE name LIKE ");
        String[] listkeys = keys.trim().split(" ");
        if (listkeys.length > 1) {
            sql.append("'%").append(listkeys[0]).append("%'");
            for (int i = 1; i < listkeys.length; i++) {
                sql.append(" AND name LIKE " + "'%").append(listkeys[i]).append("%'");
            }
        } else {
            sql.append("'%").append(keys).append("%'");
        }
        Session session = sessionFactory.getCurrentSession();
        List<Product> list = session.createQuery(sql.toString()).getResultList();
        for (Product item : list) {
            item.setImageArr();
        }
        return list;
    }
    @Override
    @Transactional
    public List<Product> searchProductbyKey(String keys) {


        System.out.println(keys);
        StringBuilder sql = new StringBuilder("FROM product WHERE name LIKE ");
        String[] listkeys = keys.trim().split(" ");
        if (listkeys.length > 1) {
            sql.append("'%").append(listkeys[0]).append("%'");
            for (int i = 1; i < listkeys.length; i++) {
                sql.append(" AND name LIKE " + "'%").append(listkeys[i]).append("%'");
            }
        } else {
            sql.append("'%").append(keys).append("%'");
        }
        Session session = sessionFactory.getCurrentSession();
        List<Product> list = session.createQuery(sql.toString()).setFirstResult(0).setMaxResults(6).getResultList();
        for (Product item : list) {
            item.setImageArr();
        }
        return list;
    }

    @Override
    @Transactional
    public Product getListPDBySanPham(int productId) {
        Session session=sessionFactory.getCurrentSession();
        Product product= (Product) session.createQuery("from product p where p.productId="+productId).getSingleResult();
        return product;
    }

    @Override
    @Transactional
    public boolean create(Product object) {
        object.setStatus(0);
        object.setDateCreated(new Date());
        object.setDateModified(new Date());
        int id = (int) sessionFactory.getCurrentSession().save(object);
        if (id > 0) return true;
        return false;
    }

    @Override
    @Transactional
    public void update(Product object) {
        object.setDateCreated(new Date());
        object.setDateModified(new Date());
        Session session = sessionFactory.getCurrentSession();
        session.update(object);

    }

    @Override
    @Transactional
    public void delete(Product object) {
        Session session = sessionFactory.getCurrentSession();
        session.update(object);
    }

    @Override
    @Transactional
    public List<Product> getListNav(int start, int limit) {
        return null;
    }

    @Override
    @Transactional
    public long totalItem() {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("select COUNT(productId) from product where status =1 or status =0");
        for (Iterator it = query.iterate(); it.hasNext(); ) {
            long row = (Long) it.next();
            return row;
        }
        return 0;
    }

}
