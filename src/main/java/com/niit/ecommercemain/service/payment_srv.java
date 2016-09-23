package com.niit.ecommercemain.service;

import java.util.List;

import com.niit.ecommercemain.model.payment;

public interface payment_srv {
	public List<payment> getallpayment(String userid);
	
	public void savepayment(payment obj);
	
	public void updatepayment(payment payment);
	
	public payment getpaymentbyid(String userid);

}
