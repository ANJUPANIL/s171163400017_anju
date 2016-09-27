package com.niit.ecommercemain.model;

import java.io.Serializable;
import java.util.Set;
import java.util.UUID;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.stereotype.Component;

@Entity
@Table(name="Brand")
@Component
public class brand  implements Serializable{
	
	private static final long serialVersionUID = 1L;
	@Id
	@Column(name="brand_id")
	@NotEmpty(message="Please enter a valid brand Id")
	private String brand_id;
	
	@Column(name="brand_name")
	@NotBlank(message="Please enter a brand name")
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

    public brand() {

		this.brand_id = "B" + UUID.randomUUID().toString().substring(30).toUpperCase();
		
	}

}
