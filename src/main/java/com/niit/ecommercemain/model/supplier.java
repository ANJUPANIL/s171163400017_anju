package com.niit.ecommercemain.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="Supplier")
public class supplier implements Serializable{
	
	private static final long serialVersionUID = 1L;
	 @Id
	 @Column(name="sup_id")
	 private String id;
	 
	 @Column(name="sup_name")
	 @NotEmpty(message="Please enter a name")
	 private String name;
	 
	 @Column(name="sup_address")
	 @NotEmpty(message="Please enter supplier address")
	 private String address;
	 
	 @Column(name="sup_city")
	 @NotEmpty(message="Please enter supplier city")
	 private String city;
	 
	 @Column(name="sup_state")
	 @NotEmpty(message="Please enter supplier state")
	 private String state;
	 
	 @Column(name="sup_pincode")
	 @NotEmpty(message="Please enter pincode")
	 private String pin;
	 
	 @NotEmpty(message = "Please enter contact details.")
	 @Size(min = 10, max = 10, message = "Please enter a valid contact number")
	 @Column(name="sup_contact")
	 private String contact;
	 
	 @NotEmpty(message = "Please enter Email address.")
	 @Email(message = "Invalid Email..please enter a valid Email address.")
	 @Column(name="sup_email")
	 private String email;
	 
	 @Column(name="status")
	 private boolean status;
	 
	 public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

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
