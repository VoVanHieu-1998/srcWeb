package com.cdweb.entity;

import java.util.Date;

import javax.persistence.*;

@Entity(name = "color")
public class Color {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer colorId;
    private String name;
    @Transient
    private String name_eng;
    private int itemStatus;
    private Date createDate;
    private Date updateDate;


    public String getName_eng() {
        return name_eng;
    }

    public void setName_eng() {
        switch (this.name) {
            case "Vàng":
            case "Gold": {
                this.name_eng = "yellow";
                break;
            }
            case "Đỏ": {
                this.name_eng = "red";
                break;
            }
            case "Đen": {
                this.name_eng = "black";
                break;
            }
            case "Trắng": {
                this.name_eng = "white";
                break;
            }
            case "Bạc": {
                this.name_eng = "silver";
                break;
            }
            case "Xám": {
                this.name_eng = "gray";
                break;
            }
            case "Xanh lá": {
                this.name_eng = "green";
                break;
            }
            case "Hồng": {
                this.name_eng = "pink";
                break;
            }
            case "Xanh": {
                this.name_eng = "blue";
                break;
            }
            default: {
                this.name_eng = "";
                break;
            }
        }
    }

    public Integer getColorId() {
        return colorId;
    }

    public void setColorId(Integer colorId) {
        this.colorId = colorId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getItemStatus() {
        return itemStatus;
    }

    public void setItemStatus(int itemStatus) {
        this.itemStatus = itemStatus;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }
}
