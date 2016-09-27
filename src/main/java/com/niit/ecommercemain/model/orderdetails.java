package com.niit.ecommercemain.model;

import java.io.Serializable;
import java.util.Set;
import java.util.UUID;

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

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.stereotype.Component;

@Entity
@Table(name="Orderdetails")
@Component
public class orderdetails implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	
	@Id
	@Column
	@GeneratedValue
	private String oid;
	
	@Column
	@NotEmpty(message="Please enter a valid order no")
	private String order_no;
	
	@Column
	@NotEmpty(message="Please enter your billing address")
	private String billing_address;
	
	@Column
	@NotEmpty(message="Please enter ayour shpping address")
	private String shipping_address;
	
	@Column
	@NotEmpty(message="Please enter a valid orderdate")
	private String order_date;
	
	@Column
	private Double grandtotal;
	
	@Column
	private String status;
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getOrder_date() {
		return order_date;
	}

	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}

	
	
	@ManyToOne
    @JoinColumn(name="user_id")
    private userdetails user;
    
	@ManyToOne
    @JoinColumn(name="id")
    private cart cartobj;

	

	public cart getCartobj() {
		return cartobj;
	}

	public void setCartobj(cart cartobj) {
		this.cartobj = cartobj;
	}

	public String getOid() {
		return oid;
	}

	public void setOid(String oid) {
		this.oid = oid;
	}

	public String getBilling_address() {
		return billing_address;
	}

	public void setBilling_address(String billing_address) {
		this.billing_address = billing_address;
	}

	public String getShipping_address() {
		return shipping_address;
	}

	public void setShipping_address(String shipping_address) {
		this.shipping_address = shipping_address;
	}

	

	public String getOrder_no() {
		return order_no;
	}

	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}

	

	public Double getGrandtotal() {
		return grandtotal;
	}

	public void setGrandtotal(Double grandtotal) {
		this.grandtotal = grandtotal;
	}

	

	public userdetails getUser() {
		return user;
	}

	public void setUser(userdetails user) {
		this.user = user;
	}
	
	public orderdetails() {

		this.order_no = "OD" + UUID.randomUUID().toString().substring(30).toUpperCase();
	}
	
}
