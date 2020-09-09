package com.cdweb.entity;

import javax.persistence.*;
import java.util.Set;

@Entity(name = "warranty")
public class Warranty {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int warrantyId;
    int WarrantyMonth;
    @OneToMany(cascade = CascadeType.ALL)
    @JoinColumn(name = "waranty")
    Set<Product> product;

    public int getWarrantyId() {
        return warrantyId;
    }

    public void setWarrantyId(int warrantyId) {
        this.warrantyId = warrantyId;
    }

    public int getWarrantyMonth() {
        return WarrantyMonth;
    }

    public void setWarrantyMonth(int warrantyMonth) {
        WarrantyMonth = warrantyMonth;
    }

    public Set<Product> getProduct() {
        return product;
    }

    public void setProduct(Set<Product> product) {
        this.product = product;
    }
}
