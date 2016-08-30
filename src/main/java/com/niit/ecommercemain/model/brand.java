package com.niit.ecommercemain.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.stereotype.Component;

@Entity
@Table(name="Brand")
@Component
public class brand {
	@Id
	@Column(name="brand_id")
	@NotEmpty(message="Please enter a valid brand Id")
	private String brand_id;
	
	@Column(name="brand_name")
	@NotEmpty(message="Pease enter a brand name")
	private String brand_name;
	
	@Column(name="status")
	private boolean status;
	
	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public String getBrand_id() {
		return brand_id;
	}

	public void setBrand_id(String brand_id) {
		this.brand_id = brand_id;
	}

	public String getBrand_name() {
		return brand_name;
	}

	public void setBrand_name(String brand_name) {
		this.brand_name = brand_name;
	}
	
	@OneToMany(cascade=CascadeType.ALL)
    @JoinColumn(name="brand_id")
    private Set<category> category;
    
    @OneToMany(cascade=CascadeType.ALL)
    @JoinColumn(name="brand_id")
    private Set<product> product;

	

}
