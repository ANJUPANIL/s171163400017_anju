package com.niit.ecommercemain.model;

import java.io.Serializable;
import java.util.Set;
import java.util.UUID;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.stereotype.Component;

@Entity
@Table(name="Category")
@Component
public class category implements Serializable {
	
	private static final long serialVersionUID = 1L;
	@Id
	/**@GeneratedValue**/
	@Column(name="category_id")
	@NotEmpty(message="Please enter a valid category Id")
	private String id;
	
	@Column(name="category_name")
	@NotEmpty(message="Please enter category name")
	private String name;
	
	@Column(name="category_des")
	@NotEmpty(message="Please enter category description")
	private String des;
	
	@Column(name="status")
	private boolean status;
	
	public boolean isStatus() {
		return status;
	}
	public void setStatus(boolean status) {
		this.status = status;
	}

	@ManyToOne
	@JoinColumn(name="brand_id")
	private brand brands;
	
	public brand getBrands() {
		return brands;
	}
	public void setBrands(brand brands) {
		this.brands = brands;
	}
	
	@OneToMany(cascade=CascadeType.ALL)
    @JoinColumn(name="category_id")
    private Set<product> product;
    
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
	
	 public category() {

			this.id = "C" + UUID.randomUUID().toString().substring(30).toUpperCase();
			
		}
}
