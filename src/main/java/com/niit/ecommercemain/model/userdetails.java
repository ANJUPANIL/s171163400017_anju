package com.niit.ecommercemain.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import javassist.SerialVersionUID;

@Entity
@Table(name="Register")
@Component
public class userdetails implements Serializable{
	
	public static final long serialVersionUID = 1L;
	
	@Id
	@Column(name="user_id")
	@NotEmpty(message = "Please enter your Email address.")
	@Email(message = "Invalid Email..please enter a valid Email address.")
	private String user_id;
	
	@Column(name="user_fname")
	@NotEmpty(message = "Please enter your first name.")
	private String fname;
	
	@Column(name="user_sname")
	@NotEmpty(message = "Please enter your second name.")
	private String sname;
	
	@Column(name="user_lname")
	@NotEmpty(message = "Please enter your last name.")
	private String lname;
	
	@Column(name="user_dob")
	@NotEmpty(message = "Please enter your date of birth.")
	private String dob;
	
	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
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

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	
	
	@Column(name="user_address")
	@NotEmpty(message = "Please enter your address.")
	private String address;
	
	@Column(name="user_city")
	@NotEmpty(message = "Please enter your city.")
	private String city;
	
	@Column(name="user_contact")
	@NotEmpty(message = "Please enter your contact number.")
	@Size(min=10,max=10,message = "Enter 10 digit contact number")
	private String contact;
		
	@Column(name="user_password")
	@NotEmpty(message = "Please enter your password.")
	@Size(min = 6, max = 15, message = "Your password must between 6 and 15 characters")
	private String password;
		
	
	
}
