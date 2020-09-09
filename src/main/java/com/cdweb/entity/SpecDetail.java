package com.cdweb.entity;

import java.util.Date;

import javax.persistence.*;

@Entity(name="specs_detail")
public class SpecDetail {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer specsdetailId;
	@ManyToOne(cascade=CascadeType.ALL,fetch = FetchType.EAGER)
	@JoinColumn(name="specsId",nullable=false)
	private Spec spec_specDetail;
	
	private String name;
	private String value;
	private int itemStatus;
	private Date createDate;
	private Date updateDate;
	

	public Integer getSpecsdetailId() {
		return specsdetailId;
	}

	public void setSpecsdetailId(Integer specsdetailId) {
		this.specsdetailId = specsdetailId;
	}

	public Spec getSpec_specDetail() {
		return spec_specDetail;
	}
	public void setSpec_specDetail(Spec spec_specDetail) {
		this.spec_specDetail = spec_specDetail;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getValue() {
		return value;
	}
	public void setValue(String value) {
		this.value = value;
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
