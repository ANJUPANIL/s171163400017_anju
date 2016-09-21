package com.niit.ecommercemain.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

import org.springframework.stereotype.Component;

@Entity
@Table(name="Cart")
@Component
public class cart {
	@Id
	@Column
	@GeneratedValue
	private String id;
	
	@OneToOne
	@JoinColumn(name="user_id")
	private userdetails user;
	
	
	@ManyToOne
	@JoinColumn(name="product_id")
	private product product;
	

	public product getProduct() {
		return product;
	}

	public void setProduct(product product) {
		this.product = product;
	}

	
	
	@Column
	@NotNull
	private int quantity;
	
	
	
	@Column
	private double total;
	
	@Column(columnDefinition = "boolean default false")
	private boolean status;
	
	public String getId() {
		return id;
		
	}

	public void setId(String id) {
		this.id = id;
	}

	

	public userdetails getUser() {
		return user;
	}

	public void setUser(userdetails user) {
		this.user = user;
	}
	
	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getTotal() {
		return total;
	}

	public void setTotal(double total) {
		this.total = total;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	@OneToMany(cascade=CascadeType.ALL)
    @JoinColumn(name="id")
    private Set<orderdetails> order;
}
