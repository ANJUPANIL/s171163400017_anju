package com.niit.ecommercemain.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Supplier")
public class supplier {
	 @Id
	 @Column(name="sup_id")
	 private String id;
	 
	 @Column(name="sup_name")
	 private String name;
	 
	 @Column(name="sup_address")
	 private String address;
	 
	 @Column(name="sup_city")
	 private String city;
	 
	 @Column(name="sup_state")
	 private String state;
	 
	 @Column(name="sup_pincode")
	 private String pin;
	 
	 @Column(name="sup_contact")
	 private String contact;
	 
	 @Column(name="sup_email")
	 private String email;
	 
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getPin() {
		return pin;
	}

	public void setPin(String pin) {
		this.pin = pin;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	

}
