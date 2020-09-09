package com.cdweb.entity;

import javax.persistence.*;
import java.util.Set;

@Entity(name = "brand")
public class Brand {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    int brandId;
    String name;
    String img;
    @OneToMany(cascade = CascadeType.ALL,fetch = FetchType.EAGER)
    @JoinColumn(name = "brand")
    Set<Product> listproduct;

    public int getBrandId() {
        return brandId;
    }

    public void setBrandId(int brandId) {
        this.brandId = brandId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public Set<Product> getListproduct() {
        return listproduct;
    }

    public void setListproduct(Set<Product> listproduct) {
        this.listproduct = listproduct;
    }
}
