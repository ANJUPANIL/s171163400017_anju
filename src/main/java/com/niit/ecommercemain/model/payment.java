package com.niit.ecommercemain.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.stereotype.Component;

@Entity
@Component
public class payment implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
	private String cardDetailId;
	
	private String user_id;
	
	public String getCardDetailId() {
		return cardDetailId;
	}
	
	@Column
	private String order_no;

	public String getOrder_no() {
		return order_no;
	}

	public void setOrder_no(String order_no) {
		this.order_no = order_no;
	}

	public void setCardDetailId(String cardDetailId) {
		this.cardDetailId = cardDetailId;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getCardNumber() {
		return cardNumber;
	}

	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}

	public String getExpiryMonth() {
		return expiryMonth;
	}

	public void setExpiryMonth(String expiryMonth) {
		this.expiryMonth = expiryMonth;
	}

	public String getExpiryYear() {
		return expiryYear;
	}

	public void setExpiryYear(String expiryYear) {
		this.expiryYear = expiryYear;
	}

	public String getCvNumber() {
		return cvNumber;
	}

	public void setCvNumber(String cvNumber) {
		this.cvNumber = cvNumber;
	}

	public String getNameOnCard() {
		return nameOnCard;
	}

	public void setNameOnCard(String nameOnCard) {
		this.nameOnCard = nameOnCard;
	}

	public double getTotalCost() {
		return totalCost;
	}

	public void setTotalCost(double totalCost) {
		this.totalCost = totalCost;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Column
	@NotEmpty(message="Please enter valid card number")
	@Size(min=13,max=16,message = "Enter minimum 13 valid card number")
	private String cardNumber;
	
	@Column
	@NotEmpty(message="Please select valid card expiry month")
	private String expiryMonth;
	
	@Column
	@NotEmpty(message="Please select expiry year")
	private String expiryYear;
	
	@Column
	@NotEmpty(message="Please enter card CVNumber")
	@Size(min=3,max=3,message = "Enter 3 digit CVV number")
	private String cvNumber;
	
	@Column
	@NotEmpty(message="Please enter name on card")
	private String nameOnCard;
	
	@Column
	@NotEmpty(message="Please select valid card type")
	private String cardtype;
	
	public String getCardtype() {
		return cardtype;
	}

	public void setCardtype(String cardtype) {
		this.cardtype = cardtype;
	}

	private double totalCost;

}
