package com.niit.ecommercemain.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

@Entity
@Table(name="Category")
@Component
public class category {
	@Id
	/**@GeneratedValue**/
	@Column(name="category_id")
	private String id;
	
	@Column(name="category_name")
	private String name;
	
	@Column(name="category_des")
	private String des;
	
	@Column(name="brand_id")
	private String brand_id;
	
	public String getBrand_id() {
		return brand_id;
	}
	public void setBrand_id(String brand_id) {
		this.brand_id = brand_id;
	}
	/*@OneToOne
	@JoinColumn(name = "brand_id")
	private brand brandobj;
	
	
	public brand getBrandobj() {
		return brandobj;
	}
	public void setBrandobj(brand brandobj) {
		this.brandobj = brandobj;
	}*/
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
}
